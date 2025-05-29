import 'package:car_wash/core/constant/padding.dart';
import 'package:car_wash/core/routes/route_name.dart';
import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ConfirmServiceBookingScreen extends StatelessWidget {
  const ConfirmServiceBookingScreen({super.key});

  Widget customListTile({
    required String title,
    required String value,
    required TextTheme textTheme,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: textTheme.bodyMedium),
        Text(
          value,
          style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 24.h,
          children: [
            Text("Confirm Your Order", style: textTheme.headlineSmall),
            Container(
              width: 400.w,
              padding: EdgeInsets.all(12.r),
              decoration: Utils.commonBoxDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Order Summary",
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Divider(color: AppColors.surface),
                  SizedBox(height: 12.h),
                  customListTile(
                    title: "Service Name",
                    value: "Car Wash",
                    textTheme: textTheme,
                  ),
                  SizedBox(height: 16.h),
                  customListTile(
                    title: "Order Location",
                    value: "New York City",
                    textTheme: textTheme,
                  ),
                  SizedBox(height: 16.h),
                  customListTile(
                    title: "Order Date",
                    value: "02-05-2025",
                    textTheme: textTheme,
                  ),
                  SizedBox(height: 16.h),
                  customListTile(
                    title: "Order Time",
                    value: "08:00 AM",
                    textTheme: textTheme,
                  ),
                  SizedBox(height: 16.h),
                  customListTile(
                    title: "Service Type",
                    value: "Schedule Service",
                    textTheme: textTheme,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Utils.primaryButton(
                onPressed: () {
                  context.go(RouteName.homeScreen);
                },
                text: "Confirm Booking",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
