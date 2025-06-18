import 'package:car_wash/core/services/api_services/api_endpoints.dart';
import 'package:car_wash/core/services/api_services/api_services.dart';
import 'package:car_wash/src/feature/auth_screens/view/signup_screens/model/email_otp_state_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

final resendOtpProvider =
    StateNotifierProvider<ResendNotifier, EmailOtpStateModel>((ref) {
      return ResendNotifier();
    });

class ResendNotifier extends StateNotifier<EmailOtpStateModel> {
  ResendNotifier() : super(EmailOtpStateModel());

  Future<bool> hitTheResend({required String email}) async {
    state = state.copyWith(isLoading: true);

    try {
      final payload = {"email": email};
      final response = await ApiServices.instance.postData(
        endPoint: ApiEndPoints.resendOtp,
        body: payload,
        headers: {'Content-Type': 'application/json'},
      );

      if (response['success'] == true || response['success'] == "true") {
        debugPrint("$response \n");
        state = state.copyWith(isLoading: false);
        return true;
      } else {
        state = state.copyWith(isLoading: false);
        Fluttertoast.showToast(msg: "Failed to resend code, please try again!",backgroundColor: Colors.red, textColor: Colors.white);
        return false;
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "$e",
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      throw Exception('\nSign up failed: $e\n');
    }
  }
}
