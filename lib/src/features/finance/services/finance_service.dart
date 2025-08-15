import 'package:health_device/src/features/finance/models/expense.dart';
import 'package:dio/dio.dart';

class FinanceService {
  // Backend integration
  final Dio? _dio;
  final String? _baseUrl;
  final String? _authToken;

  FinanceService({Dio? dio, String? baseUrl, String? authToken})
      : _dio = dio,
        _baseUrl = baseUrl,
        _authToken = authToken;

  // Check if backend is available
  bool get isBackendAvailable => _dio != null && _baseUrl != null && _authToken != null;

  // Mock data for development
  static final List<Expense> _mockExpenses = [
    Expense(
      id: '1',
      eventId: '1',
      category: 'travel',
      description: 'Flight tickets for Tech Expo team',
      amount: 1250.00,
      currency: 'USD',
      status: 'approved',
      submittedBy: 'user1',
      approvedBy: 'user2',
      approvedAt: DateTime.now().subtract(Duration(days: 2)),
      expenseDate: DateTime.now().subtract(Duration(days: 5)),
      submittedAt: DateTime.now().subtract(Duration(days: 7)),
      attachments: ['receipt_flight_001.pdf'],
      metadata: {'airline': 'American Airlines', 'route': 'LAX-CHI'},
      createdAt: DateTime.now().subtract(Duration(days: 7)),
      updatedAt: DateTime.now().subtract(Duration(days: 2)),
    ),
    Expense(
      id: '2',
      eventId: '1',
      category: 'accommodation',
      description: 'Hotel booking for 3 nights',
      amount: 450.00,
      currency: 'USD',
      status: 'pending',
      submittedBy: 'user3',
      expenseDate: DateTime.now().add(Duration(days: 25)),
      submittedAt: DateTime.now().subtract(Duration(days: 1)),
      attachments: ['hotel_confirmation.pdf'],
      metadata: {'hotel': 'Marriott Downtown', 'nights': 3},
      createdAt: DateTime.now().subtract(Duration(days: 1)),
      updatedAt: DateTime.now().subtract(Duration(days: 1)),
    ),
    Expense(
      id: '3',
      eventId: '2',
      category: 'marketing',
      description: 'Banner and promotional materials',
      amount: 320.00,
      currency: 'USD',
      status: 'paid',
      submittedBy: 'user2',
      approvedBy: 'user1',
      approvedAt: DateTime.now().subtract(Duration(days: 5)),
      expenseDate: DateTime.now().subtract(Duration(days: 10)),
      submittedAt: DateTime.now().subtract(Duration(days: 12)),
      attachments: ['banner_invoice.pdf', 'design_files.zip'],
      metadata: {'vendor': 'PrintPro', 'items': 'Banners, Flyers, Business Cards'},
      createdAt: DateTime.now().subtract(Duration(days: 12)),
      updatedAt: DateTime.now().subtract(Duration(days: 5)),
    ),
  ];

  static final List<Budget> _mockBudgets = [
    Budget(
      id: '1',
      eventId: '1',
      name: 'Tech Expo 2025 Budget',
      category: 'overall',
      allocatedAmount: 50000.00,
      spentAmount: 1700.00,
      currency: 'USD',
      startDate: DateTime.now().subtract(Duration(days: 60)),
      endDate: DateTime.now().add(Duration(days: 40)),
      status: 'active',
      expenseIds: ['1', '2'],
      createdAt: DateTime.now().subtract(Duration(days: 60)),
      updatedAt: DateTime.now().subtract(Duration(days: 1)),
    ),
    Budget(
      id: '2',
      eventId: '2',
      name: 'Smart Home Summit Budget',
      category: 'overall',
      allocatedAmount: 25000.00,
      spentAmount: 320.00,
      currency: 'USD',
      startDate: DateTime.now().subtract(Duration(days: 45)),
      endDate: DateTime.now().add(Duration(days: 50)),
      status: 'active',
      expenseIds: ['3'],
      createdAt: DateTime.now().subtract(Duration(days: 45)),
      updatedAt: DateTime.now().subtract(Duration(days: 5)),
    ),
  ];

  Future<List<Expense>> getExpenses(String eventId) async {
    // Try backend first, fallback to mock data
    if (isBackendAvailable) {
      try {
        final response = await _dio!.get('/expenses');
        
        if (response.statusCode == 200) {
          final List<dynamic> data = response.data['data'];
          final allExpenses = data.map((json) => Expense.fromJson(json)).toList();
          return allExpenses.where((expense) => expense.eventId == eventId).toList();
        }
      } catch (e) {
        print('Backend error, using mock data: $e');
      }
    }

    // Fallback to mock data
    await Future.delayed(Duration(milliseconds: 500));
    return _mockExpenses.where((expense) => expense.eventId == eventId).toList();
  }

  Future<List<Expense>> getExpensesByStatus(String status) async {
    await Future.delayed(Duration(milliseconds: 400));
    return _mockExpenses.where((expense) => expense.status == status).toList();
  }

  Future<List<Budget>> getBudgets(String eventId) async {
    await Future.delayed(Duration(milliseconds: 600));
    return _mockBudgets.where((budget) => budget.eventId == eventId).toList();
  }

  Future<Expense?> getExpenseById(String id) async {
    await Future.delayed(Duration(milliseconds: 300));
    try {
      return _mockExpenses.firstWhere((expense) => expense.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<bool> submitExpense(Expense expense) async {
    await Future.delayed(Duration(milliseconds: 800));
    // Simulate successful expense submission
    return true;
  }

  Future<bool> approveExpense(String expenseId, String approverId) async {
    await Future.delayed(Duration(milliseconds: 600));
    // Simulate successful expense approval
    return true;
  }

  Future<bool> rejectExpense(String expenseId, String reason) async {
    await Future.delayed(Duration(milliseconds: 500));
    // Simulate successful expense rejection
    return true;
  }

  Future<bool> createBudget(Budget budget) async {
    await Future.delayed(Duration(milliseconds: 700));
    // Simulate successful budget creation
    return true;
  }

  Future<bool> updateBudget(Budget budget) async {
    await Future.delayed(Duration(milliseconds: 600));
    // Simulate successful budget update
    return true;
  }

  // Financial analytics
  Future<Map<String, dynamic>> getFinancialSummary(String eventId) async {
    await Future.delayed(Duration(milliseconds: 800));
    
    final eventExpenses = _mockExpenses.where((e) => e.eventId == eventId).toList();
    final eventBudgets = _mockBudgets.where((b) => b.eventId == eventId).toList();
    
    double totalExpenses = eventExpenses.fold(0, (sum, e) => sum + e.amount);
    double totalBudget = eventBudgets.fold(0, (sum, b) => sum + b.allocatedAmount);
    double remainingBudget = totalBudget - totalExpenses;
    
    Map<String, int> expensesByCategory = {};
    for (var expense in eventExpenses) {
      expensesByCategory[expense.category] = (expensesByCategory[expense.category] ?? 0) + 1;
    }
    
    return {
      'totalBudget': totalBudget,
      'totalExpenses': totalExpenses,
      'remainingBudget': remainingBudget,
      'utilizationPercentage': totalBudget > 0 ? (totalExpenses / totalBudget) * 100 : 0,
      'expensesByCategory': expensesByCategory,
      'pendingExpenses': eventExpenses.where((e) => e.status == 'pending').length,
      'approvedExpenses': eventExpenses.where((e) => e.status == 'approved').length,
      'paidExpenses': eventExpenses.where((e) => e.status == 'paid').length,
    };
  }
}
