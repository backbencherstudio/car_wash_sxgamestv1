import 'package:car_wash/core/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

final splashViewModelProvider = Provider<SplashViewModel>((ref) {
  return SplashViewModel();
});

class SplashViewModel {
  static const String isOpenFirstKey = "isOpenFirst";

  Future<void> handleSplashNavigation(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();

    await Future.delayed(const Duration(seconds: 2));

    if (!context.mounted) return;

    final isFirstOpen = prefs.getBool(isOpenFirstKey);

    if (isFirstOpen == null || isFirstOpen == false) {
      await prefs.setBool(isOpenFirstKey, true);
      context.go(RouteName.onboardingScreen);
    } else {
      context.go(RouteName.signInScreen);
    }
  }
}
