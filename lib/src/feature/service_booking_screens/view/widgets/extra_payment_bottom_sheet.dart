import 'package:car_wash/core/constant/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routes/route_name.dart';
import '../../../../../core/utils/utils.dart';
import '../../../auth_screens/view/payment/view/widget/agreement.dart';
import '../../../auth_screens/view/payment/view/widget/box_container.dart';
import '../../../auth_screens/view/payment/view/widget/form.dart';
import '../../../auth_screens/view/payment/view/widget/terms&condition.dart';

Future<void> showPaymentBottomSheet({required BuildContext context}) async {
  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: Colors.transparent,
    builder: (_) {
      final textStyle = Theme.of(context).textTheme;
      return Container(
        padding: AppPadding.screenHorizontal,
        constraints: BoxConstraints(maxHeight: 810.h, minHeight: 810.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),

        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 24.h),
              Text(
                "Set Up Your Card",
                style: textStyle.headlineMedium!.copyWith(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff1F1F1F),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "Choose a Payment Option to Start Your Subscription",
                style: textStyle.bodySmall!.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff444950),
                ),
              ),
              SizedBox(height: 32.h),
              FormCard(),
              SizedBox(height: 16.h),
              PriceContainer(),
              SizedBox(height: 16),
              TermsAndCondition(),
              SizedBox(height: 16.h),
              Agreement(),
              SizedBox(height: 16.h),
              Utils.primaryButton(
                onPressed: () {
                  context.pop();
                },
                text: "Continue",
              ),
            ],
          ),
        ),
      );
    },
  );
}
