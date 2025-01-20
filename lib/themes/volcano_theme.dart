import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:refreshed/refreshed.dart';

sealed class VolcanoTheme {
  static final ThemeData lightTheme = FlexThemeData.light(
    scheme: FlexScheme.material,
    surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
    blendLevel: 2,
    appBarOpacity: 0.95,
    // keyColors: const FlexKeyColors(),
    useMaterial3: true,
    fontFamily: 'Sofia Pro',
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );
  static final ThemeData darkTheme = FlexThemeData.dark(
    scheme: FlexScheme.material,
    surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
    blendLevel: 30,
    appBarOpacity: 0.90,
    surfaceTint: const Color(0xff000000),
    // keyColors: const FlexKeyColors(
    //   keepPrimary: true,
    // ),
    useMaterial3: true,
    fontFamily: 'Sofia Pro',
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );

  static ThemeData get theme => Get.theme;
  static ColorScheme get colorScheme => Get.theme.colorScheme;
}