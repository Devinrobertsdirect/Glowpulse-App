// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shipping_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShippingOrder {

 String get id; String get tradeShowId; String get userId; String get orderNumber; String get status;// 'pending', 'processing', 'shipped', 'delivered'
 String get shippingAddress; String get recipientName; String get recipientPhone; String get carrier;// 'FedEx', 'UPS', 'DHL', etc.
 String? get trackingNumber; DateTime get estimatedDelivery; DateTime get createdAt; DateTime get updatedAt; List<ShippingItem>? get items; String? get notes; double? get totalCost;
/// Create a copy of ShippingOrder
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShippingOrderCopyWith<ShippingOrder> get copyWith => _$ShippingOrderCopyWithImpl<ShippingOrder>(this as ShippingOrder, _$identity);

  /// Serializes this ShippingOrder to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShippingOrder&&(identical(other.id, id) || other.id == id)&&(identical(other.tradeShowId, tradeShowId) || other.tradeShowId == tradeShowId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.shippingAddress, shippingAddress) || other.shippingAddress == shippingAddress)&&(identical(other.recipientName, recipientName) || other.recipientName == recipientName)&&(identical(other.recipientPhone, recipientPhone) || other.recipientPhone == recipientPhone)&&(identical(other.carrier, carrier) || other.carrier == carrier)&&(identical(other.trackingNumber, trackingNumber) || other.trackingNumber == trackingNumber)&&(identical(other.estimatedDelivery, estimatedDelivery) || other.estimatedDelivery == estimatedDelivery)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.totalCost, totalCost) || other.totalCost == totalCost));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tradeShowId,userId,orderNumber,status,shippingAddress,recipientName,recipientPhone,carrier,trackingNumber,estimatedDelivery,createdAt,updatedAt,const DeepCollectionEquality().hash(items),notes,totalCost);

@override
String toString() {
  return 'ShippingOrder(id: $id, tradeShowId: $tradeShowId, userId: $userId, orderNumber: $orderNumber, status: $status, shippingAddress: $shippingAddress, recipientName: $recipientName, recipientPhone: $recipientPhone, carrier: $carrier, trackingNumber: $trackingNumber, estimatedDelivery: $estimatedDelivery, createdAt: $createdAt, updatedAt: $updatedAt, items: $items, notes: $notes, totalCost: $totalCost)';
}


}

/// @nodoc
abstract mixin class $ShippingOrderCopyWith<$Res>  {
  factory $ShippingOrderCopyWith(ShippingOrder value, $Res Function(ShippingOrder) _then) = _$ShippingOrderCopyWithImpl;
@useResult
$Res call({
 String id, String tradeShowId, String userId, String orderNumber, String status, String shippingAddress, String recipientName, String recipientPhone, String carrier, String? trackingNumber, DateTime estimatedDelivery, DateTime createdAt, DateTime updatedAt, List<ShippingItem>? items, String? notes, double? totalCost
});




}
/// @nodoc
class _$ShippingOrderCopyWithImpl<$Res>
    implements $ShippingOrderCopyWith<$Res> {
  _$ShippingOrderCopyWithImpl(this._self, this._then);

  final ShippingOrder _self;
  final $Res Function(ShippingOrder) _then;

/// Create a copy of ShippingOrder
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tradeShowId = null,Object? userId = null,Object? orderNumber = null,Object? status = null,Object? shippingAddress = null,Object? recipientName = null,Object? recipientPhone = null,Object? carrier = null,Object? trackingNumber = freezed,Object? estimatedDelivery = null,Object? createdAt = null,Object? updatedAt = null,Object? items = freezed,Object? notes = freezed,Object? totalCost = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tradeShowId: null == tradeShowId ? _self.tradeShowId : tradeShowId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,orderNumber: null == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,shippingAddress: null == shippingAddress ? _self.shippingAddress : shippingAddress // ignore: cast_nullable_to_non_nullable
as String,recipientName: null == recipientName ? _self.recipientName : recipientName // ignore: cast_nullable_to_non_nullable
as String,recipientPhone: null == recipientPhone ? _self.recipientPhone : recipientPhone // ignore: cast_nullable_to_non_nullable
as String,carrier: null == carrier ? _self.carrier : carrier // ignore: cast_nullable_to_non_nullable
as String,trackingNumber: freezed == trackingNumber ? _self.trackingNumber : trackingNumber // ignore: cast_nullable_to_non_nullable
as String?,estimatedDelivery: null == estimatedDelivery ? _self.estimatedDelivery : estimatedDelivery // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,items: freezed == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ShippingItem>?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,totalCost: freezed == totalCost ? _self.totalCost : totalCost // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ShippingOrder implements ShippingOrder {
  const _ShippingOrder({required this.id, required this.tradeShowId, required this.userId, required this.orderNumber, required this.status, required this.shippingAddress, required this.recipientName, required this.recipientPhone, required this.carrier, this.trackingNumber, required this.estimatedDelivery, required this.createdAt, required this.updatedAt, final  List<ShippingItem>? items, this.notes, this.totalCost}): _items = items;
  factory _ShippingOrder.fromJson(Map<String, dynamic> json) => _$ShippingOrderFromJson(json);

@override final  String id;
@override final  String tradeShowId;
@override final  String userId;
@override final  String orderNumber;
@override final  String status;
// 'pending', 'processing', 'shipped', 'delivered'
@override final  String shippingAddress;
@override final  String recipientName;
@override final  String recipientPhone;
@override final  String carrier;
// 'FedEx', 'UPS', 'DHL', etc.
@override final  String? trackingNumber;
@override final  DateTime estimatedDelivery;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
 final  List<ShippingItem>? _items;
@override List<ShippingItem>? get items {
  final value = _items;
  if (value == null) return null;
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? notes;
@override final  double? totalCost;

/// Create a copy of ShippingOrder
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShippingOrderCopyWith<_ShippingOrder> get copyWith => __$ShippingOrderCopyWithImpl<_ShippingOrder>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShippingOrderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShippingOrder&&(identical(other.id, id) || other.id == id)&&(identical(other.tradeShowId, tradeShowId) || other.tradeShowId == tradeShowId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.shippingAddress, shippingAddress) || other.shippingAddress == shippingAddress)&&(identical(other.recipientName, recipientName) || other.recipientName == recipientName)&&(identical(other.recipientPhone, recipientPhone) || other.recipientPhone == recipientPhone)&&(identical(other.carrier, carrier) || other.carrier == carrier)&&(identical(other.trackingNumber, trackingNumber) || other.trackingNumber == trackingNumber)&&(identical(other.estimatedDelivery, estimatedDelivery) || other.estimatedDelivery == estimatedDelivery)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.totalCost, totalCost) || other.totalCost == totalCost));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tradeShowId,userId,orderNumber,status,shippingAddress,recipientName,recipientPhone,carrier,trackingNumber,estimatedDelivery,createdAt,updatedAt,const DeepCollectionEquality().hash(_items),notes,totalCost);

@override
String toString() {
  return 'ShippingOrder(id: $id, tradeShowId: $tradeShowId, userId: $userId, orderNumber: $orderNumber, status: $status, shippingAddress: $shippingAddress, recipientName: $recipientName, recipientPhone: $recipientPhone, carrier: $carrier, trackingNumber: $trackingNumber, estimatedDelivery: $estimatedDelivery, createdAt: $createdAt, updatedAt: $updatedAt, items: $items, notes: $notes, totalCost: $totalCost)';
}


}

/// @nodoc
abstract mixin class _$ShippingOrderCopyWith<$Res> implements $ShippingOrderCopyWith<$Res> {
  factory _$ShippingOrderCopyWith(_ShippingOrder value, $Res Function(_ShippingOrder) _then) = __$ShippingOrderCopyWithImpl;
@override @useResult
$Res call({
 String id, String tradeShowId, String userId, String orderNumber, String status, String shippingAddress, String recipientName, String recipientPhone, String carrier, String? trackingNumber, DateTime estimatedDelivery, DateTime createdAt, DateTime updatedAt, List<ShippingItem>? items, String? notes, double? totalCost
});




}
/// @nodoc
class __$ShippingOrderCopyWithImpl<$Res>
    implements _$ShippingOrderCopyWith<$Res> {
  __$ShippingOrderCopyWithImpl(this._self, this._then);

  final _ShippingOrder _self;
  final $Res Function(_ShippingOrder) _then;

/// Create a copy of ShippingOrder
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tradeShowId = null,Object? userId = null,Object? orderNumber = null,Object? status = null,Object? shippingAddress = null,Object? recipientName = null,Object? recipientPhone = null,Object? carrier = null,Object? trackingNumber = freezed,Object? estimatedDelivery = null,Object? createdAt = null,Object? updatedAt = null,Object? items = freezed,Object? notes = freezed,Object? totalCost = freezed,}) {
  return _then(_ShippingOrder(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tradeShowId: null == tradeShowId ? _self.tradeShowId : tradeShowId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,orderNumber: null == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,shippingAddress: null == shippingAddress ? _self.shippingAddress : shippingAddress // ignore: cast_nullable_to_non_nullable
as String,recipientName: null == recipientName ? _self.recipientName : recipientName // ignore: cast_nullable_to_non_nullable
as String,recipientPhone: null == recipientPhone ? _self.recipientPhone : recipientPhone // ignore: cast_nullable_to_non_nullable
as String,carrier: null == carrier ? _self.carrier : carrier // ignore: cast_nullable_to_non_nullable
as String,trackingNumber: freezed == trackingNumber ? _self.trackingNumber : trackingNumber // ignore: cast_nullable_to_non_nullable
as String?,estimatedDelivery: null == estimatedDelivery ? _self.estimatedDelivery : estimatedDelivery // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,items: freezed == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ShippingItem>?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,totalCost: freezed == totalCost ? _self.totalCost : totalCost // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$ShippingItem {

 String get id; String get name; int get quantity; String get description; double get weight; String get dimensions; String? get sku;
/// Create a copy of ShippingItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShippingItemCopyWith<ShippingItem> get copyWith => _$ShippingItemCopyWithImpl<ShippingItem>(this as ShippingItem, _$identity);

  /// Serializes this ShippingItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShippingItem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.description, description) || other.description == description)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.dimensions, dimensions) || other.dimensions == dimensions)&&(identical(other.sku, sku) || other.sku == sku));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,quantity,description,weight,dimensions,sku);

@override
String toString() {
  return 'ShippingItem(id: $id, name: $name, quantity: $quantity, description: $description, weight: $weight, dimensions: $dimensions, sku: $sku)';
}


}

/// @nodoc
abstract mixin class $ShippingItemCopyWith<$Res>  {
  factory $ShippingItemCopyWith(ShippingItem value, $Res Function(ShippingItem) _then) = _$ShippingItemCopyWithImpl;
@useResult
$Res call({
 String id, String name, int quantity, String description, double weight, String dimensions, String? sku
});




}
/// @nodoc
class _$ShippingItemCopyWithImpl<$Res>
    implements $ShippingItemCopyWith<$Res> {
  _$ShippingItemCopyWithImpl(this._self, this._then);

  final ShippingItem _self;
  final $Res Function(ShippingItem) _then;

/// Create a copy of ShippingItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? quantity = null,Object? description = null,Object? weight = null,Object? dimensions = null,Object? sku = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,dimensions: null == dimensions ? _self.dimensions : dimensions // ignore: cast_nullable_to_non_nullable
as String,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ShippingItem implements ShippingItem {
  const _ShippingItem({required this.id, required this.name, required this.quantity, required this.description, required this.weight, required this.dimensions, this.sku});
  factory _ShippingItem.fromJson(Map<String, dynamic> json) => _$ShippingItemFromJson(json);

@override final  String id;
@override final  String name;
@override final  int quantity;
@override final  String description;
@override final  double weight;
@override final  String dimensions;
@override final  String? sku;

/// Create a copy of ShippingItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShippingItemCopyWith<_ShippingItem> get copyWith => __$ShippingItemCopyWithImpl<_ShippingItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShippingItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShippingItem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.description, description) || other.description == description)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.dimensions, dimensions) || other.dimensions == dimensions)&&(identical(other.sku, sku) || other.sku == sku));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,quantity,description,weight,dimensions,sku);

@override
String toString() {
  return 'ShippingItem(id: $id, name: $name, quantity: $quantity, description: $description, weight: $weight, dimensions: $dimensions, sku: $sku)';
}


}

/// @nodoc
abstract mixin class _$ShippingItemCopyWith<$Res> implements $ShippingItemCopyWith<$Res> {
  factory _$ShippingItemCopyWith(_ShippingItem value, $Res Function(_ShippingItem) _then) = __$ShippingItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int quantity, String description, double weight, String dimensions, String? sku
});




}
/// @nodoc
class __$ShippingItemCopyWithImpl<$Res>
    implements _$ShippingItemCopyWith<$Res> {
  __$ShippingItemCopyWithImpl(this._self, this._then);

  final _ShippingItem _self;
  final $Res Function(_ShippingItem) _then;

/// Create a copy of ShippingItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? quantity = null,Object? description = null,Object? weight = null,Object? dimensions = null,Object? sku = freezed,}) {
  return _then(_ShippingItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,dimensions: null == dimensions ? _self.dimensions : dimensions // ignore: cast_nullable_to_non_nullable
as String,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
