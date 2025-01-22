part of 'filter_controller.dart';

class FilterState {
  final RxList<Cuisine> cuisines = <Cuisine>[].obs;
  final RxList<Cuisine> selectedCuisines = <Cuisine>[].obs;
}
