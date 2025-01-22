part of 'cuisines_controller.dart';

class CuisinesProvider {
  Future<List<Json>> getCuisines() async {
    return await SupabaseConnector.to.supabase
      .from(DatabaseTables.cuisines)
      .select("*");
  }
}