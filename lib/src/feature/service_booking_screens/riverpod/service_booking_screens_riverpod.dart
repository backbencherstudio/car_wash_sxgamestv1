import 'package:car_wash/src/feature/service_booking_screens/riverpod/service_booking_screens_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final serviceBookingRiverpod = StateNotifierProvider<ServiceBookingRiverpod, ServiceBookingState>(
(ref)=>ServiceBookingRiverpod()
);



class ServiceBookingRiverpod extends StateNotifier<ServiceBookingState>{
  ServiceBookingRiverpod() : super(ServiceBookingState());


  void onSelectServiceTimeType({required ServiceTime selectedService}){
    if(selectedService == state.selectedServiceTimeType) return;
    state = state.copyWith(selectedServiceTimeType : selectedService);
  }

  void onSelectServiceType({required ServiceType selectedServiceType}){
    if(selectedServiceType == state.selectedServiceType) return;
    state = state.copyWith(selectedServiceType : selectedServiceType);
  }

  void onSelectLocationDetectType({required LocationDetectType locationDetectType}) {
    if(locationDetectType == state.locationDetectType) return;
    state = state.copyWith(locationDetectType : locationDetectType);
  }


  void pickedDate({required DateTime pickedDate,}){
    state = state.copyWith(
      pickedDate: pickedDate,
    );
  }

  void pickedTime({  required TimeOfDay pickedTime}){
    state = state.copyWith(
      pickedTime: pickedTime,
    );
  }


}