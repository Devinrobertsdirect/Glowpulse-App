// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ShippingOrder _$ShippingOrderFromJson(Map<String, dynamic> json) =>
    _ShippingOrder(
      id: json['id'] as String,
      tradeShowId: json['tradeShowId'] as String,
      userId: json['userId'] as String,
      orderNumber: json['orderNumber'] as String,
      status: json['status'] as String,
      shippingAddress: json['shippingAddress'] as String,
      recipientName: json['recipientName'] as String,
      recipientPhone: json['recipientPhone'] as String,
      carrier: json['carrier'] as String,
      trackingNumber: json['trackingNumber'] as String?,
      estimatedDelivery: DateTime.parse(json['estimatedDelivery'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => ShippingItem.fromJson(e as Map<String, dynamic>))
              .toList(),
      notes: json['notes'] as String?,
      totalCost: (json['totalCost'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ShippingOrderToJson(_ShippingOrder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tradeShowId': instance.tradeShowId,
      'userId': instance.userId,
      'orderNumber': instance.orderNumber,
      'status': instance.status,
      'shippingAddress': instance.shippingAddress,
      'recipientName': instance.recipientName,
      'recipientPhone': instance.recipientPhone,
      'carrier': instance.carrier,
      'trackingNumber': instance.trackingNumber,
      'estimatedDelivery': instance.estimatedDelivery.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'items': instance.items,
      'notes': instance.notes,
      'totalCost': instance.totalCost,
    };

_ShippingItem _$ShippingItemFromJson(Map<String, dynamic> json) =>
    _ShippingItem(
      id: json['id'] as String,
      name: json['name'] as String,
      quantity: (json['quantity'] as num).toInt(),
      description: json['description'] as String,
      weight: (json['weight'] as num).toDouble(),
      dimensions: json['dimensions'] as String,
      sku: json['sku'] as String?,
    );

Map<String, dynamic> _$ShippingItemToJson(_ShippingItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'quantity': instance.quantity,
      'description': instance.description,
      'weight': instance.weight,
      'dimensions': instance.dimensions,
      'sku': instance.sku,
    };
