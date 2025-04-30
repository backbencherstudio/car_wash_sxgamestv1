import 'package:car_wash/core/constant/padding.dart';
import 'package:car_wash/src/feature/home_screen/view/widgets/banner_show/show_banner.dart';
import 'package:car_wash/src/feature/home_screen/view/widgets/blog_list/blog_list.dart';
import 'package:car_wash/src/feature/home_screen/view/widgets/book_service/book_service.dart';
import 'package:car_wash/src/feature/home_screen/view/widgets/client_rivew_list/clients_rivew_list.dart';
import 'package:car_wash/src/feature/home_screen/view/widgets/discount_banner_body/discount_banner_list_view.dart';
import 'package:car_wash/src/feature/home_screen/view/widgets/drawer/home_drawer.dart';
import 'package:car_wash/src/feature/home_screen/view/widgets/home_header/home_header.dart';
import 'package:car_wash/src/feature/home_screen/view/widgets/services_list/service_list.dart';
import 'package:car_wash/src/feature/parent_screen/riverpod/parent_screen_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, _) {
        return Scaffold(
          key: _scaffoldKey,
          endDrawer: appDrawer(context: context),
          onEndDrawerChanged:
              ref.read(parentsScreenProvider.notifier).onDrawerOpenOrClose,
          body: Stack(
           // fit: StackFit.expand,
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 145.h),
                    DiscountBannerListView(),
                    SizedBox(height: 32.h),
                    ServicesList(),

                    SizedBox(height: 33.h),
                    BookService(),
                    SizedBox(height: 33.h),
                    ShowBanner(),
                    SizedBox(height: 33.h),
                    BlogList(),
                    SizedBox(height: 23.h),
                    ClientsReviewList(),

                    SizedBox(height: 150.h),
                  ],
                ),
              ),

              Align(
                alignment: Alignment.topCenter,
                child:  HomeHeader(isOnlyTrailing: false,),
              ),
            ],
          ),
        );
      },
    );
  }
}
