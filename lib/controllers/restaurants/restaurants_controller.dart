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

  Future<List<Restaurant>> getRestaurants({int offset = 0}) async {
    state.isRestaurantsLoading.value = false;

    try {
      final List<Json> restaurantsRes = await _provider.getRestaurants(
          offset: offset
      );

      logger.d("Restaurants: $restaurantsRes");

      return restaurantsRes.map((Json restaurant) {
        return Restaurant.fromJson(restaurant);
      }).toList();
    } on PostgrestException catch (error, stackTrace) {
      logger.e(error.message, stackTrace: stackTrace);
      logger.e(error.details);
      return [];
    } catch (error, stackTrace) {
      logger.e('$error', stackTrace: stackTrace);
      return [];
    } finally {
      state.isRestaurantsLoading.value = false;
    }
  }
}
