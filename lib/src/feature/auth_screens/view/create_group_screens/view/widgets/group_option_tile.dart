import 'package:car_wash/src/common_widget_style/common_style/auth_style/auth_color_pallete.dart';
import 'package:car_wash/src/feature/auth_screens/view/create_group_screens/view_model/create_group_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget groupOptionTile({
  required BuildContext context,
  required String label,
  required String iconImage,
}) {
  final titleSmall = Theme.of(context).textTheme.titleSmall;

  return Consumer(
    builder: (context, ref, child) {
      final selectedLabel = ref.watch(createGroupProvider).selectedLabel;
      final isSelected = selectedLabel == label;
      final notifier = ref.read(createGroupProvider.notifier);

      return GestureDetector(
        onTap: () {
          notifier.selectLabel(label);
        },
        child: Container(
          // height: 76.h,
          padding: EdgeInsets.all(20.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(99.r),
            border: Border.all(
              color:
                  isSelected
                      ? AuthColorPalette.shadePurple
                      : Colors.transparent,
              width: 1,
            ),

            color: AuthColorPalette.white,
          ),
          child: Row(
            children: [
              ImageIcon(
                AssetImage(iconImage),
                color: AuthColorPalette.bodyTextColor,
              ),
              SizedBox(width: 12.w),
              Text(
                label,
                style: titleSmall?.copyWith(color: AuthColorPalette.titleColor),
              ),
              const Spacer(),
              Icon(
                isSelected ? Icons.check_circle : Icons.circle_outlined,
                color: AuthColorPalette.primary,
              ),
            ],
          ),
        ),
      );
    },
  );
}
