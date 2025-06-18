import 'package:car_wash/src/feature/auth_screens/model/user_model.dart';

class LoginStateModel {
  final bool isLoading;
  // final String? message;
  // final String? error;
  // final bool success;
  final UserModel? userModel;
  final String? userToken;

  LoginStateModel({
    this.isLoading = false,
    // this.message,
    // this.error,
    // this.success = false,
    this.userModel,
    this.userToken,
  });

  LoginStateModel copyWith({
    bool? isLoading,
    // String? message,
    // String? error,
    // bool? success,
    UserModel? userModel,
    String? userToken,
  }) {
    return LoginStateModel(
      isLoading: isLoading ?? this.isLoading,
      // message: message ?? this.message,
      // error: error ?? this.error,
      // success: success ?? this.success,
      userModel: userModel ?? this.userModel,
      userToken: userToken ?? this.userToken
    );
  }
}
