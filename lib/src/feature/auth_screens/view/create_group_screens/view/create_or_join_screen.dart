import 'package:car_wash/core/routes/route_name.dart';
import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:car_wash/src/common_widget_style/common_widgets/common_widgets.dart';
import 'package:car_wash/src/feature/auth_screens/view/auth_style/auth_color_pallete.dart';
import 'package:car_wash/src/feature/auth_screens/view/auth_style/auth_input_decoration_theme.dart';
import 'package:car_wash/src/feature/auth_screens/view/auth_widgets/footer_text.dart';
import 'package:car_wash/src/feature/auth_screens/view/create_group_screens/view/widgets/CustomCheckContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CreateOrJoinScreen extends StatelessWidget {
  const CreateOrJoinScreen({super.key});

  @override
  Widget build(BuildContext context) {

    /// Text Theme
    final headlineSmall = Theme.of(context).textTheme.headlineSmall;
    final bodyMedium = Theme.of(context).textTheme.bodyMedium;
    final titleSmall = Theme.of(context).textTheme.titleSmall;

    return Scaffold(
     extendBody: true,
     resizeToAvoidBottomInset: true,
     body: Stack(
      fit: StackFit.expand,
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,

          decoration: BoxDecoration(
            color: Color(0xffffffff)
          ),),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            
            child: Image.asset("assets/images/whitebgm.png",
            fit: BoxFit.cover,
            width: double.infinity,
            ),),
      
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: Center(
                child: Container(
          // padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 225.h),
                height: 450,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.r),
                    color: Color(0xffF8FAFB)
                  ),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.w ),
                    child: Column(
                      children: [
                        SizedBox(height:40.h ,),
                       Text("Who am I?",
                       style: headlineSmall!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.secondary
                       ),
                       ),
                       SizedBox(height: 44.h,),
                       Align(
                        alignment: Alignment.centerLeft,
                         child: Text("What role do you want to create?",
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.secondary
                         ),
                         ),
                       ),
                       SizedBox(height: 16.h,),
                       CustomCheckContainer(
                        img: "assets/images/Frame.png",
                        text: "Im a customer",
                        index: 0,
                       ),
                       SizedBox(height: 12.h,),
                       CustomCheckContainer(
                        img: "assets/images/Family.png",
                        text: "Im a service provider",
                        index: 1,
                       ),
                       SizedBox(height: 32.h,),
                       Utils.primaryButton(onPressed: (){
                        context.pushNamed(RouteName.profileCreateScreen);
                       }, text: "Done"),
                       SizedBox(height: 10.h,)
                      ],
                    ),
                  ),
                ),
              ),
            )
        
      ],
     ),
    );
  }
}