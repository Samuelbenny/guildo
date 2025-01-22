import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grock/grock.dart';
import 'package:guildo/features/home/home.dart';
import 'package:guildo/models/models.dart';
import 'package:guildo/themes/themes.dart';
import 'package:guildo/utils/custom_types.dart';
import 'package:guildo/utils/utils.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:refreshed/refreshed.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    logger.f("HomePage: ${controller.state.pagingController.itemList?.length}");

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          0.15.sh.verticalSpace,
          _buildGreeting(),
          90.h.verticalSpace,
          _buildRestaurantList(),
        ],
      ),
    );
  }

  Widget _buildGreeting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Salut',
          style: TextStyle(
            color: VolcanoTheme.colorScheme.onSurface,
            fontSize: 45.sp,
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
        )
      ],
    ).marginSymmetric(horizontal: 30.w);
  }

  Widget _buildRestaurantList() {
    return PagedListView(
      pagingController: controller.state.pagingController,
      padding: 30.w.horizontalP,
      shrinkWrap: true,
      builderDelegate: PagedChildBuilderDelegate<Restaurant>(
        itemBuilder: (context, restaurant, index) {
          return RestaurantItem();
        }
      ),
    );
  }
}
