import 'package:car_wash/core/routes/route_name.dart';
import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:car_wash/src/common_widget_style/common_widgets/common_widgets.dart';
import 'package:car_wash/src/feature/auth_screens/view/auth_style/auth_color_pallete.dart';
import 'package:car_wash/src/feature/auth_screens/view/forgot_password_screens/Riverpod/forget_otp_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../auth_widgets/footer_text.dart';

class OTPVerifyScreen extends StatelessWidget {
  final String? email;
  const OTPVerifyScreen({super.key, this.email});

  @override
  Widget build(BuildContext context) {
    /// Text Theme
    // final bodyLarge = Theme.of(context).textTheme.bodyLarge;
    final headlineSmall = Theme.of(context).textTheme.headlineSmall;
    final titleSmall = Theme.of(context).textTheme.titleSmall;
    final TextEditingController forgetOtpController = TextEditingController();
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
                    color: AppColors.onSecondary,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 40.h),
                PinCodeTextField(
                  controller: forgetOtpController,
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
                SizedBox(height: 16.h),
                Consumer(
                  builder: (context, ref, _) {
                    final forgetOtp = ref.watch(forgetOtpEmailverifyProvider);
                    final forgetOtpNotifier = ref.read(
                      forgetOtpEmailverifyProvider.notifier,
                    );
                    return forgetOtp.isLoading
                        ? Utils.loadingButton()
                        : CommonWidgets.primaryButton(
                          context: context,
                          title: "Submit",
                          color: AppColors.primary,
                          textColor: Color(0xffffffff),
                          onPressed: () async {
                            await forgetOtpNotifier.emailOtpVerify(
                              email: email,
                              otp: forgetOtpController.text,
                            );
                            final upadatedForgetOtp = ref.watch(
                              forgetOtpEmailverifyProvider,
                            );
                        debugPrint("\n\n ${upadatedForgetOtp.message}   \n\n");

                            if (upadatedForgetOtp.success) {
                              context.go(
                                RouteName.successfullyResetPasswordScreen,
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    upadatedForgetOtp.message ??
                                        "OTP verification failed. Please try again.",
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
                SizedBox(height: 16.h),
                footerText(
                  text1: "Haven’t you got the OTP yet? ",
                  text2: "Resend Code",
                  context: context,
                  onTap: () {},
                ),
                SizedBox(height: 32.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
