// ignore_for_file: file_names

class SignupState {
  final bool isLoading;
  final String? message;
  final String? error;
    final bool success;

  SignupState({this.isLoading = false, this.message, this.error, this.success = false});

  SignupState copyWith({bool? isLoading, String? message, String? error, bool? success,
}) {
    return SignupState(
      isLoading: isLoading ?? this.isLoading,
      message: message ?? this.message,
      error: error ?? this.error,
      success: success ?? this.success,

    );
  }
}
