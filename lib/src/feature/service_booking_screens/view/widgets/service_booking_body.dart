import 'package:car_wash/src/feature/google_map_screen/riverpod/google_map_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/icons.dart';
import 'custom_calender.dart';
import '../../riverpod/service_booking_screens_riverpod.dart';
import '../../riverpod/service_booking_screens_state.dart';
import 'custom_selection_widget.dart';

class ServiceBookingBody extends StatelessWidget{
  final TabController tabController;
  const ServiceBookingBody({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400.w,
      height: 245.h,
      child: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: tabController,
        children: [
          Consumer(
            builder: (_, ref, _) {
              final serviceSelectionState = ref.watch(
                serviceBookingRiverpod,
              );
              final serviceSelectionNotifier = ref.read(
                serviceBookingRiverpod.notifier,
              );
              return customSelectionWidget(
                context: context,
                firstBodyText: "Instant Service",
                firstLeadingIconPath: AppIcons.instant,
                headingText: "Select Service Time",
                isFirstOneActive:
                serviceSelectionState.selectedServiceTimeType ==
                    ServiceTime.instantService,
                firstOneTap: () {
                  serviceSelectionNotifier.onSelectServiceTimeType(
                    selectedService: ServiceTime.instantService,
                  );
                },
                secondBodyText: "Schedule Service",
                secondLeadingIconPath: AppIcons.calendar,
                secondOneTap:
                    () async  {
                  serviceSelectionNotifier
                    .onSelectServiceTimeType(
                  selectedService:
                  ServiceTime.scheduledService,
                );

                  // await   showDialog(
                  // context: context,
                  // barrierDismissible: true,
                  // builder: (context) {
                  //   return Dialog(
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(12),
                  //     ),
                  //     insetPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
                  //     child: CustomCalendarWidget(),
                  //   );
                  // },
                  // );

                }
              );
            },
          ),

          Consumer(
            builder: (_, ref, _) {
              final serviceSelectionState = ref.watch(
                serviceBookingRiverpod,
              );
              final serviceSelectionNotifier = ref.read(
                serviceBookingRiverpod.notifier,
              );
              return customSelectionWidget(
                context: context,
                firstBodyText: "Car Wash",
                firstLeadingIconPath: AppIcons.car,
                headingText: "Select Service Type",
                isFirstOneActive:
                serviceSelectionState.selectedServiceType ==
                    ServiceType.carWash,
                firstOneTap: () {
                  serviceSelectionNotifier.onSelectServiceType(
                    selectedServiceType: ServiceType.carWash,
                  );
                },
                secondBodyText: "Wheel Fixing",
                secondLeadingIconPath: AppIcons.steering,
                secondOneTap:
                    () => serviceSelectionNotifier
                    .onSelectServiceType(
                      selectedServiceType: ServiceType.wheelFixing,
                ),
              );
            },
          ),

          Consumer(
            builder: (_, ref, _) {
              final serviceSelectionState = ref.watch(
                serviceBookingRiverpod,
              );
              final serviceSelectionNotifier = ref.read(
                serviceBookingRiverpod.notifier,
              );
              final locationState = ref.watch(gMapRiverpod);
              return customSelectionWidget(
                context: context,
                firstBodyText: locationState.autoDetectLocation ?? "Auto Detect Location",
                firstLeadingIconPath: AppIcons.car,
                headingText: "Please Select Your Location",
                isFirstOneActive:
                serviceSelectionState.locationDetectType ==
                    LocationDetectType.auto,
                firstOneTap: () {
                  serviceSelectionNotifier.onSelectLocationDetectType(
                    locationDetectType: LocationDetectType.auto,
                  );
                },
                secondBodyText: locationState.userAddress ??  "Manual Selection",
                secondLeadingIconPath: AppIcons.steering,
                secondOneTap:
                    () => serviceSelectionNotifier
                    .onSelectLocationDetectType(
                  locationDetectType: LocationDetectType.manual,
                ),
              );
            },
          ),


        ],
      ),
    );
  }
}