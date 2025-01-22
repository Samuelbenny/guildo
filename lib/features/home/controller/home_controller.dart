import 'package:guildo/controllers/controllers.dart';
import 'package:guildo/models/models.dart';
import 'package:guildo/utils/utils.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:refreshed/refreshed.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Binding;

part 'home_binding.dart';
part 'home_state.dart';

class HomeController extends GetxController {
  final HomeState state = HomeState();

  static HomeController get to => Get.find();

  @override
  void onInit() async {
    super.onInit();

    state.pagingController.addPageRequestListener((pageKey) async {
      await getRestaurants(
          offset: state.pagingController.itemList?.length ?? 0
      );
    });
  }


  @override
  void dispose() {
    super.dispose();

    state.pagingController.dispose();
  }

  /// Fetches restaurants and manages pagination and error handling.
  ///
  /// This asynchronous function retrieves a list of restaurants based on
  /// the provided offset and updates the state with the new items.
  /// It also handles any exceptions that may occur during the fetch
  /// operation.
  getRestaurants({
    int offset = 0,
  }) async {
    try {
      // Fetch the list of restaurants with specified cuisine IDs and offset
      final List<Restaurant> restaurants = await RestaurantsController.to.getRestaurants(
        cuisineIds: state.cuisineIds,
        offset: offset,
      );

      // Load the retrieved restaurants into the state
      _loadRestaurants(newItems: restaurants);
    } on PostgrestException catch (error, stackTrace) {
      // Log the error message and stack trace for Postgrest exceptions
      logger.e(error.message, stackTrace: stackTrace);
      logger.e(error.details);
      state.pagingController.error = error;
    } catch (error, stackTrace) {
      // Log any other exceptions that occur
      logger.e('$error', stackTrace: stackTrace);
      state.pagingController.error = error;
    }
  }

  /// Loads restaurants into the paging controller, handling pagination.
  ///
  /// Updates the paging controller with new items and determines if
  /// there are more pages to load.
  ///
  /// Parameters:
  /// - [newItems]: The list of newly fetched [Restaurant] items to load.
  _loadRestaurants({required List<Restaurant> newItems}) {
    final int previouslyFetchedItemsCount = state.pagingController.itemList?.length ?? 0;

    final bool isLastPage = newItems.isEmpty || newItems.length < state.limit;

    if (isLastPage) {
      // Appends the last page of items; no more pages to load.
      state.pagingController.appendLastPage(newItems);
    } else {
      // Calculates the key for the next page based on previously fetched items and limit.
      final int nextPageKey = previouslyFetchedItemsCount + state.limit;
      // Appends the new items and provides the key for the next page.
      state.pagingController.appendPage(newItems, nextPageKey);
    }
  }

  /// Updates the filters by assigning new cuisine IDs and refreshing the paging controller.
  ///
  /// Parameters:
  /// - [cuisineIds] (optional): A list of cuisine IDs to update the filter criteria.
  updateFilters({List<String> cuisineIds = const []}) {
    // Assigns the new list of cuisine IDs to the state
    state.cuisineIds.assignAll(cuisineIds);

    // Refreshes the paging controller to apply the updated filters
    state.pagingController.refresh();
  }


}
