import 'package:car_wash/core/constant/images.dart';
import 'package:car_wash/core/constant/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/constant/icons.dart';
import '../../../../../../core/routes/route_name.dart';
import '../../../../../../core/theme/theme_extension/app_colors.dart';
import 'blog_card.dart';

class BlogList extends StatelessWidget {
  const BlogList({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle headerTextStyle = Theme.of(context).textTheme.titleSmall!;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      //spacing: 13.h,
      children: [
        Padding(
          padding: AppPadding.screenHorizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Recent Blogs", style: headerTextStyle),
              GestureDetector(
                onTap: () => context.push(RouteName.blogListScreen),
                child: Row(
                  children: [
                    Text(
                      "View All",
                      style: headerTextStyle.copyWith(color: AppColors.primary),
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
        ),

        SizedBox(
          height: 449.h,
          child: ListView.builder(
            padding: EdgeInsets.all(20.r),
            itemCount: 2,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return FittedBox(
                child: BlogCard(
                  imagePath:
                      index == 0 ? AppImages.carWash : AppImages.carWash3,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
