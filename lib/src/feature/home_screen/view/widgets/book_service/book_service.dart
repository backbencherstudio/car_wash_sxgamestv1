import 'package:car_wash/core/constant/icons.dart';
import 'package:car_wash/core/constant/padding.dart';
import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'book_service_card.dart';

class BookService extends StatelessWidget{
  const BookService({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle headerTextStyle = Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 18.sp,);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 22.h,
      children: [
        Padding(
          padding: AppPadding.screenHorizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Select service you want",style: headerTextStyle,),
              Row(
                children: [
                  Text("View All",style: headerTextStyle.copyWith(color: AppColors.primary),),
                  SvgPicture.asset(AppIcons.arrowRight,colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),)
                ],
              ),
            ],
          ),
        ),
        BookServiceCard(serviceName: "Exterior Wash",),
        BookServiceCard(serviceName: "Hand Drying",),
      ],
    );
  }
}