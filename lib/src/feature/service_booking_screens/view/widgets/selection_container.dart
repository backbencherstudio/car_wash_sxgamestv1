import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSelectionContainer extends StatelessWidget {
  final bool isSelected;
  final String leadingSvgIconPath;
  final bool isImage;
  final String bodyText;
  final VoidCallback onTap;

  final Color unSelectedBorderColor = Color(0xffE9E9E9);
  final Color unSelectedColor = Color(0xff777980);
  final Color selectedColor = AppColors.primary;
  final Color selectedTextColor = AppColors.textColor;

  CustomSelectionContainer({
    super.key,
    required this.isSelected,
    required this.leadingSvgIconPath,
    required this.bodyText,
    required this.onTap,
    this.isImage = false,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.bodyLarge?.copyWith(
      fontSize: 18.sp,
      fontWeight: FontWeight.w400,
    );
    return Container(
      width: double.infinity,
      //   height: 76.h,
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? selectedColor : unSelectedBorderColor,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: ListTile(
        onTap: onTap,
        leading:
            !isImage
                ? SvgPicture.asset(
                  leadingSvgIconPath,
                  width: 24.w,
                  height: 24.h,
                  colorFilter: ColorFilter.mode(
                    isSelected ? selectedColor : unSelectedColor,
                    BlendMode.srcIn,
                  ),
                )
                : Image.asset(leadingSvgIconPath, width: 24.w, height: 24.h),
        title: Text(
          bodyText,
          style: textTheme?.copyWith(
            color: isSelected ? selectedTextColor : unSelectedColor,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Container(
          padding: EdgeInsets.all(3.r),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? AppColors.primary : Colors.white,
            border: Border.all(
              color: isSelected ? AppColors.primary : Color(0xffEEF3F8),
            ),
          ),
          child: Icon(Icons.check, color: Colors.white, size: 16.r),
        ),
      ),
    );
  }
}
