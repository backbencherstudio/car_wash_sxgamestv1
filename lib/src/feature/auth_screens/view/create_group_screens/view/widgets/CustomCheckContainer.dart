import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:car_wash/src/feature/auth_screens/view/create_group_screens/view/widgets/customCheckbox.dart';
import 'package:car_wash/src/feature/auth_screens/view/create_group_screens/view_model/checkbox_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCheckContainer extends StatelessWidget {
  final String img;
  final String text;
  final int index;
  const CustomCheckContainer({
    super.key,

    required this.img,
    required this.text,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, _) {
        final checkBox = ref.watch(checkboxListProvider);
        final isSelected = checkBox[index];

        return Container(
          width: 360.w,
          height: 75.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Color(0xffffffff),
            border: Border.all(
              color: isSelected ? AppColors.primary : Colors.transparent,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                SizedBox(width: 20.w),
                ImageIcon(
                  AssetImage(img),
                  size: 24,

                  color: isSelected ? AppColors.primary : Color(0xff777980),
                ),
                SizedBox(width: 15.w),
                Text(
                  text,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondary,
                  ),
                ),
                Spacer(),

                CustomCheckbox(
                  isSelected: isSelected,

                  onTap: () {
                    final updated = [...checkBox];
                    updated[index] = !updated[index];
                    ref.read(checkboxListProvider.notifier).state = updated;
                  },
                ),
                SizedBox(width: 20.w),
              ],
            ),
          ),
        );
      },
    );
  }
}
