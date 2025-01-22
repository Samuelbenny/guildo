import 'package:guildo/config/config.dart';
import 'package:quickly/quickly.dart';
import 'package:refreshed/refreshed.dart';

part 'splash_binding.dart';
part 'splash_state.dart';
class SplashController extends GetxController {
  final SplashState state = SplashState();

  @override
  void onInit() {
    super.onInit();

    3.delay(() async {
      Get.offAllNamed(RouteConfig.home);
    });
  }
}
