import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:health_device/src/features/auth/presentation/login.dart';
import 'package:health_device/src/features/auth/presentation/signup.dart';
import 'package:health_device/src/features/reset_password/presentation/reset_password.dart';
import 'package:health_device/src/features/splash/splash_screen.dart';
import 'package:health_device/src/features/tabs/home/home.dart';
import 'package:health_device/src/features/tabs/settings/settings.dart';
import 'package:health_device/src/features/tabs/tabs.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../features/auth/provider/auth_provider.dart';
part 'router.g.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter router(Ref ref) {
  final router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: SplashScreen.path,
    routes: [
      GoRoute(
        path: SplashScreen.path,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: LoginScreen.path,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: SignupScreen.path,
        builder: (context, state) => SignupScreen(),
      ),
      GoRoute(path: HomeScreen.path, builder: (context, state) => HomeScreen()),
      GoRoute(
        path: SettingsScreen.path,
        builder: (context, state) => SettingsScreen(),
      ),
      GoRoute(
        path: ResetPasswordScreen.path,
        builder: (context, state) => ResetPasswordScreen(),
      ),
      GoRoute(path: TabsScreen.path, builder: (context, state) => TabsScreen()),
    ],
  );
  ref.onDispose(router.dispose);
  return router;
}
