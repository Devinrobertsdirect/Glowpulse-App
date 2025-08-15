class Expense {
  final String id;
  final String eventId;
  final String category; // 'travel', 'accommodation', 'meals', 'supplies', 'marketing', 'other'
  final String description;
  final double amount;
  final String currency;
  final String status; // 'pending', 'approved', 'rejected', 'paid'
  final String submittedBy;
  final String? approvedBy;
  final DateTime? approvedAt;
  final DateTime expenseDate;
  final DateTime submittedAt;
  final List<String> attachments;
  final Map<String, dynamic> metadata;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Expense({
    required this.id,
    required this.eventId,
    required this.category,
    required this.description,
    required this.amount,
    required this.currency,
    required this.status,
    required this.submittedBy,
    this.approvedBy,
    this.approvedAt,
    required this.expenseDate,
    required this.submittedAt,
    required this.attachments,
    required this.metadata,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'eventId': eventId,
      'category': category,
      'description': description,
      'amount': amount,
      'currency': currency,
      'status': status,
      'submittedBy': submittedBy,
      'approvedBy': approvedBy,
      'approvedAt': approvedAt?.toIso8601String(),
      'expenseDate': expenseDate.toIso8601String(),
      'submittedAt': submittedAt.toIso8601String(),
      'attachments': attachments,
      'metadata': metadata,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      id: json['id'] as String,
      eventId: json['eventId'] as String,
      category: json['category'] as String,
      description: json['description'] as String,
      amount: json['amount'] as double,
      currency: json['currency'] as String,
      status: json['status'] as String,
      submittedBy: json['submittedBy'] as String,
      approvedBy: json['approvedBy'] as String?,
      approvedAt: json['approvedAt'] != null 
          ? DateTime.parse(json['approvedAt'] as String) 
          : null,
      expenseDate: DateTime.parse(json['expenseDate'] as String),
      submittedAt: DateTime.parse(json['submittedAt'] as String),
      attachments: List<String>.from(json['attachments']),
      metadata: Map<String, dynamic>.from(json['metadata']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  Expense copyWith({
    String? id,
    String? eventId,
    String? category,
    String? description,
    double? amount,
    String? currency,
    String? status,
    String? submittedBy,
    String? approvedBy,
    DateTime? approvedAt,
    DateTime? expenseDate,
    DateTime? submittedAt,
    List<String>? attachments,
    Map<String, dynamic>? metadata,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Expense(
      id: id ?? this.id,
      eventId: eventId ?? this.eventId,
      category: category ?? this.category,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      status: status ?? this.status,
      submittedBy: submittedBy ?? this.submittedBy,
      approvedBy: approvedBy ?? this.approvedBy,
      approvedAt: approvedAt ?? this.approvedAt,
      expenseDate: expenseDate ?? this.expenseDate,
      submittedAt: submittedAt ?? this.submittedAt,
      attachments: attachments ?? this.attachments,
      metadata: metadata ?? this.metadata,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class Budget {
  final String id;
  final String eventId;
  final String name;
  final String category;
  final double allocatedAmount;
  final double spentAmount;
  final String currency;
  final DateTime startDate;
  final DateTime endDate;
  final String status; // 'active', 'exceeded', 'completed'
  final List<String> expenseIds;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Budget({
    required this.id,
    required this.eventId,
    required this.name,
    required this.category,
    required this.allocatedAmount,
    required this.spentAmount,
    required this.currency,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.expenseIds,
    required this.createdAt,
    required this.updatedAt,
  });

  double get remainingAmount => allocatedAmount - spentAmount;
  double get utilizationPercentage => (spentAmount / allocatedAmount) * 100;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'eventId': eventId,
      'name': name,
      'category': category,
      'allocatedAmount': allocatedAmount,
      'spentAmount': spentAmount,
      'currency': currency,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'status': status,
      'expenseIds': expenseIds,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory Budget.fromJson(Map<String, dynamic> json) {
    return Budget(
      id: json['id'] as String,
      eventId: json['eventId'] as String,
      name: json['name'] as String,
      category: json['category'] as String,
      allocatedAmount: json['allocatedAmount'] as double,
      spentAmount: json['spentAmount'] as double,
      currency: json['currency'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      status: json['status'] as String,
      expenseIds: List<String>.from(json['expenseIds']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }
}
