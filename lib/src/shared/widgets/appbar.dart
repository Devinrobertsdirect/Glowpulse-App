import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:health_device/src/application/providers/user_type.dart';
import 'package:health_device/src/config/enum/user_types.dart';
import 'package:health_device/src/config/router.dart';
import 'package:health_device/src/config/theme.dart';
import 'package:health_device/src/features/auth/presentation/signup.dart';
import 'package:health_device/src/features/tabs/settings/settings.dart';

import 'package:health_device/src/shared/widgets/gradient_decoration.dart';

class GradientAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final String title;
final bool showBackButton;
   GradientAppBar({super.key, required this.title,this.showBackButton=false});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final appTitle =Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold));
    final userType = ref.watch(userTypeNotifierProvider);
    return AppBar(
      title:userType==UserType.user?appTitle: Row(

        children: [
          Container(
            decoration: BoxDecoration(
              color: AppTheme.appWhite.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(100),
              
              
            ),
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            child: Text('Admin access',style: TextStyle(fontSize: 11.sp),),
          ),
          SizedBox(width: 20.w,),
          appTitle
        ],
      ),
      centerTitle: true,
      flexibleSpace: Container(
        decoration: getGradientDecoration(context),
      ),
      elevation: 0,
      automaticallyImplyLeading: showBackButton==true,

      actions:userType==UserType.user?[]: [
        IconButton(
          icon: Icon(Icons.settings, color: AppTheme.appWhite),  // Settings icon
          onPressed: () {
           navigatorKey.currentContext?.push(SettingsScreen.path);
          },
        ),

      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}


