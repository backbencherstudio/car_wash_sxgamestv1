class ForgetOtpState {
  final bool isLoading;
  final String? message;
  final String? error;
    final bool success;

  ForgetOtpState({this.isLoading = false, this.message, this.error, this.success = false});

  ForgetOtpState copyWith({bool? isLoading, String? message, String? error, bool? success,
}) {
    return ForgetOtpState(
      isLoading: isLoading ?? this.isLoading,
      message: message ?? this.message,
      error: error ?? this.error,
      success: success ?? this.success,

    );
  }
}