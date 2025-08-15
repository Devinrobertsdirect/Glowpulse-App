// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trade_show.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TradeShow _$TradeShowFromJson(Map<String, dynamic> json) => _TradeShow(
  id: json['id'] as String,
  name: json['name'] as String,
  location: json['location'] as String,
  boothNumber: json['boothNumber'] as String,
  hall: json['hall'] as String,
  startDate: DateTime.parse(json['startDate'] as String),
  endDate: DateTime.parse(json['endDate'] as String),
  product: json['product'] as String,
  status: json['status'] as String,
  description: json['description'] as String?,
  notes: json['notes'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$TradeShowToJson(_TradeShow instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'location': instance.location,
      'boothNumber': instance.boothNumber,
      'hall': instance.hall,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'product': instance.product,
      'status': instance.status,
      'description': instance.description,
      'notes': instance.notes,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_TradeShowBooking _$TradeShowBookingFromJson(Map<String, dynamic> json) =>
    _TradeShowBooking(
      id: json['id'] as String,
      tradeShowId: json['tradeShowId'] as String,
      userId: json['userId'] as String,
      boothNumber: json['boothNumber'] as String,
      hall: json['hall'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      product: json['product'] as String,
      status: json['status'] as String,
      specialRequirements: json['specialRequirements'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$TradeShowBookingToJson(_TradeShowBooking instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tradeShowId': instance.tradeShowId,
      'userId': instance.userId,
      'boothNumber': instance.boothNumber,
      'hall': instance.hall,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'product': instance.product,
      'status': instance.status,
      'specialRequirements': instance.specialRequirements,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
