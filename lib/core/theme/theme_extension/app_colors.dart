import 'package:flutter/material.dart';

class AppColors {
  ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xff1141CB),
    onPrimary: Color(0xffFFFFFF),
    secondary: Color(0xff151C24),
    onSecondary: Color(0xffB4B4B4),
    error: Color(0xffEB3D4D),
    onError: Color(0xffFFFFFF),
    surface: Color(0xff1141CB).withOpacity(0.08),
    onSurface: Color(0xffB4B4B4),
  );
  static const Color warningColor = Color(0xffF9C80E);
  static const Color successColor = Color(0xff22CAAD);
}
