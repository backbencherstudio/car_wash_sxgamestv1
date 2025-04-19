class SignInModel {
  final bool isPasswordVisible;
  final bool isRemember;
  final bool isLoading;

  const SignInModel({
    this.isPasswordVisible = true,
    this.isRemember = false,
    this.isLoading = false,
  });

  SignInModel copyWith({
    bool? isPasswordVisible,
    bool? isRemember,
    bool? isLoading,
  }) {
    return SignInModel(
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isRemember: isRemember ?? this.isRemember,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
