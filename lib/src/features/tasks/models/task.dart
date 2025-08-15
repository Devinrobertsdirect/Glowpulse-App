class Task {
  final String id;
  final String eventId;
  final String title;
  final String description;
  final String status; // 'pending', 'in_progress', 'completed', 'cancelled'
  final String priority; // 'low', 'medium', 'high', 'urgent'
  final String assignedTo;
  final String createdBy;
  final DateTime dueDate;
  final DateTime? completedAt;
  final List<String> dependencies;
  final List<String> attachments;
  final Map<String, dynamic> metadata;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Task({
    required this.id,
    required this.eventId,
    required this.title,
    required this.description,
    required this.status,
    required this.priority,
    required this.assignedTo,
    required this.createdBy,
    required this.dueDate,
    this.completedAt,
    required this.dependencies,
    required this.attachments,
    required this.metadata,
    required this.createdAt,
    required this.updatedAt,
  });

  bool get isOverdue => dueDate.isBefore(DateTime.now()) && status != 'completed';
  bool get isDueSoon => dueDate.difference(DateTime.now()).inDays <= 3 && status != 'completed';

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'eventId': eventId,
      'title': title,
      'description': description,
      'status': status,
      'priority': priority,
      'assignedTo': assignedTo,
      'createdBy': createdBy,
      'dueDate': dueDate.toIso8601String(),
      'completedAt': completedAt?.toIso8601String(),
      'dependencies': dependencies,
      'attachments': attachments,
      'metadata': metadata,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] as String,
      eventId: json['eventId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      status: json['status'] as String,
      priority: json['priority'] as String,
      assignedTo: json['assignedTo'] as String,
      createdBy: json['createdBy'] as String,
      dueDate: DateTime.parse(json['dueDate'] as String),
      completedAt: json['completedAt'] != null 
          ? DateTime.parse(json['completedAt'] as String) 
          : null,
      dependencies: List<String>.from(json['dependencies']),
      attachments: List<String>.from(json['attachments']),
      metadata: Map<String, dynamic>.from(json['metadata']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  Task copyWith({
    String? id,
    String? eventId,
    String? title,
    String? description,
    String? status,
    String? priority,
    String? assignedTo,
    String? createdBy,
    DateTime? dueDate,
    DateTime? completedAt,
    List<String>? dependencies,
    List<String>? attachments,
    Map<String, dynamic>? metadata,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Task(
      id: id ?? this.id,
      eventId: eventId ?? this.eventId,
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
      priority: priority ?? this.priority,
      assignedTo: assignedTo ?? this.assignedTo,
      createdBy: createdBy ?? this.createdBy,
      dueDate: dueDate ?? this.dueDate,
      completedAt: completedAt ?? this.completedAt,
      dependencies: dependencies ?? this.dependencies,
      attachments: attachments ?? this.attachments,
      metadata: metadata ?? this.metadata,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class TaskComment {
  final String id;
  final String taskId;
  final String userId;
  final String content;
  final List<String> attachments;
  final DateTime createdAt;
  final DateTime updatedAt;

  const TaskComment({
    required this.id,
    required this.taskId,
    required this.userId,
    required this.content,
    required this.attachments,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'taskId': taskId,
      'userId': userId,
      'content': content,
      'attachments': attachments,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory TaskComment.fromJson(Map<String, dynamic> json) {
    return TaskComment(
      id: json['id'] as String,
      taskId: json['taskId'] as String,
      userId: json['userId'] as String,
      content: json['content'] as String,
      attachments: List<String>.from(json['attachments']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }
}
