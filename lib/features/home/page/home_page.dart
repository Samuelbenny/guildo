import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grock/grock.dart';
import 'package:guildo/features/home/home.dart';
import 'package:guildo/models/models.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:refreshed/refreshed.dart';
import 'package:guildo/widgets/widgets.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    // logger.f("HomePage: ${controller.state.pagingController.itemList?.length}");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        0.15.sh.verticalSpace,
        HomeHeader(),
        60.h.verticalSpace,
        Expanded(child: _buildRestaurantList()),
      ],
    );
  }
  Widget _buildRestaurantList() {
    return PagedListView(
      pagingController: controller.state.pagingController,
      padding: 30.w.horizontalP,
      shrinkWrap: true,
      builderDelegate: PagedChildBuilderDelegate<Restaurant>(
        itemBuilder: (context, restaurant, index) {
          return RestaurantItem(
            restaurant: restaurant,
          );
        },
        firstPageProgressIndicatorBuilder: (_) {
          return _buildLoader();
        },
        noItemsFoundIndicatorBuilder: (_) {
          return _buildNoItemsFound();
        }
      ),
    );
  }

  Widget _buildLoader() {
    return SizedBox(
      width: 1.sw, height: 0.8.sh,
      child: VolcanoShimmer(
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return RestaurantItem(
              restaurant: Restaurant(),
            );
          },
        )
      ),
    );
  }

  Widget _buildNoItemsFound() {
    return SizedBox(
      width: 1.sw, height: 0.8.sh,
      child: Center(
        child: Text(
          'Aucun restaurant trouvé',
          style: TextStyle(
            fontSize: 30.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
