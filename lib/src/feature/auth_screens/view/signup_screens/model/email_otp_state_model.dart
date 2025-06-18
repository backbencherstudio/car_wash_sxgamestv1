class EmailOtpStateModel {
  final bool isLoading;
  final String? error;

  EmailOtpStateModel({this.isLoading = false, this.error,});

  EmailOtpStateModel copyWith({bool? isLoading, String? message, String? error, bool? success,
}) {
    return EmailOtpStateModel(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}