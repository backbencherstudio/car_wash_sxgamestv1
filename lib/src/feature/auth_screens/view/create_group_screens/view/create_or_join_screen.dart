import 'package:car_wash/src/common_widget_style/common_widgets/common_widgets.dart';
import 'package:car_wash/src/feature/auth_screens/view/auth_style/auth_color_pallete.dart';
import 'package:car_wash/src/feature/auth_screens/view/auth_style/auth_input_decoration_theme.dart';
import 'package:car_wash/src/feature/auth_screens/view/auth_widgets/footer_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateOrJoinScreen extends StatelessWidget {
  const CreateOrJoinScreen({super.key});

  @override
  Widget build(BuildContext context) {

    /// Text Theme
    final headlineSmall = Theme.of(context).textTheme.headlineSmall;
    final bodyMedium = Theme.of(context).textTheme.bodyMedium;
    final titleSmall = Theme.of(context).textTheme.titleSmall;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi! Maren Workman',
                  style: headlineSmall?.copyWith(
                    color: AuthColorPalette.titleColor,
                    fontWeight: FontWeight.w500
                  ),
                ),
                Text(
                  "Become a member of our community!",
                  style: titleSmall?.copyWith(
                      color: AuthColorPalette.textColorGreyscale,
                      fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(height: 108.h),
                TextFormField(
                  decoration: AuthInputDecorationTheme.lightInputDecorationTheme(
                    context: context,
                    hintText: "Enter reference posse link",
                    fillColor: AuthColorPalette.referenceBackground

                  ),
                ),
                SizedBox(height: 16.h),
                CommonWidgets.primaryButton(
                  context: context,
                  title: "Join now",
                  color: AuthColorPalette.primary,
                  textColor: AuthColorPalette.white,
                  onPressed: () {
                    // context.go(RouteName.homeScreen);
                  },
                ),                SizedBox(height: 38.h),
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
                SizedBox(height: 24.h,),
                footerText(context: context, text1: "Want to create a new group? ", text2: 'Create now', onTap: (){
                  // context.pushNamed(RouteName.createGroupScreen);
                })


              ],
            ),
          ),
        ),
      ),
    );
  }
}