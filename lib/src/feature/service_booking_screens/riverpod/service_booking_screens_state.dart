
enum ServiceTime{instantService, scheduledService}
enum ServiceType{carWash, wheelFixing}

class ServiceBookingState{

  ServiceTime selectedServiceTime;
  ServiceType selectedServiceType;
  ServiceBookingState({this.selectedServiceTime = ServiceTime.instantService, this.selectedServiceType = ServiceType.carWash});

  ServiceBookingState copyWith({ ServiceTime? selectedServiceTime, ServiceType? selectedServiceType}){
    return ServiceBookingState(selectedServiceTime: selectedServiceTime ?? this.selectedServiceTime,
    selectedServiceType: selectedServiceType ?? this.selectedServiceType,
    );
  }
}