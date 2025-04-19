import 'package:car_wash/src/feature/auth_screens/view/auth_style/auth_color_pallete.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

Widget footerText({
  required BuildContext context,
  // required TextStyle? textStyle,
  required String text1,
  required String text2,
  required VoidCallback onTap,
}) {
  final bodyLarge = Theme.of(context).textTheme.bodyLarge;

  return Align(
    alignment: Alignment.center,
    child: RichText(
      text: TextSpan(
        text: text1,
        style: bodyLarge?.copyWith(color: AuthColorPalette.textColorGrey, fontWeight: FontWeight.w600),
        children: [
          TextSpan(
            text: text2,
            style: bodyLarge?.copyWith(color: AuthColorPalette.primary, fontWeight: FontWeight.w600),
            recognizer:
                TapGestureRecognizer()
                  ..onTap = onTap
          ),
        ],
      ),
    ),
  );
}
