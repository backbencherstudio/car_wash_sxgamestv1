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
              SizedBox(height: 100.h),

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
                "Enter your Card Information",
                style: textStyle.bodySmall!.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff444950),
                ),
              ),
              SizedBox(height: 32.h),
              CardFormField(
                style: CardFormStyle(
                  borderRadius: 15,
                  backgroundColor: Colors.white,
                  textColor: AppColors.textColor,
                  borderColor: AppColors.primary,
                  borderWidth: 2,
                  cursorColor: AppColors.primary,
                  textErrorColor: Colors.red,
                  placeholderColor: AppColors.primary,
                ),
              ),
              SizedBox(height: 16.h),
              Utils.primaryButton(
                onPressed: () async {
                  final String? paymentId = await StripeServices.instance.createPaymentMethod();

                    context.go(RouteName.successfullyRegisteredScreen);
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
