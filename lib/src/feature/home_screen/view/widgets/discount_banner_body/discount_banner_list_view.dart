import 'package:car_wash/core/constant/padding.dart';
import 'package:car_wash/src/feature/home_screen/view/widgets/discount_banner_body/discountBanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiscountBannerListView extends StatelessWidget {
  const DiscountBannerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240.h,
      width: double.infinity,

      child: ListView.builder(
        padding: AppPadding.screenHorizontal,
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        physics: ClampingScrollPhysics(),
        itemBuilder: (_, index) {
          return DiscountBanner();
        },
      ),
    );
  }
}
