import 'package:guildo/controllers/controllers.dart';
import 'package:guildo/models/models.dart';
import 'package:guildo/utils/utils.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:refreshed/refreshed.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Binding;

part 'home_binding.dart';
part 'home_state.dart';
part 'home_provider.dart';

class HomeController extends GetxController {
  final HomeState state = HomeState();
  final HomeProvider _provider = HomeProvider();


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

  getRestaurants({int offset = 0}) async {
    try {
      final List<Restaurant> restaurants = await _provider.getRestaurants(
        offset: offset
      );

      logger.d("Restaurants: ${restaurants.length}");

      _loadChannels(newItems: restaurants);
    } on PostgrestException catch (error, stackTrace) {
      logger.e(error.message, stackTrace: stackTrace);
      logger.e(error.details);
      state.pagingController.error = error;
    } catch (error, stackTrace) {
      logger.e('$error', stackTrace: stackTrace);
      state.pagingController.error = error;
    }
  }

  _loadChannels({required List<Restaurant> newItems}) {
    final int previouslyFetchedItemsCount = state.pagingController.itemList?.length ?? 0;
    final bool isLastPage = newItems.isEmpty || newItems.length < state.limit;
    logger.w("LastPage: $isLastPage");

    if (isLastPage) {
      state.pagingController.appendLastPage(newItems);
    } else {
      final int nextPageKey = previouslyFetchedItemsCount + state.limit;
      state.pagingController.appendPage(newItems, nextPageKey);
    }
  }
}
