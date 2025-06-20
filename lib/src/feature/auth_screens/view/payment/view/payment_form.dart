import 'package:car_wash/core/constant/padding.dart';
import 'package:car_wash/core/routes/route_name.dart';
import 'package:car_wash/core/services/payment_services/stripe_services.dart';
import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:car_wash/src/feature/auth_screens/view/signin_screens/Riverpod/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/services/local_storage_services/secure_storage_service.dart';

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
              Consumer(
                builder: (_, ref, _) {
                  final isLoading = ref.watch(loginProvider).isLoading;
                  return isLoading ?
                  Utils.loadingButton()
                  :

                    Utils.primaryButton(
                    onPressed: () async {
                     FocusScope.of(context).unfocus();

                        final isSuccess = await ref.read(loginProvider.notifier).makePayment();
                       if(isSuccess != null && isSuccess){
                         debugPrint("\nSuccessfully made payment, navigating to home screen.\n");
                         if(context.mounted){
                           context.go(RouteName.homeScreen);
                         }
                       }




                    },
                    text: "Start Membership",
                  );
                }
              ),
              SizedBox(height: 20.h,),
              GestureDetector(
                onTap: () async {
                  await SecureAuthTokenStorageService.deleteAuthToken();
                  if(context.mounted){
                    context.go(RouteName.signInScreen);
                  }
                },
                child: RichText(text: TextSpan(
                  text: "Do you want to ",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
                  children:
                    [
                      TextSpan(
                        text: "Sign Out?",
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.primary,fontWeight: FontWeight.w600),
                      )
                    ]
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
