import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:car_wash/src/feature/auth_screens/view/auth_style/auth_input_decoration_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customTextfield(
  String label,
  TextEditingController controller,
  BuildContext context,
  bool active,
) {
  return Padding(
    padding: EdgeInsets.only(bottom: 16.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Color(0xffB4B4B4),
          ),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          enabled: active,
          controller: controller,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: active ? AppColors.textColor : AppColors.onSurface,
          ),
          decoration: AuthInputDecorationTheme.lightInputDecorationTheme(
            context: context,
            fillColor: Colors.white,
          ),
        ),
      ],
    ),
  );
}
