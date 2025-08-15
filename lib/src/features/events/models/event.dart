class Event {
  final String id;
  final String name;
  final String description;
  final String location;
  final DateTime startDate;
  final DateTime endDate;
  final String status; // 'planning', 'active', 'completed', 'cancelled'
  final String organizerId;
  final List<String> teamMemberIds;
  final Map<String, dynamic> settings;
  final Map<String, dynamic> metadata;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Event({
    required this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.organizerId,
    required this.teamMemberIds,
    required this.settings,
    required this.metadata,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'location': location,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'status': status,
      'organizerId': organizerId,
      'teamMemberIds': teamMemberIds,
      'settings': settings,
      'metadata': metadata,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      location: json['location'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      status: json['status'] as String,
      organizerId: json['organizerId'] as String,
      teamMemberIds: List<String>.from(json['teamMemberIds']),
      settings: Map<String, dynamic>.from(json['settings']),
      metadata: Map<String, dynamic>.from(json['metadata']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  Event copyWith({
    String? id,
    String? name,
    String? description,
    String? location,
    DateTime? startDate,
    DateTime? endDate,
    String? status,
    String? organizerId,
    List<String>? teamMemberIds,
    Map<String, dynamic>? settings,
    Map<String, dynamic>? metadata,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Event(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      location: location ?? this.location,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      status: status ?? this.status,
      organizerId: organizerId ?? this.organizerId,
      teamMemberIds: teamMemberIds ?? this.teamMemberIds,
      settings: settings ?? this.settings,
      metadata: metadata ?? this.metadata,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class BoothAssignment {
  final String id;
  final String eventId;
  final String boothNumber;
  final String hall;
  final String assignedTo;
  final String status; // 'available', 'assigned', 'occupied', 'maintenance'
  final Map<String, dynamic> specifications;
  final DateTime? assignedAt;
  final DateTime? occupiedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  const BoothAssignment({
    required this.id,
    required this.eventId,
    required this.boothNumber,
    required this.hall,
    required this.assignedTo,
    required this.status,
    required this.specifications,
    this.assignedAt,
    this.occupiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'eventId': eventId,
      'boothNumber': boothNumber,
      'hall': hall,
      'assignedTo': assignedTo,
      'status': status,
      'specifications': specifications,
      'assignedAt': assignedAt?.toIso8601String(),
      'occupiedAt': occupiedAt?.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory BoothAssignment.fromJson(Map<String, dynamic> json) {
    return BoothAssignment(
      id: json['id'] as String,
      eventId: json['eventId'] as String,
      boothNumber: json['boothNumber'] as String,
      hall: json['hall'] as String,
      assignedTo: json['assignedTo'] as String,
      status: json['status'] as String,
      specifications: Map<String, dynamic>.from(json['specifications']),
      assignedAt: json['assignedAt'] != null 
          ? DateTime.parse(json['assignedAt'] as String) 
          : null,
      occupiedAt: json['occupiedAt'] != null 
          ? DateTime.parse(json['occupiedAt'] as String) 
          : null,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }
}
