import 'package:car_wash/src/feature/service_booking_screens/riverpod/service_booking_screens_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final serviceBookingRiverpod = StateNotifierProvider<ServiceBookingRiverpod, ServiceBookingState>(
(ref)=>ServiceBookingRiverpod()
);



class ServiceBookingRiverpod extends StateNotifier<ServiceBookingState>{
  ServiceBookingRiverpod() : super(ServiceBookingState());

  //ServiceTime selectedService = ServiceTime.instantService;

  void onSelectServiceTime({required ServiceTime selectedService}){
    if(selectedService == state.selectedServiceTime) return;
    state = state.copyWith(selectedServiceTime : selectedService);
  }

  void onSelectServiceType({required ServiceType selectedServiceType}){
    if(selectedServiceType == state.selectedServiceType) return;
    state = state.copyWith(selectedServiceType : selectedServiceType);
  }


  void onConfirmServiceTime(){}
}