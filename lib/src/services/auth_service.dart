import 'package:dio/dio.dart';
import 'package:health_device/src/core/network/dio_client.dart';

class AuthService {
  final DioClient dioClient = DioClient(Dio());

  AuthService();

  /// User Login
  Future<Map<String, dynamic>> login(String identifier, String password) async {
    try {
      final response = await dioClient.post(
        "/api/auth/login",
        data: {
          "email": identifier,
          "password": password,
        },
      );

      return response.data;
    } catch (e) {
      throw e;

    }
  }

  /// User Signup
  Future<Map<String, dynamic>> signup(
      String username, String email, String password, String fullName) async {
    try {
      final response = await dioClient.post(
        "/api/auth/signup",
        data: {
          "name": fullName,
          "email": email,
          "password": password,
        },
      );
      print('e.response');
      return response.data;
    }catch (e) {
      // print(e?.response);
      throw e;
    }
  }
}
