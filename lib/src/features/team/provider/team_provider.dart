import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_device/src/features/team/models/team_member.dart';
import 'package:health_device/src/features/team/services/team_service.dart';

final teamServiceProvider = Provider<TeamService>((ref) {
  final dio = DioClient.getInstance();
  return TeamService(dio: dio, baseUrl: DioClient.baseUrl, authToken: 'mock-jwt-token');
});

final teamMembersProvider = FutureProvider<List<TeamMember>>((ref) async {
  final service = ref.read(teamServiceProvider);
  return await service.getTeamMembers();
});

final pendingInvitationsProvider = FutureProvider<List<TeamInvitation>>((ref) async {
  final service = ref.read(teamServiceProvider);
  return await service.getPendingInvitations();
});

final teamMemberByIdProvider = FutureProvider.family<TeamMember?, String>((ref, id) async {
  final service = ref.read(teamServiceProvider);
  return await service.getTeamMemberById(id);
});

final teamMembersByRoleProvider = FutureProvider.family<List<TeamMember>, String>((ref, role) async {
  final members = await ref.read(teamMembersProvider.future);
  return members.where((member) => member.role == role).toList();
});

final activeTeamMembersProvider = FutureProvider<List<TeamMember>>((ref) async {
  final members = await ref.read(teamMembersProvider.future);
  return members.where((member) => member.isActive).toList();
});
