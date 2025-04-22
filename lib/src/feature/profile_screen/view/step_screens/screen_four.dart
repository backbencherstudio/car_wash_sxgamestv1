import 'package:car_wash/core/routes/route_name.dart';
import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:car_wash/src/common_widget_style/common_style/auth_style/auth_input_decoration_theme.dart';
import 'package:car_wash/src/feature/profile_screen/view_model/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ScreenFour extends StatelessWidget {
  const ScreenFour({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final dobController = TextEditingController();
    final nidController = TextEditingController();
    final licenseController = TextEditingController();
    final businessLocController = TextEditingController();
    final permanentLocController = TextEditingController();

    return Consumer(
      builder: (context, ref, _) {
        final stepNotifier = ref.read(StepControllerProvider.notifier);
        final stepState = ref.watch(StepControllerProvider);

        void validateInputs() {
          final isComplete = nameController.text.isNotEmpty &&
              dobController.text.isNotEmpty &&
              nidController.text.isNotEmpty &&
              licenseController.text.isNotEmpty &&
              businessLocController.text.isNotEmpty &&
              permanentLocController.text.isNotEmpty;

          stepNotifier.markStepComplete(isComplete);
        }

        // Add listeners
        nameController.addListener(validateInputs);
        dobController.addListener(validateInputs);
        nidController.addListener(validateInputs);
        licenseController.addListener(validateInputs);
        businessLocController.addListener(validateInputs);
        permanentLocController.addListener(validateInputs);

        return SingleChildScrollView(
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
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: AppColors.secondary),
              ),
              SizedBox(height: 24.h),
              customTextfield("Applicant’s Name", nameController, context),
              customTextfield("Applicant’s Date of Birth", dobController, context),
              customTextfield("Applicant’s NID Number", nidController, context),
              customTextfield("Applicant’s License Number", licenseController, context),
              customTextfield("Applicant’s Business Location", businessLocController, context),
              customTextfield("Applicant’s Permanent Location", permanentLocController, context),
              SizedBox(height: 24.h),
              Utils.primaryButton(
                onPressed: stepState.stepCompleted[stepState.currentStep]
                    ? () => context.go(RouteName.successfullyResetPasswordScreen)
                    : null,
                text: "Submit Information",
              ),
            ],
          ),
        );
      },
    );
  }

  Widget customTextfield(String label, TextEditingController controller, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          SizedBox(height: 8.h),
          TextFormField(
            controller: controller,
            decoration: AuthInputDecorationTheme.lightInputDecorationTheme(
              context: context,
              fillColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
