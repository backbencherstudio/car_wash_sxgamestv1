import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/images.dart';

class CommonHeader extends StatelessWidget {
  const CommonHeader({
    super.key,
    required this.backgroundColor,
    this.child,
    this.bgImage,
    this.backgroundContainerHeight,
  });

  final Color backgroundColor;
  final Widget? child;
  final String? bgImage;
  final double? backgroundContainerHeight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background container
        Container(
          height: backgroundContainerHeight ?? 210.h,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24.r),
              bottomRight: Radius.circular(24.r),
            ),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: bgImage != null ? ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24.r),
                bottomRight: Radius.circular(24.r),
              ),
              child: Image.asset(
                bgImage!,
                fit: BoxFit.cover,
               // width: ScreenUtil().screenWidth,
              ),
            ) : SizedBox(),
          ),
        ),

        // Optional child widget placed on top
        if (child != null) Positioned.fill(child: child!),
      ],
    );
  }
}

