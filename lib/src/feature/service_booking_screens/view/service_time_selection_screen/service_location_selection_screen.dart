import 'package:car_wash/core/constant/padding.dart';
import 'package:car_wash/core/routes/route_name.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:car_wash/src/feature/service_booking_screens/view/service_time_selection_screen/widget/service_location_selection_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/constant/images.dart';
import '../../../home_screen/view/widgets/drawer/home_drawer.dart';
import '../../../home_screen/view/widgets/home_header/home_header.dart';
import '../../riverpod/service_booking_screens_riverpod.dart';
import '../../riverpod/service_booking_screens_state.dart';

class ServiceLocationSelectionScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ServiceLocationSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: appDrawer(context: context),
      body: Stack(
        children: [
          /// Background
          Positioned.fill(
            child: Image.asset(
              AppImages.whiteBackground,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          /// Foreground
          Positioned.fill(
            child: Column(
              children: [
                /// Header
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, top: 20),
                      child: Consumer(
                        builder: (_, ref, _) {
                          return Utils.backButton(
                            context: context,
                            onTap: () {
                              ref
                                  .read(serviceBookingRiverpod.notifier)
                                  .clearServiceBookingState();
                              context.pop();
                            },
                          );
                        },
                      ),
                    ),

                    HomeHeader(isOnlyTrailing: true),
                  ],
                ),

                SizedBox(height: 99.h),

                ServiceLocationSelectionBody(),

                SizedBox(height: 28.h),

                /// Continue button
                Padding(
                  padding: AppPadding.screenHorizontal,
                  child: Consumer(
                    builder: (_, ref, _) {
                      final serviceBookingState = ref.watch(
                        serviceBookingRiverpod,
                      );

                      final serviceBookingNotifier = ref.watch(
                        serviceBookingRiverpod.notifier,
                      );

                      return serviceBookingState.isContinueButtonLoading
                          ? Utils.loadingButton()
                          : Utils.primaryButton(
                            height: 48.h,
                            onPressed: () async {

                              if(serviceBookingState.locationDetectType == LocationDetectType.auto){
                                if(serviceBookingState.serviceAutoDetectedLocation != null){
                                  final serviceBookingModel =  serviceBookingNotifier.createServiceBookingModel();
                                  context.pushReplacement(RouteName.confirmBookingScreen,extra: serviceBookingModel);
                                }
                                else{
                                  final isSuccess = await serviceBookingNotifier
                                      .onDetectLocation(context);
                                  debugPrint(
                                    "\nSuccessfully completed the last phase of booking : $isSuccess\n",
                                  );
                                }

                              }
                              else{
                                if(serviceBookingState.serviceManuallyDetectedLocation != null){
                                  final serviceBookingModel =  serviceBookingNotifier.createServiceBookingModel();
                                  context.pushReplacement(RouteName.confirmBookingScreen,extra: serviceBookingModel);

                                }
                                else{
                                  context.push(RouteName.googleMapScreen);
                                }

                              }


                            },
                            text: "Continue",
                          );
                    },
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
