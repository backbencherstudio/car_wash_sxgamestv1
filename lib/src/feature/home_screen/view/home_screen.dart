import 'package:car_wash/src/feature/home_screen/view/widgets/discount_banner_body/discount_banner_list_view.dart';
import 'package:car_wash/src/feature/home_screen/view/widgets/drawer/home_drawer.dart';
import 'package:car_wash/src/feature/home_screen/view/widgets/home_header/home_header.dart';
import 'package:car_wash/src/feature/home_screen/view/widgets/services_list/service_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: appDrawer(context: context),
      body: Column(
        children: [
          HomeHeader(),
          SizedBox(height: 24.h),
          DiscountBannerListView(),
          SizedBox(height: 32.h),
          ServicesList(),
        ],
      ),
    );
  }
}
