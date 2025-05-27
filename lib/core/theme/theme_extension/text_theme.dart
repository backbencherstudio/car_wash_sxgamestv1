import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class AppTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: GoogleFonts.roboto(
      fontSize: 28.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.textColor,
    ),
    headlineMedium: GoogleFonts.roboto(
      fontSize: 26.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.textColor,
    ),
    headlineSmall: GoogleFonts.roboto(
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.textColor,
    ),
    titleLarge: GoogleFonts.roboto(
      fontSize: 22.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.textColor,
    ),
    titleMedium: GoogleFonts.roboto(
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.textColor,
    ),
    titleSmall: GoogleFonts.roboto(
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.textColor,
    ),
    bodyLarge: GoogleFonts.roboto(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.textColor,
    ),
    bodyMedium: GoogleFonts.roboto(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.textColor,
    ),
    bodySmall: GoogleFonts.roboto(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.textColor,
    ),
    labelLarge: GoogleFonts.roboto(
      fontSize: 14.sp,
      color: Color(0xff4A4C56),
      fontWeight: FontWeight.w500,
    ),
    labelMedium: GoogleFonts.roboto(
      fontSize: 12.sp,
      color: Color(0xff4A4C56),
      fontWeight: FontWeight.w500,
    ),
    labelSmall: GoogleFonts.roboto(
      fontSize: 11.sp,
      color: Color(0xff4A4C56),
      fontWeight: FontWeight.w400,
    ),
  );
  static TextTheme darkTextTheme = TextTheme();
}
