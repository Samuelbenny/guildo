import 'package:refreshed/refreshed.dart';
import 'package:guildo/features/features.dart';
import 'package:guildo/controllers/controllers.dart';

class RouteConfig {
  static const String home = "/";

  static final List<GetPage> rootNavigationPages = [
    GetPage(
      name: home,
      page: () => const HomePage(),
      bindings: [
        RestaurantsBinding(),
        HomeBinding()
      ]
    )
  ];
}