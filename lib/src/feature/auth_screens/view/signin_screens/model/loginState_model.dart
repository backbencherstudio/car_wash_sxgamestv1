class LoginStateModel {

final bool isLoading;
  final String? message;
  final String? error;
  final bool success;

LoginStateModel({this.isLoading = false, this.message, this.error, this.success = false});

LoginStateModel copyWith({bool? isLoading, String? message, String? error, bool? success,
}) {
    return LoginStateModel(
      isLoading: isLoading ?? this.isLoading,
      message: message ?? this.message,
      error: error ?? this.error,
      success: success ?? this.success,

    );
  }
}







