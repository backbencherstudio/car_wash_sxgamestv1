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
  Future<void> emailOtpVerify({
    required String? email,
    required String? otp,
  }) async {
    state = EmailOtpStateModel(isLoading: true);
    try {
      final payload = {"email": email, "token": otp};
      final response = await ApiServices.postData(
        endPoint: ApiEndPoints.emailOtpVerify,
        body: payload,
        headers: {'Content-Type': 'application/json'},
      );
      if (response['success'] == true || response['success'] == 'true') {
        state = EmailOtpStateModel(
          isLoading: false,
          message: response['message'],
          success: true,
        );

      }else{
     state = EmailOtpStateModel(
          isLoading: false,
          error: response['message'] ?? "otp verification failled",
          success: false,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString(),
      backgroundColor: Colors.red,
      textColor: Color(0xffffffff),
      );
      throw Exception(e);
    }
  }
}
