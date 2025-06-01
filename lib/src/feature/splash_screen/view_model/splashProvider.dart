import 'package:car_wash/core/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

final splashViewModelProvider = Provider<SplashViewModel>((ref) {
  return SplashViewModel();
});

class SplashViewModel {
  static const String firstOpenKey = "isFirstOpen"; 

  Future<void> handleSplashNavigation(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();

    await Future.delayed(const Duration(seconds: 1));

    if (!context.mounted) return;

    final isFirstOpen = prefs.getInt(firstOpenKey) ?? 0;

    if (isFirstOpen == 0) {
      // First time opening the app
      await prefs.setInt(firstOpenKey, 1);
      context.go(RouteName.onboardingScreen);
    } else {
      // Not first time
      context.go(RouteName.signInScreen);
    }
  }
}
