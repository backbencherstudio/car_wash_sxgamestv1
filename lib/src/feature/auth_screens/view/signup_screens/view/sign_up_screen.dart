// ignore_for_file: use_build_context_synchronously

import 'package:car_wash/core/constant/icons.dart';
import 'package:car_wash/core/routes/route_name.dart';
import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:car_wash/src/common_widget_style/common_style/auth_style/auth_color_pallete.dart';
import 'package:car_wash/src/common_widget_style/common_style/auth_style/auth_input_decoration_theme.dart';
import 'package:car_wash/src/common_widget_style/common_widgets/common_widgets.dart';
import 'package:car_wash/src/feature/auth_screens/view/signup_screens/Riverpod/Auth_signUP_provider.dart';
import 'package:car_wash/src/feature/auth_screens/view/signup_screens/Riverpod/sign_up_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../auth_widgets/footer_text.dart';
import '../../signin_screens/view/widgets/custom_login_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    /// Text Theme
    final headlineSmall = Theme.of(context).textTheme.headlineSmall;
    final titleSmall = Theme.of(context).textTheme.titleSmall;
    final bodyMedium = Theme.of(context).textTheme.bodyMedium;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.r, vertical: 16.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create Your Account',
                  style: headlineSmall?.copyWith(color: AppColors.primary),
                ),
                Text(
                  "Sign up and enjoy your experience",
                  style: titleSmall?.copyWith(
                    color: AppColors.onSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 32.h),
                TextFormField(
                  controller: nameController,
                  decoration:
                      AuthInputDecorationTheme.lightInputDecorationTheme(
                        context: context,
                        hintText: "Your name",
                        fillColor: Color(0xffffffff),

                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 16.w, right: 4.w),
                          child: SvgPicture.asset(
                            AppIcons.personOutlined,
                            width: 18.w,
                            height: 18.h,
                          ),
                        ),
                      ),
                ),
                SizedBox(height: 16.h),
                TextFormField(
                  controller: emailController,
                  decoration:
                      AuthInputDecorationTheme.lightInputDecorationTheme(
                        context: context,
                        hintText: "Your email",
                        fillColor: Color(0xffffffff),

                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 16.w, right: 4.w),
                          child: SvgPicture.asset(
                            AppIcons.mailOutlined,
                            width: 18.w,
                            height: 18.h,
                          ),
                        ),
                      ),
                ),

                SizedBox(height: 16.h),
                Consumer(
                  builder: (context, ref, child) {
                    final isPasswordVisible =
                        ref.watch(signUpProvider).isPasswordVisible;
                    final notifier = ref.read(signUpProvider.notifier);

                    return TextFormField(
                      controller: passwordController,
                      obscureText: isPasswordVisible,
                      decoration:
                          AuthInputDecorationTheme.lightInputDecorationTheme(
                            context: context,
                            hintText: "Create your password",
                            fillColor: Color(0xffffffff),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                notifier.togglePasswordVisibility();
                              },
                              child: Icon(
                                isPasswordVisible
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                size: 20.r,
                                color: Color(0xFF777980),
                              ),
                            ),
                          ),
                    );
                  },
                ),
                SizedBox(height: 16.h),
                Consumer(
                  builder: (context, ref, child) {
                    final isConfirmPasswordVisible =
                        ref.watch(signUpProvider).isConfirmPasswordVisible;
                    final notifier = ref.read(signUpProvider.notifier);

                    return TextFormField(
                      controller: confirmPasswordController,
                      obscureText: !isConfirmPasswordVisible,
                      decoration:
                          AuthInputDecorationTheme.lightInputDecorationTheme(
                            context: context,
                            hintText: "Confirm your password",
                            fillColor: Color(0xffffffff),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                notifier.toggleConfirmPasswordVisibility();
                              },
                              child: Icon(
                                isConfirmPasswordVisible
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                size: 20.r,
                                color: Color(0xFF777980),
                              ),
                            ),
                          ),
                    );
                  },
                ),
                SizedBox(height: 32.h),
                Consumer(
                  builder: (context, ref, _) {
                    final signUpState = ref.watch(signUpControllerProvider);
                    final signUpNotifier = ref.read(
                      signUpControllerProvider.notifier,
                    );
                    return signUpState.isLoading
                        ? Utils.loadingButton()
                        : CommonWidgets.primaryButton(
                          context: context,
                          title: "Continue",
                          color: AppColors.primary,
                          textColor: AuthColorPalette.white,
                          onPressed: () async {
                            if (passwordController.text.trim() !=
                                confirmPasswordController.text.trim()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "password doesnt match",

                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ),
                              );
                              return;
                            }
                            await signUpNotifier.signUp(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                              name: nameController.text.trim(),
                            );

                            final updatedState = ref.read(
                              signUpControllerProvider,
                            );

                            if (updatedState.success) {
                              debugPrint("🚀 Navigating to OTP page...");

                              context.push(
                                '${RouteName.signUpOTPScreen}?email=${emailController.text.trim()}',
                              );
                            } else if (updatedState.error != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    updatedState.error!,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ),
                              );
                            }
                          },
                        );
                  },
                ),
                SizedBox(height: 32.h),
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
                SizedBox(height: 24.h),
                buildLoginButton(
                  context: context,
                  imagePath: AppIcons.google,

                  title: "Continue with Google",
                ),

                SizedBox(height: 24.h),

                footerText(
                  context: context,
                  text1: "Already have an account? ",
                  text2: 'Log In',
                  onTap: () {
                    context.push(RouteName.signInScreen);
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
