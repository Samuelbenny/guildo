import 'package:guildo/models/models.dart';
import 'package:guildo/services/services.dart';
import 'package:guildo/utils/utils.dart';
import 'package:refreshed/refreshed.dart';
import 'package:guildo/config/config.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Binding;

part 'cuisines_binding.dart';
part 'cuisines_state.dart';
part 'cuisines_provider.dart';

class CuisinesController extends GetxController {
  final CuisinesState state = CuisinesState();
  final CuisinesProvider _provider = CuisinesProvider();

  static CuisinesController get to => Get.find();


  /// Asynchronously fetches a list of cuisines from a data provider.
  ///
  /// This function updates the [isCuisinesLoading] state to `true` before
  /// making the request, and sets it back to `false` in a `finally` block
  /// to ensure the UI reflects the loading state.
  /// It handles potential `PostgrestException` and other exceptions,
  /// logging errors and returning an empty list in case of failure.
  ///
  /// Returns a [Future] that completes with a [List] of [Cuisine] objects.
  /// Returns an empty list if no cuisines are found or if an error occurs
  /// during the fetching process.
  Future<List<Cuisine>> getCuisines() async {
    // Indicate loading state.
    state.isCuisinesLoading.value = true;

    try {
      // Fetch cuisines from the data provider.
      final List<Json> cuisinesRes = await _provider.getCuisines();

      // Convert JSON responses to Cuisine objects.
      return cuisinesRes.map((Json genreJson) => Cuisine.fromJson(genreJson)).toList();
    } on PostgrestException catch (error, stackTrace) {
      // Handle Postgrest exceptions. Log error details.
      logger.e(error.message, stackTrace: stackTrace);
      logger.e(error.details);
      return [];
    } catch (error, stackTrace) {
      // Handle other exceptions. Log the error.
      logger.e('$error', stackTrace: stackTrace);
      return [];
    } finally {
      // Ensure loading state is reset.
      state.isCuisinesLoading.value = false;
    }
  }
}
