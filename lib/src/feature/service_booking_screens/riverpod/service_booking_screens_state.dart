import 'package:flutter/material.dart';

enum ServiceTime { instantService, scheduledService }

enum ServiceType { carWash, wheelFixing }

enum LocationDetectType { auto, manual }

class ServiceBookingState {
  ServiceTime selectedServiceTimeType;
  ServiceType selectedServiceType;
  LocationDetectType locationDetectType;
  DateTime? pickedDate;
  TimeOfDay? pickedTime;
  bool isContinueButtonLoading;
  bool isPaymentProcessing;
  String? paymentId;

  ServiceBookingState({
    this.pickedDate,
    this.pickedTime,
    this.selectedServiceTimeType = ServiceTime.instantService,
    this.selectedServiceType = ServiceType.carWash,
    this.locationDetectType = LocationDetectType.auto,
    this.isContinueButtonLoading = false,
    this.isPaymentProcessing = false,
    this.paymentId,
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
  }) {
    return ServiceBookingState(
      pickedDate: pickedDate ?? this.pickedDate,
      pickedTime: pickedTime ?? this.pickedTime,
      selectedServiceTimeType:
          selectedServiceTimeType ?? this.selectedServiceTimeType,
      selectedServiceType: selectedServiceType ?? this.selectedServiceType,
      locationDetectType: locationDetectType ?? this.locationDetectType,
      isContinueButtonLoading: isContinueButtonLoading ?? this.isContinueButtonLoading,
      isPaymentProcessing: isPaymentProcessing ?? this.isPaymentProcessing,
      paymentId: paymentId ?? this.paymentId,
    );
  }
}
