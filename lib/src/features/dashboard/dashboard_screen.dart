import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_device/src/config/theme.dart';
import 'package:health_device/src/features/events/provider/event_provider.dart';
import 'package:health_device/src/features/finance/provider/finance_provider.dart';
import 'package:health_device/src/features/tasks/provider/task_provider.dart';
import 'package:health_device/src/features/team/provider/team_provider.dart';
import 'package:health_device/src/features/trade_shows/provider/trade_show_provider.dart';
import 'package:health_device/src/features/shipping/provider/shipping_provider.dart';
import 'package:health_device/src/shared/widgets/theme_card.dart';

class DashboardScreen extends ConsumerWidget {
  static final path = '/dashboard';
  
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Team Dashboard'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildWelcomeSection(context),
              SizedBox(height: 20.h),
              _buildQuickStatsSection(context, ref),
              SizedBox(height: 20.h),
              _buildUpcomingEventsSection(context, ref),
              SizedBox(height: 20.h),
              _buildTaskOverviewSection(context, ref),
              SizedBox(height: 20.h),
              _buildFinancialOverviewSection(context, ref),
              SizedBox(height: 20.h),
              _buildTeamActivitySection(context, ref),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeSection(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Theme.of(context).primaryColor, Theme.of(context).primaryColor.withOpacity(0.8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [boxShadowWidget()],
      ),
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome back, Team!',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Here\'s what\'s happening with your tradeshow operations',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.white.withOpacity(0.9),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickStatsSection(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            context,
            'Active Events',
            ref.watch(upcomingEventsProvider).when(
              data: (events) => '${events.length}',
              loading: () => '...',
              error: (_, __) => '0',
            ),
            Icons.event,
            Colors.blue,
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: _buildStatCard(
            context,
            'Team Members',
            ref.watch(activeTeamMembersProvider).when(
              data: (members) => '${members.length}',
              loading: () => '...',
              error: (_, __) => '0',
            ),
            Icons.people,
            Colors.green,
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: _buildStatCard(
            context,
            'Pending Tasks',
            ref.watch(pendingTasksProvider).when(
              data: (tasks) => '${tasks.length}',
              loading: () => '...',
              error: (_, __) => '0',
            ),
            Icons.assignment,
            Colors.orange,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(BuildContext context, String title, String value, IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [boxShadowWidget()],
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 32),
          SizedBox(height: 12.h),
          Text(
            value,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildUpcomingEventsSection(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [boxShadowWidget()],
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Upcoming Events',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.calendar_today, color: Theme.of(context).primaryColor),
              ],
            ),
            SizedBox(height: 16.h),
            Consumer(
              builder: (context, ref, child) {
                final eventsAsync = ref.watch(upcomingEventsProvider);
                
                return eventsAsync.when(
                  data: (events) {
                    if (events.isEmpty) {
                      return Center(
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            'No upcoming events',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      );
                    }
                    
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: events.take(3).length,
                      itemBuilder: (context, index) {
                        final event = events[index];
                        return _buildEventCard(context, event);
                      },
                    );
                  },
                  loading: () => Center(child: CircularProgressIndicator()),
                  error: (error, stack) => Text('Error: $error'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventCard(BuildContext context, dynamic event) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(0.3),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.event, color: Colors.white, size: 20),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.name,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  '${event.location} • ${_formatDateRange(event.startDate, event.endDate)}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: _getStatusColor(event.status),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              event.status.toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskOverviewSection(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [boxShadowWidget()],
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Task Overview',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.assignment, color: Theme.of(context).primaryColor),
              ],
            ),
            SizedBox(height: 16.h),
            Consumer(
              builder: (context, ref, child) {
                final taskSummaryAsync = ref.watch(taskSummaryProvider('1'));
                
                return taskSummaryAsync.when(
                  data: (summary) {
                    return Row(
                      children: [
                        Expanded(
                          child: _buildTaskStat(
                            context,
                            'Total',
                            '${summary['totalTasks']}',
                            Icons.list,
                            Colors.blue,
                          ),
                        ),
                        Expanded(
                          child: _buildTaskStat(
                            context,
                            'In Progress',
                            '${summary['inProgressTasks']}',
                            Icons.pending,
                            Colors.orange,
                          ),
                        ),
                        Expanded(
                          child: _buildTaskStat(
                            context,
                            'Completed',
                            '${summary['completedTasks']}',
                            Icons.check_circle,
                            Colors.green,
                          ),
                        ),
                      ],
                    );
                  },
                  loading: () => Center(child: CircularProgressIndicator()),
                  error: (error, stack) => Text('Error: $error'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskStat(BuildContext context, String label, String value, IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          SizedBox(height: 8.h),
          Text(
            value,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildFinancialOverviewSection(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [boxShadowWidget()],
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Financial Overview',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.attach_money, color: Theme.of(context).primaryColor),
              ],
            ),
            SizedBox(height: 16.h),
            Consumer(
              builder: (context, ref, child) {
                final financialSummaryAsync = ref.watch(financialSummaryProvider('1'));
                
                return financialSummaryAsync.when(
                  data: (summary) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: _buildFinancialStat(
                                context,
                                'Budget',
                                '\$${summary['totalBudget'].toStringAsFixed(0)}',
                                Icons.account_balance_wallet,
                                Colors.green,
                              ),
                            ),
                            Expanded(
                              child: _buildFinancialStat(
                                context,
                                'Spent',
                                '\$${summary['totalExpenses'].toStringAsFixed(0)}',
                                Icons.payment,
                                Colors.red,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        LinearProgressIndicator(
                          value: summary['utilizationPercentage'] / 100,
                          backgroundColor: Colors.grey[300],
                          valueColor: AlwaysStoppedAnimation<Color>(
                            summary['utilizationPercentage'] > 80 ? Colors.red : Colors.green,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          '${summary['utilizationPercentage'].toStringAsFixed(1)}% of budget used',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    );
                  },
                  loading: () => Center(child: CircularProgressIndicator()),
                  error: (error, stack) => Text('Error: $error'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFinancialStat(BuildContext context, String label, String value, IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          SizedBox(height: 8.h),
          Text(
            value,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildTeamActivitySection(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [boxShadowWidget()],
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Team Activity',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.people, color: Theme.of(context).primaryColor),
              ],
            ),
            SizedBox(height: 16.h),
            Consumer(
              builder: (context, ref, child) {
                final teamMembersAsync = ref.watch(activeTeamMembersProvider);
                
                return teamMembersAsync.when(
                  data: (members) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: members.take(3).length,
                      itemBuilder: (context, index) {
                        final member = members[index];
                        return _buildTeamMemberCard(context, member);
                      },
                    );
                  },
                  loading: () => Center(child: CircularProgressIndicator()),
                  error: (error, stack) => Text('Error: $error'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamMemberCard(BuildContext context, dynamic member) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(0.2),
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Theme.of(context).primaryColor,
            child: Text(
              member.name.substring(0, 1).toUpperCase(),
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  member.name,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  '${member.role} • ${member.department}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: member.isActive ? Colors.green : Colors.grey,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              member.isActive ? 'ACTIVE' : 'INACTIVE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDateRange(DateTime start, DateTime end) {
    if (start.year == end.year && start.month == end.month && start.day == end.day) {
      return '${start.month}/${start.day}/${start.year}';
    }
    return '${start.month}/${start.day}/${start.year} - ${end.month}/${end.day}/${end.year}';
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'planning':
        return Colors.blue;
      case 'active':
        return Colors.green;
      case 'completed':
        return Colors.grey;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
