import 'package:car_wash/src/feature/profile_screen/Riverpod/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CustomDialogue extends StatelessWidget {
  const CustomDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: 260.h,
        width: 400.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Color(0xffffffff),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            top: 32.h,
            bottom: 20,
          ),
          child: Consumer(
            builder: (context, ref, _) {
              final imagePicker = ref.read(profileEditProvider.notifier);
              final imageState = ref.watch(profileEditProvider);
              return Column(
                children: [
                  Text(
                    "Change your picture",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Divider(thickness: 2, color: Color(0xffE9E9EA)),
                  GestureDetector(
                    onTap: () async {
                      await imagePicker.pickFromGallery();
                      if(context.mounted){
                        context.pop();
                      }

                    },
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: Color(0xffFAFBFC),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 16.w,
                            right: 16.w,
                            top: 10.h,
                            bottom: 10.h,
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/icons/takephoto.svg"),
                              SizedBox(width: 10.w),
                              Text(
                                "Take a photo",
                                style: Theme.of(context).textTheme.bodyMedium!
                                    .copyWith(color: Color(0xff444950)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      imagePicker.clearImage();
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: Color(0xffFAFBFC),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 16.w,
                            right: 16.w,
                            top: 10.h,
                            bottom: 10.h,
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/icons/delete.svg"),
                              SizedBox(width: 10.w),
                              Text(
                                "Delete Photo",
                                style: Theme.of(context).textTheme.bodyMedium!
                                    .copyWith(color: Color(0xffEB3D4D)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
