class EmailOtpStateModel {
  final bool isLoading;
  final String? message;
  final String? error;
    final bool success;

  EmailOtpStateModel({this.isLoading = false, this.message, this.error, this.success = false});

  EmailOtpStateModel copyWith({bool? isLoading, String? message, String? error, bool? success,
}) {
    return EmailOtpStateModel(
      isLoading: isLoading ?? this.isLoading,
      message: message ?? this.message,
      error: error ?? this.error,
      success: success ?? this.success,

    );
  }
}