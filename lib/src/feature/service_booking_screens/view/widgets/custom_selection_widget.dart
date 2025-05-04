import 'package:car_wash/src/feature/service_booking_screens/view/widgets/selection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customSelectionWidget({
  required BuildContext context,
  required String headingText,
  required String firstLeadingIconPath,
  required String firstBodyText,
  required String secondLeadingIconPath,
  required String secondBodyText,
  required bool isFirstOneActive,
  required VoidCallback  firstOneTap,
  required VoidCallback  secondOneTap,
}) {
  return Column(
    children: [
      Text(headingText, style: Theme.of(context).textTheme.headlineSmall),
      SizedBox(height: 20.h),

      CustomSelectionContainer(
        onTap: firstOneTap,
        bodyText: firstBodyText,
        isSelected: isFirstOneActive,
        leadingSvgIconPath: firstLeadingIconPath,
      ),

      SizedBox(height: 12.h),

      CustomSelectionContainer(
        onTap: secondOneTap,
        bodyText: secondBodyText,
        isSelected: !isFirstOneActive,
        leadingSvgIconPath: secondLeadingIconPath,
      ),
    ],
  );
}