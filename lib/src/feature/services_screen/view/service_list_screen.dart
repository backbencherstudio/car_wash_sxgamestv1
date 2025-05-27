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

class ServiceListScreen extends ConsumerWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ServiceListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: appDrawer(context: context),
      onEndDrawerChanged:
          ref.read(parentsScreenProvider.notifier).onDrawerOpenOrClose,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 124.h),

                /// Service's list
                ServicesList(),
                SizedBox(height: 33.h),

                /// Booked a service
                BookService(),
                SizedBox(height: 33.h),

                /// Show company service's banner
                ShowBanner(),
                SizedBox(height: 33.h),

                /// Show blog
                BlogList(),
                SizedBox(height: 23.h),

                /// Client's review on services
                ClientsReviewList(),

                SizedBox(height: 150.h),
              ],
            ),
          ),

          Align(
            alignment: Alignment.topRight,
            child: HomeHeader(isOnlyTrailing: true),
          ),
        ],
      ),
    );
  }
}
