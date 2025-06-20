import 'package:car_wash/core/constant/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constant/icons.dart';
import '../../../../google_map_screen/riverpod/google_map_riverpod.dart';
import '../../../riverpod/service_booking_screens_riverpod.dart';
import '../../../riverpod/service_booking_screens_state.dart';
import '../../widgets/custom_selection_widget.dart';


class ServiceLocationSelectionBody extends StatelessWidget {

  const ServiceLocationSelectionBody({super.key,});

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;

    return Container(
      //width: 400.w,
      height: deviceHeight < 700 ? 325.h : 275.h,
      margin: AppPadding.screenHorizontal,
      child:  /// Body with Tab Bar View
      Consumer(
        builder: (_, ref, _) {
          final serviceSelectionState = ref.watch(serviceBookingRiverpod);
          final serviceSelectionNotifier = ref.read(
            serviceBookingRiverpod.notifier,
          );
          // final locationState = ref.watch(gMapRiverpod);
          return customSelectionWidget(
            context: context,
            firstBodyText:
            serviceSelectionState.serviceAutoDetectedLocation ?? "Auto Detect Location",
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
            secondBodyText: serviceSelectionState.serviceManuallyDetectedLocation ?? "Manual Selection",
            secondLeadingIconPath: AppIcons.steering,
            secondOneTap:
                () => serviceSelectionNotifier.onSelectLocationDetectType(
                  locationDetectType: LocationDetectType.manual,
                ),
          );
        },
      ),
    );
  }
}
