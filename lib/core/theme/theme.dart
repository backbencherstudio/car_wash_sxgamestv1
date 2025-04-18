import 'package:car_wash/core/theme/part/app_bar_theme.dart';
import 'package:car_wash/core/theme/part/elevated_button_theme.dart';
import 'package:car_wash/core/theme/part/input_decoration_theme.dart';
import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightTheme = ThemeData(
    inputDecorationTheme: AppInputDecorationTheme.inputDecorationTheme,
    scaffoldBackgroundColor: AppColors.onPrimary,
    appBarTheme: AppAppBarTheme.lightAppBarTheme,
    elevatedButtonTheme: AppEvaluatedButtonThemes.evaluatedButtonTheme,
    //textTheme: AppTextTheme.lightTextTheme,
    colorScheme: AppColors.lightColorScheme,
  );
  static ThemeData darkTheme = ThemeData();
}
