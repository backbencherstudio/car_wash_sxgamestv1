class ApiEndPoints {
  static const String baseUrl = 'https://car-wash-backend.signalsmind.com';
  static const String bookInstant = 'api/service-booking/instant';
  static const String bookScheduled = 'api/service-booking/scheduled';
  static const String blogList = 'api/blog';
  static const String blogById = '';
  static const String registration = 'api/auth/register';
  static const String emailOtpVerify = 'api/auth/verify-email';
  static const String resendOtp = 'api/auth/resend-verification-email';
  static const String forgetPass = 'api/auth/forgot-password';
  static const String forgetOtp = 'api/auth/verify-email';
  static const String extraPayment = 'api/payment/stripe/instant-payment';
  static const String login = 'api/auth/login';
  static const String updateUserData = 'api/auth/me';
  static const String makePayment = 'api/payment/stripe/subscribe';

  static const String orderHistory = 'api/order-history';

  static const String clientReview = 'api/order-history/reviews';
  static const String instantServiceBook = 'api/service-booking/instant';
  static const String scheduledServiceBook = 'api/service-booking/scheduled';
}