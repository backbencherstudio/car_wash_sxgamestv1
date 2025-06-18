import 'package:json_annotation/json_annotation.dart';

part 'client_review_model.g.dart';

@JsonSerializable()
class ClientReviewModel {
  final String id;
  final int rating;
  final String description;
  final String created_at;
  final User user;
  final Booking booking;

  ClientReviewModel({
    required this.id,
    required this.rating,
    required this.description,
    required this.created_at,
    required this.user,
    required this.booking,
  });

  factory ClientReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ClientReviewModelFromJson(json);
  Map<String, dynamic> toJson() => _$ClientReviewModelToJson(this);
}

@JsonSerializable()
class User {
  final String id;
  final String name;
  final String email;
  final String? avatar;
  final String? phone_number;
  User({
    required this.id,
    required this.name,
    required this.email,
    this.avatar,
    this.phone_number,
  });
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Booking {
  final String id;
  final String service_type;
  final String service_timing;
  final String location;
  final String schedule_date;
  final String schedule_time;
  final String status;
  Booking({
    required this.id,
    required this.service_type,
    required this.service_timing,
    required this.location,
    required this.schedule_date,
    required this.schedule_time,
    required this.status,
  });

  factory Booking.fromJson(Map<String, dynamic> json) =>
      _$BookingFromJson(json);
  Map<String, dynamic> toJson() => _$BookingToJson(this);
}
