import 'package:car_wash/core/constant/icons.dart';
import 'package:car_wash/core/constant/images.dart';
import 'package:car_wash/core/routes/route_name.dart';
import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

Drawer appDrawer({required BuildContext context}) {
  return Drawer(
    backgroundColor: Colors.white,
    child: ListView(
      padding: EdgeInsets.zero,
      children: [

        /// Drawer Header
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          margin: EdgeInsets.only(top:85.h,bottom: 65.h),
          color: Colors.white,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(AppImages.appLogo),
                IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon( Icons.close, color: AppColors.mainIconColor,size: 28.r,))
              ],
            ),
          ),
        ),

        ListTile(
          onTap: ()=>context.push(RouteName.profileScreen),
          leading: Utils.secondaryButton(
              onPressed: (){},
              imageAsset: AppIcons.userFill,
              padding: EdgeInsets.all(8.r),
              context: context,
              backgroundColor: AppColors.secondaryButtonBgColor
          ),
          title: Text("Profile",style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.onSurface
          ),),
          trailing: SvgPicture.asset(
            AppIcons.arrowRight,
            colorFilter: ColorFilter.mode( AppColors.primary, BlendMode.srcIn),
          ),
        ),
        SizedBox(height: 8.h,),
        ListTile(
          onTap: (){
            context.push(RouteName.orderHistoryScreen);
          },
          leading: Utils.secondaryButton(
              onPressed: (){},
              imageAsset: AppIcons.order,
              padding: EdgeInsets.all(8.r),
              context: context,
              backgroundColor: AppColors.secondaryButtonBgColor
          ),
          title: Text("Orders",style: Theme.of(context).textTheme.bodyLarge?.copyWith()),
          trailing: SvgPicture.asset(AppIcons.arrowRight,
            colorFilter: ColorFilter.mode( AppColors.primary, BlendMode.srcIn),),
        ),
        SizedBox(height: 8.h,),
        ListTile(
          leading: Utils.secondaryButton(
              onPressed: (){},
              imageAsset: AppIcons.crown,
              padding: EdgeInsets.all(8.r),
              context: context,
              backgroundColor: AppColors.secondaryButtonBgColor
          ),
          title: Text("Premium",style: Theme.of(context).textTheme.bodyLarge?.copyWith()),
          trailing: SvgPicture.asset(AppIcons.arrowRight,
            colorFilter: ColorFilter.mode( AppColors.primary, BlendMode.srcIn),),
        ),
        SizedBox(height: 8.h,),
        ListTile(
          onTap: ()=> context.go(RouteName.signInScreen),
          leading: Utils.secondaryButton(
              onPressed: (){},
              imageAsset: AppIcons.logout,
              padding: EdgeInsets.all(8.r),
              context: context,
              backgroundColor: AppColors.secondaryButtonBgColor
          ),
          title: Text("Logout",style: Theme.of(context).textTheme.bodyLarge?.copyWith()),
          trailing: SvgPicture.asset(AppIcons.arrowRight,
            colorFilter: ColorFilter.mode( AppColors.primary, BlendMode.srcIn),),
        ),
        SizedBox(height: 8.h,),

      ],
    ),
  );
}