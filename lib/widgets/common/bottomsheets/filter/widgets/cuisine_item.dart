import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grock/grock.dart';
import 'package:guildo/models/models.dart';
import 'package:guildo/themes/themes.dart';
import 'package:guildo/utils/utils.dart';
import 'package:icons_plus/icons_plus.dart';

class CuisineItem extends StatelessWidget {
  final Cuisine cuisine;
  final bool isSelected;
  final VoidCallback? onTap;

  const CuisineItem({
    super.key,
    required this.cuisine,
    this.isSelected = false,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected
          ? VolcanoTheme.colorScheme.primary.withValues(alpha: 0.1)
          : Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: 15.r.borderRadius,
        side: BorderSide(
          color: isSelected
              ? VolcanoTheme.colorScheme.primary
              : VolcanoTheme.colorScheme.onSurface.withValues(alpha: 0.1),
          width: 2.5.w,
        )
      ),
      child: InkWell(
        borderRadius: 15.r.borderRadius,
        onTap: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              IonIcons.fast_food,
              color: isSelected
                  ? VolcanoTheme.colorScheme.primary
                  : VolcanoTheme.colorScheme.onSurface.withValues(alpha: 0.7),
              size: 30.w
            ),
            30.w.horizontalSpace,
            Text(
              cuisine.name ?? '',
              style: TextStyle(
                fontSize: 27.sp,
                fontWeight: FontWeight.w500,
                color: isSelected
                  ? VolcanoTheme.colorScheme.primary
                  : VolcanoTheme.colorScheme.onSurface,
              ),
            ),
          ],
        ).marginSymmetric(horizontal: 30.w, vertical: 15.h),
      ),
    );
  }
}
