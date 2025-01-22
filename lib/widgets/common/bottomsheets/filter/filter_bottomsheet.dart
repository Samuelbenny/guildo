import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grock/grock.dart';
import 'package:guildo/controllers/controllers.dart';
import 'package:guildo/models/models.dart';
import 'package:guildo/utils/utils.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:refreshed/refreshed.dart';
import 'package:guildo/widgets/widgets.dart';

class FilterBottomsheet extends GetView<FilterController> {
  const FilterBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return VolcanoBottomsheet(
      title: "Filtres",
      initialChildSize: 0.93,
      minChildSize: 0.93,
      maxChildSize: 0.93,
      content: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        90.h.verticalSpace,
        Text(
          'Types de cuisines',
          style: TextStyle(
            fontSize: 32.sp,
            fontWeight: FontWeight.w700,
          ),
        ).width(1.sw).marginSymmetric(horizontal: 30.w),
        60.h.verticalSpace,
        _buildCuisineList(),
        90.h.verticalSpace,
        _buildValidateButton(),
        60.h.verticalSpace,
      ],
    );
  }

  Widget _buildCuisineList() {
    return Obx(() {
      if (CuisinesController.to.state.isCuisinesLoading.value) {
        return _buildLoader();
      } else {
        return Wrap(
          runSpacing: 20.w, spacing: 20.w,
          alignment: WrapAlignment.start,
          children: controller.state.cuisines.value.map((Cuisine cuisine) {
            return CuisineItem(
              cuisine: cuisine,
              isSelected: _isCuisineSelected(cuisine: cuisine),
              onTap: () => _onCuisineTapped(cuisine: cuisine),
            );
          }).toList() ?? []
        ).marginSymmetric(horizontal: 30.w);
      }
    });
  }

  Widget _buildLoader() {
    return VolcanoShimmer(
      child: Wrap(
        runSpacing: 20.w, spacing: 20.w,
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        runAlignment: WrapAlignment.end,
        children: List<Widget>.generate(25, (index) {
          return CuisineItem(
            cuisine: Cuisine(),
          );
        })
      ).marginSymmetric(horizontal: 30.w)
    );
  }

  Widget _buildValidateButton() {
    return VolcanoButton(
      text: 'Valider',
      width: 1.sw,
      icon: Icon(
          Iconsax.tick_square_bold,
          size: 35.w
      ),
      onPressed: () async {
        await controller.filterRestaurants();

        Navigator.pop(
          Get.context!,
          // controller.state.selectedGenres.value
        );
      },
    ).marginSymmetric(horizontal: 30.w);
  }


  bool _isCuisineSelected({required Cuisine cuisine}) {
    return controller.state.selectedCuisines.any((selected) {
      return selected.id == cuisine.id;
    });
  }

  void _onCuisineTapped({required Cuisine cuisine}) {
    final Cuisine? res = controller.state.selectedCuisines.value
        .firstOrNullWhere((selected) {
      return selected.id == cuisine.id;
    });

    if (res != null) {
      controller.state.selectedCuisines.removeWhere((selected) {
        return selected.id == cuisine.id;
      });
    } else {
      controller.state.selectedCuisines.add(cuisine);
    }
  }
}
