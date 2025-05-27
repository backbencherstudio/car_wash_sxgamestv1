import 'package:car_wash/core/constant/icons.dart';
import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:car_wash/src/common_widget_style/common_widgets/common_widgets.dart';
import 'package:car_wash/src/feature/profile_Create_screen/view/step_screens/screen_four.dart';
import 'package:car_wash/src/feature/profile_Create_screen/view/step_screens/screen_one.dart';
import 'package:car_wash/src/feature/profile_Create_screen/view/step_screens/screen_three.dart';
import 'package:car_wash/src/feature/profile_Create_screen/view/step_screens/screen_two.dart';
import 'package:car_wash/src/feature/profile_Create_screen/view_model/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class ProfileCreateScreen extends StatelessWidget {
  const ProfileCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = [ScreenOne(), ScreenTwo(), ScreenThree(), ScreenFour()];

    return Scaffold(
      appBar: AppBar(
        leading: Consumer(
          builder: (context, ref, _) {
            final stepNotifier = ref.read(StepControllerProvider.notifier);
            final stepState = ref.watch(StepControllerProvider);

            return IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                color: AppColors.secondary,
              ),
              onPressed:
                  stepState.currentStep == 0
                      ? () => Navigator.pop(context)
                      : stepNotifier.previousStep,
            );
          },
        ),
        title: Padding(
          padding: EdgeInsets.only(right: 150.w),
          child: Consumer(
            builder: (context, ref, _) {
              final StepState = ref.watch(StepControllerProvider);
              return StepProgressIndicator(
                totalSteps: pages.length,
                currentStep: StepState.currentStep + 1,
                selectedColor: AppColors.primary,
                unselectedColor: AppColors.onSecondary,
                size: 6,
                padding: 2,
                roundedEdges: Radius.circular(99),
              );
            },
          ),
        ),
      ),

      body: Consumer(
        builder: (context, ref, _) {
          final StepState = ref.watch(StepControllerProvider);
          final stepNotifier = ref.read(StepControllerProvider.notifier);

          return PageView.builder(
            controller: StepState.pageController,
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: stepNotifier.onPageChanged,
            itemCount: pages.length,

            itemBuilder: (_, index) => pages[index],
          );
        },
      ),
    );
  }
}
