import 'package:health_device/src/features/tasks/models/task.dart';
import 'package:dio/dio.dart';

class TaskService {
  // Backend integration
  final Dio? _dio;
  final String? _baseUrl;
  final String? _authToken;

  TaskService({Dio? dio, String? baseUrl, String? authToken})
      : _dio = dio,
        _baseUrl = baseUrl,
        _authToken = authToken;

  // Check if backend is available
  bool get isBackendAvailable => _dio != null && _baseUrl != null && _authToken != null;

  // Mock data for development
  static final List<Task> _mockTasks = [
    Task(
      id: '1',
      eventId: '1',
      title: 'Setup booth display materials',
      description: 'Prepare and organize all booth display materials including banners, product demos, and promotional items',
      status: 'in_progress',
      priority: 'high',
      assignedTo: 'user1',
      createdBy: 'user2',
      dueDate: DateTime.now().add(Duration(days: 25)),
      dependencies: [],
      attachments: ['booth_layout.pdf', 'materials_list.xlsx'],
      metadata: {'estimatedHours': 4, 'requiredTools': ['Ladder', 'Drill']},
      createdAt: DateTime.now().subtract(Duration(days: 5)),
      updatedAt: DateTime.now().subtract(Duration(days: 1)),
    ),
    Task(
      id: '2',
      eventId: '1',
      title: 'Coordinate with venue staff',
      description: 'Finalize setup times, power requirements, and internet access with venue management',
      status: 'completed',
      priority: 'medium',
      assignedTo: 'user2',
      createdBy: 'user1',
      dueDate: DateTime.now().subtract(Duration(days: 2)),
      completedAt: DateTime.now().subtract(Duration(days: 1)),
      dependencies: [],
      attachments: ['venue_contract.pdf', 'setup_schedule.pdf'],
      metadata: {'contactPerson': 'Mike Johnson', 'phone': '+1-555-0126'},
      createdAt: DateTime.now().subtract(Duration(days: 10)),
      updatedAt: DateTime.now().subtract(Duration(days: 1)),
    ),
    Task(
      id: '3',
      eventId: '1',
      title: 'Prepare product demonstrations',
      description: 'Set up and test all product demos, ensure they work properly and staff is trained',
      status: 'pending',
      priority: 'high',
      assignedTo: 'user3',
      createdBy: 'user1',
      dueDate: DateTime.now().add(Duration(days: 20)),
      dependencies: ['1'],
      attachments: ['demo_script.pdf', 'product_specs.pdf'],
      metadata: {'demoCount': 5, 'trainingRequired': true},
      createdAt: DateTime.now().subtract(Duration(days: 3)),
      updatedAt: DateTime.now().subtract(Duration(days: 3)),
    ),
    Task(
      id: '4',
      eventId: '2',
      title: 'Design marketing materials',
      description: 'Create banners, flyers, and digital assets for Smart Home Summit',
      status: 'in_progress',
      priority: 'medium',
      assignedTo: 'user2',
      createdBy: 'user1',
      dueDate: DateTime.now().add(Duration(days: 30)),
      dependencies: [],
      attachments: ['brand_guidelines.pdf', 'design_brief.docx'],
      metadata: {'designer': 'Sarah Johnson', 'approvalRequired': true},
      createdAt: DateTime.now().subtract(Duration(days: 7)),
      updatedAt: DateTime.now().subtract(Duration(days: 2)),
    ),
  ];

  static final List<TaskComment> _mockComments = [
    TaskComment(
      id: '1',
      taskId: '1',
      userId: 'user1',
      content: 'Started organizing materials. Will need additional storage boxes.',
      attachments: [],
      createdAt: DateTime.now().subtract(Duration(hours: 6)),
      updatedAt: DateTime.now().subtract(Duration(hours: 6)),
    ),
    TaskComment(
      id: '2',
      taskId: '1',
      userId: 'user2',
      content: 'Storage boxes ordered and will arrive tomorrow.',
      attachments: ['order_confirmation.pdf'],
      createdAt: DateTime.now().subtract(Duration(hours: 2)),
      updatedAt: DateTime.now().subtract(Duration(hours: 2)),
    ),
  ];

  Future<List<Task>> getTasks(String eventId) async {
    // Try backend first, fallback to mock data
    if (isBackendAvailable) {
      try {
        final response = await _dio!.get('/tasks');
        
        if (response.statusCode == 200) {
          final List<dynamic> data = response.data['data'];
          final allTasks = data.map((json) => Task.fromJson(json)).toList();
          return allTasks.where((task) => task.eventId == eventId).toList();
        }
      } catch (e) {
        print('Backend error, using mock data: $e');
      }
    }

    // Fallback to mock data
    await Future.delayed(Duration(milliseconds: 500));
    return _mockTasks.where((task) => task.eventId == eventId).toList();
  }

  Future<List<Task>> getTasksByStatus(String status) async {
    await Future.delayed(Duration(milliseconds: 400));
    return _mockTasks.where((task) => task.status == status).toList();
  }

  Future<List<Task>> getTasksByAssignee(String userId) async {
    await Future.delayed(Duration(milliseconds: 450));
    return _mockTasks.where((task) => task.assignedTo == userId).toList();
  }

  Future<Task?> getTaskById(String id) async {
    await Future.delayed(Duration(milliseconds: 300));
    try {
      return _mockTasks.firstWhere((task) => task.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<List<TaskComment>> getTaskComments(String taskId) async {
    await Future.delayed(Duration(milliseconds: 350));
    return _mockComments.where((comment) => comment.taskId == taskId).toList();
  }

  Future<bool> createTask(Task task) async {
    await Future.delayed(Duration(milliseconds: 800));
    // Simulate successful task creation
    return true;
  }

  Future<bool> updateTask(Task task) async {
    await Future.delayed(Duration(milliseconds: 600));
    // Simulate successful task update
    return true;
  }

  Future<bool> updateTaskStatus(String taskId, String newStatus) async {
    await Future.delayed(Duration(milliseconds: 500));
    // Simulate successful status update
    return true;
  }

  Future<bool> assignTask(String taskId, String userId) async {
    await Future.delayed(Duration(milliseconds: 400));
    // Simulate successful task assignment
    return true;
  }

  Future<bool> addTaskComment(TaskComment comment) async {
    await Future.delayed(Duration(milliseconds: 600));
    // Simulate successful comment addition
    return true;
  }

  // Task analytics
  Future<Map<String, dynamic>> getTaskSummary(String eventId) async {
    await Future.delayed(Duration(milliseconds: 700));
    
    final eventTasks = _mockTasks.where((t) => t.eventId == eventId).toList();
    
    int totalTasks = eventTasks.length;
    int completedTasks = eventTasks.where((t) => t.status == 'completed').length;
    int inProgressTasks = eventTasks.where((t) => t.status == 'in_progress').length;
    int pendingTasks = eventTasks.where((t) => t.status == 'pending').length;
    
    int overdueTasks = eventTasks.where((t) => t.isOverdue).length;
    int dueSoonTasks = eventTasks.where((t) => t.isDueSoon).length;
    
    Map<String, int> tasksByPriority = {};
    for (var task in eventTasks) {
      tasksByPriority[task.priority] = (tasksByPriority[task.priority] ?? 0) + 1;
    }
    
    return {
      'totalTasks': totalTasks,
      'completedTasks': completedTasks,
      'inProgressTasks': inProgressTasks,
      'pendingTasks': pendingTasks,
      'overdueTasks': overdueTasks,
      'dueSoonTasks': dueSoonTasks,
      'completionRate': totalTasks > 0 ? (completedTasks / totalTasks) * 100 : 0,
      'tasksByPriority': tasksByPriority,
    };
  }
}
