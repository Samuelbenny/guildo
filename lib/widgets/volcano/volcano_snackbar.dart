import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:refreshed/refreshed.dart';
import 'package:guildo/themes/volcano_theme.dart';

class VolcanoSnackbar {
  // Properties for the custom snackbar
  final String titleText;
  final Color? titleTextColor;
  final String messageText;
  final Color? messageTextColor;
  final Color? backgroundColor;
  final IconData icon;
  final Duration duration;

  VolcanoSnackbar({
    required this.titleText,
    required this.messageText,
    this.titleTextColor,
    this.messageTextColor,
    this.backgroundColor,
    this.icon = Icons.info, // Default icon
    this.duration = const Duration(seconds: 10), // Default duration
  });

  // Constructor for error snackbar
  VolcanoSnackbar.error({
    required String titleText,
    required String messageText,
    Color? titleTextColor,
    Color? messageTextColor,
    Color? backgroundColor,
    IconData icon = FontAwesome.circle_xmark_solid,
    Duration duration = const Duration(seconds: 10),
  }) : this(
    titleText: titleText,
    messageText: messageText,
    titleTextColor: titleTextColor ?? getErrorColor(
      lightModeColor: VolcanoTheme.colorScheme.onError,
      darkModeColor: VolcanoTheme.colorScheme.onErrorContainer,
    ),
    messageTextColor: messageTextColor ?? getErrorColor(
      lightModeColor: VolcanoTheme.colorScheme.onError,
      darkModeColor: VolcanoTheme.colorScheme.onErrorContainer,
    ),
    backgroundColor: backgroundColor ?? getErrorColor(
      lightModeColor: VolcanoTheme.colorScheme.error,
      darkModeColor: VolcanoTheme.colorScheme.errorContainer,
    ),
    icon: icon,
    duration: duration,
  );

  // Method to show the snackbar
  void show() {
    Get.snackbar(
      '',
      '',
      titleText: Text(
        titleText,
        style: TextStyle(
          color: titleTextColor ?? VolcanoTheme.colorScheme.onPrimary,
          fontSize: 30.sp,
          fontWeight: FontWeight.w700
        )
      ), // Title of the snackbar
      messageText: Text(
        messageText,
        style: TextStyle(
          color: messageTextColor ?? VolcanoTheme.colorScheme.onPrimary,
          fontSize: 27.sp,
          fontWeight: FontWeight.w400
        )
      ), // Message of the snackbar
      backgroundColor: backgroundColor ?? (Get.isDarkMode
          ? VolcanoTheme.colorScheme.primary.withValues(alpha: 0.7)
          : VolcanoTheme.colorScheme.primary.withValues(alpha: 0.7)
      ),
      icon: Icon(
        icon,
        color: messageTextColor ?? VolcanoTheme.colorScheme.onPrimary,
        size: 40.sp,
      ), // Custom icon
      duration: duration,
      // barBlur: 0.5,
      margin: EdgeInsets.zero, // Margin
      snackPosition: SnackPosition.bottom, // Position at the bottom
      // snackStyle: SnackStyle.FLOATING, // Floating style
      borderRadius: 0,
      // boxShadows: [
      //   BoxShadow(
      //     color: Colors.black.withOpacity(0.5),
      //     blurRadius: 10,
      //     offset: Offset(0, 2), // Shadow offset
      //   ),
      // ],
    );
  }

  // Helper function to determine the color based on the theme
  static Color getErrorColor({
    required Color lightModeColor,
    required Color darkModeColor
  }) {
    return Get.isDarkMode ? darkModeColor : lightModeColor;
  }
}
