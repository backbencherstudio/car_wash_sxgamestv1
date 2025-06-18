// ignore_for_file: file_names

class SignupState {
  final bool isLoading;
  final String? message;
  final String? error;

  SignupState({this.isLoading = false, this.message, this.error});

  SignupState copyWith({bool? isLoading, String? message, String? error}) {
    return SignupState(
      isLoading: isLoading ?? this.isLoading,
      message: message ?? this.message,
      error: error ?? this.error,
    );
  }
}
