import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:health_device/src/application/providers/user_type.dart';
import 'package:health_device/src/config/app_constants.dart';
import 'package:health_device/src/config/enum/user_types.dart';
import 'package:health_device/src/config/theme.dart';
import 'package:health_device/src/features/auth/presentation/login.dart';
import 'package:health_device/src/features/auth/provider/auth_provider.dart';
import 'package:health_device/src/shared/widgets/appbar.dart';
import 'package:health_device/src/shared/widgets/theme_card.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  static final path = '/settings-page';

  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  bool isNotificationOn = true;
  bool isDarkModeOn = true;
  final Widget _divider = Divider(height: 0.1);

  @override
  Widget build(BuildContext context) {
    final userType = ref.watch(userTypeNotifierProvider);
    return Scaffold(
      appBar:
          userType == UserType.admin
              ? GradientAppBar(title: AppConstants.APP_NAME)
              : null,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      singSettingRow(
                        Icon(
                          Icons.notifications,
                          color: AppTheme.textColorGray,
                          size: 20,
                        ),
                        "Notification",
                        "Get alerts for new assignments",
                        Switch(
                          value: isNotificationOn,
                          onChanged: (value) {
                            setState(() {
                              isNotificationOn = value;
                            });
                          },
                        ),
                        context,
                      ),
                      // _divider,
                      singSettingRow(
                        Icon(
                          Icons.nightlight_round_rounded,
                          color: AppTheme.textColorGray,
                          size: 20,
                        ),
                        "Dark Mode",
                        "Switch to dark theme",
                        Switch(
                          value: isDarkModeOn,
                          onChanged: (value) {
                            setState(() {
                              isDarkModeOn = value;
                            });
                          },
                        ),
                        context,
                      ),
                      // _divider,
                      Material(
                        child: InkWell(
                          child: singSettingRow(
                            Icon(
                              Icons.g_translate,
                              color: AppTheme.textColorGray,
                              size: 20,
                            ),
                            "Language",
                            "Change app language",
                            Icon(Icons.arrow_forward_ios, size: 20),
                            context,
                          ),
                          onTap: () {},
                        ),
                      ),
                      // _divider,
                      Material(
                        child: InkWell(
                          child: singSettingRow(
                            Icon(
                              Icons.privacy_tip,
                              color: AppTheme.textColorGray,
                              size: 20,
                            ),
                            "Privacy",
                            "Manage your privacy settings",
                            Icon(Icons.arrow_forward_ios, size: 20),
                            context,
                          ), onTap: () {},
                        ),
                      ),

                      Material(
                        child: InkWell(
                          child: singSettingRow(
                            Icon(
                              Icons.logout,
                              color: AppTheme.textColorGray,
                              size: 20,
                            ),
                            "Sign Out",
                            "Log out of your account",
                            SizedBox(),
                            context,
                            hideBottomBorder: true,
                          ),
                          onTap: () {
                            ref.read(authProviderProvider.notifier).logout();
                            if(mounted){
                              context.pushReplacement(LoginScreen.path);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget singSettingRow(
    Icon icon,
    String title,
    String subtitle,
    Widget widget,
    BuildContext context, {
    bool? hideBottomBorder,
  }) {
    return Container(
      decoration: BoxDecoration(
        border:
            hideBottomBorder == true
                ? null
                : Border(
                  bottom: BorderSide(
                    color:
                        AppTheme
                            .borderGrey, // Set the color of the bottom border
                    width: 2.0, // Set the width of the bottom border
                  ),
                ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        padding: EdgeInsets.only(top: 10.h, bottom: 10.h),

        child: Row(
          children: [
            icon,
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 20.w, right: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppTheme.textColorLightGray,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            widget,
          ],
        ),
      ),
    );
  }
}
