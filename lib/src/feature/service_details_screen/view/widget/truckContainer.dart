import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:car_wash/src/feature/service_details_screen/view/widget/bridge.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TruckContainer extends StatelessWidget {
  const TruckContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Utils.commonBoxDecoration(),

      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Car Wash Services",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color:AppColors.primary,
                 ),      
              ),
            ),
            SizedBox(height: 17.h,),

            Align(
              alignment: Alignment.centerLeft,
              child: Text("Exterior Wash",
               style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color:AppColors.textColor,
                   ),     
              ),
            ),

            RowContent(img: "assets/icons/suv.svg", text: "Sedan", trailText: "\$20",),
            RowContent(img: "assets/icons/suv.svg", text: "SUV", trailText: "\$20",),
            RowContent(img: "assets/icons/suv.svg", text: "Truck", trailText: "\$20",),
            RowContent(img: "assets/icons/suv.svg", text: "Sedan", trailText: "\$20",),

            SizedBox(height: 32.h,),
             Align(
              alignment: Alignment.centerLeft,
              child: Text("Full Interior & Exterior",
               style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color:AppColors.textColor,
                   ),     
              ),
            ),

            RowContent(img: "assets/icons/suv.svg", text: "Sedan", trailText: "\$20",),
            RowContent(img: "assets/icons/suv.svg", text: "SUV", trailText: "\$20",),
            RowContent(img: "assets/icons/suv.svg", text: "Truck", trailText: "\$20",),
            RowContent(img: "assets/icons/suv.svg", text: "Sedan", trailText: "\$20",),
              SizedBox(height: 32.h,),
             Align(
              alignment: Alignment.centerLeft,
              child: Text("Wheel Alignment",
               style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color:AppColors.textColor,
                   ),     
              ),
            ),

            RowContent(img: "assets/icons/suv.svg", text: "Sedan", trailText: "\$20",),

          ],
        ),
      ),
    );
  }
}
