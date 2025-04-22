import 'package:car_wash/core/constant/images.dart';
import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:car_wash/src/common_widget_style/common_style/auth_style/auth_input_decoration_theme.dart';
import 'package:car_wash/src/feature/profile_screen/view_model/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final numberController = TextEditingController();

    return Consumer(
      builder: (context, ref, _) {
        final stepState = ref.watch(StepControllerProvider);
        final stepNotifier = ref.read(StepControllerProvider.notifier);

        void validateInputs() {
          final isValid =
              nameController.text.isNotEmpty &&
              numberController.text.isNotEmpty;
          stepNotifier.markStepComplete(isValid);
        }

        nameController.addListener(validateInputs);
        numberController.addListener(validateInputs);

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
                TextFormField(
                  controller: nameController,
                  decoration:
                      AuthInputDecorationTheme.lightInputDecorationTheme(
                        context: context,
                        hintText: "Your Business Name",
                        fillColor: Color(0xffffffff),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 16.w, right: 4.w),
                          child: ImageIcon(
                            AssetImage(AppImages.personIcon),
                            size: 18.r,
                          ),
                        ),
                      ),
                ),
                SizedBox(height: 16.h),
                TextFormField(
                  controller: numberController,
                  decoration:
                      AuthInputDecorationTheme.lightInputDecorationTheme(
                        context: context,
                        hintText: "Your Business Number",
                        fillColor: Color(0xffffffff),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 16.w, right: 4.w),
                          child: ImageIcon(
                            AssetImage(AppImages.emailIcon),
                            size: 18.r,
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
