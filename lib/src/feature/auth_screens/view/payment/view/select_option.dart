import 'package:car_wash/core/constant/icons.dart';
import 'package:car_wash/core/constant/padding.dart';
import 'package:car_wash/core/routes/route_name.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:car_wash/src/feature/auth_screens/view/payment/riverpod/selection_provider.dart';
import 'package:car_wash/src/feature/service_booking_screens/view/widgets/selection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PaymentSlectionScreen extends StatelessWidget {
  const PaymentSlectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppPadding.screenHorizontal,
        child: Consumer(
          builder: (context, ref, _) {
            final selected = ref.watch(selectionProvider);
            return Column(
              children: [
                SizedBox(height: 200.h),
                Text(
                  "Select Your Payment Method",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff1F1F1F),
                  ),
                ),
                SizedBox(height: 8.h),
                Center(
                  child: Text(
                    "Choose a Payment Option to Start Your Subscription",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff444950),
                    ),
                  ),
                ),
                SizedBox(height: 32.h),

                CustomSelectionContainer(
                  leadingSvgIconPath: AppIcons.visa,
                  isSelected: selected == 0,
                  bodyText: "Visa Card",
                  onTap: () {
                    ref.read(selectionProvider.notifier).toggle(0);
                  },
                ),
                SizedBox(height: 8.h),

                CustomSelectionContainer(
                  leadingSvgIconPath: AppIcons.master,
                  isImage: true,
                  isSelected: selected == 1,
                  bodyText: "Master Card",
                  onTap: () {
                    ref.read(selectionProvider.notifier).toggle(1);
                  },
                ),
                SizedBox(height: 56.h),

                SizedBox(height: 2.h),
                Utils.primaryButton(
                  onPressed: () {
                    context.pushNamed(RouteName.paymentSlectionFormScreen);
                  },
                  text: "Continue",
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
