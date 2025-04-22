import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:car_wash/src/feature/profile_screen/view_model/profile_provider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final stepState = ref.watch(StepControllerProvider);
        final stepNotifier = ref.read(StepControllerProvider.notifier);

        return Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Complete Profile",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(height: 2.h),

                Text(
                  "Complete your profile before getting started",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(color: AppColors.onSecondary),
                ),
                SizedBox(height: 24.h),
                Text(
                  "Upload your profile photo",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.secondary,
                  ),
                ),

                SizedBox(height: 16.h),
                DottedBorder(
                  color: AppColors.primary,
                  strokeWidth: 1,
                  borderType: BorderType.RRect,
                  radius: Radius.circular(12),
                  dashPattern: [6, 6],
                  child: Container(
                    height: 263.h,
                    width: 400.w,

                    child: Padding(
                      padding: const EdgeInsets.all(11),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Image.asset(
                              "assets/images/bag.png",
                              height: 48.h,
                              width: 48.w,
                            ),
                          ),
                          SizedBox(height: 48.h),

                          Image.asset(
                            "assets/images/upload.png",
                            height: 40.h,
                            width: 40.w,
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            "Upload Your Profile Photo",
                            style: Theme.of(
                              context,
                            ).textTheme.bodyLarge!.copyWith(
                              fontSize: 14.sp,
                              color: AppColors.onSecondary,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            "Only support .jpg, .png and .svg and zip files",
                            style: Theme.of(context).textTheme.bodySmall!
                                .copyWith(color: AppColors.onSecondary),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 24.h),
                Utils.primaryButton(
                  onPressed:
                      stepState.stepCompleted[stepState.currentStep]
                          ? stepNotifier.nextStep
                          : null,
                  text: "Next",
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
