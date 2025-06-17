import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:car_wash/src/feature/splash_screen/view_model/splashProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _MyScreenState();
}


class _MyScreenState extends ConsumerState<SplashScreen> {

  @override
  void initState() {
    Future.microtask(() async {
      final splashViewModel = ref.read(splashViewModelProvider);
      final String? route = await splashViewModel.handleSplashNavigation();
      if (mounted && route != null) {
        context.go(route);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Image.asset("assets/images/splash.png", fit: BoxFit.cover),
    );
  }
}
