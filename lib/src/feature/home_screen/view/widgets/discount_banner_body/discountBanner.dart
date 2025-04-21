import 'package:car_wash/core/constant/icons.dart';
import 'package:car_wash/core/constant/images.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380.w,
      height: 240.h,
      margin: EdgeInsets.only(right: 16.w),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(AppImages.carWashBanner, fit: BoxFit.cover),
          ),

          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.all(16.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "30% OFF*",
                        style: Theme.of(context).textTheme.headlineLarge
                            ?.copyWith(color: Colors.white, fontSize: 32.sp),
                      ),
                      Text(
                        "Car Wash & Detailing",
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge?.copyWith(color: Colors.white),
                      ),
                    ],
                  ),

                  Utils.secondaryButton(
                    onPressed: () {},
                    imageAsset: AppIcons.arrowUpRight,
                    context: context,
                    backgroundColor: Color.fromRGBO(255, 255, 255, 0.26),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
