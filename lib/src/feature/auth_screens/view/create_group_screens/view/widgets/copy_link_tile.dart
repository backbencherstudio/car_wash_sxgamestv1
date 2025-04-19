import 'package:car_wash/src/common_widget_style/common_style/auth_style/auth_color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CopyLinkTile extends StatelessWidget {
  const CopyLinkTile({
    super.key,
    required this.titleSmall,
    required this.bodyLarge,
  });

  final TextStyle? titleSmall;
  final TextStyle? bodyLarge;

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.only(left: 12.w,),
      decoration: BoxDecoration(
        color: AuthColorPalette.white, // Light background
        borderRadius: BorderRadius.circular(99.r),
      ),
      child: Row(
        children: [
          // Left side - URL
          Container(
            constraints: BoxConstraints(maxWidth: 200.w),
            child: Text(
              'https://example.com/group/link',
              overflow: TextOverflow.ellipsis,
              style: titleSmall,
            ),
          ),
          const Spacer(),
          // Right side - Copy button
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: const Color(0xFFE8D7FF), // Light purple
              borderRadius: BorderRadius.circular(99.r),
            ),
            child: Text(
              'Copy Link',
              style: bodyLarge?.copyWith(
                  fontWeight: FontWeight.w500
              ),
            ),
          ),
        ],
      ),
    );
  }
}