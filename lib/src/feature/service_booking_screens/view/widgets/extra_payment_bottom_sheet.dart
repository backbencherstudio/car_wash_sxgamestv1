import 'package:car_wash/core/constant/padding.dart';
import 'package:car_wash/src/feature/service_booking_screens/riverpod/service_booking_screens_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/theme/theme_extension/app_colors.dart';
import '../../../../../core/utils/utils.dart';


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
       // constraints: BoxConstraints( minHeight: 610.h),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),

        child: ListView(
          children: [
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Set Up Your Card",
                  style: textStyle.headlineMedium!.copyWith(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff1F1F1F),
                  ),
                ),
                IconButton(onPressed: ()=> context.pop(), icon: Icon(Icons.close,color: AppColors.primary,size: 30.sp,),),

              ],
            ),
            SizedBox(height: 8.h),
            Text(
              "Enter your card information for payment",
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
                debugPrint("\nIs payment processing : ${ref.watch(serviceBookingRiverpod).isPaymentProcessing}\n");
                return ref.watch(serviceBookingRiverpod).isPaymentProcessing ?
                Utils.loadingButton()
                :
                Utils.primaryButton(
                  onPressed: () async {
                    final String? paymentMethodId = await ref.read(serviceBookingRiverpod.notifier).onExtraPayment();
                    if(paymentMethodId != null){
                      context.pop();
                    }

                  },
                  text: "Continue",
                );
              }
            ),
          ],
        ),
      );
    },
  );
}
