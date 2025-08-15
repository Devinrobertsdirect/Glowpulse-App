import 'dart:convert';

class TradeShow {
  final String id;
  final String name;
  final String location;
  final String boothNumber;
  final String hall;
  final DateTime startDate;
  final DateTime endDate;
  final String product;
  final String status; // 'upcoming', 'active', 'completed'
  final String? description;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;

  const TradeShow({
    required this.id,
    required this.name,
    required this.location,
    required this.boothNumber,
    required this.hall,
    required this.startDate,
    required this.endDate,
    required this.product,
    required this.status,
    this.description,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'boothNumber': boothNumber,
      'hall': hall,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'product': product,
      'status': status,
      'description': description,
      'notes': notes,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory TradeShow.fromJson(Map<String, dynamic> json) {
    return TradeShow(
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
  }

  TradeShow copyWith({
    String? id,
    String? name,
    String? location,
    String? boothNumber,
    String? hall,
    DateTime? startDate,
    DateTime? endDate,
    String? product,
    String? status,
    String? description,
    String? notes,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return TradeShow(
      id: id ?? this.id,
      name: name ?? this.name,
      location: location ?? this.location,
      boothNumber: boothNumber ?? this.boothNumber,
      hall: hall ?? this.hall,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      product: product ?? this.product,
      status: status ?? this.status,
      description: description ?? this.description,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class TradeShowBooking {
  final String id;
  final String tradeShowId;
  final String userId;
  final String boothNumber;
  final String hall;
  final DateTime startDate;
  final DateTime endDate;
  final String product;
  final String status; // 'pending', 'confirmed', 'cancelled'
  final String? specialRequirements;
  final DateTime createdAt;
  final DateTime updatedAt;

  const TradeShowBooking({
    required this.id,
    required this.tradeShowId,
    required this.userId,
    required this.boothNumber,
    required this.hall,
    required this.startDate,
    required this.endDate,
    required this.product,
    required this.status,
    this.specialRequirements,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tradeShowId': tradeShowId,
      'userId': userId,
      'boothNumber': boothNumber,
      'hall': hall,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'product': product,
      'status': status,
      'specialRequirements': specialRequirements,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory TradeShowBooking.fromJson(Map<String, dynamic> json) {
    return TradeShowBooking(
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
  }

  TradeShowBooking copyWith({
    String? id,
    String? tradeShowId,
    String? userId,
    String? boothNumber,
    String? hall,
    DateTime? startDate,
    DateTime? endDate,
    String? product,
    String? status,
    String? specialRequirements,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return TradeShowBooking(
      id: id ?? this.id,
      tradeShowId: tradeShowId ?? this.tradeShowId,
      userId: userId ?? this.userId,
      boothNumber: boothNumber ?? this.boothNumber,
      hall: hall ?? this.hall,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      product: product ?? this.product,
      status: status ?? this.status,
      specialRequirements: specialRequirements ?? this.specialRequirements,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
