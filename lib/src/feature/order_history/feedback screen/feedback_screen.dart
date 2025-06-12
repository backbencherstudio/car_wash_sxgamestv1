import 'package:car_wash/core/constant/images.dart';
import 'package:car_wash/core/constant/padding.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:car_wash/src/feature/order_history/feedback%20screen/riverpod/star_rating_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       leading: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Utils.backButton(context: context),
       ),
      ),
      body: Consumer(
        builder: (context,ref,_) {
          final value = ref.watch(ratingProvider);
          return Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  AppImages.whiteBackground,
                  fit: BoxFit.cover,
                ),
              ),
              
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Share Your Reviews",
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                            color: Color(0xff151C24),
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(height: 32.h),
                    Text(
                      "Tap To Rate",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Color(0xff444950),
                          ),
                    ),
                    SizedBox(height: 8.h),
                    
                    RatingStars(
                      value: value,
                      onValueChanged: (v) {
                        ref.read(ratingProvider.notifier).state = v;
                      },
                      valueLabelVisibility: false,
                      starCount: 5,
                      starSize: 28,
                      starSpacing: 2,
                      animationDuration: Duration(milliseconds: 1000),
                      starOffColor: const Color(0xffe7e8ea),
                      starColor: Color(0xffFAAD14),
                    ),
                    SizedBox(height: 28.h),
                    
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: AppPadding.screenHorizontal,
                        child: Text(
                          "Tell us more (Optional)",
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                color: Color(0xff444950),
                              ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    SizedBox(
                      width: 390.w,
                      height: 101.h,
                      child: TextFormField(
                        maxLines: 3,
                        style: TextStyle(fontSize: 16.sp),
                        decoration: InputDecoration(
                          hintText: "Write your experience...",
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.all(16.r),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 28.h),
                    Padding(
                      padding: AppPadding.screenHorizontal,
                      child: Utils.primaryButton(onPressed: () {}, text: "Submit"),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}
