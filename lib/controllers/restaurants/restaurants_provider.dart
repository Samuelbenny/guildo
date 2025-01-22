part of 'restaurants_controller.dart';

class RestaurantsProvider {
  Future<List<Json>> getRestaurants({
    List<String>? cuisineIds,
    int? offset,
  }) async {
    return await SupabaseConnector.to.supabase
      .rpc(
        'get_restaurants',
        params: {
          'p_cuisine_ids': cuisineIds,
          'p_offset': offset,
          'p_limit': 10
        }
      ).select('*');
  }
}