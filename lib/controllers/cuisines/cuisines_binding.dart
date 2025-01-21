part of 'cuisines_controller.dart';

class CuisinesBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [Bind.lazyPut(() => CuisinesController())];
  }
}