import 'package:car_wash/core/constant/icons.dart';
import 'package:car_wash/core/constant/images.dart';
import 'package:car_wash/core/routes/route_name.dart';
import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:car_wash/src/common_widget_style/common_style/auth_style/auth_color_pallete.dart';
import 'package:car_wash/src/common_widget_style/common_style/auth_style/auth_input_decoration_theme.dart';
import 'package:car_wash/src/common_widget_style/common_widgets/common_widgets.dart';
import 'package:car_wash/src/feature/auth_screens/view/auth_widgets/footer_text.dart';
import 'package:car_wash/src/feature/auth_screens/view/signin_screens/view/widgets/custom_login_button.dart';
import 'package:car_wash/src/feature/auth_screens/view/signin_screens/view_model/sign_in_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// text theme
    final headlineSmall = Theme.of(context).textTheme.headlineSmall;
    final titleSmall = Theme.of(context).textTheme.titleSmall;
    final bodyLarge = Theme.of(context).textTheme.bodyLarge;
    final bodyMedium = Theme.of(context).textTheme.bodyMedium;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi! Welcome Back',
                  style: headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Log in to your account",
                  style: titleSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 40.h),
                TextFormField(
                  decoration:
                      AuthInputDecorationTheme.lightInputDecorationTheme(
                        context: context,
                        hintText: "Your Email",
                        fillColor: Color(0xffffffff),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 16.w, right: 4.w),
                          child: SvgPicture.asset(AppIcons.mail),
                        ),
                      ),
                ),
                SizedBox(height: 16.h),
                Consumer(
                  builder: (context, ref, child) {
                    final isPasswordVisible =
                        ref.watch(signInProvider).isPasswordVisible;
                    final notifier = ref.read(signInProvider.notifier);

                    return TextFormField(
                      obscureText: !isPasswordVisible,
                      decoration:
                          AuthInputDecorationTheme.lightInputDecorationTheme(
                            context: context,
                            hintText: "Enter your password",
                            fillColor: Color(0xffffffff),
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: 16.w, right: 4.w),
                              child: SvgPicture.asset(
                                AppIcons.lockOutlined,
                                width: 18.w,
                                height: 18.w,
                              ),
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                notifier.togglePasswordVisibility();
                              },
                              child: Icon(
                                isPasswordVisible
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                size: 20.r,
                                color: AuthColorPalette.bodyTextColor,
                              ),
                            ),
                          ),
                    );
                  },
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Consumer(
                          builder: (context, ref, child) {
                            final isRemember =
                                ref.watch(signInProvider).isRemember;
                            final notifier = ref.read(signInProvider.notifier);

                            return GestureDetector(
                              onTap: () {
                                notifier.toggleIsRemember();
                              },
                              child: Icon(
                                isRemember
                                    ? Icons.check_circle_rounded
                                    : Icons.circle_outlined,
                                color: AppColors.primary,
                              ),
                            );
                          },
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          "Remember me",
                          style: bodyLarge?.copyWith(
                            color: AuthColorPalette.textColorGrey,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        context.go(RouteName.emailVerifyScreen);
                      },
                      child: Text(
                        "Forgot Password?",
                        style: bodyLarge?.copyWith(color: AppColors.primary),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 44.h),
                Consumer(
                  builder: (context, ref, child) {
                    return CommonWidgets.primaryButton(
                      context: context,
                      title: "Log in",
                      color: AppColors.primary,
                      textColor: AuthColorPalette.white,
                      onPressed: () {
                        context.go(RouteName.homeScreen);

                        //   ref.read(parentsScreenProvider.notifier).onSelectedIndex(2);

                        //   debugPrint("Selected index: ${ref.read(parentsScreenProvider).selectedIndex}");
                      },
                    );
                  },
                ),
                SizedBox(height: 44.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Divider(
                        color: AuthColorPalette.greyscale200,
                        height: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 17.w),
                      child: Text(
                        "Or",
                        style: bodyMedium?.copyWith(
                          color: AuthColorPalette.textColorGrey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: AuthColorPalette.greyscale200,
                        height: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 44.h),
                buildLoginButton(
                  context: context,
                  imagePath: AppIcons.google,

                  title: "Continue with Google",
                ),
                // SizedBox(height: 16.h),
                // buildLoginButton(
                //   context: context,
                //   imagePath: AppIcons.apple,
                //   title: "Continue with Apple",
                // ),
                SizedBox(height: 32.h),

                footerText(
                  context: context,
                  text1: "Don't have an account? ",
                  text2: 'Sign Up',
                  onTap: () {
                    context.push(RouteName.signUpScreen);
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
