
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'secure_storage_provider.g.dart';

/// Secure Storage Service with methods for setting, getting, and deleting values
@riverpod
class SecureStorageService extends _$SecureStorageService {
  @override
  FlutterSecureStorage build() {
    return FlutterSecureStorage();
  }

  /// Set a value
  Future<void> setValue(String key, String value) async {
    await state.write(key: key, value: value);
  }

  /// Get a value
  Future<String?> getValue(String key) async {
    return await state.read(key: key);
  }

  /// Delete a value
  Future<void> deleteValue(String key) async {
    await state.delete(key: key);
  }

  /// Clear all values
  Future<void> clearAll() async {
    await state.deleteAll();
  }
}
