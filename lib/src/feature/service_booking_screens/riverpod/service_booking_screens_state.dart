import 'package:flutter/material.dart';

import '../model/service_booking_model.dart';

enum ServiceTime { instantService, scheduledService }

enum ServiceType { carWash, wheelFixing, store }

enum LocationDetectType { auto, manual }

class ServiceBookingState {
  ServiceTime selectedServiceTimeType;
  ServiceType selectedServiceType;
  LocationDetectType locationDetectType;
  bool isContinueButtonLoading;
  bool isPaymentProcessing;
  String? paymentId;
  DateTime? pickedDate;
  TimeOfDay? pickedTime;
  String? serviceAutoDetectedLocation;
  String? serviceManuallyDetectedLocation;
  ServiceBookingModel? serviceBookingModel;

  ServiceBookingState({
    this.pickedDate,
    this.pickedTime,
    this.selectedServiceTimeType = ServiceTime.instantService,
    this.selectedServiceType = ServiceType.carWash,
    this.locationDetectType = LocationDetectType.auto,
    this.isContinueButtonLoading = false,
    this.isPaymentProcessing = false,
    this.paymentId,
    this.serviceBookingModel,
    this.serviceAutoDetectedLocation,
    this.serviceManuallyDetectedLocation,
  });

  ServiceBookingState copyWith({
    DateTime? pickedDate,
    TimeOfDay? pickedTime,
    ServiceTime? selectedServiceTimeType,
    ServiceType? selectedServiceType,
    LocationDetectType? locationDetectType,
    bool? isContinueButtonLoading,
    bool? isPaymentProcessing,
    String? paymentId,
    ServiceBookingModel? serviceBookingModel,
    String? serviceAutoDetectedLocation,
    String? serviceManuallyDetectedLocation,
  }) {
    return ServiceBookingState(
      pickedDate: pickedDate ?? this.pickedDate,
      pickedTime: pickedTime ?? this.pickedTime,
      selectedServiceTimeType:
          selectedServiceTimeType ?? this.selectedServiceTimeType,
      selectedServiceType: selectedServiceType ?? this.selectedServiceType,
      locationDetectType: locationDetectType ?? this.locationDetectType,
      isContinueButtonLoading:
          isContinueButtonLoading ?? this.isContinueButtonLoading,
      isPaymentProcessing: isPaymentProcessing ?? this.isPaymentProcessing,
      paymentId: paymentId ?? this.paymentId,
      serviceBookingModel: serviceBookingModel ?? this.serviceBookingModel,
      serviceAutoDetectedLocation:
          serviceAutoDetectedLocation ?? this.serviceAutoDetectedLocation,
      serviceManuallyDetectedLocation:
          serviceManuallyDetectedLocation ??
          this.serviceManuallyDetectedLocation,
    );
  }
}
