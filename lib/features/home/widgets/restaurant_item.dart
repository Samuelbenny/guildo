import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grock/grock.dart';
import 'package:guildo/features/home/widgets/restaurant_cuisine_list.dart';
import 'package:guildo/models/models.dart';
import 'package:guildo/themes/themes.dart';
import 'package:guildo/utils/custom_types.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:quickly/quickly.dart';

class RestaurantItem extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantItem({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadius: 15.r.borderRadius,
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            _buildImage(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildName(),
                  20.h.verticalSpace,
                  _buildAddress(),
                  // 15.h.verticalSpace,


                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _buildRating(),
                      30.w.horizontalSpace,
                      const Spacer(),
                      _buildPriceType(),
                    ],
                  ),
                  30.h.verticalSpace,
                  RestaurantCuisineList(
                      cuisines: restaurant.cuisines ?? []
                  ).withMarginOnly(left: 20.w),
                ],
              )
            )
          ],
        ).withMarginOnly(
          left: 30.w, right: 30.w, top: 30.h, bottom: 30.h
        ),
      ),
    ).marginSymmetric(vertical: 10.h).width(1.sw);
  }

  Widget _buildImage() {
    return ExtendedImage.network(
      restaurant.imageUrl ?? '',
      width: 0.23.sw, height: 0.13.sh,
      fit: BoxFit.cover,
      cache: true, cacheRawData: true,
    ).withRounded(radius: 10.r);
  }

  Widget _buildName() {
    return Text(
      restaurant.name ?? '',
      maxLines: 1,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: VolcanoTheme.colorScheme.onSurface,
        fontSize: 30.sp,
        fontWeight: FontWeight.w700,
      ),
    ).withMarginOnly(left: 30.w);
  }

  Widget _buildAddress() {
    return Text(
      restaurant.address?.fullAddress ?? '',
      maxLines: 1,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: VolcanoTheme.colorScheme.onSurface.withValues(alpha: 0.7),
        fontSize: 27.sp,
        fontWeight: FontWeight.w400,
      ),
    ).withMarginOnly(left: 30.w);
  }

  Widget _buildRating() {
    return Row(
      children: [
        Icon(
          Iconsax.star_1_bold,
          color: VolcanoTheme.colorScheme.onSurface,
          size: 27.sp,
        ),
        15.w.horizontalSpace,
        Text(
          '${restaurant.rating}',
          style: TextStyle(
            color: VolcanoTheme.colorScheme.onSurface.withValues(alpha: 0.7),
            fontSize: 27.sp,
          ),
        ).withMarginOnly(top: 5.h),
      ],
    ).withMarginOnly(left: 30.w);
  }

  Widget _buildPriceType() {
    return Text(
      '${restaurant.priceTypes}',
      style: TextStyle(
        color: VolcanoTheme.colorScheme.onSurface.withValues(alpha: 0.7),
        fontSize: 27.sp,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
