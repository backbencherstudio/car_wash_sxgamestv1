import 'package:car_wash/core/constant/icons.dart';
import 'package:car_wash/core/constant/images.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BlogCard extends StatelessWidget{
  const BlogCard({super.key});

  @override
  Widget build(BuildContext context) {
    final Color bodyTextColor = Color(0xff62676C);
    final Color iconColor = Color(0xff444950);
    final Color surfaceColor = Color(0xffF0F3FC);
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: 400.w,
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.r),
      decoration: Utils.commonBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8.h,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.asset(
              AppImages.carWash4,
              width: 368.w,
              height: 177.h,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(6.r),
            decoration: BoxDecoration(
              color: surfaceColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text("Car Wash",style: textTheme.bodyMedium?.copyWith(color: bodyTextColor),),
          ),
          Text("Why Regular Car Washing is More Important Than You Think",
            style: textTheme.titleSmall,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

        Text("Keeping your car clean is not just about looking good...",style: textTheme.bodyMedium?.copyWith(color: bodyTextColor),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
          SizedBox(height: 10.h,),
          
          Row(
            children: [
              SvgPicture.asset(AppIcons.calendar,width: 16.w,height: 16.h,colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),),
              SizedBox(width: 4.w,),
              Text("May 11, 2025",style: textTheme.bodyMedium?.copyWith(color: bodyTextColor),),
              SizedBox(width: 8.w,),
              SvgPicture.asset(AppIcons.eye,width: 16.w,height: 16.h,colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),),
              SizedBox(width: 4.w,),
              Text("22 views",style: textTheme.bodyMedium?.copyWith(color: bodyTextColor),),
            ],
          )
        ],
      ),
    );
  }
}