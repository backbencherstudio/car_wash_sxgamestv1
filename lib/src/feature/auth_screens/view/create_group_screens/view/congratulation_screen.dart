import 'package:car_wash/core/constant/images.dart';
import 'package:car_wash/core/routes/route_name.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:car_wash/src/common_widget_style/common_widgets/common_widgets.dart';
import 'package:car_wash/src/feature/auth_screens/view/auth_style/auth_color_pallete.dart';
import 'package:car_wash/src/feature/auth_screens/view/create_group_screens/view/widgets/copy_link_tile.dart';
import 'package:car_wash/src/feature/auth_screens/view/create_group_screens/view/widgets/social_media_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CongratulationScreen extends StatelessWidget {
  const CongratulationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// Text Theme
    final bodyLarge = Theme.of(context).textTheme.bodyLarge;
    final headlineSmall = Theme.of(context).textTheme.headlineSmall;
    final titleSmall = Theme.of(context).textTheme.titleSmall;

    return Scaffold(
      appBar: Utils.appBarBackButton(context),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:  24.r),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50.h,),
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
                  "Congratulation",
                  style: headlineSmall?.copyWith(
                    color: AuthColorPalette.titleColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 28.sp
                  ),
                ),
                SizedBox(height: 8.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(
                    '''Your group has been successfully created''',
                    textAlign: TextAlign.center,
            
                    style: bodyLarge?.copyWith(
                      color: AuthColorPalette.bodyTextColor,
                    ),
                  ),
                ),
                SizedBox(height: 46.h,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Social Share",style: headlineSmall?.copyWith(
                    color: AuthColorPalette.primary,
                    fontWeight: FontWeight.w500,
                  ),),
                ),
                SizedBox(height: 24.h,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Share this link via",style: titleSmall?.copyWith(
                    color: AuthColorPalette.bodyTextColor,
                    fontWeight: FontWeight.w500,
                  ),),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
            
                  children: [
                  SocialMediaCard(imagePath: "assets/icons/social_media/facebook.png",),
                  SocialMediaCard(imagePath: "assets/icons/social_media/twitter.png",),
                  SocialMediaCard(imagePath: "assets/icons/social_media/linkedin.png",),
                  SocialMediaCard(imagePath: "assets/icons/social_media/instagram.png",),
            
                  ],
                ),
                SizedBox(height: 24.h,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Copy Link",style: titleSmall?.copyWith(
                    color: AuthColorPalette.bodyTextColor,
                    fontWeight: FontWeight.w500,
                  ),),
                ),
            SizedBox(height: 16.h,),
            CopyLinkTile(titleSmall: titleSmall, bodyLarge: bodyLarge),
                SizedBox(height: 16.h,),
                Consumer(
                  builder: (context,ref,child) {
                    return CommonWidgets.primaryButton(
                      context: context,
                      title: "Continue",
                      color: AuthColorPalette.primary,
                      textColor: AuthColorPalette.white,
                      onPressed: () {
                        // context.go(RouteName.parentsScreen);

                        // ref.read(parentsScreenProvider.notifier).onSelectedIndex(2);

                        // debugPrint("Selected index: ${ref.read(parentsScreenProvider).selectedIndex}");
                      },
                    );
                  }
                ),
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}




