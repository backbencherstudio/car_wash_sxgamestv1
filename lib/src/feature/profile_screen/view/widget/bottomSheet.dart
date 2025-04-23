import 'dart:io';

import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:car_wash/src/feature/profile_screen/view_model/image_provider.dart';
import 'package:car_wash/src/feature/profile_screen/view_model/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageSourcePicker extends StatelessWidget {
  final WidgetRef ref;
  final String id;
  const ImageSourcePicker({required this.ref, required this.id});

  @override
  Widget build(BuildContext context) {
    final imagePicker = ref.read(imagePickerProvider.notifier);
    final stepNotifier = ref.read(StepControllerProvider.notifier);

    return Container(
            color: AppColors.onPrimary,
      padding: const EdgeInsets.all(20),

child: Wrap(
        runSpacing: 16,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.onPrimary,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title:  Text("Choose from Gallery",
            style: Theme.of(context).textTheme.bodyMedium,
            ),
            onTap: () async {
              Navigator.pop(context);
              await imagePicker.pickFromGallery(id);
              if (ref.read(imagePickerProvider) != null) {
                stepNotifier.markStepComplete(true);
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_camera),
            title:  Text("Take a Photo",
                        style: Theme.of(context).textTheme.bodyMedium,

            ),
            onTap: () async {
              Navigator.pop(context);
              await imagePicker.pickFromCamera(id);
              if (ref.read(imagePickerProvider) != null) {
                stepNotifier.markStepComplete(true);
              }
            },
          ),
        ],
      ),
    );
  }
}
