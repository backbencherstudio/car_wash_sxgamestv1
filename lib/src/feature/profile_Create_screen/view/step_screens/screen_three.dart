import 'dart:io';
import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:car_wash/src/feature/profile_Create_screen/view/widget/bottomSheet.dart';
import 'package:car_wash/src/feature/profile_Create_screen/view_model/image_provider.dart';
import 'package:car_wash/src/feature/profile_Create_screen/view_model/profile_provider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenThree extends StatelessWidget {
  const ScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        final stepState = ref.watch(StepControllerProvider);
        final stepNotifier = ref.read(StepControllerProvider.notifier);
        final imageState = ref.watch(imagePickerProvider);
        final imageNotifier = ref.read(imagePickerProvider.notifier);

        Widget imageUploadSection({
          required String id,
          required File? imageFile,
        }) {
          return GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                builder: (_) => ImageSourcePicker(ref: ref, id: id),
              );
            },
            child: DottedBorder(
              color: AppColors.primary,
              strokeWidth: 1,
              borderType: BorderType.RRect,
              radius: Radius.circular(12),
              dashPattern: [6, 6],
              child: Container(
                height: 263.h,
                width: 400.w,
                child:
                    imageFile != null
                        ? Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.file(
                                imageFile,
                                width: 400.w,
                                height: 263.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 8,
                              right: 8,
                              child: GestureDetector(
                                onTap: () {
                                  imageNotifier.clearImage(id);
                                  stepNotifier.markStepComplete(false);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black54,
                                  ),
                                  child: const Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                        : Padding(
                          padding: const EdgeInsets.all(11),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                "Upload Your $id Image",
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyLarge!.copyWith(
                                  fontSize: 14.sp,
                                  color: AppColors.onSecondary,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                "Only support .jpg, .png, .svg, and zip files",
                                style: Theme.of(context).textTheme.bodySmall!
                                    .copyWith(color: AppColors.onSecondary),
                              ),
                            ],
                          ),
                        ),
              ),
            ),
          );
        }

        return Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
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
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.onSecondary,
                    ),
                  ),
                  SizedBox(height: 24.h),

                  // License Front Image
                  Text(
                    "Upload your licence photo",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.secondary,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  imageUploadSection(
                    id: 'licenseFront',
                    imageFile: imageState.licenseFront,
                  ),
                  SizedBox(height: 16.h),

                  // License Back Image
                  imageUploadSection(
                    id: 'licenseBack',
                    imageFile: imageState.licenseBack,
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
          ),
        );
      },
    );
  }

  File? _getImageById(WidgetRef ref, String id) {
    final state = ref.read(imagePickerProvider);
    if (id == 'profile') return state.profile;
    if (id == 'licenseFront') return state.licenseFront;
    if (id == 'licenseBack') return state.licenseBack;
    return null;
  }
}
