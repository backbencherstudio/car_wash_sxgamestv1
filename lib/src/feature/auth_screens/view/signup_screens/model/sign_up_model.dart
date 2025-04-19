class SignUpModel {
  final bool isPasswordVisible;
  final bool isConfirmPasswordVisible;
  final bool isLoading;

  const SignUpModel({
    this.isPasswordVisible = true,
    this.isConfirmPasswordVisible = false,
    this.isLoading = false,
  });

  SignUpModel copyWith({
    bool? isPasswordVisible,
    bool? isConfirmPasswordVisible,
    bool? isLoading,
  }) {
    return SignUpModel(
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isConfirmPasswordVisible: isConfirmPasswordVisible ?? this.isConfirmPasswordVisible,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
