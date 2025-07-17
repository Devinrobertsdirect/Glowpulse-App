// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginUser {

 int get id; String get documentId; String get username; String get email; String get provider; bool get confirmed; bool get blocked; DateTime get createdAt; DateTime get updatedAt; DateTime get publishedAt; String get fullname; bool get approved;
/// Create a copy of LoginUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginUserCopyWith<LoginUser> get copyWith => _$LoginUserCopyWithImpl<LoginUser>(this as LoginUser, _$identity);

  /// Serializes this LoginUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginUser&&(identical(other.id, id) || other.id == id)&&(identical(other.documentId, documentId) || other.documentId == documentId)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.confirmed, confirmed) || other.confirmed == confirmed)&&(identical(other.blocked, blocked) || other.blocked == blocked)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.fullname, fullname) || other.fullname == fullname)&&(identical(other.approved, approved) || other.approved == approved));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,documentId,username,email,provider,confirmed,blocked,createdAt,updatedAt,publishedAt,fullname,approved);

@override
String toString() {
  return 'LoginUser(id: $id, documentId: $documentId, username: $username, email: $email, provider: $provider, confirmed: $confirmed, blocked: $blocked, createdAt: $createdAt, updatedAt: $updatedAt, publishedAt: $publishedAt, fullname: $fullname, approved: $approved)';
}


}

/// @nodoc
abstract mixin class $LoginUserCopyWith<$Res>  {
  factory $LoginUserCopyWith(LoginUser value, $Res Function(LoginUser) _then) = _$LoginUserCopyWithImpl;
@useResult
$Res call({
 int id, String documentId, String username, String email, String provider, bool confirmed, bool blocked, DateTime createdAt, DateTime updatedAt, DateTime publishedAt, String fullname, bool approved
});




}
/// @nodoc
class _$LoginUserCopyWithImpl<$Res>
    implements $LoginUserCopyWith<$Res> {
  _$LoginUserCopyWithImpl(this._self, this._then);

  final LoginUser _self;
  final $Res Function(LoginUser) _then;

/// Create a copy of LoginUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? documentId = null,Object? username = null,Object? email = null,Object? provider = null,Object? confirmed = null,Object? blocked = null,Object? createdAt = null,Object? updatedAt = null,Object? publishedAt = null,Object? fullname = null,Object? approved = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,documentId: null == documentId ? _self.documentId : documentId // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,confirmed: null == confirmed ? _self.confirmed : confirmed // ignore: cast_nullable_to_non_nullable
as bool,blocked: null == blocked ? _self.blocked : blocked // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,publishedAt: null == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime,fullname: null == fullname ? _self.fullname : fullname // ignore: cast_nullable_to_non_nullable
as String,approved: null == approved ? _self.approved : approved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _LoginUser implements LoginUser {
  const _LoginUser({required this.id, required this.documentId, required this.username, required this.email, required this.provider, required this.confirmed, required this.blocked, required this.createdAt, required this.updatedAt, required this.publishedAt, required this.fullname, required this.approved});
  factory _LoginUser.fromJson(Map<String, dynamic> json) => _$LoginUserFromJson(json);

@override final  int id;
@override final  String documentId;
@override final  String username;
@override final  String email;
@override final  String provider;
@override final  bool confirmed;
@override final  bool blocked;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  DateTime publishedAt;
@override final  String fullname;
@override final  bool approved;

/// Create a copy of LoginUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginUserCopyWith<_LoginUser> get copyWith => __$LoginUserCopyWithImpl<_LoginUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginUser&&(identical(other.id, id) || other.id == id)&&(identical(other.documentId, documentId) || other.documentId == documentId)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.confirmed, confirmed) || other.confirmed == confirmed)&&(identical(other.blocked, blocked) || other.blocked == blocked)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.fullname, fullname) || other.fullname == fullname)&&(identical(other.approved, approved) || other.approved == approved));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,documentId,username,email,provider,confirmed,blocked,createdAt,updatedAt,publishedAt,fullname,approved);

@override
String toString() {
  return 'LoginUser(id: $id, documentId: $documentId, username: $username, email: $email, provider: $provider, confirmed: $confirmed, blocked: $blocked, createdAt: $createdAt, updatedAt: $updatedAt, publishedAt: $publishedAt, fullname: $fullname, approved: $approved)';
}


}

/// @nodoc
abstract mixin class _$LoginUserCopyWith<$Res> implements $LoginUserCopyWith<$Res> {
  factory _$LoginUserCopyWith(_LoginUser value, $Res Function(_LoginUser) _then) = __$LoginUserCopyWithImpl;
@override @useResult
$Res call({
 int id, String documentId, String username, String email, String provider, bool confirmed, bool blocked, DateTime createdAt, DateTime updatedAt, DateTime publishedAt, String fullname, bool approved
});




}
/// @nodoc
class __$LoginUserCopyWithImpl<$Res>
    implements _$LoginUserCopyWith<$Res> {
  __$LoginUserCopyWithImpl(this._self, this._then);

  final _LoginUser _self;
  final $Res Function(_LoginUser) _then;

/// Create a copy of LoginUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? documentId = null,Object? username = null,Object? email = null,Object? provider = null,Object? confirmed = null,Object? blocked = null,Object? createdAt = null,Object? updatedAt = null,Object? publishedAt = null,Object? fullname = null,Object? approved = null,}) {
  return _then(_LoginUser(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,documentId: null == documentId ? _self.documentId : documentId // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,confirmed: null == confirmed ? _self.confirmed : confirmed // ignore: cast_nullable_to_non_nullable
as bool,blocked: null == blocked ? _self.blocked : blocked // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,publishedAt: null == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime,fullname: null == fullname ? _self.fullname : fullname // ignore: cast_nullable_to_non_nullable
as String,approved: null == approved ? _self.approved : approved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
