import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:refreshed/refreshed.dart';
import 'package:grock/grock.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:guildo/themes/volcano_colors.dart';
import 'package:guildo/themes/volcano_theme.dart';
import 'package:guildo/utils/custom_types.dart';

class VolcanoButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Widget? icon;
  final String text;
  final Color? textColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final bool isLoading;
  final Widget? loader;
  final Size? loaderSize;
  final double? width;
  final Color? disabledTextColor;
  final Color? disabledIconColor;

  const VolcanoButton({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.icon,
    this.textColor,
    this.textStyle,
    this.padding,
    this.isLoading = false,
    this.loader,
    this.loaderSize,
    this.width,
    this.disabledTextColor,
    this.disabledIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: 15.r.borderRadius
        ),
        backgroundColor: backgroundColor ?? VolcanoTheme.colorScheme.primary,
        padding: padding ?? [10.w, 20.h].horizontalAndVerticalP,
      ),
      child: isLoading ? _buildLoader() : _buildContent()
    );
  }

  Widget _buildContent() {
    final bool isDisabled = onPressed == null;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildIcon(isDisabled: isDisabled),
        Text(
          text,
          style: textStyle ?? TextStyle(
            color: textColor ?? _getTextColor(isDisabled: isDisabled),
            fontSize: 30.w,
            fontWeight: FontWeight.w600
          ),
        )
      ],
    );
  }

  Widget _buildIcon({required bool isDisabled}) {
    if (icon != null) {
      return IconTheme(
        data: IconThemeData(
          color: textColor ?? _getTextColor(isDisabled: isDisabled),
        ),
        child: icon!.withMarginOnly(right: 15.w)
      );
    } else {
      return SizedBox();
    }
  }

  Color _getTextColor({required bool isDisabled}) {
    if (isDisabled) {
      return disabledTextColor ?? Get.theme.colorScheme
          .onSurface.withOpacity(0.7);
    } else {
      return (Get.isDarkMode
          ? VolcanoColors.dark
          : Get.theme.colorScheme.onPrimary
      );
    }
  }

  Widget _buildLoader() {
    return SizedBox(
      width: width,
      child: loader ?? SizedBox(
        width: loaderSize?.width ?? 35.w, height: loaderSize?.height ?? 35.w,
        child: LoadingIndicator(
          indicatorType: Indicator.ballScaleRippleMultiple,
          colors: [VolcanoTheme.colorScheme.onPrimary],
        ),
      ),
    );
  }
}
