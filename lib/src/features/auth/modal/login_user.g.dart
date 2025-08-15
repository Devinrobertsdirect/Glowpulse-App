// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginUser _$LoginUserFromJson(Map<String, dynamic> json) => _LoginUser(
  id: (json['id'] as num).toInt(),
  documentId: json['documentId'] as String,
  username: json['username'] as String,
  email: json['email'] as String,
  provider: json['provider'] as String,
  confirmed: json['confirmed'] as bool,
  blocked: json['blocked'] as bool,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  publishedAt: DateTime.parse(json['publishedAt'] as String),
  fullname: json['fullname'] as String,
  approved: json['approved'] as bool,
);

Map<String, dynamic> _$LoginUserToJson(_LoginUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'documentId': instance.documentId,
      'username': instance.username,
      'email': instance.email,
      'provider': instance.provider,
      'confirmed': instance.confirmed,
      'blocked': instance.blocked,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'publishedAt': instance.publishedAt.toIso8601String(),
      'fullname': instance.fullname,
      'approved': instance.approved,
    };
