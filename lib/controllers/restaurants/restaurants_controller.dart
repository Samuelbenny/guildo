import 'package:refreshed/refreshed.dart';

part 'restaurants_binding.dart';
part 'restaurants_state.dart';
part 'restaurants_provider.dart';

class RestaurantsController extends GetxController {
  final RestaurantsState state = RestaurantsState();
  final RestaurantsProvider _provider = RestaurantsProvider();

  static RestaurantsController get to => Get.find();
}
