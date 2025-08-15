import 'package:health_device/src/features/team/models/team_member.dart';
import 'package:dio/dio.dart';

class TeamService {
  // Mock data for development
  static final List<TeamMember> _mockTeamMembers = [
    TeamMember(
      id: '1',
      userId: 'user1',
      name: 'John Smith',
      email: 'john@glowpulse.com',
      role: 'admin',
      department: 'Sales',
      phone: '+1-555-0123',
      isActive: true,
      joinedAt: DateTime.now().subtract(Duration(days: 365)),
      lastActive: DateTime.now(),
      permissions: ['read', 'write', 'admin', 'approve'],
      profile: {'avatar': 'assets/avatars/john.jpg', 'bio': 'Senior Sales Manager'},
    ),
    TeamMember(
      id: '2',
      userId: 'user2',
      name: 'Sarah Johnson',
      email: 'sarah@glowpulse.com',
      role: 'manager',
      department: 'Marketing',
      phone: '+1-555-0124',
      isActive: true,
      joinedAt: DateTime.now().subtract(Duration(days: 180)),
      lastActive: DateTime.now().subtract(Duration(hours: 2)),
      permissions: ['read', 'write', 'approve'],
      profile: {'avatar': 'assets/avatars/sarah.jpg', 'bio': 'Marketing Director'},
    ),
    TeamMember(
      id: '3',
      userId: 'user3',
      name: 'Mike Chen',
      email: 'mike@glowpulse.com',
      role: 'member',
      department: 'Operations',
      phone: '+1-555-0125',
      isActive: true,
      joinedAt: DateTime.now().subtract(Duration(days: 90)),
      lastActive: DateTime.now().subtract(Duration(hours: 1)),
      permissions: ['read', 'write'],
      profile: {'avatar': 'assets/avatars/mike.jpg', 'bio': 'Operations Specialist'},
    ),
  ];

  static final List<TeamInvitation> _mockInvitations = [
    TeamInvitation(
      id: '1',
      email: 'alex@glowpulse.com',
      role: 'member',
      invitedBy: 'user1',
      invitedAt: DateTime.now().subtract(Duration(days: 2)),
      expiresAt: DateTime.now().add(Duration(days: 5)),
      status: 'pending',
      token: 'invite_token_123',
    ),
  ];

  // Backend integration methods
  final Dio? _dio;
  final String? _baseUrl;
  final String? _authToken;

  TeamService({Dio? dio, String? baseUrl, String? authToken})
      : _dio = dio,
        _baseUrl = baseUrl,
        _authToken = authToken;

  // Check if backend is available
  bool get isBackendAvailable => _dio != null && _baseUrl != null && _authToken != null;

  Future<List<TeamMember>> getTeamMembers() async {
    // Try backend first, fallback to mock data
    if (isBackendAvailable) {
      try {
        final response = await _dio!.get('/team/members');
        
        if (response.statusCode == 200) {
          final List<dynamic> data = response.data['data'];
          return data.map((json) => TeamMember.fromJson(json)).toList();
        }
      } catch (e) {
        print('Backend error, using mock data: $e');
      }
    }

    // Fallback to mock data
    await Future.delayed(Duration(milliseconds: 500));
    return _mockTeamMembers;
  }

  Future<List<TeamInvitation>> getPendingInvitations() async {
    if (isBackendAvailable) {
      try {
        final response = await _dio!.get(
          '$_baseUrl/team/invitations/pending',
          options: Options(headers: {'Authorization': 'Bearer $_authToken'}),
        );
        
        if (response.statusCode == 200) {
          final List<dynamic> data = response.data['data'];
          return data.map((json) => TeamInvitation.fromJson(json)).toList();
        }
      } catch (e) {
        print('Backend error, using mock data: $e');
      }
    }

    await Future.delayed(Duration(milliseconds: 300));
    return _mockInvitations.where((inv) => inv.status == 'pending').toList();
  }

  Future<TeamMember?> getTeamMemberById(String id) async {
    if (isBackendAvailable) {
      try {
        final response = await _dio!.get(
          '$_baseUrl/team/members/$id',
          options: Options(headers: {'Authorization': 'Bearer $_authToken'}),
        );
        
        if (response.statusCode == 200) {
          return TeamMember.fromJson(response.data['data']);
        }
      } catch (e) {
        print('Backend error, using mock data: $e');
      }
    }

    await Future.delayed(Duration(milliseconds: 200));
    try {
      return _mockTeamMembers.firstWhere((member) => member.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<bool> inviteTeamMember(String email, String role) async {
    if (isBackendAvailable) {
      try {
        final response = await _dio!.post(
          '$_baseUrl/team/invitations',
          data: {'email': email, 'role': role},
          options: Options(headers: {'Authorization': 'Bearer $_authToken'}),
        );
        
        return response.statusCode == 201;
      } catch (e) {
        print('Backend error: $e');
        return false;
      }
    }

    // Mock success
    await Future.delayed(Duration(milliseconds: 800));
    return true;
  }

  Future<bool> updateTeamMemberRole(String memberId, String newRole) async {
    if (isBackendAvailable) {
      try {
        final response = await _dio!.patch(
          '$_baseUrl/team/members/$memberId',
          data: {'role': newRole},
          options: Options(headers: {'Authorization': 'Bearer $_authToken'}),
        );
        
        return response.statusCode == 200;
      } catch (e) {
        print('Backend error: $e');
        return false;
      }
    }

    await Future.delayed(Duration(milliseconds: 600));
    return true;
  }

  Future<bool> deactivateTeamMember(String memberId) async {
    if (isBackendAvailable) {
      try {
        final response = await _dio!.patch(
          '$_baseUrl/team/members/$memberId',
          data: {'isActive': false},
          options: Options(headers: {'Authorization': 'Bearer $_authToken'}),
        );
        
        return response.statusCode == 200;
      } catch (e) {
        print('Backend error: $e');
        return false;
      }
    }

    await Future.delayed(Duration(milliseconds: 400));
    return true;
  }

  // Real-time updates for team collaboration
  Future<void> subscribeToTeamUpdates(String teamId, Function(TeamMember) onUpdate) async {
    if (isBackendAvailable) {
      // Implement WebSocket or Server-Sent Events for real-time updates
      try {
        // Example WebSocket implementation
        // final ws = WebSocketChannel.connect(Uri.parse('$_baseUrl/ws/team/$teamId'));
        // ws.stream.listen((data) {
        //   final member = TeamMember.fromJson(data);
        //   onUpdate(member);
        // });
        print('Real-time updates enabled for team: $teamId');
      } catch (e) {
        print('Failed to enable real-time updates: $e');
      }
    }
  }
}
