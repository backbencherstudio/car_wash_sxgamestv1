import 'package:car_wash/core/constant/padding.dart';
import 'package:car_wash/core/routes/route_name.dart';
import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:car_wash/src/feature/google_map_screen/riverpod/google_map_riverpod.dart';
import 'package:car_wash/src/feature/service_booking_screens/view/widgets/service_booking_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constant/images.dart';
import '../../home_screen/view/widgets/drawer/home_drawer.dart';
import '../../home_screen/view/widgets/home_header/home_header.dart';
import '../riverpod/service_booking_screens_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ServiceBookingScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ServiceBookingScreen({super.key});

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

                /// Body with Tab Bar View
                ServiceTimeSelectionBody(),

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
                              final isSuccess = await serviceBookingNotifier
                                  .onSelectServiceTime(context);
                              debugPrint(
                                "\nSuccessfully completed the first phase of booking : $isSuccess\n",
                              );

                              if (isSuccess == true && context.mounted) {
                                context.pushReplacement(
                                  RouteName.serviceLocationSelectionScreen,
                                );
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
