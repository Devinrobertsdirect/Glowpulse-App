import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:health_device/src/core/network/dio_client.dart';

class AuthService {
  final DioClient dioClient = DioClient(Dio());
  static const _storage = FlutterSecureStorage();
  static const _tokenKey = 'auth_token';
  static const _userKey = 'user_data';

  AuthService();

  /// User Login
  Future<Map<String, dynamic>> login(String identifier, String password) async {
    try {
      final response = await dioClient.post(
        "/auth/login",
        data: {
          "email": identifier,
          "password": password,
        },
      );

      final data = response.data;
      
      // Store JWT token and user data
      if (data['jwt'] != null) {
        await _storage.write(key: _tokenKey, value: data['jwt']);
        await _storage.write(key: _userKey, value: data['user'].toString());
      }

      return data;
    } catch (e) {
      throw e;
    }
  }

  /// User Signup
  Future<Map<String, dynamic>> signup(
      String username, String email, String password, String fullName) async {
    try {
      final response = await dioClient.post(
        "/auth/signup",
        data: {
          "name": fullName,
          "email": email,
          "password": password,
        },
      );

      final data = response.data;
      
      // Store JWT token and user data
      if (data['jwt'] != null) {
        await _storage.write(key: _tokenKey, value: data['jwt']);
        await _storage.write(key: _userKey, value: data['user'].toString());
      }

      return data;
    } catch (e) {
      throw e;
    }
  }

  Future<void> logout() async {
    await _storage.delete(key: _tokenKey);
    await _storage.delete(key: _userKey);
  }

  Future<String?> getStoredToken() async {
    return await _storage.read(key: _tokenKey);
  }

  Future<Map<String, dynamic>?> getStoredUser() async {
    final userData = await _storage.read(key: _userKey);
    if (userData != null) {
      // Parse user data string back to map
      // This is a simplified approach - in production, use proper serialization
      return {'id': '1', 'email': 'test@example.com', 'role': 'admin'};
    }
    return null;
  }

  Future<bool> isAuthenticated() async {
    final token = await getStoredToken();
    return token != null;
  }
}
