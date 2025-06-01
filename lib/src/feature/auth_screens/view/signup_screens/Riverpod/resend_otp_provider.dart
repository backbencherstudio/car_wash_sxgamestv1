

import 'package:car_wash/core/services/api_services/api_endpoints.dart';
import 'package:car_wash/core/services/api_services/api_services.dart';
import 'package:car_wash/src/feature/auth_screens/view/signup_screens/model/email_otp_state_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

final resendOtpProvider = StateNotifierProvider< ResendNotifier,EmailOtpStateModel>(

  (ref){
    return ResendNotifier();
  }
);

class ResendNotifier extends StateNotifier<EmailOtpStateModel>{
  ResendNotifier():super(EmailOtpStateModel());

  Future<void> hitTheResend({
    required String email,
  })async{
      state = EmailOtpStateModel(isLoading: true);

      try {
        final payload = {
          	"email" : email

        };
        final response = await ApiServices.instance.postData(
          endPoint: ApiEndPoints.resendOtp,
           body: payload,
            headers: {'Content-Type':'application/json' }
            );

            if(response['success']== true || response['success']== "true"){
              debugPrint("\n\n $response");
              state = EmailOtpStateModel(isLoading: false,
              message: response['message'],
              success: true,
              );
            }else{
               state = EmailOtpStateModel(
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