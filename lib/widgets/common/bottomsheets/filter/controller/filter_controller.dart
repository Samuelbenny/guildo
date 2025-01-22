import 'package:guildo/controllers/controllers.dart';
import 'package:guildo/features/features.dart';
import 'package:guildo/models/models.dart';
import 'package:guildo/utils/utils.dart';
import 'package:refreshed/refreshed.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Binding;

part 'filter_binding.dart';
part 'filter_state.dart';

class FilterController extends GetxController {
  final FilterState state = FilterState();


  @override
  void onInit() async {
    super.onInit();

    await getCuisines();
  }

  getCuisines() async {
    try {
      final List<Cuisine> cuisines = await CuisinesController.to.getCuisines();

      state.cuisines.addAll(cuisines);
    } on PostgrestException catch (error, stackTrace) {
      logger.e(error.message, stackTrace: stackTrace);
      logger.e(error.details);
    } catch (error, stackTrace) {
      logger.e('$error', stackTrace: stackTrace);
    }
  }

  filterRestaurants() async {
    // Extract cuisines IDs from the cuisine list
    final List<String> cuisineIds =
      state.selectedCuisines.map((Cuisine cuisine) => cuisine.id ?? '')
        .toList();

    HomeController.to.updateFilters(cuisineIds: cuisineIds);
  }

  resetFilters() {
    state.selectedCuisines.clear();
  }
}
