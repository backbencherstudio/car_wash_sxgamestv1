import 'package:car_wash/core/constant/images.dart';
import 'package:car_wash/core/routes/route_name.dart';
import 'package:car_wash/src/common_widget_style/common_style/auth_style/auth_color_pallete.dart';
import 'package:car_wash/src/common_widget_style/common_widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SuccessfullyResetPasswordScreen extends StatelessWidget {
  const SuccessfullyResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// Text Theme
    final bodyLarge = Theme.of(context).textTheme.bodyLarge;
    final headlineSmall = Theme.of(context).textTheme.headlineSmall;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Container(
                  width: 265.w,
                  height: 140.h,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    // shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        ""
                        // AppImages.successfullyResetPassword
                        
                        ),
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                Text(
                  "Successful",
                  style: headlineSmall?.copyWith(
                    color: AuthColorPalette.titleColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(
                    '''Congratulations! Your password has
been successfully updated. Click
Continue to login''',
                    textAlign: TextAlign.center,

                    style: bodyLarge?.copyWith(
                      color: AuthColorPalette.bodyTextColor,
                    ),
                  ),
                ),
                SizedBox(height: 40.h,),
                CommonWidgets.primaryButton(
                  context: context,
                  title: "Continue",
                  color: AuthColorPalette.primary,
                  textColor: AuthColorPalette.white,
                  onPressed: () {
                    // context.go(RouteName.signInScreen);
                  },
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
