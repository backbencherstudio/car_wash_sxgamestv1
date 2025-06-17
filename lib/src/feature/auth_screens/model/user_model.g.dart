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
  subscription: json['subscription'] as String?,
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
