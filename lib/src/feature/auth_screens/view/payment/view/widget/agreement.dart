import 'package:car_wash/core/constant/icons.dart';
import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:car_wash/src/feature/auth_screens/view/payment/riverpod/selection_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Agreement extends StatelessWidget {
  const Agreement({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final isChecked = ref.watch(isCheckedProvider);
        return GestureDetector(
          onTap: () {
            ref.read(isCheckedProvider.notifier).isChecked();
          },
          child:

          Row(
            children: [

              Transform.scale(
               scale: 1.2,
                child: Checkbox(
                  shape: OvalBorder(),
                    value: isChecked,
                    onChanged: (_){},
                ),
              ),

              // SvgPicture.asset(
              //   AppIcons.check,
              //   color: isChecked ? AppColors.primary : Color(0xff62676C),
              // ),
              SizedBox(width: 5.w),
              Text(
                "I Agree",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: isChecked ? AppColors.primary : Color(0xff62676C),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
