import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grock/grock.dart';
import 'package:guildo/features/features.dart';
import 'package:refreshed/refreshed.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody()
    );
  }

  Widget _buildBody() => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'GUILDO',
        style: TextStyle(
          color: Get.theme.colorScheme.primary,
          fontSize: 60.sp,
          fontWeight: FontWeight.w700,
          letterSpacing: 2.w
        ),
      )
    ]
  ).width(1.sw);
}
