import 'package:car_wash/core/services/api_services/api_endpoints.dart';
import 'package:car_wash/core/services/api_services/api_services.dart';
import 'package:car_wash/src/feature/auth_screens/view/signin_screens/model/loginState_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

final loginProvider = StateNotifierProvider<LoginNotifier, LoginstateModel>((
  ref,
) {
  return LoginNotifier();
});

class LoginNotifier extends StateNotifier<LoginstateModel> {
  LoginNotifier() : super(LoginstateModel());

  Future<void> login({required String email, required String password}) async {
    try {
      state = LoginstateModel(isLoading: true);
      final payload = {"email": email, "password": password};

      final response = await ApiServices.instance.postData(
        endPoint: ApiEndPoints.login ,
         body: payload,
          headers:{'Content-Type': 'application/json'} );

      if (response['success'] == true || response['success'] == "true") {
       debugPrint("\n Signup successful: ${response['message']} \n");

      debugPrint("\n  Signup successful: ${response['message']} \n ");
        state = LoginstateModel(
          isLoading: false,
          message: response['message'],
          success: true,
        );
      } else {
        state = LoginstateModel(
          isLoading: false,
          error: response['message'] ?? 'Signup failed',
          success: false,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Sign Up failed: $e",
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      throw Exception('\nSign up failed: $e\n');
    }
  }
}