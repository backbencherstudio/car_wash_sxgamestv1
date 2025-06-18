import 'package:car_wash/core/services/api_services/api_endpoints.dart';
import 'package:car_wash/core/services/api_services/api_services.dart';
import 'package:car_wash/src/feature/auth_screens/view/signup_screens/model/email_otp_state_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

final otpEmailverifyProvider =
    StateNotifierProvider<EmailOtpNotifier, EmailOtpStateModel>((ref) {
      return EmailOtpNotifier();
    });

class EmailOtpNotifier extends StateNotifier<EmailOtpStateModel> {
  EmailOtpNotifier() : super(EmailOtpStateModel());
  void resetError() {
    state = state.copyWith(error: null);
  }

  Future<bool> emailOtpVerify({
    required String email,
    required String otp,
  }) async {
    state = state.copyWith(isLoading: true);
    try {
      final payload = {"email": email, "token": otp};
      final response = await ApiServices.instance.postData(
        endPoint: ApiEndPoints.emailOtpVerify,
        body: payload,
        headers: {'Content-Type': 'application/json'},
      );
      state = state.copyWith(isLoading: false);
      if (response['success'] == true || response['success'] == 'true') {
       // state = state.copyWith(isLoading: false);
        return true;
      } else {
        Fluttertoast.showToast(
          msg: response['message'] ?? "otp verification failled",
          backgroundColor: Colors.red,
          textColor: Color(0xffffffff),
        );

      //  state = state.copyWith(isLoading: false);
        return false;
      }

    } catch (e) {
      state = state.copyWith(isLoading: false);
      Fluttertoast.showToast(
        msg: e.toString(),
        backgroundColor: Colors.red,
        textColor: Color(0xffffffff),
      );
      throw Exception(e);
    }
  }
}
