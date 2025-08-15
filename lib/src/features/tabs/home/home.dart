import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_device/src/config/theme.dart';
import 'package:health_device/src/shared/widgets/appButton.dart';
import 'package:health_device/src/shared/widgets/theme_card.dart';

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
                        Text(
                          "Today's Assignment",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        SizedBox(height: 10.h),
                        itemTile(
                          Icons.pin_drop_rounded,
                          'Booth #2034, Hall B',
                          context,
                        ),
                        SizedBox(height: 7.h),
                        itemTile(
                          Icons.home,
                          'Product: Smart Home Suite 2025',
                          context,
                        ),
                        SizedBox(height: 7.h),
                        itemTile(
                          Icons.access_time_outlined,
                          'Time: 9:00 AM - 5:00 PM',
                          context,
                        ),
                        SizedBox(height: 7.h),
                        itemTile(
                          Icons.business,
                          'Location: Convention Center, West Wing',
                          context,
                        ),
                        SizedBox(height: 7.h),
                        _verticalSpacer,

                        AppButton(
                          title: 'Create Shipping Order',
                          onTap: () {
                            // context.push(TabsScreen.path);
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
}
