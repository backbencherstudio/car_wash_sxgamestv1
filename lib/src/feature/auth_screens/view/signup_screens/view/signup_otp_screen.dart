// ignore_for_file: prefer_if_null_operators

import 'package:car_wash/core/routes/route_name.dart';
import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:car_wash/src/common_widget_style/common_style/auth_style/auth_color_pallete.dart';
import 'package:car_wash/src/common_widget_style/common_widgets/common_widgets.dart';
import 'package:car_wash/src/feature/auth_screens/view/auth_widgets/footer_text.dart';
import 'package:car_wash/src/feature/auth_screens/view/signup_screens/Riverpod/Auth_otp_email_verification_provider.dart';
import 'package:car_wash/src/feature/auth_screens/view/signup_screens/Riverpod/resend_otp_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SignupOtpScreen extends StatelessWidget {
  final String? email;
  const SignupOtpScreen({super.key, this.email});

  @override
  Widget build(BuildContext context) {
    /// Text Theme
    // final bodyLarge = Theme.of(context).textTheme.bodyLarge;
    final headlineSmall = Theme.of(context).textTheme.headlineSmall;
    final titleSmall = Theme.of(context).textTheme.titleSmall;
    TextEditingController otpController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Enter OTP",
                  style: headlineSmall?.copyWith(
                    color: AuthColorPalette.titleColor,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "6 digit OTP has been sent to your email",
                  style: titleSmall?.copyWith(
                    color: AuthColorPalette.textColorGreyscale,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 32.h),
                PinCodeTextField(
                  controller: otpController,
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(12),
                    fieldHeight: 56,
                    fieldWidth: 56,
                    activeFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    activeColor: Color(0xFF2764B5),
                    selectedColor: Color(0xFF2764B5),
                    //Color(0xFF2764B5),
                    inactiveColor: Color(0xFFE9EAEC),

                    borderWidth: 1,
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  onCompleted: (v) {
                    print("Completed");
                  },
                  appContext: context,
                ),

                SizedBox(height: 82.h),
                Consumer(
                  builder: (context, ref, _) {
                    final otpVerify = ref.watch(otpEmailverifyProvider);

                    final otpNotifier = ref.read(
                      otpEmailverifyProvider.notifier,
                    );

                    return otpVerify.isLoading
                        ? Utils.loadingButton()
                        : CommonWidgets.primaryButton(
                          context: context,
                          title: "Submit",
                          color: AppColors.primary,
                          textColor: Color(0xffffffff),
                          onPressed: () async {
                            ref
                                .read(otpEmailverifyProvider.notifier)
                                .resetError();

                            await otpNotifier.emailOtpVerify(
                              email: email,
                              otp: otpController.text,
                            );
                            if (!context.mounted) return;
                    final upadteOtpVerify = ref.watch(otpEmailverifyProvider);

                            if (upadteOtpVerify.success) {
                              
                              context.go(RouteName.successfullyRegisteredScreen);
                            } else {
                              // Show error 
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                               upadteOtpVerify.message??  "OTP verification failed. Please try again.",
                                    style: TextStyle(color: Color(0xff000000)),
                                  ),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          },
                        );
                  },
                ),

                 Consumer(
                   builder: (context, ref,_) {
                         final resend = ref.watch(resendOtpProvider);
                        final resendNotifier = ref.read(
                          resendOtpProvider.notifier,
                        );
                     return footerText(
                      text1: "Haven’t you got the OTP yet? ",
                      text2: resend.isLoading? "Loading....":  "Resend Code",
                      context: context,
                      onTap: ()async {
                    await resendNotifier.hitTheResend(email: email.toString());
                  debugPrint("\n\n\n ${resend.message}\n\n\n");

                       },
                                     );
                   }
                 ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       "Didnt got the OTP?",
                //       style: Theme.of(context).textTheme.bodySmall!.copyWith(
                //         color: AppColors.lightIconColor,
                //         fontWeight: FontWeight.w500,
                //       ),
                //     ),
                //     SizedBox(width: 15.w),
                //     Consumer(
                //       builder: (context, ref, _) {
                        // final resend = ref.watch(resendOtpProvider);
                        // final resendNotifier = ref.read(
                        //   resendOtpProvider.notifier,
                        // );
                //         return GestureDetector(
                //           onTap: () async {
                //             await resendNotifier.hitTheResend(email: email.toString());
                //           },
                //           child:
                //               resend.isLoading
                //                   ? CircularProgressIndicator() // Show a loading indicator when the request is in progress
                //                   : Center(
                //                     child: Text(
                //                       "Click here", 
                //                       softWrap: true,
                //                       overflow: TextOverflow.ellipsis,// If success is true, show confirmation message, otherwise "Click here"
                //                       style: Theme.of(
                //                         context,
                //                       ).textTheme.bodyMedium!.copyWith(
                //                         color: AppColors.primary,
                //                         fontWeight: FontWeight.w500,
                //                       ),
                //                     ),
                //                   ),
                //         );
                //       },
                //     ),
                //   ],
                // ),
                SizedBox(height: 32.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
