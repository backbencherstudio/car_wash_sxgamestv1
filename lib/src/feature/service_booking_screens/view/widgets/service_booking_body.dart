import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/icons.dart';
import '../../../service_details_screen/view/widget/custom_calender.dart';
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
      height: 250.h,
      child: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: tabController,
        children: [
          Consumer(
            builder: (_, ref, _) {
              final serviceSelectionState = ref.watch(
                serviceBookingRiverpod,
              );
              final serviceSelectionNotifier = ref.watch(
                serviceBookingRiverpod.notifier,
              );
              return customSelectionWidget(
                context: context,
                firstBodyText: "Instant Service",
                firstLeadingIconPath: AppIcons.instant,
                headingText: "Select Service Time",
                isFirstOneActive:
                serviceSelectionState.selectedServiceTime ==
                    ServiceTime.instantService,
                firstOneTap: () {
                  serviceSelectionNotifier.onSelectServiceTime(
                    selectedService: ServiceTime.instantService,
                  );
                },
                secondBodyText: "Schedule Service",
                secondLeadingIconPath: AppIcons.calendar,
                secondOneTap:
                    () async  {
                  serviceSelectionNotifier
                    .onSelectServiceTime(
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
              final serviceSelectionNotifier = ref.watch(
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
              final serviceSelectionNotifier = ref.watch(
                serviceBookingRiverpod.notifier,
              );
              return customSelectionWidget(
                context: context,
                firstBodyText: "Auto Detect Location",
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
                secondBodyText: "Manual Selection",
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