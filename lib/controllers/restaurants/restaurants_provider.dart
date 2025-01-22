part of 'restaurants_controller.dart';

class RestaurantsProvider {
  /// Retrieves a list of restaurants from the Supabase database.
  ///
  /// This asynchronous function calls the 'get_restaurants' remote procedure
  /// and returns all matching restaurant records as a list of JSON objects.
  ///
  /// Parameters:
  /// - [cuisineIds] (optional): A list of cuisine IDs to filter the restaurants.
  /// - [offset] (optional): The number of records to skip for pagination.
  ///
  /// Returns:
  /// - A Future that resolves to a `List<Json>` containing the restaurant data.
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
          'p_limit': 10  // Limit the number of returned records
        }
    ).select('*');  // Select all columns from the result
  }
}