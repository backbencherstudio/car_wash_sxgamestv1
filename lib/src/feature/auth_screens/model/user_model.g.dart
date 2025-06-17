// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: json['id'] as String,
  name: json['name'] as String?,
  email: json['email'] as String,
  avatar: json['avatar'] as String?,
  address: json['address'] as String?,
  phone_number: json['phone_number'] as String?,
  type: json['type'] as String?,
  gender: json['gender'] as String?,
  date_of_birth: json['date_of_birth'] as String?,
  created_at: json['created_at'] as String?,
  subscription:
      (json['subscription'] as List<dynamic>?)
          ?.map((e) => SubscriptionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'avatar': instance.avatar,
  'address': instance.address,
  'phone_number': instance.phone_number,
  'type': instance.type,
  'gender': instance.gender,
  'date_of_birth': instance.date_of_birth,
  'created_at': instance.created_at,
  'subscription': instance.subscription,
};

SubscriptionModel _$SubscriptionModelFromJson(Map<String, dynamic> json) =>
    SubscriptionModel(
      id: json['id'] as String?,
      stripe_subscription_id: json['stripe_subscription_id'] as String?,
      status: json['status'] as String?,
      is_active: json['is_active'] as bool?,
      current_period_start: json['current_period_start'] as String?,
      current_period_end: json['current_period_end'] as String?,
      cancel_at_period_end: json['cancel_at_period_end'] as bool?,
      plan:
          json['plan'] == null
              ? null
              : SubscriptionPlanModel.fromJson(
                json['plan'] as Map<String, dynamic>,
              ),
    );

Map<String, dynamic> _$SubscriptionModelToJson(SubscriptionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'stripe_subscription_id': instance.stripe_subscription_id,
      'status': instance.status,
      'is_active': instance.is_active,
      'current_period_start': instance.current_period_start,
      'current_period_end': instance.current_period_end,
      'cancel_at_period_end': instance.cancel_at_period_end,
      'plan': instance.plan,
    };

SubscriptionPlanModel _$SubscriptionPlanModelFromJson(
  Map<String, dynamic> json,
) => SubscriptionPlanModel(
  name: json['name'] as String?,
  price: json['price'] as String?,
  currency: json['currency'] as String?,
  interval: json['interval'] as String?,
);

Map<String, dynamic> _$SubscriptionPlanModelToJson(
  SubscriptionPlanModel instance,
) => <String, dynamic>{
  'name': instance.name,
  'price': instance.price,
  'currency': instance.currency,
  'interval': instance.interval,
};
