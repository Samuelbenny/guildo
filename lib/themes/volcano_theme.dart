import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:refreshed/refreshed.dart';

/// Defines the theme configurations for the Volcano application.
///
/// This sealed class provides light and dark themes using FlexColorScheme,
/// with Material 3 design system implementation.
sealed class VolcanoTheme {
  /// Light theme configuration with Material design scheme.
  ///
  /// Implements a high background, low scaffold surface mode with
  /// custom opacity and blend levels for optimal visibility.
  static final ThemeData lightTheme = FlexThemeData.light(
    scheme: FlexScheme.material,
    surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
    blendLevel: 2,
    appBarOpacity: 0.95,
    useMaterial3: true,
    fontFamily: 'Sofia Pro',
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );

  /// Dark theme configuration with Material design scheme.
  ///
  /// Features higher blend levels and custom surface tinting
  /// for enhanced dark mode visibility and contrast.
  static final ThemeData darkTheme = FlexThemeData.dark(
    scheme: FlexScheme.material,
    surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
    blendLevel: 30,
    appBarOpacity: 0.90,
    surfaceTint: const Color(0xff000000),
    useMaterial3: true,
    fontFamily: 'Sofia Pro',
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );

  /// Returns the current active theme.
  static ThemeData get theme => Get.theme;

  /// Returns the color scheme of the current active theme.
  static ColorScheme get colorScheme => Get.theme.colorScheme;
}
