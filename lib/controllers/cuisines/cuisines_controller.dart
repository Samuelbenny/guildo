import 'package:refreshed/refreshed.dart';

part 'cuisines_binding.dart';
part 'cuisines_state.dart';
part 'cuisines_provider.dart';

class CuisinesController extends GetxController {
  final CuisinesState state = CuisinesState();
  final CuisinesProvider _provider = CuisinesProvider();

  static CuisinesController get to => Get.find();
}
