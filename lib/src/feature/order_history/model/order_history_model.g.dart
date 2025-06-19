// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderHistoryModel _$OrderHistoryModelFromJson(Map<String, dynamic> json) =>
    OrderHistoryModel(
      id: json['id'] as String,
      service_type: json['service_type'] as String,
      service_timing: json['service_timing'] as String,
      location: json['location'] as String,
      schedule_date: json['schedule_date'] as String,
      schedule_time: json['schedule_time'] as String,
      schedule_datetime: json['schedule_datetime'] as String,
      status: json['status'] as String,
      created_at: json['created_at'] as String,
      review:
          json['review'] == null
              ? null
              : Review.fromJson(json['review'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderHistoryModelToJson(OrderHistoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'service_type': instance.service_type,
      'service_timing': instance.service_timing,
      'location': instance.location,
      'schedule_date': instance.schedule_date,
      'schedule_time': instance.schedule_time,
      'schedule_datetime': instance.schedule_datetime,
      'status': instance.status,
      'created_at': instance.created_at,
      'review': instance.review,
    };

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
  id: json['id'] as String,
  created_at: json['created_at'] as String,
  description: json['description'] as String,
  rating: (json['rating'] as num).toInt(),
);

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
  'id': instance.id,
  'rating': instance.rating,
  'description': instance.description,
  'created_at': instance.created_at,
};
