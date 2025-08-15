import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:health_device/src/config/theme.dart';

final themeProvider = StateNotifierProvider<ThemeNotifier, bool>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<bool> {
  ThemeNotifier() : super(false) {
    _loadTheme();
  }

  static const _storage = FlutterSecureStorage();
  static const _themeKey = 'isDarkMode';

  Future<void> _loadTheme() async {
    final isDark = await _storage.read(key: _themeKey);
    if (isDark != null) {
      state = isDark == 'true';
    }
  }

  Future<void> toggleTheme() async {
    state = !state;
    await _storage.write(key: _themeKey, value: state.toString());
  }

  Future<void> setTheme(bool isDark) async {
    state = isDark;
    await _storage.write(key: _themeKey, value: state.toString());
  }
}

final currentThemeProvider = Provider<ThemeData>((ref) {
  final isDark = ref.watch(themeProvider);
  return isDark ? AppTheme.darkTheme : AppTheme.lightTheme;
});
