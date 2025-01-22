import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grock/grock.dart';
import 'package:guildo/themes/themes.dart';
import 'package:guildo/utils/utils.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:refreshed/refreshed.dart';
import 'package:guildo/features/home/home.dart';

class HomeHeader extends GetView<HomeController> {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildGreeting(),
        const Spacer(),
        _buildActions()
      ],
    ).marginSymmetric(horizontal: 30.w);
  }

  Widget _buildGreeting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Salut',
          style: TextStyle(
            color: VolcanoTheme.colorScheme.onSurface,
            fontSize: 40.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          'Bienvenue sur Guildo',
          style: TextStyle(
            color: VolcanoTheme.colorScheme.onSurface.withValues(alpha: 0.7),
            fontSize: 30.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        // VolcanoButton(
        //   text: 'Fresh',
        //   onPressed: () async {
        //     await controller.getRestaurants();
        //   },
        // )
      ],
    );
  }

  Widget _buildActions() {
    return Row(
      children: [
        Material(
          borderRadius: 15.r.borderRadius,
          color: VolcanoTheme.colorScheme.primary,
          child: InkWell(
            borderRadius: 15.r.borderRadius,
            onTap: () {},
            child: Icon(
              Iconsax.filter_bold,
              color: VolcanoTheme.colorScheme.onPrimary,
              size: 30.w,
            ).padding(all: 20.w),
          ),
        )
      ],
    );
  }
}
