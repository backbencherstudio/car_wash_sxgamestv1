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
  String? subscription;
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
    this.subscription,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
