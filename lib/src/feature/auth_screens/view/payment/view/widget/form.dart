import 'package:car_wash/src/feature/auth_screens/view/payment/view/widget/custom_textBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormCard extends StatelessWidget {
  const FormCard({super.key});

  @override
  Widget build(BuildContext context) {
        final textStyle = Theme.of(context).textTheme;

    return Column(
      children: [

              BuildLabel( text:  "Card Number",textStyle:  textStyle),
              SizedBox(height: 8.h),
              TextFormField(
                decoration: InputDecoration(hintText: "Enter Card Number"),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16.h),

              BuildLabel(text:  "Card Holder Name",textStyle:  textStyle),
              SizedBox(height: 8.h),

              TextFormField(
                decoration: InputDecoration(hintText: "Enter Full Name"),
              ),
              SizedBox(height: 16.h),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BuildLabel(text:  "Expiry Date",textStyle:  textStyle),
                        SizedBox(height: 8.h),

                        TextFormField(
                          decoration: InputDecoration(hintText: "MM/YY"),
                          keyboardType: TextInputType.datetime,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BuildLabel(text:  "CVV",textStyle:  textStyle),
                        SizedBox(height: 8.h),

                        TextFormField(
                          decoration: InputDecoration(hintText: "CVV"),
                          obscureText: true,
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ],
    );
  }
}