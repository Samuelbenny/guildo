import 'package:guildo/services/services.dart';
import 'package:refreshed/refreshed.dart';
import 'package:guildo/features/features.dart';
import 'package:guildo/controllers/controllers.dart';
import 'package:guildo/widgets/widgets.dart';

class RouteConfig {
  static const String splash = "/";
  static const String home = "/home";

  static final List<GetPage> rootNavigationPages = [
    GetPage(
      name: splash,
      page: () => const SplashPage(),
      bindings: [
        SupabaseConnectorBinding(),
        SplashBinding(),
      ]
    ),
    GetPage(
      name: home,
      page: () => const HomePage(),
      bindings: [
        RestaurantsBinding(),
        FilterBinding(),
        HomeBinding()
      ]
    )
  ];
}