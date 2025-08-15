import 'dart:convert';

class ShippingOrder {
  final String id;
  final String tradeShowId;
  final String userId;
  final String orderNumber;
  final String status; // 'pending', 'processing', 'shipped', 'delivered'
  final String shippingAddress;
  final String recipientName;
  final String recipientPhone;
  final String carrier; // 'FedEx', 'UPS', 'DHL', etc.
  final String? trackingNumber;
  final DateTime estimatedDelivery;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<ShippingItem>? items;
  final String? notes;
  final double? totalCost;

  const ShippingOrder({
    required this.id,
    required this.tradeShowId,
    required this.userId,
    required this.orderNumber,
    required this.status,
    required this.shippingAddress,
    required this.recipientName,
    required this.recipientPhone,
    required this.carrier,
    this.trackingNumber,
    required this.estimatedDelivery,
    required this.createdAt,
    required this.updatedAt,
    this.items,
    this.notes,
    this.totalCost,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tradeShowId': tradeShowId,
      'userId': userId,
      'orderNumber': orderNumber,
      'status': status,
      'shippingAddress': shippingAddress,
      'recipientName': recipientName,
      'recipientPhone': recipientPhone,
      'carrier': carrier,
      'trackingNumber': trackingNumber,
      'estimatedDelivery': estimatedDelivery.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'items': items?.map((item) => item.toJson()).toList(),
      'notes': notes,
      'totalCost': totalCost,
    };
  }

  factory ShippingOrder.fromJson(Map<String, dynamic> json) {
    return ShippingOrder(
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
      items: (json['items'] as List<dynamic>?)
          ?.map((item) => ShippingItem.fromJson(item as Map<String, dynamic>))
          .toList(),
      notes: json['notes'] as String?,
      totalCost: json['totalCost'] as double?,
    );
  }

  ShippingOrder copyWith({
    String? id,
    String? tradeShowId,
    String? userId,
    String? orderNumber,
    String? status,
    String? shippingAddress,
    String? recipientName,
    String? recipientPhone,
    String? carrier,
    String? trackingNumber,
    DateTime? estimatedDelivery,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<ShippingItem>? items,
    String? notes,
    double? totalCost,
  }) {
    return ShippingOrder(
      id: id ?? this.id,
      tradeShowId: tradeShowId ?? this.tradeShowId,
      userId: userId ?? this.userId,
      orderNumber: orderNumber ?? this.orderNumber,
      status: status ?? this.status,
      shippingAddress: shippingAddress ?? this.shippingAddress,
      recipientName: recipientName ?? this.recipientName,
      recipientPhone: recipientPhone ?? this.recipientPhone,
      carrier: carrier ?? this.carrier,
      trackingNumber: trackingNumber ?? this.trackingNumber,
      estimatedDelivery: estimatedDelivery ?? this.estimatedDelivery,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      items: items ?? this.items,
      notes: notes ?? this.notes,
      totalCost: totalCost ?? this.totalCost,
    );
  }
}

class ShippingItem {
  final String id;
  final String name;
  final int quantity;
  final String description;
  final double weight;
  final String dimensions;
  final String? sku;

  const ShippingItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.description,
    required this.weight,
    required this.dimensions,
    this.sku,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'quantity': quantity,
      'description': description,
      'weight': weight,
      'dimensions': dimensions,
      'sku': sku,
    };
  }

  factory ShippingItem.fromJson(Map<String, dynamic> json) {
    return ShippingItem(
      id: json['id'] as String,
      name: json['name'] as String,
      quantity: json['quantity'] as int,
      description: json['description'] as String,
      weight: json['weight'] as double,
      dimensions: json['dimensions'] as String,
      sku: json['sku'] as String?,
    );
  }
}
