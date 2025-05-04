
enum ServiceTime{instantService, scheduledService}
enum ServiceType{carWash, wheelFixing}
enum LocationDetectType{auto, manual}

class ServiceBookingState{

  ServiceTime selectedServiceTime;
  ServiceType selectedServiceType;
  LocationDetectType locationDetectType;
  ServiceBookingState({
    this.selectedServiceTime = ServiceTime.instantService,
    this.selectedServiceType = ServiceType.carWash,
    this.locationDetectType = LocationDetectType.auto,

  });

  ServiceBookingState copyWith({
    ServiceTime? selectedServiceTime,
    ServiceType? selectedServiceType,
    LocationDetectType? locationDetectType
  }){
    return ServiceBookingState(selectedServiceTime: selectedServiceTime ?? this.selectedServiceTime,
    selectedServiceType: selectedServiceType ?? this.selectedServiceType,
      locationDetectType: locationDetectType ?? this.locationDetectType,
    );
  }
}