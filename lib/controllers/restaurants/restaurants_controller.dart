import 'package:guildo/models/models.dart';
import 'package:guildo/services/services.dart';
import 'package:guildo/utils/utils.dart';
import 'package:refreshed/refreshed.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Binding;

part 'restaurants_binding.dart';
part 'restaurants_state.dart';
part 'restaurants_provider.dart';

class RestaurantsController extends GetxController {
  final RestaurantsState state = RestaurantsState();
  final RestaurantsProvider _provider = RestaurantsProvider();

  static RestaurantsController get to => Get.find();

  /// Fetches a list of restaurants with optional filters and pagination.
  ///
  /// [cuisineIds] - List of cuisine IDs to filter restaurants (optional).
  /// [offset] - Number of records to skip for pagination (default is 0).
  ///
  /// Returns a list of [Restaurant] objects.
  Future<List<Restaurant>> getRestaurants({
    List<String>? cuisineIds,
    int offset = 0
  }) async {
    state.isRestaurantsLoading.value = false;  // Ensure loading state is set

    try {
      final List<Json> restaurantsRes = await _provider.getRestaurants(
          cuisineIds: cuisineIds,
          offset: offset
      );

      // Transform JSON response into a list of Restaurant objects
      return restaurantsRes.map((Json restaurant) {
        return Restaurant.fromJson(restaurant);
      }).toList();
    } on PostgrestException catch (error, stackTrace) {
      // Log database-related errors
      logger.e(error.message, stackTrace: stackTrace);
      logger.e(error.details);
      return [];
    } catch (error, stackTrace) {
      // Log general errors
      logger.e('$error', stackTrace: stackTrace);
      return [];
    } finally {
      // Reset loading state
      state.isRestaurantsLoading.value = false;
    }
  }
}
