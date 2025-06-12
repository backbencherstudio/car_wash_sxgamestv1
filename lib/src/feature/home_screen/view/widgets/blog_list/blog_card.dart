import 'package:car_wash/core/services/api_services/api_endpoints.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/constant/icons.dart';
import '../../../../../../core/routes/route_name.dart';
import '../../../../../../core/theme/theme_extension/app_colors.dart';
import '../../../../all_blog_list_screen/model/blog_model.dart';

class BlogCard extends StatelessWidget {
  final BlogModel blog;
  const BlogCard({super.key, required this.blog});
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
            child: Utils.networkImage(
                width: 261.w,
            height: 227.h,
            imageUrl: '${ApiEndPoints.baseUrl}/${blog.thumbnailUrl}'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(Utils.dateFormat( date: DateTime.parse(blog.createdAt!)), style: subTitleTextStyle),
              Row(children: [Text(DateFormat('hh:mm a').format(DateTime.parse(blog.createdAt!)), style: subTitleTextStyle)]),
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              blog.title ?? "Title",
              style: Theme.of(context).textTheme.bodyLarge,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),

          GestureDetector(
            onTap: () => context.push(RouteName.blogDetailsScreen, extra:  blog),
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
