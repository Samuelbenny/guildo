part of 'filter_controller.dart';

class FilterBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.put(CuisinesController()),
      Bind.put(FilterController(), permanent: true)
    ];
  }
}