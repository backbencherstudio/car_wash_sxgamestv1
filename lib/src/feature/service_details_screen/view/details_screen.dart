import 'package:car_wash/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ServiceDetailsScreen extends StatelessWidget {
  const ServiceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
         child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Exterior Wash"),
            ],
          ),
          SizedBox(width: 10.w,),
          Utils.primaryButton(onPressed: (){}, text: "Book Now",
          width: 153.w, height: 49.h
          ),
          ],
         ),
       )
        ],
      ),
    );
  }
}
