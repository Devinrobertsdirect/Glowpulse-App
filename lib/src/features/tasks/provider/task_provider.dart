import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_device/src/features/tasks/models/task.dart';
import 'package:health_device/src/features/tasks/services/task_service.dart';
import 'package:health_device/src/core/network/dio_client.dart';
import 'package:dio/dio.dart';

final taskServiceProvider = Provider<TaskService>((ref) {
  final dio = Dio();
  final dioClient = DioClient(dio);
  return TaskService(dio: dio, baseUrl: DioClient.baseUrl, authToken: 'mock-jwt-token');
});

final tasksProvider = FutureProvider.family<List<Task>, String>((ref, eventId) async {
  final service = ref.read(taskServiceProvider);
  return await service.getTasks(eventId);
});

final tasksByStatusProvider = FutureProvider.family<List<Task>, String>((ref, status) async {
  final service = ref.read(taskServiceProvider);
  return await service.getTasksByStatus(status);
});

final tasksByAssigneeProvider = FutureProvider.family<List<Task>, String>((ref, userId) async {
  final service = ref.read(taskServiceProvider);
  return await service.getTasksByAssignee(userId);
});

final taskByIdProvider = FutureProvider.family<Task?, String>((ref, id) async {
  final service = ref.read(taskServiceProvider);
  return await service.getTaskById(id);
});

final taskCommentsProvider = FutureProvider.family<List<TaskComment>, String>((ref, taskId) async {
  final service = ref.read(taskServiceProvider);
  return await service.getTaskComments(taskId);
});

final taskSummaryProvider = FutureProvider.family<Map<String, dynamic>, String>((ref, eventId) async {
  final service = ref.read(taskServiceProvider);
  return await service.getTaskSummary(eventId);
});

final pendingTasksProvider = FutureProvider<List<Task>>((ref) async {
  final service = ref.read(taskServiceProvider);
  return await service.getTasksByStatus('pending');
});

final inProgressTasksProvider = FutureProvider<List<Task>>((ref) async {
  final service = ref.read(taskServiceProvider);
  return await service.getTasksByStatus('in_progress');
});

final completedTasksProvider = FutureProvider<List<Task>>((ref) async {
  final service = ref.read(taskServiceProvider);
  return await service.getTasksByStatus('completed');
});

final overdueTasksProvider = FutureProvider<List<Task>>((ref) async {
  final allTasks = await ref.read(tasksProvider('all').future);
  return allTasks.where((task) => task.isOverdue).toList();
});

final dueSoonTasksProvider = FutureProvider<List<Task>>((ref) async {
  final allTasks = await ref.read(tasksProvider('all').future);
  return allTasks.where((task) => task.isDueSoon).toList();
});

final highPriorityTasksProvider = FutureProvider<List<Task>>((ref) async {
  final allTasks = await ref.read(tasksProvider('all').future);
  return allTasks.where((task) => task.priority == 'high' || task.priority == 'urgent').toList();
});
