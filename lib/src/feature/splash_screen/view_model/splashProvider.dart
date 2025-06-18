// ignore_for_file: use_build_context_synchronously

import 'package:car_wash/core/routes/route_name.dart';
import 'package:car_wash/core/services/local_storage_services/secure_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/services/local_storage_services/sharedPref_service.dart';
import '../../auth_screens/view/signin_screens/Riverpod/login_provider.dart';
import '../../auth_screens/view/signin_screens/model/loginState_model.dart';

final splashViewModelProvider = Provider<SplashViewModel>((ref) {
  final loginNotifier = ref.read(loginProvider.notifier);
  return SplashViewModel(loginNotifier: loginNotifier,);
});

class SplashViewModel {
  final LoginNotifier loginNotifier;
  SplashViewModel({ required this.loginNotifier,});
  static const String firstOpenKey = "isFirstOpen"; 

  Future<String?> handleSplashNavigation() async {

    // if (!context.mounted) return;

    final isFirstOpen = await SharedPreferenceStorageService.getData(firstOpenKey) as int? ?? 0;

    if (isFirstOpen == 0) {
      // First time opening the app
      await SharedPreferenceStorageService.saveData(firstOpenKey, 1);
      await Future.delayed(Duration(milliseconds: 500));
      return RouteName.onboardingScreen;
      //context.go(RouteName.onboardingScreen);
    }
    else {
      final String? userToken  = await SecureAuthTokenStorageService.getAuthToken();
      if(userToken != null && userToken.isNotEmpty){
        loginNotifier.updateUserToken(userToken);
        await loginNotifier.updateUserModel();
        debugPrint("\nuser name : ${loginNotifier.state.userModel?.name}\n");
        if(loginNotifier.state.userModel!.subscriptions != null && loginNotifier.state.userModel!.subscriptions![0].is_active == true){
          return RouteName.homeScreen;
          // context.go(RouteName.homeScreen);
        }
        else{
          return RouteName.paymentSlectionFormScreen;
         // context.go(RouteName.homeScreen);
        }

      }
      else{
        return RouteName.signInScreen;
        //context.go(RouteName.signInScreen);
      }

    }
  }
}
