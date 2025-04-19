import 'package:car_wash/core/routes/route_name.dart';
import 'package:car_wash/src/common_widget_style/common_widgets/common_widgets.dart';
import 'package:car_wash/src/feature/auth_screens/view/auth_style/auth_color_pallete.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../auth_widgets/footer_text.dart';

class OTPVerifyScreen extends StatelessWidget {
  const OTPVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// Text Theme
    // final bodyLarge = Theme.of(context).textTheme.bodyLarge;
    final headlineSmall = Theme.of(context).textTheme.headlineSmall;
    final titleSmall = Theme.of(context).textTheme.titleSmall;

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
                  "4 digit OTP has been sent to your email",
                  style: titleSmall?.copyWith(
                    color: AuthColorPalette.textColorGreyscale,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 40.h),
                PinCodeTextField(
                  length: 4,
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
                CommonWidgets.primaryButton(
                  context: context,
                  title: "Submit",
                  color: AuthColorPalette.primary,
                  textColor: AuthColorPalette.white,
                  onPressed: () {
                    // context.go(RouteName.successfullyResetPasswordScreen);
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
