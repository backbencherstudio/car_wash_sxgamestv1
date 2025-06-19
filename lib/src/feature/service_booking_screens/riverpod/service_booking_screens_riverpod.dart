import 'dart:convert';
import 'dart:math';

import 'package:car_wash/core/services/api_services/api_endpoints.dart';
import 'package:car_wash/core/services/api_services/api_services.dart';
import 'package:car_wash/src/feature/auth_screens/model/user_model.dart';
import 'package:car_wash/src/feature/auth_screens/view/signin_screens/Riverpod/login_provider.dart';
import 'package:car_wash/src/feature/service_booking_screens/model/service_booking_model.dart';
import 'package:car_wash/src/feature/service_booking_screens/riverpod/service_booking_screens_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

import '../../../../core/routes/route_name.dart';
import '../../../../core/services/payment_services/stripe_services.dart';
import '../../google_map_screen/riverpod/google_map_riverpod.dart';
import '../../google_map_screen/riverpod/google_map_state.dart';
import '../view/widgets/extra_payment_bottom_sheet.dart';

final serviceBookingRiverpod =
    StateNotifierProvider<ServiceBookingRiverpod, ServiceBookingState>((ref) {
      final googleMapState = ref.watch(gMapRiverpod);
      final userModel = ref.watch(loginProvider).userModel;
      final userToken = ref.watch(loginProvider).userToken;
      return ServiceBookingRiverpod(
        googleMapState: googleMapState,
        userToken: userToken!,
        userModel: userModel!,
      );
    });

class ServiceBookingRiverpod extends StateNotifier<ServiceBookingState> {
  final GoogleMapState googleMapState;
  final UserModel userModel;
  final String userToken;

  ServiceBookingRiverpod({
    required this.googleMapState,
    required this.userModel,
    required this.userToken,
  }) : super(ServiceBookingState());

  void onSelectServiceTimeType({required ServiceTime selectedService}) {
   // if (selectedService == state.selectedServiceTimeType) return;
    state = state.copyWith(selectedServiceTimeType: selectedService);
  }

  void onSelectServiceType({required ServiceType selectedServiceType}) {
  //  if (selectedServiceType == state.selectedServiceType) return;
    state = state.copyWith(selectedServiceType: selectedServiceType);
  }

  void onSelectLocationDetectType({
    required LocationDetectType locationDetectType,
  }) {
    if (locationDetectType == state.locationDetectType) return;
    state = state.copyWith(locationDetectType: locationDetectType);
  }

  void onPickedDate({required DateTime pickedDate}) {
    state = state.copyWith(pickedDate: pickedDate);
  }

  void onPickedTime({required TimeOfDay pickedTime}) {
    state = state.copyWith(pickedTime: pickedTime);
  }

  Future<void> onContinueToBooking({
    required BuildContext context,
    required TabController tabController,
    required Function() onAutoDetectLocation,
  }) async
  {
    debugPrint("\ncontinue button pressed, service time type : ${state.selectedServiceTimeType.toString()}\n");
    state = state.copyWith(isContinueButtonLoading: true);
    DateTime? pickedDate;
    TimeOfDay? picked;

    /// If user select "Schedule Service then show date picker and time picker
    /// Default picked date is today
    /// after picked date and time, store it in service booking state's variable
    if (tabController.index == 0 &&
        state.selectedServiceTimeType == ServiceTime.scheduledService)
    {
      /// Date picker
      pickedDate = await showDatePicker(
        initialDate: DateTime.now(),
        context: context,
        firstDate: DateTime(DateTime.now().year - 1),
        lastDate: DateTime(DateTime.now().year + 11),
      );
      debugPrint("\npicked date : $pickedDate\n");

      /// Time picker
      picked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (_, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              textTheme: Theme.of(context).textTheme.copyWith(
                bodySmall: TextStyle(color: Colors.transparent),
              ),
            ),
            child: child!,
          );
        },
      );
      debugPrint("\npicked time : $picked\n");

      /// Storing picked date and time
      if (pickedDate != null && picked != null) {
        onPickedDate(pickedDate: pickedDate);
        onPickedTime(pickedTime: picked);
      }
    }
    else if (tabController.index == 0 &&
        state.selectedServiceTimeType == ServiceTime.instantService) {
      await showPaymentBottomSheet(context: context);
    }

    debugPrint("\n${state.selectedServiceTimeType.toString()}\n");
    if (tabController.index == 0 &&
        state.selectedServiceTimeType == ServiceTime.instantService) {
      state = state.copyWith(isContinueButtonLoading: false);

      if (state.paymentId != null && state.paymentId != 'null') {
        debugPrint("\n animating to next tab, payment id : ${state.paymentId}\n");
        tabController.animateTo(1);
      }

      return;
    }
    else if ((state.selectedServiceTimeType ==
            ServiceTime.scheduledService) &&
        (pickedDate != null && picked != null) && (tabController.index == 0)) {
      tabController.animateTo(1);
      state = state.copyWith(isContinueButtonLoading: false);
      return;
    }
    else{
      state = state.copyWith(isContinueButtonLoading: false);
    }
    debugPrint("\n${state.selectedServiceTimeType.toString()}\n");

    /// If Tab index is the last one, and location detection type is selected to auto
    /// then just call the google Map Notifier auto detect location method
    /// Else navigate to the google map screen
    if (tabController.index + 1 == tabController.length) {
      /// Automatically detecting location
      if (state.locationDetectType == LocationDetectType.auto) {
        state = state.copyWith(isContinueButtonLoading: true);

        if (googleMapState.autoDetectLocation == null) {
          debugPrint("\nDetecting Location automatically.\n");
          await onAutoDetectLocation();
        }
        else {
          debugPrint("\nLocation is already detected\n");
          debugPrint("\n${state.selectedServiceTimeType.toString()}\n");
          state = state.copyWith(
            isContinueButtonLoading: false,
            serviceBookingModel: ServiceBookingModel(
              serviceType: 'car_wash',
              serviceTiming:
                  state.selectedServiceTimeType == ServiceTime.instantService
                      ? 'instant'
                      : 'scheduled',
              scheduleDate:
                  pickedDate != null
                      ? DateFormat('yyyy-MM-dd').format(pickedDate)
                      : DateFormat('yyyy-MM-dd').format(DateTime.now()),
              scheduleTime:
                  picked != null
                      ? DateFormat('hh:mm').format(picked as DateTime)
                      : DateFormat('hh:mm').format(DateTime.now()),
              location: googleMapState.autoDetectLocation,
            ),
          );

          context.pushReplacement(
            RouteName.confirmBookingScreen,
            extra: state.serviceBookingModel,
          );
        }
      }
      else {
        debugPrint("\nDetecting Location manually.\n");
        state = state.copyWith(isContinueButtonLoading: false);
        if (googleMapState.userAddress == null) {
          /// Navigate to the google map screen
          context.push(RouteName.googleMapScreen);
        } else {
          state = state.copyWith(
            serviceBookingModel: ServiceBookingModel(
              serviceType: 'car_wash',
              serviceTiming:
              state.selectedServiceTimeType == ServiceTime.instantService
                  ? 'instant'
                  : 'scheduled',
              scheduleDate:
              pickedDate != null
                  ? DateFormat('yyyy-MM-dd').format(pickedDate)
                  : DateFormat('yyyy-MM-dd').format(DateTime.now()),
              scheduleTime:
              picked != null
                  ? DateFormat('hh:mm').format(picked as DateTime)
                  : DateFormat('hh:mm').format(DateTime.now()),
              location: googleMapState.userAddress,
            ),
          );
          debugPrint("\nLocation is already selected\n${ state.selectedServiceTimeType == ServiceTime.instantService
              ? 'instant'
              : 'scheduled'}\n");
          context.pushReplacement(
            RouteName.confirmBookingScreen,
            extra: state.serviceBookingModel,
          );
        }
      }
    }
    debugPrint("\ncontinue button end, service time type : ${state.selectedServiceTimeType.toString()}\n");
    /// Checking and assuring if the service time is selected to schedule service
    /// the picked date and time is not  null

    // state = state.copyWith(isContinueButtonLoading:  false);
  }

  /// payment method
  Future<String?> onExtraPayment() async {
    try {
      debugPrint(
        "\nPayment Method is called. Payment processing is starting...\n",
      );
      state = state.copyWith(isPaymentProcessing: true);

      final String? paymentMethodId = await StripeServices.instance
          .createPaymentMethod(email: userModel.email);

      if (paymentMethodId != null) {
        final body = {
          "email": userModel.email,
          "userId": userModel.id,
          "paymentMethodId": paymentMethodId.toString(),
          "amount": 20,
          "currency": "usd",
        };
        debugPrint("\nbody : $body\n");
        final header = {
          'Authorization': 'Bearer $userToken',
          'Content-Type': 'application/json',
        };

        final response = await ApiServices.instance.postData(
          endPoint: ApiEndPoints.extraPayment,
          body: body,
          headers: header,
        );
        state = state.copyWith(
          isPaymentProcessing: false,
          paymentId: paymentMethodId,
        );
        debugPrint("\nPayment response : $response\n");
        return paymentMethodId;
      } else {
        state = state.copyWith(isPaymentProcessing: false);
        return paymentMethodId;
      }
    } catch (e) {
      state = state.copyWith(isPaymentProcessing: false);
      Fluttertoast.showToast(
        msg: "Failed, Please try again!",
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      throw Exception(
        '\nFailed to complete payment on Extra payment for instant service\nError: $e\n',
      );
    }
  }

  /// clear booking data
  void clearBookingData() {
    state = state.copyWith(
      pickedDate: null,
      pickedTime: null,
      selectedServiceTimeType: ServiceTime.instantService,
      selectedServiceType: ServiceType.carWash,
      locationDetectType: LocationDetectType.auto,
      isContinueButtonLoading: false,
      isPaymentProcessing: false,
      paymentId: "null",
    );
  }


  /// Call this API to confirm the order
  Future<bool> confirmOrder() async {
    try {
      state = state.copyWith(isContinueButtonLoading: true);
      final body = state.serviceBookingModel!.toJson();
      final headers = {
        "Authorization": "bearer $userToken",
        'Content-Type': 'application/json',
      };
      final response = await ApiServices.instance.postData(
        endPoint:
            state.selectedServiceTimeType == ServiceTime.instantService
                ? ApiEndPoints.instantServiceBook
                : ApiEndPoints.scheduledServiceBook,
        body: body,
        headers: headers,
      );
      if (response['success'] == true || response['success'] == 'true') {
        clearBookingData();
        Fluttertoast.showToast(
          msg: "Order Confirmed",
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );
        return true;
      } else {
        Fluttertoast.showToast(
          msg: "Order Confirmation Failed",
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
        return false;
      }
    } catch (error) {
      throw Exception('Error while confirming order : $error');
    } finally {
      state = state.copyWith(isContinueButtonLoading: false);
    }
  }
}
