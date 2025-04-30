import 'package:car_wash/core/utils/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';
import 'package:car_wash/core/constant/images.dart';
import 'package:car_wash/src/feature/profile_screen/Riverpod/profile_provider.dart';
import 'package:car_wash/src/feature/profile_screen/view/widget/custom_dialogue.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        // Watch the profile image from the provider
        final profilepic = ref.watch(profileImagePickerProvider);
        final profileImage = profilepic.profileImage ?? AppImages.shakin; // Default image if profile image is null

        return Column(
          children: [
            SizedBox(
              width: 118.w,
              height: 118.h,
              child: Stack(
                children: [
                  ClipOval(
                    child: Hero(
                      tag: "profileImageHero", 
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FullScreenImage(
                                imageUrl: profileImage is String
                                    ? profileImage // For assets
                                    : profileImage.toString(), // For File, use its path
                                isNetworkImage: false, // Assuming local image
                              ),
                            ),
                          );
                        },
                        child: profileImage is File
                            ? Image.file(
                                profileImage,
                                fit: BoxFit.cover,
                                height: 118.h,
                                width: 118.w,
                              )
                            : Image.asset(
                                profileImage.toString(),
                                fit: BoxFit.cover,
                                height: 118.h,
                                width: 118.w,
                              ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 75.h,
                    bottom: 1.h,
                    left: 85.w,
                    right: 0.w,
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return CustomDialogue();
                          },
                        );
                      },
                      child: SvgPicture.asset("assets/icons/addImage.svg"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
