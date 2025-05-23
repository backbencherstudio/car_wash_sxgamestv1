// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class BuildLabel extends StatelessWidget {
  final String text;
  final TextTheme textStyle;
  const BuildLabel({super.key,
  required this.text,
  required this.textStyle
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: textStyle.bodySmall!.copyWith(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: Color(0xffB4B4B4),
        ),
      ),
    );
  }
}
