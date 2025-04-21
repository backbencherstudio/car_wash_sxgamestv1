import 'package:car_wash/core/constant/icons.dart';
import 'package:car_wash/core/constant/padding.dart';
import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServicesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.screenHorizontal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12.h,
        children: [
          Text(
            "Servicces",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: 18.sp,
              color: AppColors.textColor,
            ),
          ),
          Container(
            height: 268.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.04),
                  blurRadius: 10.r,
                  spreadRadius: 10.r,
                  offset: Offset(4, 8),
              ),

              ],
            ),

            child: GridView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 24.h,
                  mainAxisSpacing: 16.w,

                ),
                itemBuilder: (_, index){
                TextStyle textStyle = Theme.of(context).textTheme.bodyMedium!;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 12.h,
                  children: [
                    Utils.secondaryButton(
                        onPressed: (){},
                        imageAsset: AppIcons.userFill,
                        context: context,
                      backgroundColor: Color.fromRGBO(0, 124, 240, 0.08),
                      iconColor: AppColors.primary
                    ),
                    Text("Exterior Wash",style: textStyle,)
                  ],
                );
          }),
          ),
        ],
      ),
    );
  }
}
