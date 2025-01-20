import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guildo/config/routes_config.dart';
import 'package:guildo/themes/themes.dart';
import 'package:refreshed/refreshed.dart';

void main() {
  runApp(const GuildoApp());
}

class GuildoApp extends StatelessWidget {
  const GuildoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(720, 1472),
      builder: (context, child) => GetMaterialApp(
        title: 'Guildo',
        debugShowCheckedModeBanner: false,
        theme: VolcanoTheme.lightTheme,
        darkTheme: VolcanoTheme.darkTheme,
        themeMode: ThemeMode.system,
        supportedLocales: const [
          Locale('fr', 'FR'),
          Locale('en', 'US'),
        ],
        locale: const Locale('fr', 'FR'),
        getPages: RouteConfig.rootNavigationPages,
        // binds: [
        //   Bind.put<PlayerController>(PlayerController()),
        //   Bind.put<FloatingPlayerController>(FloatingPlayerController())
        // ],
        builder: (context, xChild) {
          return xChild!;
        },
      ),
    );
  }
}
