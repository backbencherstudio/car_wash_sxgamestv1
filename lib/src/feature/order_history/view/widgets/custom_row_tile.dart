import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRowTile extends StatelessWidget {
  final String text;
  final String leadingText;
  const CustomRowTile({super.key,
  required this.text,
  required this.leadingText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text,style: Theme.of(context).textTheme.bodySmall!.copyWith(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: Color(0xff62676C)
        ), ),
        Spacer(),
            
        Text(leadingText,style: Theme.of(context).textTheme.bodySmall!.copyWith(
          fontSize: 15.sp,
          fontWeight: FontWeight.w600,
          color: Color(0xff62676C)
        ), ),
      ],
    );
  }
}