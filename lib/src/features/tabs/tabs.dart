import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_device/src/application/providers/user_type.dart';
import 'package:health_device/src/config/app_constants.dart';
import 'package:health_device/src/config/enum/user_types.dart';

import 'package:health_device/src/features/tabs/home/home.dart';
import 'package:health_device/src/features/tabs/inventory/inventory.dart';
import 'package:health_device/src/features/tabs/profile/profile.dart';
import 'package:health_device/src/features/tabs/reporting/reporting.dart';
import 'package:health_device/src/features/tabs/settings/settings.dart';
import 'package:health_device/src/shared/widgets/appbar.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});
  static final path = '/tabs';

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedIndex = 0;
  // Navigation items

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _getNavItems(UserType userType) {
    List<BottomNavigationBarItem> navItems = [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(
        icon: Icon(Icons.insert_chart_outlined),
        label: 'Reporting',
      ),
      userType == UserType.user
          ? BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          )
          : BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'Inventory',
          ),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
    ];
    return navItems;
  }

  _getPages(int index, UserType userType) {
    final List<Widget> pages = [
      Center(child: HomeScreen()),
      Center(child: ReportingScreen()),
      userType == UserType.user
          ? Center(child: SettingsScreen())
          : Center(child: InventoryScreen()),
      Center(child: ProfileScreen()),
    ];
    return pages[index];
  }

  @override
  Widget build(BuildContext context) {
    final userType = ref.watch(userTypeNotifierProvider);

    return Scaffold(
      appBar: GradientAppBar(
        title: AppConstants.APP_NAME,
        showBackButton: false,
      ),
      body: _getPages(_selectedIndex, userType),
      bottomNavigationBar: BottomNavigationBar(
        items: _getNavItems(userType),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor:
            Theme.of(context).primaryColor, // Highlight color for selected tab
        unselectedItemColor: Colors.grey, // Gray for unselected tabs
        showUnselectedLabels: true, // Ensures labels are always visible
        type: BottomNavigationBarType.fixed, // Keeps icons aligned
        // selectedFontSize: 14.sp,
        // unselectedFontSize: 12.sp,
        selectedLabelStyle: Theme.of(context).textTheme.bodyLarge,
        unselectedLabelStyle: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
