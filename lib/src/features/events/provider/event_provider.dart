import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_device/src/features/events/models/event.dart';
import 'package:health_device/src/features/events/services/event_service.dart';
import 'package:health_device/src/core/network/dio_client.dart';
import 'package:dio/dio.dart';

final eventServiceProvider = Provider<EventService>((ref) {
  final dio = Dio();
  final dioClient = DioClient(dio);
  return EventService(dio: dio, baseUrl: DioClient.baseUrl, authToken: 'mock-jwt-token');
});

final eventsProvider = FutureProvider<List<Event>>((ref) async {
  final service = ref.read(eventServiceProvider);
  return await service.getEvents();
});

final eventByIdProvider = FutureProvider.family<Event?, String>((ref, id) async {
  final service = ref.read(eventServiceProvider);
  return await service.getEventById(id);
});

final eventsByStatusProvider = FutureProvider.family<List<Event>, String>((ref, status) async {
  final service = ref.read(eventServiceProvider);
  return await service.getEventsByStatus(status);
});

final boothAssignmentsProvider = FutureProvider.family<List<BoothAssignment>, String>((ref, eventId) async {
  final service = ref.read(eventServiceProvider);
  return await service.getBoothAssignments(eventId);
});

final upcomingEventsProvider = FutureProvider<List<Event>>((ref) async {
  final events = await ref.read(eventsProvider.future);
  final now = DateTime.now();
  return events.where((event) => 
    event.startDate.isAfter(now) && event.status == 'planning'
  ).toList();
});

final activeEventsProvider = FutureProvider<List<Event>>((ref) async {
  final events = await ref.read(eventsProvider.future);
  final now = DateTime.now();
  return events.where((event) => 
    event.startDate.isBefore(now) && event.endDate.isAfter(now) && event.status == 'active'
  ).toList();
});

final completedEventsProvider = FutureProvider<List<Event>>((ref) async {
  final events = await ref.read(eventsProvider.future);
  final now = DateTime.now();
  return events.where((event) => 
    event.endDate.isBefore(now) && event.status == 'completed'
  ).toList();
});
