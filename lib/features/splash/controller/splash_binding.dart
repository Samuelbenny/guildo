part of 'splash_controller.dart';

class SplashBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.put<SplashController>(SplashController())
    ];
  }
}