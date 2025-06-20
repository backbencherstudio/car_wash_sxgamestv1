import 'package:car_wash/core/theme/part/app_bar_theme.dart';
import 'package:car_wash/core/theme/part/date_picker_theme.dart';
import 'package:car_wash/core/theme/part/elevated_button_theme.dart';
import 'package:car_wash/core/theme/part/input_decoration_theme.dart';
import 'package:car_wash/core/theme/part/time_picker_theme.dart';
import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:car_wash/core/theme/theme_extension/text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightTheme = ThemeData(
    inputDecorationTheme: AppInputDecorationTheme.inputDecorationTheme,
    scaffoldBackgroundColor: AppColors.onPrimary,
    appBarTheme: AppAppBarTheme.lightAppBarTheme,
    elevatedButtonTheme: AppEvaluatedButtonThemes.evaluatedButtonTheme,
    textTheme: AppTextTheme.lightTextTheme,
    colorScheme: AppColors.lightColorScheme,
    timePickerTheme: CustomTimePickerTheme.timePickerTheme,
    datePickerTheme: CustomDatePickerTheme.datePickerTheme,
  );
  static ThemeData darkTheme = ThemeData();
}
