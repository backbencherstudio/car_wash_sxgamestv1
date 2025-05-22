import 'package:car_wash/core/utils/utils.dart';
import 'package:car_wash/src/order_history/view/widgets/customContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../feature/home_screen/view/widgets/home_header/home_header.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.w, top: 20),
                child: Utils.backButton(context: context),
              ),

              HomeHeader(isOnlyTrailing: true),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 17.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Text(
                        "Order History",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff151C24),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Customcontainer(),
                  SizedBox(height: 12.h),
                  Customcontainer(),
                  SizedBox(height: 12.h),
                  Customcontainer(),
                  SizedBox(height: 100.h),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
