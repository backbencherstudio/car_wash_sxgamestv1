import 'package:car_wash/core/constant/padding.dart';
import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:car_wash/src/feature/home_screen/view/widgets/banner_show/show_banner.dart';
import 'package:car_wash/src/feature/service_details_screen/view/widget/bridge.dart';
import 'package:car_wash/src/feature/service_details_screen/view/widget/five_star.dart';
import 'package:car_wash/src/feature/service_details_screen/view/widget/truckContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routes/route_name.dart';
import '../../home_screen/view/widgets/client_rivew_list/clients_rivew_list.dart';
import '../../home_screen/view/widgets/drawer/home_drawer.dart';
import '../../home_screen/view/widgets/home_header/home_header.dart'
    show HomeHeader;
import '../../parent_screen/riverpod/parent_screen_riverpod.dart';

class ServiceDetailsScreen extends StatelessWidget {
  ServiceDetailsScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
            children: [
              SingleChildScrollView(
              child: Column(
              children: [
              SizedBox(
              height: 300.h,
              width: MediaQuery.sizeOf(context).width,
              child: Image.asset(
              "assets/images/serviceDetails/maskGroup.png",
              fit: BoxFit.cover,
                      ),
                    ),

              //below image content
              Padding(
              padding: EdgeInsets.only(top: 25.h, right: 20.w),
              child: SizedBox(
              height: 84.h,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Padding(
              padding: AppPadding.screenHorizontal,
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text("Exterior Wash",style:Theme.of(context).textTheme.headlineSmall,),
              SizedBox(height: 2.h),
              Text("CarFlix", style: Theme.of(context).textTheme.bodyLarge!.copyWith( fontWeight: FontWeight.w400,color: Color(0xff62676C))),
              FiveStar(),
                                ],
                              ),
                            ),
               SizedBox(width: 17.w),
               Utils.primaryButton(
                              onPressed: () {
                                context.push(RouteName.googleMapScreen);
                              },
                              text: "Book Now",
                              width: 153.w,
                              height: 49.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 18.h),
                    Column(
                      children: [
                        Padding(
                          padding: AppPadding.screenHorizontal,
                          child: Column(
                            children: [
                              RowContent(
                                img: "assets/icons/carOne.svg",
                                text: "Service Type",
                                trailText: "Car Wash",
                              ),
                              RowContent(
                                img: "assets/icons/map.svg",
                                text: "New York City",
                                trailText: null,
                              ),
                              RowContent(
                                img: "assets/icons/clocky.svg",
                                text: "09:30 AM - 11:00 PM",
                                trailText: null,
                              ),
                              SizedBox(height: 24.h),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "About the Provider",
                                  style: Theme.of(
                                    context,
                                  ).textTheme.headlineMedium!.copyWith(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textColor,
                                  ),
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Premium mobile & in-garage detailing. We serve all vehicle types and offer expert wheel services",
                                  style: Theme.of(context).textTheme.bodyLarge!
                                      .copyWith(color: Color(0xff62676C)),
                                ),
                              ),
                              SizedBox(height: 16.h),
                              RowContent(
                                img: "assets/icons/userry.svg",
                                text: "Team Size: 03",
                              ),
                              RowContent(
                                img: "assets/icons/towTruck.svg",
                                text: "Mobile: Available",
                              ),
                              RowContent(
                                img: "assets/icons/garage.svg",
                                text: "Garage: Available",
                              ),
                              SizedBox(height: 24.h),
                            ],
                          ),
                        ),

                        TruckContainer(),
                        SizedBox(height: 24.h),

                        ShowBanner(
                          assetImagePath:
                              "assets/images/serviceDetails/bently.png",
                          heading: "Gallery",
                        ),
                        SizedBox(height: 24.h),

                        ClientsReviewList(),
                      ],
                    ),
                    SizedBox(height: 200.h),
                  ],
                ),
              ),

              Align(
                alignment: Alignment.topRight,
                child: Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left:30.w , top: 20),
                      child: Utils.backButton(context: context),
                    ),
                    Spacer(),
                    HomeHeader(isOnlyTrailing: true),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
