// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientReviewModel _$ClientReviewModelFromJson(Map<String, dynamic> json) =>
    ClientReviewModel(
      id: json['id'] as String,
      rating: (json['rating'] as num).toInt(),
      description: json['description'] as String,
      created_at: json['created_at'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      booking: Booking.fromJson(json['booking'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ClientReviewModelToJson(ClientReviewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rating': instance.rating,
      'description': instance.description,
      'created_at': instance.created_at,
      'user': instance.user,
      'booking': instance.booking,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: json['id'] as String,
  name: json['name'] as String,
  email: json['email'] as String,
  avatar: json['avatar'] as String?,
  phone_number: json['phone_number'] as String?,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'avatar': instance.avatar,
  'phone_number': instance.phone_number,
};

Booking _$BookingFromJson(Map<String, dynamic> json) => Booking(
  id: json['id'] as String,
  service_type: json['service_type'] as String,
  service_timing: json['service_timing'] as String,
  location: json['location'] as String,
  schedule_date: json['schedule_date'] as String,
  schedule_time: json['schedule_time'] as String,
  status: json['status'] as String,
);

Map<String, dynamic> _$BookingToJson(Booking instance) => <String, dynamic>{
  'id': instance.id,
  'service_type': instance.service_type,
  'service_timing': instance.service_timing,
  'location': instance.location,
  'schedule_date': instance.schedule_date,
  'schedule_time': instance.schedule_time,
  'status': instance.status,
};
