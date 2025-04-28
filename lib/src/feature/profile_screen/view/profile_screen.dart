// ignore_for_file: library_private_types_in_public_api

import 'package:car_wash/core/constant/padding.dart';
import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:car_wash/src/feature/profile_screen/view/widget/customTextField.dart';
import 'package:car_wash/src/feature/profile_screen/view/widget/profile_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final TextEditingController nameController;
  final TextEditingController dobController = TextEditingController(text: "abc@gmail.com");
  final TextEditingController nidController = TextEditingController(text: "123456789");
  final TextEditingController licenseController = TextEditingController(text: "123456789");
  final TextEditingController businessLocController = TextEditingController(text: "4319 Wakefield Street, Philadelphia, PA 19126");
@override
  void initState() {
    nameController = TextEditingController( text: "John Abraham");
    super.initState();
  }
  @override
  void dispose() {
    nameController.dispose();
    dobController.dispose();
    nidController.dispose();
    licenseController.dispose();
    businessLocController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: Text(
          "Profile",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: AppColors.textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: AppPadding.screenHorizontal,
          child: Column(
            children: [
              ProfileHeader(),
              SizedBox(height: 25.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.h),
                  customTextfield("User Name", nameController, context, true),
                  customTextfield("Email Address",dobController,context,false),
                  customTextfield("Phone Number", nidController, context, true),
                  customTextfield("Passwords",licenseController,context,true),
                  customTextfield("Location",businessLocController,context,true),
                  SizedBox(height: 24.h),
                  Utils.primaryButton(onPressed: () {}, text: "Save & Change"),
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

