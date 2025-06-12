class ServiceBookingModel {
  String? serviceType;
  String? serviceTiming;
  String? location;
  String? scheduleDate;
  String? scheduleTime;

  ServiceBookingModel(
      {this.serviceType,
        this.serviceTiming,
        this.location,
        this.scheduleDate,
        this.scheduleTime});

  ServiceBookingModel.fromJson(Map<String, dynamic> json) {
    serviceType = json['service_type'];
    serviceTiming = json['service_timing'];
    location = json['location'];
    scheduleDate = json['schedule_date'];
    scheduleTime = json['schedule_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_type'] = this.serviceType;
    data['service_timing'] = this.serviceTiming;
    data['location'] = this.location;
    data['schedule_date'] = this.scheduleDate;
    data['schedule_time'] = this.scheduleTime;
    return data;
  }
}