

import 'package:car_wash/core/services/api_services/api_endpoints.dart';
import 'package:car_wash/core/services/api_services/api_services.dart';
import 'package:car_wash/src/feature/auth_screens/view/forgot_password_screens/model/forget_pass_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

final resendForgetOtpProvider = StateNotifierProvider< ResendForgetOtpNotifier,ForgetEmailOtpStateModel>(

  (ref){
    return ResendForgetOtpNotifier();
  }
);

class ResendForgetOtpNotifier extends StateNotifier<ForgetEmailOtpStateModel>{
  ResendForgetOtpNotifier():super(ForgetEmailOtpStateModel());

  Future<void> hitTheResend({
    required String email,
  })async{
      state = ForgetEmailOtpStateModel(isLoading: true);

      try {
        final payload = {
          	"email" : email

        };
        final response = await ApiServices.postData(
          endPoint: ApiEndPoints.forgetPass,
           body: payload,
            headers: {'Content-Type':'application/json' }
            );

            if(response['success']== true || response['success']== "true"){
              debugPrint("\n\n $response \n\n");
              state = ForgetEmailOtpStateModel(isLoading: false,
              message: response['message'],
              success: true,
              );
            }else{
               state = ForgetEmailOtpStateModel(
              isLoading: false,
              error: response['message'] ?? "error sending the code",
              success: true,
              );
            }
      } catch (e) {
        Fluttertoast.showToast(msg:"$e",
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      throw Exception('\nSign up failed: $e\n');
      }
  }
}