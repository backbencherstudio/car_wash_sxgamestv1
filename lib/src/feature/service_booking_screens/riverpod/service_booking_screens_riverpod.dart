import 'dart:convert';
import 'dart:math';

import 'package:car_wash/core/services/api_services/api_endpoints.dart';
import 'package:car_wash/core/services/api_services/api_services.dart';
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
      return ServiceBookingRiverpod(googleMapState);
    });

class ServiceBookingRiverpod extends StateNotifier<ServiceBookingState> {
  final GoogleMapState googleMapState;

  ServiceBookingRiverpod(this.googleMapState) : super(ServiceBookingState());

  void onSelectServiceTimeType({required ServiceTime selectedService}) {
    if (selectedService == state.selectedServiceTimeType) return;
    state = state.copyWith(selectedServiceTimeType: selectedService);
  }

  void onSelectServiceType({required ServiceType selectedServiceType}) {
    if (selectedServiceType == state.selectedServiceType) return;
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

  void onContinueToBooking({
    required BuildContext context,
    required TabController tabController,
    required Function onAutoDetectLocation,
  }) async {
    state = state.copyWith(isContinueButtonLoading: true);
    DateTime? pickedDate;
    TimeOfDay? picked;

    /// If user select "Schedule Service then show date picker and time picker
    /// Default picked date is today
    /// after picked date and time, store it in service booking state's variable
    if (tabController.index == 0 &&
        state.selectedServiceTimeType == ServiceTime.scheduledService) {
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
    } else if (tabController.index == 0 &&
        state.selectedServiceTimeType == ServiceTime.instantService) {
      await showPaymentBottomSheet(context: context);
    }

    if (tabController.index == 0 &&
        state.selectedServiceTimeType == ServiceTime.instantService) {
      state = state.copyWith(isContinueButtonLoading: false);
      if (state.paymentId != null) {
        tabController.animateTo(1);
      }

      return;
    } else if ((state.selectedServiceTimeType ==
            ServiceTime.scheduledService) &&
        (pickedDate != null && picked != null)) {
      tabController.animateTo(1);
      state = state.copyWith(isContinueButtonLoading: false);
      return;
    }

    /// If Tab index is the last one, and location detection type is selected to auto
    /// then just call the google Map Notifier auto detect location method
    /// Else navigate to the google map screen
    if (tabController.index + 1 == tabController.length) {
      /// Automatically detecting location
      if (state.locationDetectType == LocationDetectType.auto) {
        debugPrint("\nDetecting Location automatically.\n");
        if (googleMapState.autoDetectLocation == null) {
          await onAutoDetectLocation();
        } else {
          state = state.copyWith(isContinueButtonLoading: false);
          state = state.copyWith(
            serviceBookingModel: ServiceBookingModel(
              serviceType: 'car_wash',
              serviceTiming: 'instant',
              scheduleDate:
                  pickedDate != null
                      ? DateFormat('dd-MM-yyyy').format(pickedDate)
                      : DateFormat('dd-MM-yyyy').format(DateTime.now()),
              scheduleTime:
                  picked != null
                      ? DateFormat('hh:mm a').format(picked as DateTime)
                      : DateFormat('hh:mm a').format(DateTime.now()),
              location: googleMapState.autoDetectLocation,
            ),
          );
          debugPrint("\nLocation is already detected\n");
          context.pushReplacement(
            RouteName.confirmBookingScreen,
            extra: state.serviceBookingModel,
          );
        }
      } else {
        debugPrint("\nDetecting Location manually.\n");
        state = state.copyWith(isContinueButtonLoading: false);
        if (googleMapState.userAddress == null) {
          /// Navigate to the google map screen
          context.push(RouteName.googleMapScreen);
        } else {
          state = state.copyWith(
            serviceBookingModel: ServiceBookingModel(
              serviceType: 'car_wash',
              serviceTiming: 'instant',
              scheduleTime: null,
              scheduleDate: null,
              location: googleMapState.userAddress,
            ),
          );
          debugPrint("\nLocation is already selected\n");
          context.pushReplacement(
            RouteName.confirmBookingScreen,
            extra: state.serviceBookingModel,
          );
        }
      }
    }

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
      final String? paymentMethodId =
          await StripeServices.instance.createPaymentMethod();
      if (paymentMethodId != null) {
        debugPrint("\nPayment completed. Payment id : $paymentMethodId\n");
        final response = await ApiServices.instance.postData(
          endPoint: ApiEndPoints.extraPayment,
          body: {
            "email": "tanvirbdcallingnode@gmail.com",
            "userId": "cmbbzywb5000ojhy052i14fzm",
            "paymentMethodId": paymentMethodId.toString(),
            "amount": '20',
            "currency": "usd",
          },
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InRlc3RAZ21haWwuY29tIiwic3ViIjoiY21iYnp5d2I1MDAwb2poeTA1MmkxNGZ6bSIsImlhdCI6MTc0ODY4MTc3NSwiZXhwIjoxNzQ4NzY4MTc1fQ.2lI5kyS5MJFynWHWNKMsjj6cW3Yb-6v3p5YgOKkOifk',
          },
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
      paymentId: null,
    );
  }
}
