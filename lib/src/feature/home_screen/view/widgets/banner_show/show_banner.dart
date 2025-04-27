import 'package:car_wash/core/constant/images.dart';
import 'package:car_wash/core/constant/padding.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowBanner extends StatelessWidget{
  const ShowBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 240.h,
    child: ListView.builder(
      padding: AppPadding.screenHorizontal,
      scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (_, index){
        return Container(
            height: 240.h,
            width: 320.w,
            margin: EdgeInsets.only(right: 16.w),
            decoration: Utils.commonBoxDecoration(shadowColor: Colors.transparent),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.asset( (index+1) %2 == 0 ? AppImages.banner2 : AppImages.banner,fit: BoxFit.cover,),
            ),
          );
        }
    ),
    );


  }
}