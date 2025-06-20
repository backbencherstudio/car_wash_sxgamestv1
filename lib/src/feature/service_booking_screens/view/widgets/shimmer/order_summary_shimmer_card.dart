import 'package:car_wash/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../../../../core/theme/theme_extension/app_colors.dart';

class OrderSummaryShimmerCard extends StatelessWidget{
  const OrderSummaryShimmerCard({super.key});


  Widget _falseText(){
    return Container(
      width: 87.w,
      height: 20.h,
      decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(10.r)
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Shimmer(
      color: Colors.white,
      colorOpacity: 1,
      child: Container(
        width:  400.w,
        //height: 232.h,
        padding: EdgeInsets.all(15.r),
        decoration: Utils.commonBoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 15.h,
          children: [
            _falseText(),
            Divider(color: AppColors.surface),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _falseText(),
                _falseText(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _falseText(),
                _falseText(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _falseText(),
                _falseText(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _falseText(),
                _falseText(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _falseText(),
                _falseText(),
              ],
            ),

          ],
        ),
      ),
    );
  }
}