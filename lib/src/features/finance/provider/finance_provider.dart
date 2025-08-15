import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_device/src/features/finance/models/expense.dart';
import 'package:health_device/src/features/finance/services/finance_service.dart';

final financeServiceProvider = Provider<FinanceService>((ref) {
  final dio = DioClient.getInstance();
  return FinanceService(dio: dio, baseUrl: DioClient.baseUrl, authToken: 'mock-jwt-token');
});

final expensesProvider = FutureProvider.family<List<Expense>, String>((ref, eventId) async {
  final service = ref.read(financeServiceProvider);
  return await service.getExpenses(eventId);
});

final expensesByStatusProvider = FutureProvider.family<List<Expense>, String>((ref, status) async {
  final service = ref.read(financeServiceProvider);
  return await service.getExpensesByStatus(status);
});

final budgetsProvider = FutureProvider.family<List<Budget>, String>((ref, eventId) async {
  final service = ref.read(financeServiceProvider);
  return await service.getBudgets(eventId);
});

final expenseByIdProvider = FutureProvider.family<Expense?, String>((ref, id) async {
  final service = ref.read(financeServiceProvider);
  return await service.getExpenseById(id);
});

final financialSummaryProvider = FutureProvider.family<Map<String, dynamic>, String>((ref, eventId) async {
  final service = ref.read(financeServiceProvider);
  return await service.getFinancialSummary(eventId);
});

final pendingExpensesProvider = FutureProvider<List<Expense>>((ref) async {
  final service = ref.read(financeServiceProvider);
  return await service.getExpensesByStatus('pending');
});

final approvedExpensesProvider = FutureProvider<List<Expense>>((ref) async {
  final service = ref.read(financeServiceProvider);
  return await service.getExpensesByStatus('approved');
});

final paidExpensesProvider = FutureProvider<List<Expense>>((ref) async {
  final service = ref.read(financeServiceProvider);
  return await service.getExpensesByStatus('paid');
});

final totalExpensesProvider = FutureProvider.family<double, String>((ref, eventId) async {
  final expenses = await ref.read(expensesProvider(eventId).future);
  return expenses.fold<double>(0, (sum, expense) => sum + expense.amount);
});

final totalBudgetProvider = FutureProvider.family<double, String>((ref, eventId) async {
  final budgets = await ref.read(budgetsProvider(eventId).future);
  return budgets.fold<double>(0, (sum, budget) => sum + budget.allocatedAmount);
});
