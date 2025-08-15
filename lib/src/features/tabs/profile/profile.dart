import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_device/src/config/theme.dart';

import 'package:health_device/src/shared/widgets/theme_card.dart';

class ProfileScreen extends StatefulWidget {
  static final path = '/profile';
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final Widget _divider = Padding(
    padding: EdgeInsets.symmetric(vertical: 5),
    child: Divider(),
  );
  @override
  Widget build(BuildContext context) {
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
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(color: AppTheme.borderGrey,
                        borderRadius: BorderRadius.circular(150)
                        ),
                        child: Icon(Icons.person,size: 70,color: AppTheme.textColorLightGray2,),
                        height: 120,
                        width: 120,
                      ),
                      SizedBox(height: 10.h,),
                      Text("Jhon Smith",style: Theme.of(context).textTheme.headlineMedium,),
                      Text("Trade Show Representative",style: Theme.of(context).textTheme.bodyLarge,),
                      SizedBox(height: 10.h,),
                    ],
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
                        singProfileRow(
                          Icons.email,

                          "Email",
                          "john.smith@company.com",
                          context,
                        ),
                        _divider,
                        singProfileRow(
                          Icons.phone,

                          "Phone",
                          "+1 (555) 123-4567",
                          context,
                        ),
                        _divider,
                        singProfileRow(
                          Icons.contact_phone,

                          "Employee ID",
                          "EMP1234",
                          context,
                        ),
                        _divider,
                        singProfileRow(
                          Icons.business,

                          "Department",
                          "Sales",
                          context,
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

  Widget singProfileRow(
    IconData icon,
    String title,
    String subtitle,
    BuildContext context,
  ) {
    return Row(
      children: [

        Icon(
          icon,
          color: Theme.of(context).primaryColor,
          size: 20,
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        Spacer(),
        Text(
          subtitle,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600,
          color: AppTheme.headingColor
          ),
        ),

      ],
    );
  }
}
