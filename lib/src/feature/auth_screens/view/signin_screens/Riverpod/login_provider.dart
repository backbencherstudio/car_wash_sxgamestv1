import 'package:car_wash/core/services/api_services/api_endpoints.dart';
import 'package:car_wash/core/services/api_services/api_services.dart';
import 'package:car_wash/core/services/local_storage_services/secure_storage_service.dart';
import 'package:car_wash/src/feature/auth_screens/model/user_model.dart';
import 'package:car_wash/src/feature/auth_screens/view/signin_screens/model/loginState_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../../../core/routes/route_name.dart';
import '../../../../../../core/services/payment_services/stripe_services.dart';

final loginProvider = StateNotifierProvider<LoginNotifier, LoginStateModel>((
  ref,
) {
  return LoginNotifier();
});

class LoginNotifier extends StateNotifier<LoginStateModel> {
  LoginNotifier() : super(LoginStateModel());

  Future<String?> login({
    required BuildContext context,
    required String email,
    required String password,
  }) async
  {
    state = state.copyWith(isLoading: true);

    try {
      final payload = {"email": email, "password": password};

      final response = await ApiServices.instance.postData(
        endPoint: ApiEndPoints.login,
        body: payload,
        headers: {'Content-Type': 'application/json'},
      );

      final success = response['success'].toString().toLowerCase() == 'true';

      if (success) {
        final token = response['authorization']?['token'];
        final userJson = response['data'];

        if (token != null) {
          await SecureAuthTokenStorageService.saveAuthToken(token);
        }

        state = state.copyWith(
          isLoading: false,
          userToken: token,
          userModel: UserModel.fromJson(userJson),
        );

        debugPrint("Login successful. User ID: ${state.userModel?.id}");

        if (state.userModel!.subscriptions != null) {
          debugPrint(
            "\nis subscribed : ${state.userModel!.subscriptions?[0].is_active.toString()}\n",
          );
          if (state.userModel!.subscriptions!.isNotEmpty &&
              state.userModel!.subscriptions![0].is_active == true) {
            return RouteName.homeScreen;
          } else {
            return RouteName.paymentSlectionFormScreen;
          }
        } else {
          debugPrint(
            "\nis subscribed : ${state.userModel!.subscriptions?[0].is_active.toString()}\n",
          );
          return RouteName.paymentSlectionFormScreen;
        }
      } else {
        _handleError(response['message'] ?? 'Login failed');
        return null;
      }
    } catch (e) {
      _handleError('Login exception: ${e.toString()}');
      return null;
    }
  }

  void _handleError(String message) {
    state = state.copyWith(isLoading: false);
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }

  Future<void> updateUserModel() async {
    try {
      final response = await ApiServices.instance.getData(
        endPoint: ApiEndPoints.updateUserData,
        headers: {"Authorization": "Bearer ${state.userToken}"},
      );
      if (response['success'] == true ||
          response['success'].toString().toLowerCase() == 'true') {
        state = state.copyWith(userModel: UserModel.fromJson(response['data']));
        debugPrint("\nupdated data : ${response['data']}\n");
        debugPrint("\nuser id : ${state.userToken}\n");
      } else {
        throw Exception('Failed to updated user model.\nResponse: $response');
      }
    } catch (error) {
      throw Exception('Error while updating user model : $error');
    }
  }

  void updateUserToken(String token) {
    state = state.copyWith(userToken: token);
  }

  Future<bool?> makePayment() async {
    try{
      state = state.copyWith(isLoading: true);
      final String? paymentMethodId = await StripeServices.instance.createPaymentMethod(email: state.userModel!.email);
      debugPrint("\nmaking payment for email : ${state.userModel?.email}\nuser id : ${state.userModel?.id}\n");
      final body = {
        "email":state.userModel?.email ?? "",
        "userId":state.userModel?.id ?? "",
        "paymentMethodId":paymentMethodId
      };
      final response = await ApiServices.instance.postData(endPoint: ApiEndPoints.makePayment, body: body, headers: {
        "Content-Type":"application/json"
      });
      debugPrint("\npayment response : $response\n");
      state = state.copyWith(isLoading: false);
      if(response["success"] == true || response["success"].toString().toLowerCase() == 'true'){
        return true;
      }
      else{
        return false;
      }
    }catch(error){
      state = state.copyWith(isLoading: false);
      throw Exception("Error while making payment : $error");
    }
  }
}
