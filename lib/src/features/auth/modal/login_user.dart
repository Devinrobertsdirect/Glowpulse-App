import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_user.freezed.dart';
part 'login_user.g.dart';

@freezed
abstract  class LoginUser with _$LoginUser {
  const factory LoginUser({
    required int id,
    required String documentId,
    required String username,
    required String email,
    required String provider,
    required bool confirmed,
    required bool blocked,
    required DateTime createdAt,
    required DateTime updatedAt,
    required DateTime publishedAt,
    required String fullname,
    required bool approved,
  }) = _LoginUser;

  factory LoginUser.fromJson(Map<String, dynamic> json) => _$LoginUserFromJson(json);
}
