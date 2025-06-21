import 'package:car_wash/core/utils/utils.dart';
import 'package:car_wash/src/feature/order_history/Riverpod/order_notifier.dart';
import 'package:car_wash/src/feature/order_history/view/widgets/customContainer.dart';
import 'package:car_wash/src/feature/order_history/view/widgets/shimmer/order_Shimmer.dart';
import 'package:car_wash/src/feature/service_booking_screens/view/widgets/shimmer/order_summary_shimmer_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../home_screen/view/widgets/drawer/home_drawer.dart';
import '../../home_screen/view/widgets/home_header/home_header.dart';

class OrderHistoryScreen extends StatelessWidget {
  OrderHistoryScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: appDrawer(context: context),
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
                  Consumer(
                    builder: (context, ref, _) {
                      final orderListAsync = ref.watch(orderHistoryProvider);

                      return orderListAsync.when(
                        data: (orderList) {
                          if (orderList.isEmpty) {
                            return Center(
                              child: Text("No order history found"),
                            );
                          }

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: orderList.length,
                            itemBuilder: (context, index) {
                              final order = orderList[index];

                              return Padding(
                                padding: EdgeInsets.only(
                                  left: 24.w,
                                  right: 24.w,
                                  top: 10.h,
                                  bottom: 16.h,
                                ),
                                child: Customcontainer(
                                  status: order.status,
                                  serviceName: order.service_type,
                                  orderDate: order.schedule_date,
                                  orderID: order.id,
                                  orderLoacation: order.location,
                                  orderTime: order.schedule_time,
                                  serviceType: order.service_type,
                                ),
                              );
                            },
                          );
                        },
                        loading:
                            () => Column(
                              children: [
                               OrderSummaryShimmerCard(),
                               OrderSummaryShimmerCard(),
                               OrderSummaryShimmerCard()
                              ],
                            ),
                        error:
                            (error, _) => Center(
                              child: Text("Error: ${error.toString()}"),
                            ),
                      );
                    },
                  ),

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
