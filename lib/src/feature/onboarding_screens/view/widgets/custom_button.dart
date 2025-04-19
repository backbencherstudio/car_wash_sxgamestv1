import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common_widget_style/common_style/auth_style/auth_color_pallete.dart';

Widget buildContainerButton({
  required BuildContext context,
  required String imagePath,
  required String title,
  required Color color,
  required Color textColor,
  required VoidCallback onTap,
  Color? circleColor,
  Color? iconColor,
  // required Color titleColor,
}) {

  final titleSmall = Theme.of(context).textTheme.titleSmall;

  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(99.r),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: circleColor,
              shape: BoxShape.circle,
            ),
            child: ImageIcon(AssetImage(imagePath),color: iconColor),
          ),
          SizedBox(width: 16.w),
          Text(
            title,
            style: titleSmall?.copyWith(color: textColor), // color == Color(0xFFECEFF3) ? Color(0xFF1D1F2C) : Color(0xFFFFFFFF)),
          ),
          Spacer(),
          Icon(Icons.arrow_forward, color:  color == Color(0xFFECEFF3) ? Color(0xFF1D1F2C) : Color(0xFFFFFFFF)),
          SizedBox(width: 10.w),
        ],
      ),
    ),
  );
}