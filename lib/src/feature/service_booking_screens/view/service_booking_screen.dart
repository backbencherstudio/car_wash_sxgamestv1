import 'package:car_wash/core/constant/padding.dart';
import 'package:car_wash/core/routes/route_name.dart';
import 'package:car_wash/core/services/location_services/location_services.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:car_wash/src/feature/google_map_screen/riverpod/google_map_riverpod.dart';
import 'package:car_wash/src/feature/service_booking_screens/riverpod/calendar_riverpod.dart';
import 'package:car_wash/src/feature/service_booking_screens/view/widgets/custom_calender.dart';
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
                      child: Utils.backButton(context: context),
                    ),

                    HomeHeader(isOnlyTrailing: true),
                  ],
                ),

                SizedBox(height: 99.h),

                /// Body with Tab Bar View
                ServiceBookingBody(tabController: tabController),

                SizedBox(height: 28.h),

                /// Continue button
                SizedBox(
                  width: 360.w,
                  child: Consumer(
                    builder: (_, ref, _) {

                      final serviceBookingState = ref.watch(serviceBookingRiverpod);

                      final serviceBookingNotifier = ref.watch(serviceBookingRiverpod.notifier);

                      final googleMapNotifier = ref.read(gMapRiverpod.notifier);

                      return Utils.primaryButton(
                        onPressed: () async{
                          serviceBookingNotifier.onContinueToBooking(context: context, tabController: tabController, onAutoDetectLocation: googleMapNotifier.onAutoDetectLocation);
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
