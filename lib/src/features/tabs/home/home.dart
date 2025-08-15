import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_device/src/config/theme.dart';
import 'package:health_device/src/shared/widgets/appButton.dart';
import 'package:health_device/src/shared/widgets/theme_card.dart';
import 'package:health_device/src/features/trade_shows/provider/trade_show_provider.dart';
import 'package:health_device/src/features/shipping/provider/shipping_provider.dart';
import 'package:health_device/src/features/trade_shows/models/trade_show.dart';
import 'package:health_device/src/features/shipping/models/shipping_order.dart';

class HomeScreen extends ConsumerWidget {
  static final path = '/home';
  HomeScreen({super.key});
  final Widget _verticalSpacer = SizedBox(height: 15.h);
  @override
  Widget build(BuildContext context,WidgetRef ref) {

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
                    boxShadow: [
                      boxShadowWidget()
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome back, User!",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        _verticalSpacer,
                        Text(
                          "Here's your trade show assignment for today",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        _verticalSpacer,
                        Consumer(
                          builder: (context, ref, child) {
                            final bookingsAsync = ref.watch(userBookingsProvider);
                            
                            return bookingsAsync.when(
                              data: (bookings) {
                                if (bookings.isEmpty) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "No Active Assignments",
                                        style: Theme.of(context).textTheme.headlineSmall,
                                      ),
                                      SizedBox(height: 10.h),
                                      Text(
                                        "Book a trade show to get started",
                                        style: Theme.of(context).textTheme.bodyMedium,
                                      ),
                                      SizedBox(height: 10.h),
                                      AppButton(
                                        title: 'Book Trade Show',
                                        onTap: () {
                                          _showBookTradeShowDialog(context, ref);
                                        },
                                        padding: 7,
                                        size: 14,
                                        planColor: false,
                                        icon: Icon(
                                          Icons.add_business,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  );
                                }
                                
                                final currentBooking = bookings.first;
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Today's Assignment",
                                      style: Theme.of(context).textTheme.headlineSmall,
                                    ),
                                    SizedBox(height: 10.h),
                                    itemTile(
                                      Icons.pin_drop_rounded,
                                      'Booth #${currentBooking.boothNumber}, ${currentBooking.hall}',
                                      context,
                                    ),
                                    SizedBox(height: 7.h),
                                    itemTile(
                                      Icons.home,
                                      'Product: ${currentBooking.product}',
                                      context,
                                    ),
                                    SizedBox(height: 7.h),
                                    itemTile(
                                      Icons.access_time_outlined,
                                      'Time: ${_formatDateRange(currentBooking.startDate, currentBooking.endDate)}',
                                      context,
                                    ),
                                    SizedBox(height: 7.h),
                                    itemTile(
                                      Icons.business,
                                      'Status: ${currentBooking.status.toUpperCase()}',
                                      context,
                                    ),
                                  ],
                                );
                              },
                              loading: () => CircularProgressIndicator(),
                              error: (error, stack) => Text('Error: $error'),
                            );
                          },
                        ),
                        SizedBox(height: 7.h),
                        _verticalSpacer,

                        AppButton(
                          title: 'Create Shipping Order',
                          onTap: () {
                            _showCreateShippingOrderDialog(context, ref);
                          },
                          padding: 7,
                          size: 14,
                          planColor: true,
                          icon: Icon(
                            Icons.local_shipping_outlined,
                            color: Colors.white,
                          ),
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
                    boxShadow: [
                      boxShadowWidget()
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _verticalSpacer,
                        Text(
                          "Travel Information",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),

                        SizedBox(height: 10.h),
                        itemTile(
                          Icons.business,
                          'Hotel: Marriott Downtown \nCheck-in: Feb 15, Check-out: Feb 18',
                          context,
                        ),
                        SizedBox(height: 7.h),
                        itemTile(
                          Icons.airplanemode_on,
                          'Flight: AA1234\nDeparture: Feb 15, 8:00 AM\nReturn: Feb 18,7:30 PM',
                          context,
                        ),
                        SizedBox(height: 7.h),
                        itemTile(
                          Icons.emoji_transportation,
                          'Ground Transport: Enterprise Rental\nConfirmation: RNT789012',
                          context,
                        ),

                        SizedBox(height: 7.h),
                        _verticalSpacer,
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
                    boxShadow: [
                      boxShadowWidget()
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _verticalSpacer,
                        Text(
                          "Upcoming Events",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),

                        SizedBox(height: 20.h),
                        ...eventTile(
                          context,
                          'Feb 15-18, 2025',
                          'Tech Expo 2025 - Chicago',
                        ),
                        SizedBox(height: 10.h),
                        ...eventTile(
                          context,
                          'Feb 25-27, 2025',
                          'Smart Home Summit - Boston',
                        ),
                        SizedBox(height: 10.h),
                        ...eventTile(
                          context,
                          'Mar 5-8, 20255',
                          'IoT World Conference - San Francisco',
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
                    boxShadow: [
                      boxShadowWidget()
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _verticalSpacer,
                        Text(
                          "Admin Bulletin Board",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        _verticalSpacer,
                        adminBulletinBoard(context,'Feb 12, 2025','New product presentation materials available for download'),
                        SizedBox(height: 10.h),
                        adminBulletinBoard(context,'Feb 11, 2025','Updated booth setup guidelines for Chicago Tech Expo'),
                        SizedBox(height: 10.h),
                        adminBulletinBoard(context,'Feb 10, 2025','Reminder: Submit expense reports within 48 hours of event completion'),
                        _verticalSpacer,
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
Widget adminBulletinBoard(BuildContext context, String title, String subtitle){return Container(
  width: double.infinity,
  decoration: BoxDecoration(color: AppTheme.lightRedBg,
    border: Border(
      left: BorderSide(
        color: Theme.of(context).primaryColor,
        width: 5.0,          // Border width
      ),
    ),),
  padding: EdgeInsets.all(10),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          color:AppTheme.textColorLightGray,
        ),
      ),
      Text(
        subtitle,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontSize: 13.sp,
          fontWeight: FontWeight.w600,
          color:Colors.black,
        ),
      ),
    ],
  ),
);

}
  List eventTile(BuildContext context, String heading, String subheading) {
    return [
      Text(
        heading,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontSize: 13.sp,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).primaryColor,
        ),
      ),
      Text(
        subheading,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontSize: 13.sp,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      Divider(color: AppTheme.borderGrey),
    ];
  }

  Widget itemTile(IconData icon, String title, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        Icon(icon, color: Theme.of(context).primaryColor),
        SizedBox(width: 20.w),
        Expanded(
          // Ensures text wraps to new line when needed
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 13.sp,
              color: AppTheme.textColorGray,
            ),
            softWrap: true,
            overflow: TextOverflow.visible,
          ),
        ),
      ],
    );
  }

  String _formatDateRange(DateTime start, DateTime end) {
    if (start.year == end.year && start.month == end.month && start.day == end.day) {
      return '${start.month}/${start.day}/${start.year}';
    }
    return '${start.month}/${start.day}/${start.year} - ${end.month}/${end.day}/${end.year}';
  }

  void _showBookTradeShowDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => BookTradeShowDialog(),
    );
  }

  void _showCreateShippingOrderDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => CreateShippingOrderDialog(),
    );
  }
}

class BookTradeShowDialog extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final availableShows = ref.watch(availableTradeShowsProvider);
    
    return AlertDialog(
      title: Text('Book Trade Show'),
      content: SizedBox(
        width: double.maxFinite,
        child: availableShows.when(
          data: (shows) => ListView.builder(
            shrinkWrap: true,
            itemCount: shows.length,
            itemBuilder: (context, index) {
              final show = shows[index];
              return ListTile(
                title: Text(show.name),
                subtitle: Text('${show.location} - ${show.boothNumber}'),
                trailing: ElevatedButton(
                  onPressed: () {
                    _bookShow(context, ref, show);
                  },
                  child: Text('Book'),
                ),
              );
            },
          ),
          loading: () => CircularProgressIndicator(),
          error: (error, stack) => Text('Error: $error'),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
      ],
    );
  }

  void _bookShow(BuildContext context, WidgetRef ref, TradeShow show) {
    final booking = TradeShowBooking(
      id: '',
      tradeShowId: show.id,
      userId: 'current-user',
      boothNumber: show.boothNumber,
      hall: show.hall,
      startDate: show.startDate,
      endDate: show.endDate,
      product: show.product,
      status: 'pending',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    ref.read(tradeShowBookingsProvider.notifier).bookTradeShow(booking);
    Navigator.of(context).pop();
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Trade show booked successfully!')),
    );
  }
}

class CreateShippingOrderDialog extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final _addressController = TextEditingController();
  final _recipientController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: Text('Create Shipping Order'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Shipping Address'),
              validator: (value) => value?.isEmpty == true ? 'Required' : null,
            ),
            TextFormField(
              controller: _recipientController,
              decoration: InputDecoration(labelText: 'Recipient Name'),
              validator: (value) => value?.isEmpty == true ? 'Required' : null,
            ),
            TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Recipient Phone'),
              validator: (value) => value?.isEmpty == true ? 'Required' : null,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () => _createOrder(context, ref),
          child: Text('Create Order'),
        ),
      ],
    );
  }

  void _createOrder(BuildContext context, WidgetRef ref) {
    if (_formKey.currentState?.validate() == true) {
      final order = ShippingOrder(
        id: '',
        tradeShowId: '1', // TODO: Get from current booking
        userId: 'current-user',
        orderNumber: '',
        status: 'pending',
        shippingAddress: _addressController.text,
        recipientName: _recipientController.text,
        recipientPhone: _phoneController.text,
        carrier: 'FedEx',
        estimatedDelivery: DateTime.now().add(Duration(days: 3)),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        items: [
          ShippingItem(
            id: '1',
            name: 'Smart Home Suite 2025',
            quantity: 1,
            description: 'Complete smart home system',
            weight: 15.5,
            dimensions: '24" x 18" x 12"',
            sku: 'SHS-2025-001',
          ),
        ],
        totalCost: 89.99,
      );

      ref.read(shippingOrdersProvider.notifier).createShippingOrder(order);
      Navigator.of(context).pop();
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Shipping order created successfully!')),
      );
    }
  }
}
