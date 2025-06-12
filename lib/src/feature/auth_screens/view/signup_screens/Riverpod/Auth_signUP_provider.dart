import 'package:car_wash/core/services/api_services/api_endpoints.dart';
import 'package:car_wash/core/services/api_services/api_services.dart';
import 'package:car_wash/src/feature/auth_screens/view/signup_screens/model/signup_State_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

final signUpControllerProvider =
    StateNotifierProvider<SignupController, SignupState>((ref) {
      return SignupController();
    });

class SignupController extends StateNotifier<SignupState> {
  SignupController() : super(SignupState());
  Future<void> signUp({
    required String email,
    required String password,
    String? name,
  }) async {
    state = SignupState(isLoading: true);
    try {
      final payload = {
        'email': email,
        'password': password,
        'name': name,
      };
      final response = await ApiServices.instance.postData(
        endPoint: ApiEndPoints.registration,
        body: payload,
        headers: {'Content-Type': 'application/json'},
      );
      if (response['success'] == true || response['success'] == "true") {
       debugPrint("\n Signup successful: ${response['message']} \n");

      debugPrint("\n  Signup successful: ${response['message']} \n ");
        state = SignupState(
          isLoading: false,
          message: response['message'],
          success: true,
        );
      } else {
        state = SignupState(
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
