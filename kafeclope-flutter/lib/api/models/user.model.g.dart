// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel()
  ..id = json['id'] as int?
  ..email = json['email'] as String?
  ..name = json['name'] as String?
  ..phone = json['phone'] as String?
  ..ndle = json['ndle'] as String?
  ..picture = json['picture'] as String?
  ..userType = json['user_type'] as String?
  ..createdAt = json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String)
  ..updatedAt = json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'phone': instance.phone,
      'ndle': instance.ndle,
      'picture': instance.picture,
      'user_type': instance.userType,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
