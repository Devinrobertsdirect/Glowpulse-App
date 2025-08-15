import 'package:health_device/src/features/events/models/event.dart';

class EventService {
  // Backend integration
  final Dio? _dio;
  final String? _baseUrl;
  final String? _authToken;

  EventService({Dio? dio, String? baseUrl, String? authToken})
      : _dio = dio,
        _baseUrl = baseUrl,
        _authToken = authToken;

  // Check if backend is available
  bool get isBackendAvailable => _dio != null && _baseUrl != null && _authToken != null;

  // Mock data for development
  static final List<Event> _mockEvents = [
    Event(
      id: '1',
      name: 'Tech Expo 2025',
      description: 'Annual technology exhibition showcasing latest innovations',
      location: 'Chicago Convention Center',
      startDate: DateTime.now().add(Duration(days: 30)),
      endDate: DateTime.now().add(Duration(days: 33)),
      status: 'planning',
      organizerId: 'user1',
      teamMemberIds: ['user1', 'user2', 'user3'],
      settings: {
        'boothSize': '20x20',
        'setupTime': '2 hours',
        'teardownTime': '1 hour',
        'maxAttendees': 1000,
      },
      metadata: {
        'industry': 'Technology',
        'targetAudience': 'Developers, IT Professionals',
        'expectedROI': 150000,
      },
      createdAt: DateTime.now().subtract(Duration(days: 60)),
      updatedAt: DateTime.now().subtract(Duration(days: 1)),
    ),
    Event(
      id: '2',
      name: 'Smart Home Summit',
      description: 'Conference focused on smart home technologies and IoT',
      location: 'Boston Marriott',
      startDate: DateTime.now().add(Duration(days: 45)),
      endDate: DateTime.now().add(Duration(days: 47)),
      status: 'planning',
      organizerId: 'user2',
      teamMemberIds: ['user2', 'user3'],
      settings: {
        'boothSize': '10x10',
        'setupTime': '1 hour',
        'teardownTime': '30 minutes',
        'maxAttendees': 500,
      },
      metadata: {
        'industry': 'Smart Home',
        'targetAudience': 'Homeowners, Builders',
        'expectedROI': 75000,
      },
      createdAt: DateTime.now().subtract(Duration(days: 45)),
      updatedAt: DateTime.now().subtract(Duration(days: 2)),
    ),
    Event(
      id: '3',
      name: 'IoT World Conference',
      description: 'International IoT conference and exhibition',
      location: 'San Francisco Convention Center',
      startDate: DateTime.now().add(Duration(days: 60)),
      endDate: DateTime.now().add(Duration(days: 63)),
      status: 'planning',
      organizerId: 'user1',
      teamMemberIds: ['user1', 'user2', 'user3'],
      settings: {
        'boothSize': '30x30',
        'setupTime': '4 hours',
        'teardownTime': '2 hours',
        'maxAttendees': 2000,
      },
      metadata: {
        'industry': 'IoT',
        'targetAudience': 'Enterprise, Developers',
        'expectedROI': 250000,
      },
      createdAt: DateTime.now().subtract(Duration(days: 30)),
      updatedAt: DateTime.now().subtract(Duration(days: 3)),
    ),
  ];

  static final List<BoothAssignment> _mockBoothAssignments = [
    BoothAssignment(
      id: '1',
      eventId: '1',
      boothNumber: 'A15',
      hall: 'Main Hall',
      assignedTo: 'user1',
      status: 'assigned',
      specifications: {
        'size': '20x20',
        'power': '220V',
        'internet': 'High-speed WiFi',
        'furniture': 'Included',
      },
      assignedAt: DateTime.now().subtract(Duration(days: 5)),
      createdAt: DateTime.now().subtract(Duration(days: 10)),
      updatedAt: DateTime.now().subtract(Duration(days: 5)),
    ),
    BoothAssignment(
      id: '2',
      eventId: '1',
      boothNumber: 'B22',
      hall: 'North Wing',
      assignedTo: 'user2',
      status: 'assigned',
      specifications: {
        'size': '10x10',
        'power': '110V',
        'internet': 'Standard WiFi',
        'furniture': 'Not included',
      },
      assignedAt: DateTime.now().subtract(Duration(days: 3)),
      createdAt: DateTime.now().subtract(Duration(days: 8)),
      updatedAt: DateTime.now().subtract(Duration(days: 3)),
    ),
  ];

  Future<List<Event>> getEvents() async {
    // Try backend first, fallback to mock data
    if (isBackendAvailable) {
      try {
        final response = await _dio!.get('/events');
        
        if (response.statusCode == 200) {
          final List<dynamic> data = response.data['data'];
          return data.map((json) => Event.fromJson(json)).toList();
        }
      } catch (e) {
        print('Backend error, using mock data: $e');
      }
    }

    // Fallback to mock data
    await Future.delayed(Duration(milliseconds: 600));
    return _mockEvents;
  }

  Future<Event?> getEventById(String id) async {
    await Future.delayed(Duration(milliseconds: 300));
    try {
      return _mockEvents.firstWhere((event) => event.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<List<Event>> getEventsByStatus(String status) async {
    await Future.delayed(Duration(milliseconds: 400));
    return _mockEvents.where((event) => event.status == status).toList();
  }

  Future<List<BoothAssignment>> getBoothAssignments(String eventId) async {
    await Future.delayed(Duration(milliseconds: 500));
    return _mockBoothAssignments.where((booth) => booth.eventId == eventId).toList();
  }

  Future<bool> createEvent(Event event) async {
    await Future.delayed(Duration(milliseconds: 1000));
    // Simulate successful event creation
    return true;
  }

  Future<bool> updateEvent(Event event) async {
    await Future.delayed(Duration(milliseconds: 800));
    // Simulate successful event update
    return true;
  }

  Future<bool> assignBooth(String eventId, String boothNumber, String userId) async {
    await Future.delayed(Duration(milliseconds: 600));
    // Simulate successful booth assignment
    return true;
  }
}
