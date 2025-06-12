import 'package:flutter/material.dart';

import '../model/service_booking_model.dart';

enum ServiceTime { instantService, scheduledService }

enum ServiceType { carWash, wheelFixing }

enum LocationDetectType { auto, manual }

class ServiceBookingState {
  ServiceTime selectedServiceTimeType;
  ServiceType selectedServiceType;
  LocationDetectType locationDetectType;
  bool isContinueButtonLoading;
  bool isPaymentProcessing;
  String? paymentId;
  ServiceBookingModel? serviceBookingModel;

  ServiceBookingState({
    this.selectedServiceTimeType = ServiceTime.instantService,
    this.selectedServiceType = ServiceType.carWash,
    this.locationDetectType = LocationDetectType.auto,
    this.isContinueButtonLoading = false,
    this.isPaymentProcessing = false,
    this.paymentId,
    this.serviceBookingModel,
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
  }) {
    return ServiceBookingState(
      selectedServiceTimeType:
          selectedServiceTimeType ?? this.selectedServiceTimeType,
      selectedServiceType: selectedServiceType ?? this.selectedServiceType,
      locationDetectType: locationDetectType ?? this.locationDetectType,
      isContinueButtonLoading: isContinueButtonLoading ?? this.isContinueButtonLoading,
      isPaymentProcessing: isPaymentProcessing ?? this.isPaymentProcessing,
      paymentId: paymentId ?? this.paymentId,
      serviceBookingModel: serviceBookingModel ?? this.serviceBookingModel,
    );
  }
}
