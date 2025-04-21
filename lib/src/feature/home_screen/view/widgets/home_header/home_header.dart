import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/constant/icons.dart';
import '../../../../../../core/constant/images.dart';
import '../../../../../../core/utils/utils.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Utils.customAppBar(
      context: context,
      title: "Hello Dr. Shakin",
      leadingImageAddress: AppImages.shakin,
      subtitle: "zinzira",
      subtitlePreIconAsset: AppIcons.locationIcon,
      trailing: [
        Container(
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.07),
                blurRadius: 10.r,
                spreadRadius: 10.r,
                offset: Offset(4, 8),
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: SvgPicture.asset(AppIcons.notification),
        ),
        GestureDetector(
          onTap: () {
            debugPrint("\nOpening end drawer.\n");
            Scaffold.of(context).openEndDrawer();
          },
          child: SvgPicture.asset(AppIcons.menu, width: 44.w, height: 44.h),
        ),
      ],
    );
  }
}
