import 'package:car_wash/core/constant/images.dart';
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

      child: ListView(
        padding: AppPadding.screenHorizontal,
        scrollDirection: Axis.horizontal,
        physics: ClampingScrollPhysics(),
        children: [
          DiscountBanner(imagePath: AppImages.wheelFix2),
          DiscountBanner(imagePath: AppImages.carWash),
        ],
      ),
    );
  }
}
