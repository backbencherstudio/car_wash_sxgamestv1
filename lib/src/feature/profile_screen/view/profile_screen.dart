// ignore_for_file: library_private_types_in_public_api

import 'package:car_wash/core/constant/padding.dart';
import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:car_wash/src/feature/auth_screens/model/user_model.dart';
import 'package:car_wash/src/feature/auth_screens/view/signin_screens/Riverpod/login_provider.dart';
import 'package:car_wash/src/feature/profile_screen/view/widget/customTextField.dart';
import 'package:car_wash/src/feature/profile_screen/view/widget/profile_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../Riverpod/profile_provider.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  late final TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final UserModel userModel = ref.watch(loginProvider).userModel!;
      nameController.text = userModel.name ?? "";
      emailController.text = userModel.email;
      phoneController.text = userModel.phone_number ?? "";
      addressController.text = userModel.address ?? "";
    });

    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.screenHorizontal,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Utils.backButton(context: context),
              ),
              // SizedBox(height: 25.h,),
              ProfileHeader(
                profilePicture: ref.watch(loginProvider).userModel!.avatar_url ?? "",
              ),
              SizedBox(height: 25.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.h),
                  customTextfield("User Name", nameController, context, true),
                  customTextfield(
                    "Email Address",
                    emailController,
                    context,
                    false,
                  ),
                  customTextfield(
                    "Phone Number",
                    phoneController,
                    context,
                    true,
                  ),
                  customTextfield(
                    "Passwords",
                    passwordController,
                    context,
                    true,
                  ),
                  customTextfield("Location", addressController, context, true),
                  SizedBox(height: 24.h),
                  Consumer(
                    builder: (_, ref, _) {
                      final isLoading =
                          ref.watch(profileEditProvider).isLoading;
                      final profileNotifier = ref.read(
                        profileEditProvider.notifier,
                      );
                      return isLoading
                          ? Utils.loadingButton()
                          : Utils.primaryButton(
                            onPressed: () async {
                              await profileNotifier.onSubmit(
                                name:
                                    nameController.text.isNotEmpty
                                        ? nameController.text
                                        : null,
                                address:
                                    addressController.text.isNotEmpty
                                        ? addressController.text
                                        : null,
                                phone:
                                    phoneController.text.isNotEmpty
                                        ? phoneController.text
                                        : null,
                                password:
                                    passwordController.text.isNotEmpty
                                        ? passwordController.text
                                        : null,
                              );

                              if (context.mounted) {
                                context.pop();
                              }
                            },
                            text: "Save & Change",
                          );
                    },
                  ),
                  SizedBox(height: 150.h),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
