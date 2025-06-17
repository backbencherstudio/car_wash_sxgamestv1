import 'dart:convert';

import 'package:car_wash/core/services/api_services/api_endpoints.dart';
import 'package:car_wash/core/services/api_services/api_services.dart';
import 'package:car_wash/src/feature/auth_screens/view/signin_screens/model/loginState_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';

final loginProvider = StateNotifierProvider<LoginNotifier, LoginStateModel>((
  ref,
) {
  return LoginNotifier();
});

class LoginNotifier extends StateNotifier<LoginStateModel> {
  LoginNotifier() : super(LoginStateModel());

  Future<void> login({required String email, required String password}) async {
    try {
      state = state.copyWith(
        isLoading: true
      );
      final payload = {"email": email, "password": password};

      final raw = await post(Uri.parse('${ApiEndPoints.baseUrl}/${ApiEndPoints.login}',),
      body: jsonEncode(payload),
          headers:{'Content-Type': 'application/json'}
      );

      final response = jsonDecode(raw.body);

      // final response = await ApiServices.instance.postData(
      //   endPoint: ApiEndPoints.login ,
      //    body: payload,
      //     headers:{'Content-Type': 'application/json'} );

      if (response['success'] == true || response['success'] == "true") {
       debugPrint("\n Signup successful: ${response['message']} \n");

      debugPrint("\n  Signup successful: ${response['message']} \n ");
      state = state.copyWith(
        isLoading: false,
        message: response['message'],
        success: true,
      );
      } else {
        state = state.copyWith(
          isLoading: false,
          error: response['message'] ?? 'Signup failed',
          success: false,
        );
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
        success: false,
      );
      Fluttertoast.showToast(
        msg: "Sign Up failed: $e",
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      throw Exception('\nSign up failed: $e\n');
    }
  }
}