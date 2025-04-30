import 'package:car_wash/core/constant/padding.dart';
import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:car_wash/src/feature/home_screen/view/widgets/banner_show/show_banner.dart';
import 'package:car_wash/src/feature/service_details_screen/view/widget/bridge.dart';
import 'package:car_wash/src/feature/service_details_screen/view/widget/five_star.dart';
import 'package:car_wash/src/feature/service_details_screen/view/widget/truckContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ServiceDetailsScreen extends StatelessWidget {
  const ServiceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
        children: [
        SizedBox(
          height: 300.h,
          child: Stack(
          children: [
            
          Positioned.fill(child: Image.asset("assets/images/serviceDetails/maskGroup.png", fit: BoxFit.cover,)),
          Positioned(top: 70,left: 30,
          // ignore: deprecated_member_use
          child: SvgPicture.asset("assets/icons/backbutton.svg", color: Color(0xffffffff),)),
          Positioned(top: 50, left: 310, child: Utils.appBarButtons())]),
        ),
        //below image content
         Padding(
              padding:  EdgeInsets.only(top:25.h ,right: 20.w),
           child: SizedBox(
            height: 84.h,
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Padding(
                padding: AppPadding.screenHorizontal,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("Exterior Wash",style: Theme.of(context).textTheme.headlineSmall,),
                  SizedBox(height: 2.h,),
                  Text("CarFlix",style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Color(0xff62676C))),
                  FiveStar(),
                
                  ],
                ),
              ),
              SizedBox(width: 17.w,),
              Utils.primaryButton(onPressed: (){}, text: "Book Now",
              width: 153.w, height: 49.h
              ),
              ],
             ),
           ),
         ),
         SizedBox(height: 18.h,),
     Padding(
       padding: AppPadding.screenHorizontal,
       child: Column(
         children: [
           RowContent(img: "assets/icons/carOne.svg", text: "Service Type" ,trailText:"Car Wash"),
           RowContent(img: "assets/icons/map.svg", text: "New York City" ,trailText:null ,),
           RowContent(img: "assets/icons/clocky.svg", text: "09:30 AM - 11:00 PM" ,trailText:null ),
           SizedBox(height: 24.h),
           Align(
            alignment: Alignment.centerLeft,
             child: Text("About the Provider",
             style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              color:AppColors.textColor,
             ),
             ),
           ),
           SizedBox(height: 4.h,),
           Align(
            alignment: Alignment.centerLeft,
             child: Text("Premium mobile & in-garage detailing. We serve all vehicle types and offer expert wheel services",
             style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color:Color(0xff62676C),
             ),
             ),
           ),
           SizedBox(height: 16.h,),
           RowContent(img: "assets/icons/userry.svg", text: "Team Size: 03"),
           RowContent(img: "assets/icons/towTruck.svg", text: "Mobile: Available"),
           RowContent(img: "assets/icons/garage.svg", text: "Garage: Available"),
           SizedBox(height: 24.h,),
           TruckContainer(),
           SizedBox(height: 24.h,),
           
           //call the container
       
         ],
       ),
     ),
         SizedBox(height: 500000,)
          ],
        ),
      ),
    );
  }
}
