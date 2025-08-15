class TeamMember {
  final String id;
  final String userId;
  final String name;
  final String email;
  final String role; // 'admin', 'manager', 'member', 'viewer'
  final String department;
  final String phone;
  final bool isActive;
  final DateTime joinedAt;
  final DateTime? lastActive;
  final List<String> permissions;
  final Map<String, dynamic> profile;

  const TeamMember({
    required this.id,
    required this.userId,
    required this.name,
    required this.email,
    required this.role,
    required this.department,
    required this.phone,
    required this.isActive,
    required this.joinedAt,
    this.lastActive,
    required this.permissions,
    required this.profile,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
      'email': email,
      'role': role,
      'department': department,
      'phone': phone,
      'isActive': isActive,
      'joinedAt': joinedAt.toIso8601String(),
      'lastActive': lastActive?.toIso8601String(),
      'permissions': permissions,
      'profile': profile,
    };
  }

  factory TeamMember.fromJson(Map<String, dynamic> json) {
    return TeamMember(
      id: json['id'] as String,
      userId: json['userId'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      department: json['department'] as String,
      phone: json['phone'] as String,
      isActive: json['isActive'] as bool,
      joinedAt: DateTime.parse(json['joinedAt'] as String),
      lastActive: json['lastActive'] != null 
          ? DateTime.parse(json['lastActive'] as String) 
          : null,
      permissions: List<String>.from(json['permissions']),
      profile: Map<String, dynamic>.from(json['profile']),
    );
  }

  TeamMember copyWith({
    String? id,
    String? userId,
    String? name,
    String? email,
    String? role,
    String? department,
    String? phone,
    bool? isActive,
    DateTime? joinedAt,
    DateTime? lastActive,
    List<String>? permissions,
    Map<String, dynamic>? profile,
  }) {
    return TeamMember(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
      department: department ?? this.department,
      phone: phone ?? this.phone,
      isActive: isActive ?? this.isActive,
      joinedAt: joinedAt ?? this.joinedAt,
      lastActive: lastActive ?? this.lastActive,
      permissions: permissions ?? this.permissions,
      profile: profile ?? this.profile,
    );
  }
}

class TeamInvitation {
  final String id;
  final String email;
  final String role;
  final String invitedBy;
  final DateTime invitedAt;
  final DateTime expiresAt;
  final String status; // 'pending', 'accepted', 'expired', 'cancelled'
  final String? token;

  const TeamInvitation({
    required this.id,
    required this.email,
    required this.role,
    required this.invitedBy,
    required this.invitedAt,
    required this.expiresAt,
    required this.status,
    this.token,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'role': role,
      'invitedBy': invitedBy,
      'invitedAt': invitedAt.toIso8601String(),
      'expiresAt': expiresAt.toIso8601String(),
      'status': status,
      'token': token,
    };
  }

  factory TeamInvitation.fromJson(Map<String, dynamic> json) {
    return TeamInvitation(
      id: json['id'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      invitedBy: json['invitedBy'] as String,
      invitedAt: DateTime.parse(json['invitedAt'] as String),
      expiresAt: DateTime.parse(json['expiresAt'] as String),
      status: json['status'] as String,
      token: json['token'] as String?,
    );
  }
}
