import 'package:car_wash/core/services/api_services/api_endpoints.dart';
import 'package:car_wash/core/services/api_services/api_services.dart';
import 'package:car_wash/core/services/location_services/location_services.dart';
import 'package:car_wash/src/feature/auth_screens/model/user_model.dart';
import 'package:car_wash/src/feature/auth_screens/view/signin_screens/Riverpod/login_provider.dart';
import 'package:car_wash/src/feature/service_booking_screens/model/service_booking_model.dart';
import 'package:car_wash/src/feature/service_booking_screens/riverpod/service_booking_screens_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
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
    state = state.copyWith(selectedServiceTimeType: selectedService);
  }

  void onSelectServiceType({required ServiceType selectedServiceType}) {
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

  /// select service time
  Future<bool?> onSelectServiceTime(BuildContext context) async {
    /// Extra payment for instant service
    if (state.selectedServiceTimeType == ServiceTime.instantService) {
      await showPaymentBottomSheet(context: context);
      if (state.paymentId != null && state.paymentId != 'null') {
        return true;
      } else {
        return false;
      }
    }
    /// ====================================== ///
    /// selecting schedule for schedule service
    else {
      /// Date picker
      final DateTime? pickedDate = await showDatePicker(
        initialDate: DateTime.now(),
        context: context,
        firstDate: DateTime(DateTime.now().year - 1),
        lastDate: DateTime(DateTime.now().year + 11),
      );
      debugPrint("\npicked date : $pickedDate\n");

      /// Time picker
      final TimeOfDay? timeOfDay = await showTimePicker(
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
      if (pickedDate != null && timeOfDay != null) {
        state = state.copyWith(pickedDate: pickedDate, pickedTime: timeOfDay);
        return true;
      } else {
        return false;
      }
    }
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

  /// detect location
  Future<bool?> onDetectLocation(BuildContext context) async {
    state = state.copyWith(isContinueButtonLoading: true);

    debugPrint("\nDetecting Location automatically.\n");
    final String? serviceLocation =
        await LocationService.instance.getCurrentAddress();
    if (serviceLocation != null) {
      state = state.copyWith(
        isContinueButtonLoading: false,
        serviceAutoDetectedLocation: serviceLocation,
      );
      return true;
    } else {
      return false;
    }
  }

  /// detect location manually
  Future<void> onSelectManuallyLocation(String serviceLocation) async {
    state = state.copyWith(serviceManuallyDetectedLocation: serviceLocation);
  }

  /// create service booking model
  ServiceBookingModel createServiceBookingModel() {
    final now = DateTime.now();
    final serviceBookingModel = ServiceBookingModel(
      scheduleDate: DateFormat('yyyy-MM-dd').format(state.pickedDate ?? now),
      scheduleTime:
          state.pickedTime != null
              ? DateFormat('HH:MM').format(
                DateTime(
                  now.year,
                  now.month,
                  now.day,
                  state.pickedTime!.hour,
                  state.pickedTime!.minute,
                ),
              )
              : DateFormat('hh:mm a').format(DateTime.now()),
      location:
          state.locationDetectType == LocationDetectType.auto
              ? state.serviceAutoDetectedLocation
              : state.serviceManuallyDetectedLocation,
      serviceTiming:
          state.selectedServiceTimeType == ServiceTime.instantService
              ? 'instant'
              : 'scheduled',
      serviceType: handleServiceType(state.selectedServiceType),
    );
    state = state.copyWith(serviceBookingModel: serviceBookingModel);
    return serviceBookingModel;
  }

  /// clear booking data
  void clearServiceBookingState() {
    state = ServiceBookingState(
      pickedDate: null,
      pickedTime: null,
      selectedServiceTimeType: ServiceTime.instantService,
      selectedServiceType: ServiceType.carWash,
      locationDetectType: LocationDetectType.auto,
      isContinueButtonLoading: false,
      isPaymentProcessing: false,
      paymentId: null,
      serviceBookingModel: null,
      serviceAutoDetectedLocation: null,
      serviceManuallyDetectedLocation: null,
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
        clearServiceBookingState();
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

  String handleServiceType(ServiceType serviceType) {
    if (serviceType == ServiceType.carWash) {
      return 'car-wash';
    } else if (serviceType == ServiceType.wheelFixing) {
      return 'wheel-fixing';
    } else {
      return 'store';
    }
  }
}
