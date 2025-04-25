import 'package:car_wash/core/constant/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/constant/icons.dart';
import '../../../../../../core/theme/theme_extension/app_colors.dart';
import 'blog_card.dart';

class BlogList extends StatelessWidget{
  const BlogList({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle headerTextStyle = Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 18.sp,);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 13.h,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Recent Blogs",style: headerTextStyle,),
            Row(
              children: [
                Text("View All",style: headerTextStyle.copyWith(color: AppColors.primary),),
                SvgPicture.asset(AppIcons.arrowRight,colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),)
              ],
            ),
          ],
        ),

        SizedBox(
          height: 407.h,
            child: ListView.builder(
              itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index){
                return BlogCard(
                  imagePath:AppImages.blogPhoto ,
                );
                }
            ),
        )
      ],
    );
  }
}