import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FiveStar extends StatelessWidget {
  const FiveStar({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          SvgPicture.asset("assets/icons/star.svg"),
          SvgPicture.asset("assets/icons/star.svg"),
          SvgPicture.asset("assets/icons/star.svg"),
          SvgPicture.asset("assets/icons/star.svg"),
          SvgPicture.asset("assets/icons/star.svg"),
          SizedBox(width:6.w),
          Text("5.00",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Color(0xff444950),
            fontWeight: FontWeight.w500,
          ),
          )
        ],
      ),
    );
  }
}