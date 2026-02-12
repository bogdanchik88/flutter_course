// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  login: json['login'] as String,
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  birthday: json['birthday'] == null
      ? null
      : DateTime.parse(json['birthday'] as String),
  photo: json['photo'] as String?,
  users:
      (json['users'] as List<dynamic>?)
          ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'login': instance.login,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'birthday': instance.birthday?.toIso8601String(),
      'photo': instance.photo,
      'users': instance.users,
    };
