part of 'cuisines_controller.dart';

class CuisinesProvider {
  /// Fetches a list of cuisines from the Supabase database.
  ///
  /// This function retrieves all columns (indicated by "*") from the
  /// `DatabaseTables.cuisines` table using the `SupabaseConnector`. The results
  /// are returned as a [Future<List<Json>>], representing a future that resolves
  /// to a list of JSON objects containing cuisine data.
  Future<List<Json>> getCuisines() async {
    // Executes a query to select all columns from the 'cuisines' table.
    return await SupabaseConnector.to.supabase
      .from(DatabaseTables.cuisines)
      .select("*");
  }
}