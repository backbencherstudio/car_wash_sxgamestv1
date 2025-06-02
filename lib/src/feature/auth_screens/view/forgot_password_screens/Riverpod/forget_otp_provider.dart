import 'package:car_wash/core/services/api_services/api_endpoints.dart';
import 'package:car_wash/core/services/api_services/api_services.dart';
import 'package:car_wash/src/feature/auth_screens/view/forgot_password_screens/model/forget_otp_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

final forgetOtpEmailverifyProvider =
    StateNotifierProvider<ForgetOtpNotifier, ForgetOtpState>((ref) {
      return ForgetOtpNotifier();
    });

class ForgetOtpNotifier extends StateNotifier<ForgetOtpState> {
  ForgetOtpNotifier() : super(ForgetOtpState());
 void resetError() {
    state = state.copyWith(error: null); 
  }
  Future<void> emailOtpVerify({
    required String? email,
    required String? otp,
  }) async {
    state = ForgetOtpState(isLoading: true);
    try {
      final payload = {"email": email, "token": otp};
      final response = await ApiServices.instance.postData(
        endPoint: ApiEndPoints.forgetOtp,
        body: payload,
        headers: {'Content-Type': 'application/json'},
      );
      if (response['success'] == true || response['success'] == 'true') {
        state = ForgetOtpState(
          isLoading: false,
          message: response['message'],
          success: true,
        );

      }else{
     state = ForgetOtpState(
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
