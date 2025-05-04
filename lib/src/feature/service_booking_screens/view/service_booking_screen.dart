import 'package:car_wash/core/constant/padding.dart';
import 'package:car_wash/core/routes/route_name.dart';
import 'package:car_wash/core/services/location_services/location_services.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:car_wash/src/feature/service_booking_screens/view/widgets/custom_selection_widget.dart';
import 'package:car_wash/src/feature/service_booking_screens/view/widgets/service_booking_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constant/icons.dart';
import '../../../../core/constant/images.dart';
import '../../home_screen/view/widgets/home_header/home_header.dart';
import '../riverpod/service_booking_screens_riverpod.dart';
import '../riverpod/service_booking_screens_state.dart';

class ServiceBookingScreen extends StatefulWidget {
  const ServiceBookingScreen({super.key});

  @override
  State<ServiceBookingScreen> createState() => _ServiceBookingScreenState();
}

class _ServiceBookingScreenState extends State<ServiceBookingScreen>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppImages.whiteBackground,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Positioned.fill(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left:20.w , top: 20),
                      child: Utils.backButton(context: context),
                    ),

                    HomeHeader(isOnlyTrailing: true)
                  ],
                ),
                // Align(
                //   alignment: Alignment.topRight,
                //   child: HomeHeader(isOnlyTrailing: true),
                // ),

                SizedBox(height: 99.h),

                ServiceBookingBody(tabController:tabController),

                SizedBox(
                  width: 360.w,
                  child: Consumer(
                    builder: (_, ref, _) {
                      final serviceBookingState = ref.watch(serviceBookingRiverpod);
                      return Utils.primaryButton(
                        onPressed:
                            () async {
                          if(tabController.index+1 == tabController.length){
                            if(serviceBookingState.locationDetectType == LocationDetectType.auto){
                              final address = await LocationService.instance.getCurrentAddress();

                            }
                            else{
                              context.push(RouteName.googleMapScreen);
                            }
                          }
                          else{
                            tabController.animateTo(
                                tabController.index+1
                            );
                          }

                                },
                        text: "Continue",
                      );
                    }
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
