import 'package:car_wash/core/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/constant/icons.dart';
import '../../../../../../core/constant/images.dart';
import '../../../../../../core/constant/padding.dart';
import '../../../../../../core/utils/utils.dart';

class HomeHeader extends StatelessWidget {
  final bool isOnlyTrailing;
   const HomeHeader({super.key, required this.isOnlyTrailing});

  @override
  Widget build(BuildContext context,  ) {
    return Padding(
      padding: AppPadding.screenHorizontal,
      child: Utils.customAppBar(
        context: context,
        title: !isOnlyTrailing ? "Hello Dr. Yunus" : null,
        leadingImageAddress: !isOnlyTrailing ? AppImages.shakin : null,
        subtitle: !isOnlyTrailing ? "zinzira" : null,
        subtitlePreIconAsset:  !isOnlyTrailing ? AppIcons.locationIcon : null,
        trailing: [
          GestureDetector(
            onTap: ()=> context.push(RouteName.notificationScreen),
            child: Container(
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
          ),
          GestureDetector(
            onTap: () {
              debugPrint("\nOpening end drawer.\n");
              Scaffold.of(context).openEndDrawer();
            },
            child: SvgPicture.asset(AppIcons.menu, width: 44.w, height: 44.h),
          ),
        ],
      ),
    );
  }
}
