import 'package:car_wash/core/constant/images.dart';
import 'package:car_wash/core/routes/route_name.dart';
import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:car_wash/src/common_widget_style/common_style/auth_style/auth_color_pallete.dart';
import 'package:car_wash/src/common_widget_style/common_widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SuccessfullyRegisteredScreen extends StatelessWidget {
  const SuccessfullyRegisteredScreen({super.key});

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
                Spacer(),
                Container(
                  width: 136.w,
                  height: 136.h,
                  decoration: BoxDecoration(
                    color: Color(0xFFE2E8F0),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(AppImages.successfullyRegisteredImage),
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                Text(
                  "Successfully Registered",
                  style: headlineSmall?.copyWith(
                    color: AuthColorPalette.titleColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(
                    "Your account has been registered successfully, now let’s enjoy core features!",
                    textAlign: TextAlign.center,

                    style: bodyLarge?.copyWith(
                      color: AuthColorPalette.bodyTextColor,
                    ),
                  ),
                ),
                Spacer(),
                CommonWidgets.primaryButton(
                  context: context,
                  title: "Log in now",
                  color: AppColors.primary,
                  textColor: Color(0xffffffff),
                  onPressed: () {
                    context.go(RouteName.signInScreen);
                  },
                ),
                SizedBox(height: 56.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
