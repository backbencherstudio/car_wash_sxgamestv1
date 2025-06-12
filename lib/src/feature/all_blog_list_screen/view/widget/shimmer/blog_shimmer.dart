import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import '../../../../../../core/theme/theme_extension/app_colors.dart';
import '../../../../../../core/utils/utils.dart';

class BlogShimmer extends StatelessWidget{
  const BlogShimmer({super.key, this.isHorizontal = false, this.height});

  final bool isHorizontal;
  final double? height;

  Widget shimmerContainer({required double width, required double height, Widget? child}){
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(10.r)
      ),
      child: child,
    );
  }
  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        physics: !isHorizontal ? NeverScrollableScrollPhysics() : ClampingScrollPhysics(),
        shrinkWrap: !isHorizontal ? true : false,
        scrollDirection: isHorizontal ? Axis.horizontal : Axis.vertical,
        itemCount: 2,
          itemBuilder: (_, index){
        return Center(

          child: Shimmer(
            color: Colors.white,
            colorOpacity: 1,
            child: Container(
              width: 400.w,
              margin: EdgeInsets.only(bottom: 16.h),
              padding: EdgeInsets.all(16.r),
              decoration: Utils.commonBoxDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 12.h,
                children: [
                  shimmerContainer(width: 368.w, height: 175.h),
                  shimmerContainer(width: 72.w, height: 32.h),
                  shimmerContainer(width: 368.w, height: 49.h),
                  shimmerContainer(width: 368.w, height: 44.h),
                  shimmerContainer(width: 205.w, height: 20.h),

                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}