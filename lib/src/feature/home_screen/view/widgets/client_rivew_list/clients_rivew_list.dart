import 'package:car_wash/core/constant/images.dart';
import 'package:car_wash/core/constant/padding.dart';
import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClientsReviewList extends StatelessWidget {
  const ClientsReviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: AppPadding.screenHorizontal,
          child: Text(
            "Clients Sayings",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        SizedBox(
          height: 260.h,
          child: ListView.builder(
            itemCount: 5,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return FittedBox(
                child: Container(
                  width: 360.w,
                  //height: 220.h,
                  margin: EdgeInsets.only(right: 16.w),
                  padding: EdgeInsets.all(16.r),
                  decoration: Utils.commonBoxDecoration(),
                  child: Column(
                    spacing: 8.h,
                    children: [
                      Row(
                        spacing: 8.w,
                        children: [
                          ClipOval(
                            child: Image.asset(
                              AppImages.client,
                              width: 60.w,
                              height: 60.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Paula Mora",
                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(fontSize: 18.sp),
                              ),
                              Text(
                                "@paulamora",
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(color: AppColors.onSurface),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        "Lorem ipsum dolor sit amet consectetur. Eget pulvinar massa egestas sed. Maecenas eget cursus phasellus felis mi massa eget feugiat odio. Accumsan amet ornare nunc ipsum rhoncus eget donec nunc ut. Consequat lacus mi pharetra lectus in tempor erat viverra.",
                        maxLines: 6,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
