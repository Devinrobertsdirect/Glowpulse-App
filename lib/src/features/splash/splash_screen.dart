import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_device/src/features/auth/modal/login_user.dart';
import 'package:health_device/src/features/auth/presentation/login.dart';
import 'package:health_device/src/features/auth/provider/auth_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:health_device/src/features/tabs/tabs.dart';

class SplashScreen extends ConsumerWidget {
  static final path = '/';
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    ref.listen<AsyncValue<LoginUser?>>(
      authProviderProvider,
          (previous, next) {
        final user = next.value;
        if (user != null) {
          context.go(TabsScreen.path);
        } else {
          context.go(LoginScreen.path);
        }
      },
    );

    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
