// ignore_for_file: must_be_immutable

import 'package:car_wash/core/constant/icons.dart';
import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatelessWidget {
  void Function()? onTap;
   CustomButton({super.key,
  required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.primary
        ),
        child: Padding(
          padding:  EdgeInsets.only(left:16.w, right: 16.w, top: 10.h, bottom: 10.h),
          child: Row(
            children: [
              SvgPicture.asset(AppIcons.pen),
              SizedBox(width:4.w),
              Text("Review",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Color(0xffffffff)
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}