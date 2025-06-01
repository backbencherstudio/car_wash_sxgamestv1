import 'package:car_wash/core/routes/route_name.dart';
import 'package:car_wash/src/feature/auth_screens/view/forgot_password_screens/view/email_verify_screen.dart';
import 'package:car_wash/src/feature/auth_screens/view/forgot_password_screens/view/otp_verify_screen.dart';
import 'package:car_wash/src/feature/auth_screens/view/forgot_password_screens/view/successfully_reset_password_screen.dart';
import 'package:car_wash/src/feature/auth_screens/view/payment/view/payment_form.dart';
import 'package:car_wash/src/feature/auth_screens/view/payment/view/select_option.dart';
import 'package:car_wash/src/feature/auth_screens/view/signin_screens/view/sign_in_screen.dart';
import 'package:car_wash/src/feature/auth_screens/view/signup_screens/view/sign_up_screen.dart';
import 'package:car_wash/src/feature/auth_screens/view/signup_screens/view/signup_otp_screen.dart';
import 'package:car_wash/src/feature/auth_screens/view/signup_screens/view/successfully_registered_screen.dart';
import 'package:car_wash/src/feature/blog_list_screen/view/blog_list_screen.dart';
import 'package:car_wash/src/feature/google_map_screen/view/google_map_screen.dart';
import 'package:car_wash/src/feature/notification_screens/view/notification_screen.dart';
import 'package:car_wash/src/feature/onboarding_screens/view/onboarding_screen.dart';
import 'package:car_wash/src/feature/profile_screen/view/profile_screen.dart';
import 'package:car_wash/src/feature/service_booking_screens/view/confirm_booking_screen.dart';
import 'package:car_wash/src/feature/service_booking_screens/view/service_booking_screen.dart';
import 'package:car_wash/src/feature/splash_screen/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:car_wash/src/feature/profile_Create_screen/view/profile_screen.dart';
import '../../src/feature/blog_details_screen/view/blog_details_screen.dart';
import '../../src/feature/home_screen/view/home_screen.dart';
import '../../src/feature/order_history/view/order_history.dart';
import 'build_page_with_transition.dart';

class RouteConfig {
  GoRouter goRouter = GoRouter(
    initialLocation: RouteName.splashScreen,

    routes: [
      GoRoute(
        name: RouteName.splashScreen,
        path: RouteName.splashScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: SplashScreen());
        },
      ),
      GoRoute(
        name: RouteName.profileCreateScreen,
        path: RouteName.profileCreateScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: ProfileCreateScreen());
        },
      ),

      GoRoute(
        name: RouteName.onboardingScreen,
        path: RouteName.onboardingScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            child: OnboardingScreen(),
          );
        },
      ),
      GoRoute(
        name: RouteName.signInScreen,
        path: RouteName.signInScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            child: SignInScreen(),
          );
        },
      ),



      GoRoute(
        name: RouteName.emailVerifyScreen,
        path: RouteName.emailVerifyScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: EmailVerifyScreen());
        },
      ),

      GoRoute(
        name: RouteName.orderHistoryScreen,
        path: RouteName.orderHistoryScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            child: OrderHistoryScreen(),
          );
        },
      ),
      GoRoute(
        name: RouteName.otpVerifyScreen,
        path: RouteName.otpVerifyScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: OTPVerifyScreen());
        },
      ),
      GoRoute(
        name: RouteName.successfullyResetPasswordScreen,
        path: RouteName.successfullyResetPasswordScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: SuccessfullyResetPasswordScreen());
        },
      ),
      GoRoute(
        name: RouteName.signUpScreen,
        path: RouteName.signUpScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            child: SignUpScreen(),
          );
        },
      ),
      GoRoute(
        name: RouteName.signUpOTPScreen,
        path: RouteName.signUpOTPScreen,
        pageBuilder: (context, state) {
          final email =
              state.uri.queryParameters['email']; 
          return MaterialPage(
            child: SignupOtpScreen(
              email: email,
            ),
          );
        },
      ),
      GoRoute(
        name: RouteName.successfullyRegisteredScreen,
        path: RouteName.successfullyRegisteredScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: SuccessfullyRegisteredScreen());
        },
      ),
      // GoRoute(
      //    name: RouteName.crateOrJoinScreen,
      //    path: RouteName.crateOrJoinScreen,
      //    pageBuilder: (context, state) {
      //     return const MaterialPage(child: CreateOrJoinScreen());
      //    }),
      GoRoute(
        name: RouteName.homeScreen,
        path: RouteName.homeScreen,
        pageBuilder: (context, state) {
          return MaterialPage(child: HomeScreen());
        },
      ),

      // GoRoute(
      //     name: RouteName.parentsScreen,
      //     path: RouteName.parentsScreen,
      //     pageBuilder: (context, state) {
      //       return buildPageWithTransition(context: context, state: state, child: ParentScreen());
      //     }),
      //  GoRoute(
      // name: RouteName.serviceDetailsScreen,
      // path: RouteName.serviceDetailsScreen,
      // pageBuilder: (context, state) {
      //   return  MaterialPage(child: ServiceDetailsScreen());
      // }),
      GoRoute(
        name: RouteName.googleMapScreen,
        path: RouteName.googleMapScreen,
        pageBuilder: (context, state) {
          return MaterialPage(child: GoogleMapScreen());
        },
      ),
      GoRoute(
        name: RouteName.paymentSlectionScreen,
        path: RouteName.paymentSlectionScreen,
        pageBuilder: (context, state) {
          return MaterialPage(child: PaymentSlectionScreen());
        },
      ),
      GoRoute(
        name: RouteName.paymentSlectionFormScreen,
        path: RouteName.paymentSlectionFormScreen,
        pageBuilder: (context, state) {
          return MaterialPage(child: PaymentSelectionFormScreen());
        },
      ),
      GoRoute(
        name: RouteName.serviceBookingScreen,
        path: RouteName.serviceBookingScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            child: ServiceBookingScreen(),
          );
          //MaterialPage(child: ServiceBookingScreen());
        },
      ),

      GoRoute(
        name: RouteName.profileScreen,
        path: RouteName.profileScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            child: ProfileScreen(),
          );
          //MaterialPage(child: ServiceBookingScreen());
        },
      ),

      GoRoute(
        name: RouteName.blogListScreen,
        path: RouteName.blogListScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            child: BlogListScreen(),
          );
        },
      ),

      GoRoute(
        name: RouteName.blogDetailsScreen,
        path: RouteName.blogDetailsScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            child: BlogDetailsScreen(),
          );
        },
      ),

      GoRoute(
        name: RouteName.notificationScreen,
        path: RouteName.notificationScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            child: NotificationScreen(),
          );
        },
      ),

      GoRoute(
        name: RouteName.confirmBookingScreen,
        path: RouteName.confirmBookingScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            child: ConfirmServiceBookingScreen(),
          );
        },
      ),
    ],
  );
}
