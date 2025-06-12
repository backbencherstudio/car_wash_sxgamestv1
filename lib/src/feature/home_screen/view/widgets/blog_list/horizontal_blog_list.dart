import 'package:car_wash/core/constant/images.dart';
import 'package:car_wash/core/constant/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/constant/icons.dart';
import '../../../../../../core/routes/route_name.dart';
import '../../../../../../core/theme/theme_extension/app_colors.dart';
import '../../../../all_blog_list_screen/riverpod/blog_list_riverpod.dart';
import '../../../../all_blog_list_screen/view/widget/shimmer/blog_shimmer.dart';
import 'blog_card.dart';

class HorizontalBlogList extends StatelessWidget {
  const HorizontalBlogList({super.key});

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;
    TextStyle headerTextStyle = textTheme.titleSmall!;

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
          child: Consumer(
            builder: (_, ref, _) {

              final blogListAsync = ref.watch(blogListProvider);
              return blogListAsync.when(
                data:
                    (blogs) =>
                blogs.isEmpty
                    ? Center(
                  child: Text(
                    "Empty",
                    style: textTheme.bodyLarge
                        ?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
                    : ListView.builder(
                  padding: EdgeInsets.all(20.r),
                  itemCount: blogs.length<3 ? blogs.length : 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    final blog = blogs[index];
                    return FittedBox(
                      child: BlogCard(
                        blog: blog
                      ),
                    );
                  },
                ),
                error:
                    (error, stack) =>
                    Center(child: Text('Error: $error')),
                loading: () => BlogShimmer(isHorizontal: true, height: 449.h,),
              );

            }
          ),
        ),
      ],
    );
  }
}
