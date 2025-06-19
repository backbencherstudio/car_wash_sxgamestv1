import 'package:json_annotation/json_annotation.dart';

part 'order_history_model.g.dart';

@JsonSerializable()
class OrderHistoryModel {
  final String id;
  final String service_type;
  final String service_timing;
  final String location;
  final String schedule_date;
  final String schedule_time;
  final String schedule_datetime;
  final String status;
  final String created_at;
  final Review? review;

  OrderHistoryModel({
    required this.id,
    required this.service_type,
    required this.service_timing,
    required this.location,
    required this.schedule_date,
    required this.schedule_time,
    required this.schedule_datetime,
    required this.status,
    required this.created_at,
    this.review,
  });

  factory OrderHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderHistoryModelToJson(this);
}

@JsonSerializable()
class Review {
  final String id;
  final int rating;
  final String description;
  final String created_at;

  Review({
    required this.id,
    required this.created_at,
    required this.description,
    required this.rating,
  });

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}