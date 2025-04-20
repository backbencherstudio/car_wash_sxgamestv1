// ignore_for_file: must_be_immutable

import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCheckbox extends StatelessWidget {
  final bool isSelected;
  void Function()? onTap;

   CustomCheckbox({
   super.key,
   required this.onTap,
   required this.isSelected
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 24.h,
        width: 24.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? AppColors.primary: Colors.grey,
            width: 2,
          ),
          color: isSelected ? AppColors.primary: Colors.transparent,
        ),
        child: isSelected
            ? Center(
                child: Icon(
                  Icons.check,
                  size: 16.sp,
                  color: Colors.white,
                ),
              )
            : null,
      ),
    );
  }
}
