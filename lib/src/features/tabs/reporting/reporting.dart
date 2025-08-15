import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:health_device/src/shared/widgets/appButton.dart';
import 'package:health_device/src/shared/widgets/theme_card.dart';
import 'package:health_device/src/features/trade_shows/provider/trade_show_provider.dart';
import 'package:health_device/src/features/shipping/provider/shipping_provider.dart';

class ReportingScreen extends ConsumerWidget {
  static final path = '/reporting';
  const ReportingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Widget _verticalSpacer = SizedBox(height: 15.h);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
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
                        Text(
                          "Daily Sales Report",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        _verticalSpacer,
                        Text(
                          "Number of Sales",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Enter number of sales",
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "Product Type",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.withValues(alpha: 0.4),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              isExpanded: true,
                              hint: Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: const Text("Select product"),
                              ),
                              value: null,
                              onChanged: (String? newValue) {
                                // Handle selection
                              },
                              items: [
                                'Smart Home Suite 2025',
                                'IoT Bundle',
                                'Security Package'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(value),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "Total Revenue (\$)",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Enter total revenue",
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(height: 30.h),
                        AppButton(
                          title: 'Submit Sales Report',
                          padding: 12,
                          size: 16,
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Sales report submitted!')),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
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
                        Text(
                          "Trade Show Summary",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        _verticalSpacer,
                        Consumer(
                          builder: (context, ref, child) {
                            final bookingsAsync = ref.watch(userBookingsProvider);
                            final shippingAsync = ref.watch(userShippingOrdersProvider);
                            
                            return Column(
                              children: [
                                bookingsAsync.when(
                                  data: (bookings) => _buildSummaryCard(
                                    'Active Bookings',
                                    '${bookings.length}',
                                    Icons.event,
                                    context,
                                  ),
                                  loading: () => CircularProgressIndicator(),
                                  error: (error, stack) => Text('Error: $error'),
                                ),
                                SizedBox(height: 15.h),
                                shippingAsync.when(
                                  data: (orders) => _buildSummaryCard(
                                    'Shipping Orders',
                                    '${orders.length}',
                                    Icons.local_shipping,
                                    context,
                                  ),
                                  loading: () => CircularProgressIndicator(),
                                  error: (error, stack) => Text('Error: $error'),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryCard(String title, String value, IconData icon, BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15.h),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(0.3),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: Theme.of(context).primaryColor, size: 24),
          SizedBox(width: 20.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  value,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
