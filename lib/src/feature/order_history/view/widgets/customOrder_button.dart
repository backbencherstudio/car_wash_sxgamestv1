import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOrderButton extends StatelessWidget {
  final String text;
  const CustomOrderButton({super.key,
  required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(99.r),
        color: AppColors.primary.withValues(alpha: .03)
      ),
      child: Padding(
        padding:  EdgeInsets.all(8.0),
        child: Text(text,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 10.sp,
          color: AppColors.primary
        ),
        ),
      ),
    );
  }
}