import 'package:car_wash/core/constant/icons.dart';
import 'package:car_wash/core/constant/images.dart';
import 'package:car_wash/core/constant/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BlogDetailsHeader extends StatelessWidget{
  const BlogDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final bodyTextColor = Color(0xff62676C);
    final bodyTextTheme = Theme.of(context).textTheme.bodyMedium?.copyWith(color: bodyTextColor);
    
    return Padding(
        padding: AppPadding.screenHorizontal,
        child: Column(
          children: [
            /// Blog Poster Details
            Row(
              children: [
                ClipOval(
                  child: Image.asset(AppImages.shakin,width: 24.w,height: 24.w,),
                ),

                SizedBox(width: 10.w,),

                Text("By: Shafrid Bhondo",style: bodyTextTheme?.copyWith(fontWeight: FontWeight.w500),),

                Spacer(),

                Text("Published: May 13, 2025",style: bodyTextTheme?.copyWith(fontWeight: FontWeight.w500),),
              ],
            ),

            SizedBox(height: 12.h,),

            /// Thumbnail Image
            Image.asset(AppImages.indoorCarClean,width: 400.w,height: 300.h,),
            SizedBox(height: 12.h,),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              spacing: 12.w,
              children: [
                SvgPicture.asset(AppIcons.heart,width: 20.w,height: 20.w,),
                SvgPicture.asset(AppIcons.share,width: 20.w,height: 20.h,),
              ],
            )
          ],
        ),
    );
  }
}