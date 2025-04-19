
import 'package:car_wash/core/constant/images.dart';
import 'package:car_wash/core/routes/route_name.dart';
import 'package:car_wash/src/common_widget_style/common_style/auth_style/auth_color_pallete.dart';
import 'package:car_wash/src/common_widget_style/common_widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';


class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final headLineLarge = Theme.of(context).textTheme.headlineLarge;
    final headlineSmall = Theme.of(context).textTheme.headlineSmall;
    final bodyLarge = Theme.of(context).textTheme.bodyLarge;

    return Stack(
      fit: StackFit.expand,
      children: [
        /// background image
        Positioned.fill(child: Image.asset(AppImages.screenBackgroundImage, fit: BoxFit.cover)),


        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding:  EdgeInsets.only(left: 20.w, right: 20.w),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5 ,
              decoration: BoxDecoration(
                color: AuthColorPalette.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.w),
                  topLeft: Radius.circular(30.w),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 70.h),
                    Text(
                      "Let's Get Started",
                      style: headlineSmall?.copyWith(
                        color: AuthColorPalette.titleColor,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "If you want to join the conversation, \nplease log in or sign up.",
                      style: bodyLarge?.copyWith(
                        color: AuthColorPalette.bodyTextColor,
                        fontWeight: FontWeight.w500
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 44.h),
                     CommonWidgets.primaryButton(
                      context: context,
                       title: "Log In",
                        color: Color(0xff1141CB), 
                        textColor: Color(0xffffffff),
                         onPressed: (){
                          context.go(RouteName.signInScreen);
                         }),

                         SizedBox(height: 12.h,),
                         GestureDetector(
                          onTap: () {
                            context.go(RouteName.signUpScreen);
                          },
                           child: Text("New User? Sign Up",
                           style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Color(0xffB4B4B4)
                           )
                           ),
                         ),

                         SizedBox(height: 10.h
                         ,)
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}