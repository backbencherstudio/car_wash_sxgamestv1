class LoginstateModel {

final bool isLoading;
  final String? message;
  final String? error;
    final bool success;

  LoginstateModel({this.isLoading = false, this.message, this.error, this.success = false});

  LoginstateModel copyWith({bool? isLoading, String? message, String? error, bool? success,
}) {
    return LoginstateModel(
      isLoading: isLoading ?? this.isLoading,
      message: message ?? this.message,
      error: error ?? this.error,
      success: success ?? this.success,

    );
  }
}







