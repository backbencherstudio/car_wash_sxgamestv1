import 'package:car_wash/core/constant/images.dart';
import 'package:car_wash/core/constant/padding.dart';
import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowBanner extends StatelessWidget{
  final String? heading;
  final String? assetImagePath;
  const ShowBanner({super.key, this.heading, this.assetImagePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Heading
        if(heading!=null)
        Padding(
          padding: AppPadding.screenHorizontal,
          child: Text(heading!,style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: AppColors.primary
          ),),
        ),
       SizedBox(height:23.h ,),
        /// Banner horizontal list view
        SizedBox(height: 240.h,
        child: ListView.builder(
          padding: AppPadding.screenHorizontal,
          scrollDirection: Axis.horizontal,
            itemCount: 2,
            itemBuilder: (_, index){
            return Container(
                height: 240.h,
                width: 320.w,
                margin: EdgeInsets.only(right: 16.w),
                decoration: Utils.commonBoxDecoration(shadowColor: Colors.transparent),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.asset(
                    assetImagePath != null ?
                    assetImagePath! :
                    (index+1) %2 == 0 ? AppImages.banner2 : AppImages.banner,fit: BoxFit.cover,),
                ),
              );
            }
        ),
        ),
      ],
    );
  }
}