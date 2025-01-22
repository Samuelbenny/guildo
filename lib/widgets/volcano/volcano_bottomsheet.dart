import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:refreshed/refreshed.dart';
import 'package:guildo/themes/volcano_colors.dart';
import 'package:guildo/themes/volcano_theme.dart';
import 'package:guildo/utils/custom_types.dart';

class VolcanoBottomsheet extends StatelessWidget {
  final String? title;
  final Widget? header;
  final List<Widget>? actions;
  final Widget content;
  final Color? backgroundColor;
  final double? initialChildSize;
  final double? minChildSize;
  final double? maxChildSize;
  final bool snap;
  final List<double>? snapSizes;
  final bool enableScrollController;

  const VolcanoBottomsheet({
    super.key,
    this.title,
    required this.content,
    this.header,
    this.actions,
    this.backgroundColor,
    this.initialChildSize,
    this.minChildSize,
    this.maxChildSize,
    this.snap = true,
    this.snapSizes,
    this.enableScrollController = false
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      key: Key(title ?? ''),
      initialChildSize: initialChildSize ?? 0.6,
      minChildSize: minChildSize ?? 0.6,
      maxChildSize: maxChildSize ?? 0.6,
      expand: false,
      snap: snap,
      snapSizes: snapSizes,
      builder: (context, scrollController) {
        return Material(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: backgroundColor ?? (Get.isDarkMode
              ? VolcanoColors.bottomSheetDark
              : VolcanoColors.white
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15.r),
              topLeft: Radius.circular(15.r)
            )
          ),
          child: _buildBody(
              context: context,
              scrollController: scrollController
          ),
        );
      }
    );
  }

  Widget _buildBody({
    required BuildContext context,
    required ScrollController scrollController
  }) {
    // return SingleChildScrollView(
    //   controller: enableScrollController ? scrollController : null,
    //   child: content,
    // );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildTopSection(),
        Expanded(
          child: _buildContent(
            context: context,
            scrollController: scrollController
          )
        ),
      ],
    );
  }

  Widget _buildTopSection() {
    return Column(
      children: [
        Container(
          width: 0.1.sw, height: 0.01.sh,
          decoration: BoxDecoration(
            color: VolcanoTheme.colorScheme.onSurface.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10.r),
          ),
        ).withMarginOnly(top: 20.h),
        _buildHeader(),
        Container(
          height: 2.h,
          color: VolcanoTheme.colorScheme.onSurface.withValues(alpha: 0.1)
        ),
      ],
    );
  }
  Widget _buildHeader() {
    if (header != null) {
      return header!;
    } else if (title != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title!,
            style: TextStyle(
              fontSize: 35.sp,
              color: VolcanoTheme.colorScheme.onSurface,
              fontWeight: FontWeight.w700,
            ),
          ),
          if(actions != null)
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: actions!,
              ).withMarginOnly(left: 30.w),
            ),
        ],
      ).withMarginOnly(left: 30.w, top: 30.h, bottom: 30.h);
    } else {
      return const SizedBox();
    }
  }

  Widget _buildContent({
    required BuildContext context,
    required ScrollController scrollController
  }) {
    return SingleChildScrollView(
      controller: enableScrollController ? scrollController : null,
      child: content,
    );
  }
}
