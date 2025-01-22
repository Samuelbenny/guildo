import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grock/grock.dart';
import 'package:guildo/models/models.dart';
import 'package:guildo/themes/themes.dart';
import 'package:guildo/utils/utils.dart';

class RestaurantCuisineList extends StatelessWidget {
  final List<Cuisine> cuisines;
  const RestaurantCuisineList({
    super.key,
    required this.cuisines,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: cuisines.length,
      shrinkWrap: true,
      // padding: 15.w.horizontalP,
      itemBuilder: (context, index) {
        return _buildCuisineItem(cuisines[index]);
      },
    ).height(0.03.sh);
  }

  Widget _buildCuisineItem(Cuisine cuisine) {
    return Material(
      color: VolcanoTheme.colorScheme.primary.withValues(alpha: 0.1),
      borderRadius: 10.r.borderRadius,
      child: Center(
        child: Text(
          cuisine.name ?? '',
          textAlign: TextAlign.center,
          maxLines: 1,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: VolcanoTheme.colorScheme.onSurface,
            fontSize: 25.sp,
            fontWeight: FontWeight.w500,
          ),
        ).marginSymmetric(horizontal: 15.w),
      ),
    ).marginSymmetric(horizontal: 10.w);
  }
}
