import 'package:car_wash/core/constant/images.dart';
import 'package:car_wash/core/routes/route_name.dart';
import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:car_wash/src/common_widget_style/common_style/auth_style/auth_color_pallete.dart';
import 'package:car_wash/src/common_widget_style/common_style/auth_style/auth_input_decoration_theme.dart';
import 'package:car_wash/src/common_widget_style/common_widgets/common_widgets.dart';
import 'package:car_wash/src/feature/auth_screens/view/signup_screens/view_model/sign_up_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../auth_widgets/footer_text.dart';
import '../../signin_screens/view/widgets/custom_login_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {

    /// Text Theme
    final headlineSmall = Theme.of(context).textTheme.headlineSmall;
    final titleSmall = Theme.of(context).textTheme.titleSmall;
    final bodyMedium = Theme.of(context).textTheme.bodyMedium;

    return Scaffold(
      appBar: Utils.appBarBackButton(context),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.r, vertical: 16.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create Your Account',
                  style: headlineSmall?.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                Text(
                  "Sign up and enjoy your experience",
                  style: titleSmall?.copyWith(
                      color: AppColors.onSecondary,
                      fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(height: 32.h),
                TextFormField(
                  decoration:
                      AuthInputDecorationTheme.lightInputDecorationTheme(
                        context: context,
                        hintText: "Your name",
                                            fillColor: Color(0xffffffff),

                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 16.w, right: 4.w),
                          child: ImageIcon(
                            AssetImage(
                              
                              AppImages.personIcon
                             
                              
                              
                              ),
                            size: 18.r,
                          ),
                        ),
                      ),
                ),
                SizedBox(height: 16.h),
                TextFormField(
                  decoration:
                      AuthInputDecorationTheme.lightInputDecorationTheme(
                        context: context,
                        hintText: "Your email",
                                            fillColor: Color(0xffffffff),

                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 16.w, right: 4.w),
                          child: ImageIcon(
                            AssetImage(
                            
                             AppImages.emailIcon
                              
                              ),
                            size: 18.r,
                          ),
                        ),
                      ),
                ),
                SizedBox(height: 16.h),
                TextFormField(
                  decoration:
                      AuthInputDecorationTheme.lightInputDecorationTheme(
                        context: context,
                        hintText: "Date of birth",
                                            fillColor: Color(0xffffffff),

                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 16.w, right: 4.w),
                          child: ImageIcon(
                            AssetImage(
                              
                             AppImages.calendarIcon
                           
                              ),
                            size: 18.r,
                          ),
                        ),
                      ),
                ),
                SizedBox(height: 16.h),
                Consumer(
                  builder: (context,ref,child) {
                    final isPasswordVisible = ref.watch(signUpProvider).isPasswordVisible;
                    final notifier = ref.read(signUpProvider.notifier);
                    return TextFormField(
                      obscureText: !isPasswordVisible,
                      decoration:
                          AuthInputDecorationTheme.lightInputDecorationTheme(
                            context: context,
                            hintText: "Create your password",
                                                fillColor: Color(0xffffffff),

                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: 16.w, right: 4.w),
                              child: ImageIcon(
                                AssetImage(
                           
                                   AppImages.lockIcon
                                  
                                  ),
                                size: 18.r,
                              ),
                            ),
                            suffixIcon: GestureDetector(
                              onTap: (){
                                notifier.togglePasswordVisibility();
                                debugPrint("\n\ntoggle password visibility: $isPasswordVisible\n");
                              },
                              child: Icon(
                                isPasswordVisible ?  Icons.visibility_outlined : Icons.visibility_off_outlined,
                                size: 20.r,
                                color: Color(0xFF777980),
                              ),
                            ),
                          ),
                    );
                  }
                ),
                SizedBox(height: 16.h),
                Consumer(
                  builder: (context,ref,child) {
                    final isConfirmPasswordVisible = ref.watch(signUpProvider).isConfirmPasswordVisible;
                    final notifier = ref.read(signUpProvider.notifier);

                    return TextFormField(
                      obscureText: !isConfirmPasswordVisible,
                      decoration:
                          AuthInputDecorationTheme.lightInputDecorationTheme(
                            context: context,
                            hintText: "Confirm your password",
                                                fillColor: Color(0xffffffff),

                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: 16.w, right: 4.w),
                              child: ImageIcon(
                                AssetImage(
                                 
                                   AppImages.lockIcon
                                  
                                  ),
                                size: 18.r,
                              ),
                            ),
                            suffixIcon: GestureDetector(
                              onTap: (){
                                notifier.toggleConfirmPasswordVisibility();

                              },
                              child: Icon(
                               isConfirmPasswordVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                size: 20.r,
                                color: Color(0xFF777980),
                              ),
                            ),
                          ),
                    );
                  }
                ),
                SizedBox(height: 32.h),
                CommonWidgets.primaryButton(
                  context: context,
                  title: "Continue",
                  color: AppColors.primary,
                  textColor: AuthColorPalette.white,
                  onPressed: () {
                   context.push(RouteName.signUpOTPScreen);
                  },
                ),
                SizedBox(height: 32.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Divider(color: AuthColorPalette.greyscale200, height: 1),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 17.w),
                      child: Text("Or",style: bodyMedium?.copyWith(color: AuthColorPalette.textColorGrey, fontWeight: FontWeight.w500),),
                    ),
                    Expanded(
                      child: Divider(color: AuthColorPalette.greyscale200, height: 1),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                buildLoginButton(
                  context: context,
                  imagePath: 
                 AppImages.googleLogo,
                  

                  title: "Continue with Google",
                ),
               
                SizedBox(height: 24.h),
                footerText(context: context, text1: "Already have an account? ", text2: 'Log In', onTap: (){
                  context.push(RouteName.signInScreen);
                }),
              ],
            ), 
          ),
        ),
      ),
    );
  }
}
