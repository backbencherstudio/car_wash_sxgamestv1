import 'package:car_wash/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/constant/icons.dart';
import '../../../../../../core/theme/theme_extension/app_colors.dart';

class BlogCard extends StatelessWidget{
  final String imagePath;
  BlogCard({required this.imagePath});
  @override
  Widget build(BuildContext context) {
    TextStyle subTitleTextStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(color: Color(0xff93979A));
    TextStyle headerTextStyle = Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 18.sp,);

    return Container(
      height: 407.h,
      width: 285.w,
      padding: EdgeInsets.all(12.r),
      margin: EdgeInsets.only(right: 16.w),
      decoration: Utils.commonBoxDecoration(),
      child: Column(
        spacing: 5.h,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(imagePath),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("April 12, 2025",style: subTitleTextStyle,),
              Row(
                children: [
                  Text("09:30 AM",style: subTitleTextStyle,),
                ],
              ),
            ],
          ),
          Text("5 Quick Tips to Keep Your Car Shining",
            style: Theme.of(context).textTheme.bodyLarge,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),

          Text("Maintaining that showroom shine is easier than you think. From washing in tsdf",
            style: subTitleTextStyle,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),

          Row(
            children: [
              Text("Read More",style: headerTextStyle.copyWith(color: AppColors.primary),),
              SvgPicture.asset(AppIcons.arrowRight,colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),)
            ],
          ),

        ],
      ),
    );
  }
}