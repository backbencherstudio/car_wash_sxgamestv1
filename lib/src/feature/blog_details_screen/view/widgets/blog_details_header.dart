import 'package:car_wash/core/constant/icons.dart';
import 'package:car_wash/core/constant/images.dart';
import 'package:car_wash/core/constant/padding.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';

class BlogDetailsHeader extends StatelessWidget {
  final String adminName;
  final String publishedDate;
  final String thumbnailImage;

  const BlogDetailsHeader({super.key, required this.adminName, required this.publishedDate, required this.thumbnailImage, });

  @override
  Widget build(BuildContext context) {
    final bodyTextColor = Color(0xff62676C);
    final bodyTextTheme = Theme.of(
      context,
    ).textTheme.bodyMedium?.copyWith(color: bodyTextColor);

    return Padding(
      padding: AppPadding.screenHorizontal,
      child: Column(
        children: [
          /// Blog Poster Details
          Row(
            children: [
              ClipOval(
                child: Image.asset(AppImages.shakin, width: 24.w, height: 24.w),
              ),

              SizedBox(width: 10.w),

              Text(
                "By: $adminName",
                style: bodyTextTheme?.copyWith(fontWeight: FontWeight.w500),
              ),

              Spacer(),

              Text(
                "Published: ${Utils.dateFormat(date: DateTime.parse( publishedDate))}",
                style: bodyTextTheme?.copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),

          SizedBox(height: 12.h),

          /// Thumbnail Image
          ///
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Utils.networkImage(
                width: 400.w, height: 300.h,
                imageUrl: thumbnailImage),
          ),

          SizedBox(height: 12.h),

          Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                  onTap: (){
                    SharePlus.instance.share(
                      ShareParams(
                        text: 'https://bd.linkedin.com/in/nahidul-islam-shakin',
                        title: "Connect with Nahidul Islam Shakin"
                      )
                    );
                  },
                  child: SvgPicture.asset(AppIcons.share, width: 20.w, height: 20.h))),
        ],
      ),
    );
  }
}
