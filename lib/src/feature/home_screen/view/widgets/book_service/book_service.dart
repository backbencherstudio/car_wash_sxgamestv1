import 'package:car_wash/core/constant/icons.dart';
import 'package:car_wash/core/constant/images.dart';
import 'package:car_wash/core/constant/padding.dart';
import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:car_wash/src/feature/service_booking_screens/riverpod/service_booking_screens_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../service_booking_screens/riverpod/service_booking_screens_riverpod.dart';
import 'book_service_card.dart';

class BookService extends ConsumerWidget {
  const BookService({super.key});

  @override
  Widget build(BuildContext context, ref) {
    TextStyle headerTextStyle = Theme.of(context).textTheme.titleSmall!;
    final serviceBookingState = ref.read(serviceBookingRiverpod.notifier);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 22.h,
      children: [
        Padding(
          padding: AppPadding.screenHorizontal,
          child: Text("Select service you want", style: headerTextStyle),
        ),
        BookServiceCard(
          serviceName: "Car Wash",
          serviceTime: "9:30 AM - 11 PM",
          location: "New York City",
          imagePath: AppImages.carWash,
          onTap: () async {
            serviceBookingState.clearServiceBookingState();
            serviceBookingState.onSelectServiceType(
              selectedServiceType: ServiceType.carWash,
            );
          },
        ),
        BookServiceCard(
          serviceName: "Wheel Fix",
          imagePath: AppImages.wheelFix,
          serviceTime: "9:30 AM - 11 PM",
          location: "New York City",
          onTap: () {
            serviceBookingState.clearServiceBookingState();
            serviceBookingState.onSelectServiceType(
              selectedServiceType: ServiceType.wheelFixing,
            );
          },
        ),
        BookServiceCard(
          serviceName: "Store",
          location: "New York City",
          serviceTime: "9:30 AM - 11 PM",
          imagePath: AppImages.store,
          onTap: () {
            serviceBookingState.clearServiceBookingState();
            serviceBookingState.onSelectServiceType(
              selectedServiceType: ServiceType.store,
            );
          },
        ),
      ],
    );
  }
}
