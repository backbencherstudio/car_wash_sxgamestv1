import 'package:car_wash/core/constant/padding.dart';
import 'package:car_wash/core/routes/route_name.dart';
import 'package:car_wash/core/services/payment_services/stripe_services.dart';
import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:car_wash/src/feature/auth_screens/view/payment/view/widget/agreement.dart';
import 'package:car_wash/src/feature/auth_screens/view/payment/view/widget/box_container.dart';
import 'package:car_wash/src/feature/auth_screens/view/payment/view/widget/form.dart';
import 'package:car_wash/src/feature/auth_screens/view/payment/view/widget/terms&condition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:go_router/go_router.dart';

class PaymentSelectionFormScreen extends StatelessWidget {
  const PaymentSelectionFormScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: AppPadding.screenHorizontal,
        child: SingleChildScrollView(
          child: Column(
            children: [

              // Text(
              //   "Set Up Your Card",
              //   style: textStyle.headlineMedium!.copyWith(
              //     fontSize: 24.sp,
              //     fontWeight: FontWeight.w500,
              //     color: Color(0xff1F1F1F),
              //   ),
              // ),
              // SizedBox(height: 8.h),
              // Text(
              //   "Choose a Payment Option to Start Your Subscription",
              //   style: textStyle.bodySmall!.copyWith(
              //     fontSize: 16.sp,
              //     fontWeight: FontWeight.w400,
              //     color: Color(0xff444950),
              //   ),
              // ),
              // SizedBox(height: 32.h),
              // FormCard(),
              // SizedBox(height: 16.h),
              // PriceContainer(),
              // SizedBox(height: 16),
              // TermsAndCondition(),
              // SizedBox(height: 16.h),
              // Agreement(),
              // SizedBox(height: 16.h),

              // CardField(),
              //


           //   CardFormField(),


             SizedBox(height: 100.h),
              Container(
                // decoration: BoxDecoration(
                //   border: Border.all(color: AppColors.primary),
                //   borderRadius: BorderRadius.circular(15)
                // ),
                child: CardFormField(

                ),
              ),

              SizedBox(height: 16.h),
              Utils.primaryButton(
                onPressed: () async {
                  await StripeServices.instance.createPaymentMethod();
                //  context.pushNamed(RouteName.successfullyRegisteredScreen);
                },
                text: "Start Membership",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
