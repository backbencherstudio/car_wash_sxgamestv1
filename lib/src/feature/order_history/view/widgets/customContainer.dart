import 'package:car_wash/core/routes/route_name.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:car_wash/src/feature/order_history/view/widgets/customOrder_button.dart';
import 'package:car_wash/src/feature/order_history/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'custom_row_tile.dart';

class Customcontainer extends StatelessWidget {
  const Customcontainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400.w,
      height: 340.h,
      decoration: Utils.commonBoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Row(
              children: [
                CustomOrderButton(text: "Complete Order"),
                Spacer(),
                CustomButton(onTap: () {
                  context.push(RouteName.feedbackScreen);
                },),
              ],
            ),
          SizedBox(height: 4.h,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "06 May 2025",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff151C24),
                ),
              ),
            ),
            Divider(
              thickness: 2,
              color: Color(0xffE9E9E9),
              indent: 3.w,
              endIndent: 3.w,
            ),
            CustomRowTile(text: "Service Name", leadingText: "Exterior Wash"),
            SizedBox(height: 16.h),
            CustomRowTile(text: "Order ID", leadingText: "#54637898"),
            SizedBox(height: 16.h),
            CustomRowTile(text: "Order Location", leadingText: "New York City"),
            SizedBox(height: 16.h),
            CustomRowTile(text: "Order Date", leadingText: "02-05-2025"),
            SizedBox(height: 16.h),
            CustomRowTile(text: "Order Time", leadingText: "08:00 am"),
            SizedBox(height: 16.h),
            CustomRowTile(
              text: "Service Type",
              leadingText: "Schedule Service",
            ),
          ],
        ),
      ),
    );
  }
}
