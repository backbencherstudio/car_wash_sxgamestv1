import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';


@JsonSerializable()
class UserModel {
  final String id;
  String? name;
  final String email;
  String? avatar;
  String? address;
  String? phone_number;
  final String? type;
  final String? gender;
  final String? date_of_birth;
  String? created_at;
  List<SubscriptionModel>? subscriptions;
  UserModel({
    required this.id,
    this.name,
    required this.email,
    this.avatar,
    this.address,
    this.phone_number,
    this.type,
    this.gender,
    this.date_of_birth,
    this.created_at,
    this.subscriptions,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class SubscriptionModel {
  final String? id;
  final String? stripe_subscription_id;
  final String? status;
  final bool? is_active;
  final String? current_period_start;
  final String? current_period_end;
  final bool? cancel_at_period_end;
  final SubscriptionPlanModel? plan;
  SubscriptionModel({
    this.id,
    this.stripe_subscription_id,
    this.status,
    this.is_active,
    this.current_period_start,
    this.current_period_end,
    this.cancel_at_period_end,
    this.plan
});

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) => _$SubscriptionModelFromJson(json);
  Map<String, dynamic> toJson() => _$SubscriptionModelToJson(this);

}


@JsonSerializable()
class SubscriptionPlanModel{
  final String? name;
  final String? price;
  final String? currency;
  final String? interval;

  SubscriptionPlanModel({
    this.name,
    this.price,
    this.currency,
    this.interval,
});

  factory SubscriptionPlanModel.fromJson(Map<String, dynamic> json) => _$SubscriptionPlanModelFromJson(json);
  Map<String, dynamic> toJson() => _$SubscriptionPlanModelToJson(this);

}
