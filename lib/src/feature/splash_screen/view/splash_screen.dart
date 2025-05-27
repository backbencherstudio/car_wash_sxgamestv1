import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:car_wash/src/feature/splash_screen/view_model/splashProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(splashViewModelProvider).handleSplashNavigation(context);
    });

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Image.asset("assets/images/splash.png", fit: BoxFit.cover),
    );
  }
}
