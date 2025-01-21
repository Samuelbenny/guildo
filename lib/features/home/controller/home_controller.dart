import 'package:guildo/services/services.dart';
import 'package:refreshed/refreshed.dart';

part 'home_binding.dart';
part 'home_state.dart';
part 'home_provider.dart';

class HomeController extends GetxController {
  final HomeState state = HomeState();
  final HomeProvider _provider = HomeProvider();
}
