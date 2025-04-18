import 'package:flutter/material.dart';

class AppColors {
  static ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xff1141CB),
    onPrimary: Color(0xffFFFFFF),
    secondary: Color(0xff151C24),
    onSecondary: Color(0xffB4B4B4),
    error: Color(0xffEB3D4D),
    onError: Color(0xffFFFFFF),
    surface: Color(0xff007CF0).withOpacity(0.08),
    onSurface: Color(0xffB4B4B4),
  );
  static const Color primary = Color(0xff1141CB);
  static const Color onPrimary = Color(0xffFFFFFF);
  static const Color secondary = Color(0xff151C24);
  static const Color onSecondary = Color(0xffB4B4B4);
  static const Color error = Color(0xffEB3D4D);
  static const Color onError = Color(0xffFFFFFF);
  static Color surface = Color(0xff1141CB).withOpacity(0.08);
  static const Color onSurface = Color(0xffB4B4B4);
  static const Color warningColor = Color(0xffF9C80E);
  static const Color successColor = Color(0xff22CAAD);
  static const Color darkBorder = Color(0xff071B55);
}
