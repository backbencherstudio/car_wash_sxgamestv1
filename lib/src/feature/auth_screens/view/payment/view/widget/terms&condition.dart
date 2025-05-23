import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return 
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "By proceeding, you agree to our",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff62676C),
                      ),
                    ),
                    TextSpan(
                      text: " Terms & Conditions ",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff1141CB),
                      ),
                    ),
                    TextSpan(
                      text:
                          "and understand that your account will be logged out if your subscription expires. Access will resume upon renewal.",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff62676C),
                      ),
                    ),
                  ],
                ),
              );}}