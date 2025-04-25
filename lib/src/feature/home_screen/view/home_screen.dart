import 'package:car_wash/core/constant/padding.dart';
import 'package:car_wash/src/feature/home_screen/view/widgets/banner_show/show_banner.dart';
import 'package:car_wash/src/feature/home_screen/view/widgets/book_service/book_service.dart';
import 'package:car_wash/src/feature/home_screen/view/widgets/discount_banner_body/discount_banner_list_view.dart';
import 'package:car_wash/src/feature/home_screen/view/widgets/drawer/home_drawer.dart';
import 'package:car_wash/src/feature/home_screen/view/widgets/home_header/home_header.dart';
import 'package:car_wash/src/feature/home_screen/view/widgets/services_list/service_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


final bottomNavVisibilityProvider = StateProvider<bool>((ref) => true);

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _handleDrawerCallback(bool isOpened) {
    ref.read(bottomNavVisibilityProvider.notifier).state = !isOpened;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: appDrawer(context: context),
      onEndDrawerChanged: _handleDrawerCallback, 
      body: Padding(
        padding: AppPadding.screenHorizontal,
        child: Column(
          children: [
            HomeHeader(),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 24.h),
                    DiscountBannerListView(),
                    SizedBox(height: 32.h),
                    ServicesList(),

                    SizedBox(height: 33.h),
                    BookService(),
                    SizedBox(height: 33.h),
                    ShowBanner(),

                    SizedBox(height: 150.h,)
                  ],
                ),
              ),
            )


          ],
        ),
      ),
    );
  }
}


// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       endDrawer: appDrawer(context: context),
//       body: Column(
//         children: [
//           HomeHeader(),
//           SizedBox(height: 24.h),
//           DiscountBannerListView(),
//           SizedBox(height: 32.h),
//           ServicesList(),
//         ],
//       ),
//     );
//   }
// }
