// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trade_show.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TradeShow {

 String get id; String get name; String get location; String get boothNumber; String get hall; DateTime get startDate; DateTime get endDate; String get product; String get status;// 'upcoming', 'active', 'completed'
 String? get description; String? get notes; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of TradeShow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TradeShowCopyWith<TradeShow> get copyWith => _$TradeShowCopyWithImpl<TradeShow>(this as TradeShow, _$identity);

  /// Serializes this TradeShow to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TradeShow&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.location, location) || other.location == location)&&(identical(other.boothNumber, boothNumber) || other.boothNumber == boothNumber)&&(identical(other.hall, hall) || other.hall == hall)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.product, product) || other.product == product)&&(identical(other.status, status) || other.status == status)&&(identical(other.description, description) || other.description == description)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,location,boothNumber,hall,startDate,endDate,product,status,description,notes,createdAt,updatedAt);

@override
String toString() {
  return 'TradeShow(id: $id, name: $name, location: $location, boothNumber: $boothNumber, hall: $hall, startDate: $startDate, endDate: $endDate, product: $product, status: $status, description: $description, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TradeShowCopyWith<$Res>  {
  factory $TradeShowCopyWith(TradeShow value, $Res Function(TradeShow) _then) = _$TradeShowCopyWithImpl;
@useResult
$Res call({
 String id, String name, String location, String boothNumber, String hall, DateTime startDate, DateTime endDate, String product, String status, String? description, String? notes, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$TradeShowCopyWithImpl<$Res>
    implements $TradeShowCopyWith<$Res> {
  _$TradeShowCopyWithImpl(this._self, this._then);

  final TradeShow _self;
  final $Res Function(TradeShow) _then;

/// Create a copy of TradeShow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? location = null,Object? boothNumber = null,Object? hall = null,Object? startDate = null,Object? endDate = null,Object? product = null,Object? status = null,Object? description = freezed,Object? notes = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,boothNumber: null == boothNumber ? _self.boothNumber : boothNumber // ignore: cast_nullable_to_non_nullable
as String,hall: null == hall ? _self.hall : hall // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _TradeShow implements TradeShow {
  const _TradeShow({required this.id, required this.name, required this.location, required this.boothNumber, required this.hall, required this.startDate, required this.endDate, required this.product, required this.status, this.description, this.notes, required this.createdAt, required this.updatedAt});
  factory _TradeShow.fromJson(Map<String, dynamic> json) => _$TradeShowFromJson(json);

@override final  String id;
@override final  String name;
@override final  String location;
@override final  String boothNumber;
@override final  String hall;
@override final  DateTime startDate;
@override final  DateTime endDate;
@override final  String product;
@override final  String status;
// 'upcoming', 'active', 'completed'
@override final  String? description;
@override final  String? notes;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of TradeShow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TradeShowCopyWith<_TradeShow> get copyWith => __$TradeShowCopyWithImpl<_TradeShow>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TradeShowToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TradeShow&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.location, location) || other.location == location)&&(identical(other.boothNumber, boothNumber) || other.boothNumber == boothNumber)&&(identical(other.hall, hall) || other.hall == hall)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.product, product) || other.product == product)&&(identical(other.status, status) || other.status == status)&&(identical(other.description, description) || other.description == description)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,location,boothNumber,hall,startDate,endDate,product,status,description,notes,createdAt,updatedAt);

@override
String toString() {
  return 'TradeShow(id: $id, name: $name, location: $location, boothNumber: $boothNumber, hall: $hall, startDate: $startDate, endDate: $endDate, product: $product, status: $status, description: $description, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TradeShowCopyWith<$Res> implements $TradeShowCopyWith<$Res> {
  factory _$TradeShowCopyWith(_TradeShow value, $Res Function(_TradeShow) _then) = __$TradeShowCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String location, String boothNumber, String hall, DateTime startDate, DateTime endDate, String product, String status, String? description, String? notes, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$TradeShowCopyWithImpl<$Res>
    implements _$TradeShowCopyWith<$Res> {
  __$TradeShowCopyWithImpl(this._self, this._then);

  final _TradeShow _self;
  final $Res Function(_TradeShow) _then;

/// Create a copy of TradeShow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? location = null,Object? boothNumber = null,Object? hall = null,Object? startDate = null,Object? endDate = null,Object? product = null,Object? status = null,Object? description = freezed,Object? notes = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_TradeShow(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,boothNumber: null == boothNumber ? _self.boothNumber : boothNumber // ignore: cast_nullable_to_non_nullable
as String,hall: null == hall ? _self.hall : hall // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$TradeShowBooking {

 String get id; String get tradeShowId; String get userId; String get boothNumber; String get hall; DateTime get startDate; DateTime get endDate; String get product; String get status;// 'pending', 'confirmed', 'cancelled'
 String? get specialRequirements; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of TradeShowBooking
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TradeShowBookingCopyWith<TradeShowBooking> get copyWith => _$TradeShowBookingCopyWithImpl<TradeShowBooking>(this as TradeShowBooking, _$identity);

  /// Serializes this TradeShowBooking to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TradeShowBooking&&(identical(other.id, id) || other.id == id)&&(identical(other.tradeShowId, tradeShowId) || other.tradeShowId == tradeShowId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.boothNumber, boothNumber) || other.boothNumber == boothNumber)&&(identical(other.hall, hall) || other.hall == hall)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.product, product) || other.product == product)&&(identical(other.status, status) || other.status == status)&&(identical(other.specialRequirements, specialRequirements) || other.specialRequirements == specialRequirements)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tradeShowId,userId,boothNumber,hall,startDate,endDate,product,status,specialRequirements,createdAt,updatedAt);

@override
String toString() {
  return 'TradeShowBooking(id: $id, tradeShowId: $tradeShowId, userId: $userId, boothNumber: $boothNumber, hall: $hall, startDate: $startDate, endDate: $endDate, product: $product, status: $status, specialRequirements: $specialRequirements, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TradeShowBookingCopyWith<$Res>  {
  factory $TradeShowBookingCopyWith(TradeShowBooking value, $Res Function(TradeShowBooking) _then) = _$TradeShowBookingCopyWithImpl;
@useResult
$Res call({
 String id, String tradeShowId, String userId, String boothNumber, String hall, DateTime startDate, DateTime endDate, String product, String status, String? specialRequirements, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$TradeShowBookingCopyWithImpl<$Res>
    implements $TradeShowBookingCopyWith<$Res> {
  _$TradeShowBookingCopyWithImpl(this._self, this._then);

  final TradeShowBooking _self;
  final $Res Function(TradeShowBooking) _then;

/// Create a copy of TradeShowBooking
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tradeShowId = null,Object? userId = null,Object? boothNumber = null,Object? hall = null,Object? startDate = null,Object? endDate = null,Object? product = null,Object? status = null,Object? specialRequirements = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tradeShowId: null == tradeShowId ? _self.tradeShowId : tradeShowId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,boothNumber: null == boothNumber ? _self.boothNumber : boothNumber // ignore: cast_nullable_to_non_nullable
as String,hall: null == hall ? _self.hall : hall // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,specialRequirements: freezed == specialRequirements ? _self.specialRequirements : specialRequirements // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _TradeShowBooking implements TradeShowBooking {
  const _TradeShowBooking({required this.id, required this.tradeShowId, required this.userId, required this.boothNumber, required this.hall, required this.startDate, required this.endDate, required this.product, required this.status, this.specialRequirements, required this.createdAt, required this.updatedAt});
  factory _TradeShowBooking.fromJson(Map<String, dynamic> json) => _$TradeShowBookingFromJson(json);

@override final  String id;
@override final  String tradeShowId;
@override final  String userId;
@override final  String boothNumber;
@override final  String hall;
@override final  DateTime startDate;
@override final  DateTime endDate;
@override final  String product;
@override final  String status;
// 'pending', 'confirmed', 'cancelled'
@override final  String? specialRequirements;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of TradeShowBooking
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TradeShowBookingCopyWith<_TradeShowBooking> get copyWith => __$TradeShowBookingCopyWithImpl<_TradeShowBooking>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TradeShowBookingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TradeShowBooking&&(identical(other.id, id) || other.id == id)&&(identical(other.tradeShowId, tradeShowId) || other.tradeShowId == tradeShowId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.boothNumber, boothNumber) || other.boothNumber == boothNumber)&&(identical(other.hall, hall) || other.hall == hall)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.product, product) || other.product == product)&&(identical(other.status, status) || other.status == status)&&(identical(other.specialRequirements, specialRequirements) || other.specialRequirements == specialRequirements)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tradeShowId,userId,boothNumber,hall,startDate,endDate,product,status,specialRequirements,createdAt,updatedAt);

@override
String toString() {
  return 'TradeShowBooking(id: $id, tradeShowId: $tradeShowId, userId: $userId, boothNumber: $boothNumber, hall: $hall, startDate: $startDate, endDate: $endDate, product: $product, status: $status, specialRequirements: $specialRequirements, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TradeShowBookingCopyWith<$Res> implements $TradeShowBookingCopyWith<$Res> {
  factory _$TradeShowBookingCopyWith(_TradeShowBooking value, $Res Function(_TradeShowBooking) _then) = __$TradeShowBookingCopyWithImpl;
@override @useResult
$Res call({
 String id, String tradeShowId, String userId, String boothNumber, String hall, DateTime startDate, DateTime endDate, String product, String status, String? specialRequirements, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$TradeShowBookingCopyWithImpl<$Res>
    implements _$TradeShowBookingCopyWith<$Res> {
  __$TradeShowBookingCopyWithImpl(this._self, this._then);

  final _TradeShowBooking _self;
  final $Res Function(_TradeShowBooking) _then;

/// Create a copy of TradeShowBooking
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tradeShowId = null,Object? userId = null,Object? boothNumber = null,Object? hall = null,Object? startDate = null,Object? endDate = null,Object? product = null,Object? status = null,Object? specialRequirements = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_TradeShowBooking(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tradeShowId: null == tradeShowId ? _self.tradeShowId : tradeShowId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,boothNumber: null == boothNumber ? _self.boothNumber : boothNumber // ignore: cast_nullable_to_non_nullable
as String,hall: null == hall ? _self.hall : hall // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,specialRequirements: freezed == specialRequirements ? _self.specialRequirements : specialRequirements // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
