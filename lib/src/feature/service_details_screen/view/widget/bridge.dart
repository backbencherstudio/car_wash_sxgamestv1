import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RowContent extends StatelessWidget {
  final String img;
  final String text;
  final String? trailText;
  const RowContent({super.key,
  required this.img,
  required this.text,
  this.trailText
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(img),
        SizedBox(width: 6.w,),
        Text(text,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: Color(0xff62676C)
        ),
        ),
        Spacer(),
         if (trailText != null)
          Text(
            trailText!,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: const Color(0xff62676C),
                ),
          ),
      ],
    );
  }
}