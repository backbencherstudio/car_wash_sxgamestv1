import 'package:car_wash/core/constant/padding.dart';
import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlogHTMLBodyShow extends StatelessWidget {
  final String category;
  final String title;
  final String htmlText;
  const BlogHTMLBodyShow({
    super.key,
    required this.category,
    required this.title,
    required this.htmlText,
  });

  @override
  Widget build(BuildContext context) {
    final bodyTextColor = Color(0xff62676C);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: AppPadding.screenHorizontal,
          child: Text(
            category,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppColors.primary),
          ),
        ),

        SizedBox(height: 8.h),
        Padding(
          padding: AppPadding.screenHorizontal,
          child: Text(title, style: Theme.of(context).textTheme.headlineSmall),
        ),
        SizedBox(height: 8.h),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.w),
          child: Html(
            data: htmlText,
            shrinkWrap: true,
            style: {
              "h2": Style(
                color: AppColors.textColor,
                fontSize: FontSize.xxLarge,
                fontWeight: FontWeight.w600,
                lineHeight: LineHeight.normal,
              ),
              "h3": Style(
                color: AppColors.textColor,
                fontSize: FontSize.xLarge,
                fontWeight: FontWeight.w600,
              ),
              "p": Style(
                color: bodyTextColor,
                fontSize: FontSize.medium,
                fontWeight: FontWeight.w400,
                lineHeight: LineHeight.number(1.3),
              ),
            },
          ),
        ),
      ],
    );
  }
}
