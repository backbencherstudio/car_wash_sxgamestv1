import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceContainer extends StatelessWidget {
  const PriceContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Color(0xffE9E9E9),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          "USD 7.00/month",
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: Color(0xff62676C),
          ),
        ),
      ),
    );
  }
}
