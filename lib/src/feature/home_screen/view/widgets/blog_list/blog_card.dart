import 'package:car_wash/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/constant/icons.dart';
import '../../../../../../core/routes/route_name.dart';
import '../../../../../../core/theme/theme_extension/app_colors.dart';

class BlogCard extends StatelessWidget {
  final String imagePath;
  BlogCard({required this.imagePath});
  @override
  Widget build(BuildContext context) {
    TextStyle subTitleTextStyle = Theme.of(
      context,
    ).textTheme.bodyMedium!.copyWith(color: Color(0xff93979A));

    return Container(
      //height: 437.h,
      width: 285.w,
      padding: EdgeInsets.all(12.r),
      margin: EdgeInsets.only(right: 16.w),
      decoration: Utils.commonBoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 5.h,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(imagePath),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("April 12, 2025", style: subTitleTextStyle),
              Row(children: [Text("09:30 AM", style: subTitleTextStyle)]),
            ],
          ),
          Text(
            "5 Quick Tips to Keep Your Car Shining",
            style: Theme.of(context).textTheme.bodyLarge,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),

          Text(
            "Maintaining that showroom shine is easier than you think. From washing in tsdf",
            style: subTitleTextStyle,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),

          GestureDetector(
            onTap: () => context.push(RouteName.blogDetailsScreen),
            child: Row(
              children: [
                Text(
                  "Read More",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
                SvgPicture.asset(
                  AppIcons.arrowRight,
                  colorFilter: ColorFilter.mode(
                    AppColors.primary,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
