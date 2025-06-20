import 'package:car_wash/core/constant/padding.dart';
import 'package:car_wash/src/feature/google_map_screen/riverpod/google_map_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/icons.dart';
import 'custom_calender.dart';
import '../../riverpod/service_booking_screens_riverpod.dart';
import '../../riverpod/service_booking_screens_state.dart';
import 'custom_selection_widget.dart';
import 'extra_payment_bottom_sheet.dart';

class ServiceTimeSelectionBody extends StatelessWidget {

  const ServiceTimeSelectionBody({super.key,});

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;

    return Container(
      //width: 400.w,
      height: deviceHeight < 700 ? 325.h : 275.h,
      margin: AppPadding.screenHorizontal,
      child: Consumer(
        builder: (_, ref, _) {
          final serviceSelectionState = ref.watch(serviceBookingRiverpod);
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
            firstOneTap: () async {
              serviceSelectionNotifier.onSelectServiceTimeType(
                selectedService: ServiceTime.instantService,
              );
            },
            secondBodyText: "Schedule Service",
            secondLeadingIconPath: AppIcons.calendar,
            secondOneTap: () async {
              serviceSelectionNotifier.onSelectServiceTimeType(
                selectedService: ServiceTime.scheduledService,
              );
            },
          );
        },
      ),
    );
  }
}
