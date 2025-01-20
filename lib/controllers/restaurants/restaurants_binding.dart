part of 'restaurants_controller.dart';

class RestaurantsBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [Bind.lazyPut(() => RestaurantsController())];
  }
}