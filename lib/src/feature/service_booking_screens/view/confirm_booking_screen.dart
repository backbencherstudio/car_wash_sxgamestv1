import 'package:car_wash/core/constant/padding.dart';
import 'package:car_wash/core/routes/route_name.dart';
import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:car_wash/src/feature/service_booking_screens/model/service_booking_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ConfirmServiceBookingScreen extends StatelessWidget {
  final ServiceBookingModel serviceBookingModel;
  const ConfirmServiceBookingScreen({super.key, required this.serviceBookingModel});

  Widget customListTile({
    required String title,
    required String value,
    required TextTheme textTheme,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 20.w,
      children: [
        Text(title, style: textTheme.bodyMedium),
        Expanded(
          child: Text(
            value,
            style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    debugPrint("\nlocation : ${serviceBookingModel.location}\n");
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
                    value: serviceBookingModel.serviceType.toString(),
                    textTheme: textTheme,
                  ),
                  SizedBox(height: 16.h),
                  customListTile(
                    title: "Order Location",
                    value: serviceBookingModel.location.toString(),
                    textTheme: textTheme,
                  ),
                  SizedBox(height: 16.h),
                  customListTile(
                    title: "Order Date",
                    value: serviceBookingModel.scheduleDate.toString(),
                    textTheme: textTheme,
                  ),
                  SizedBox(height: 16.h),
                  customListTile(
                    title: "Order Time",
                    value: serviceBookingModel.scheduleTime.toString(),
                    textTheme: textTheme,
                  ),
                  SizedBox(height: 16.h),
                  customListTile(
                    title: "Service Type",
                    value: serviceBookingModel.serviceTiming.toString(),
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
