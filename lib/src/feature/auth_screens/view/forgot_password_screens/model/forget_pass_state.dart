class ForgetEmailOtpStateModel {
  final bool isLoading;
  final String? message;
  final String? error;
    final bool success;

  ForgetEmailOtpStateModel({this.isLoading = false, this.message, this.error, this.success = false});

  ForgetEmailOtpStateModel copyWith({bool? isLoading, String? message, String? error, bool? success,
}) {
    return ForgetEmailOtpStateModel(
      isLoading: isLoading ?? this.isLoading,
      message: message ?? this.message,
      error: error ?? this.error,
      success: success ?? this.success,

    );
  }
}