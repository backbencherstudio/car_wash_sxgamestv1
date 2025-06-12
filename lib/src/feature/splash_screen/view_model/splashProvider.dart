// ignore_for_file: use_build_context_synchronously

import 'package:car_wash/core/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/services/local_storage_services/sharedPref_service.dart';

final splashViewModelProvider = Provider<SplashViewModel>((ref) {
  return SplashViewModel();
});

class SplashViewModel {
  static const String firstOpenKey = "isFirstOpen"; 

  Future<void> handleSplashNavigation(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));

    if (!context.mounted) return;

    final isFirstOpen = await SharedPreferenceStorageService.getData(firstOpenKey) as int? ?? 0;

    if (isFirstOpen == 0) {
      // First time opening the app
      await SharedPreferenceStorageService.saveData(firstOpenKey, 1);
      context.go(RouteName.onboardingScreen);
    } else {
      // Not first time
      context.go(RouteName.signInScreen);
    }
  }
}
