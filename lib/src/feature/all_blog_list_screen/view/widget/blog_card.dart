import 'package:car_wash/core/constant/icons.dart';
import 'package:car_wash/core/routes/route_name.dart';
import 'package:car_wash/core/services/api_services/api_endpoints.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../model/blog_model.dart';

class BlogCard extends StatelessWidget {
  final BlogModel blog;
  const BlogCard({super.key, required this.blog});

  @override
  Widget build(BuildContext context) {
    final Color bodyTextColor = Color(0xff62676C);
    final Color iconColor = Color(0xff444950);
    final Color surfaceColor = Color(0xffF0F3FC);
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => context.push(RouteName.blogDetailsScreen, extra:  blog),
      child: Container(
        width: 400.w,
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.all(16.r),
        decoration: Utils.commonBoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8.h,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child:
              Image.network(
                // 'https://car-wash-backend.signalsmind.com/public/storage/avatar/e8f6578776d1f9352ae5d1baab11faccimage2.webp',
               '${ApiEndPoints.baseUrl}/${blog.thumbnailUrl!}',
                width: 368.w,
                height: 177.h,
                fit: BoxFit.cover,
                loadingBuilder: (context, child,
                    loadingProgress) {
                  if (loadingProgress == null)
                    return child; // Image is fully loaded
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress
                          .expectedTotalBytes !=
                          null
                          ? loadingProgress
                          .cumulativeBytesLoaded /
                          (loadingProgress
                              .expectedTotalBytes ??
                              1)
                          : null,
                    ),
                  );
                },
                errorBuilder:
                    (context, error, stackTrace) {
                  return Icon(Icons
                      .error); // Show an error icon if the image fails to load
                },

              ),

              // Image.asset(
              //   AppImages.carWash4,
              //   width: 368.w,
              //   height: 177.h,
              //   fit: BoxFit.cover,
              // ),
            ),
            Container(
              padding: EdgeInsets.all(6.r),
              decoration: BoxDecoration(
                color: surfaceColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                blog.category ?? "Category",
                style: textTheme.bodyMedium?.copyWith(color: bodyTextColor),
              ),
            ),
            Text(
              blog.title ?? "Title",
              style: textTheme.titleSmall,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),

            // Text(
            //   "Keeping your car clean is not just about looking good...",
            //   style: textTheme.bodyMedium?.copyWith(color: bodyTextColor),
            //   maxLines: 2,
            //   overflow: TextOverflow.ellipsis,
            // ),
            SizedBox(height: 5.h),

            Row(
              children: [
                SvgPicture.asset(
                  AppIcons.calendar,
                  width: 16.w,
                  height: 16.h,
                  colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                ),
                SizedBox(width: 4.w),
                Text(
                  Utils.dateFormat(date: DateTime.parse(blog.createdAt!)),
                  style: textTheme.bodyMedium?.copyWith(color: bodyTextColor),
                ),
                SizedBox(width: 8.w),
                SvgPicture.asset(
                  AppIcons.eye,
                  width: 16.w,
                  height: 16.h,
                  colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                ),
                SizedBox(width: 4.w),
                Text(
                  blog.views.toString(),
                  style: textTheme.bodyMedium?.copyWith(color: bodyTextColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
