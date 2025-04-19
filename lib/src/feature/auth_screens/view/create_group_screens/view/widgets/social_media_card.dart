import 'package:car_wash/src/common_widget_style/common_style/auth_style/auth_color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialMediaCard extends StatelessWidget {
  const SocialMediaCard({
    super.key, required this.imagePath,
  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){},
        child: Padding(
          padding: EdgeInsets.only(right: 24.r),
          child: Card(
            color: Colors.transparent,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.r),
                side: BorderSide(color: AuthColorPalette.greyscale200.withOpacity(0.4))
            ),
            child:Padding(
              padding: EdgeInsets.all(4.0.r),
              child: Image.asset(imagePath,fit: BoxFit.contain,width: 40.w,height: 40.h,),
            ) ,
          ),
        )
    );

    // Container(
    //   height: 40.h,
    //  width: 40.w,
    //   decoration: BoxDecoration(
    //     color: Colors.transparent,
    //     borderRadius: BorderRadius.circular(6.r),
    //     border: Border.all(color: AuthColorPalette.greyscale200),),
    //   child: Image.asset("assets/icons/social_media/facebook.png",fit: BoxFit.contain,),
    //   ),
    // );
  }
}