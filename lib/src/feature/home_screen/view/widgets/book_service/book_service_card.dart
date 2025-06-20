import 'package:car_wash/core/constant/icons.dart';
import 'package:car_wash/core/constant/images.dart';
import 'package:car_wash/core/routes/route_name.dart';
import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class BookServiceCard extends StatelessWidget {
  final String serviceName;
  final String serviceTime;
  final String location;
  final String imagePath;
  final Function() onTap;
  const BookServiceCard({
    super.key,
    required this.serviceName,
    required this.imagePath,
    required this.onTap,
    this.serviceTime = "9.30 AM - 11 PM",
    this.location = "Ney York City",
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 400.w,
        padding: EdgeInsets.all(12.r),
        decoration: Utils.commonBoxDecoration(),
        child: Row(
          // spacing: 16.w,
          children: [
            Expanded(
              child: Image.asset(
                imagePath,
                //  AppImages.beautifulCarWashingService,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                spacing: 10.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    serviceName,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        AppIcons.locationIcon,
                        width: 16.w,
                        height: 16.h,
                        colorFilter: ColorFilter.mode(
                          Color(0xff434343),
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        location,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Color(0xff62676C),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      SvgPicture.asset(
                        AppIcons.clock,
                        width: 16.w,
                        height: 16.h,
                        colorFilter: ColorFilter.mode(
                          Color(0xff434343),
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        serviceTime,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Color(0xff62676C),
                        ),
                      ),
                    ],
                  ),

                  Utils.primaryButton(
                    onPressed: () async {
                      await onTap();
                      if (context.mounted) {
                        context.push(RouteName.serviceTimeSelectionScreen);
                      }
                    },
                    text: "Book Now",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
