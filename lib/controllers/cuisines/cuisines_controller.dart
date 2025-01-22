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

  Future<List<Cuisine>> getCuisines() async {
    state.isCuisinesLoading.value = true;

    try {
      final List<Json> cuisinesRes = await _provider.getCuisines();

      return cuisinesRes.map((Json genreJson) {
        return Cuisine.fromJson(genreJson);
      }).toList();
    }
    on PostgrestException catch (error, stackTrace) {
      logger.e(error.message, stackTrace: stackTrace);
      logger.e(error.details);

      return [];
    } catch (error, stackTrace) {
      logger.e('$error', stackTrace: stackTrace);

      return [];
    } finally {
      state.isCuisinesLoading.value = false;
    }
  }
}
