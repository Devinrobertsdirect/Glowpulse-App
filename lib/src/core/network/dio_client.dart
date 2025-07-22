import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;

  DioClient(this.dio) {
    dio.options = BaseOptions(
      baseUrl: "https://YOUR-BACKEND-URL/api",
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      headers: {"Content-Type": "application/json"},
    );
  }

  /// GET request
  Future<Response> get(String url, {Map<String, dynamic>? params}) async {
    try {
      return await dio.get(url, queryParameters: params);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// POST request
  Future<Response> post(String url, {dynamic data}) async {
    try {
      return await dio.post(url, data: data);
    } on DioException catch (e) {
      // Extract meaningful error message
      String errorMessage = "Something went wrong";

      if (e.response != null && e.response?.data != null) {
        final errorData = e.response?.data;
        errorMessage = errorData["error"]?["message"] ?? "Unexpected error";
      }

      print("DioException: $errorMessage");

      // Throw a custom exception with the extracted message
      throw errorMessage;
    }
  }

  /// PUT request (Update)
  Future<Response> put(String url, {dynamic data}) async {
    try {
      return await dio.put(url, data: data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// DELETE request
  Future<Response> delete(String url, {dynamic data}) async {
    try {
      return await dio.delete(url, data: data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Error Handling
  Exception _handleError(DioException e) {
    if (e.response != null) {
      return Exception("Error: ${e.response?.statusCode} - ${e.response?.statusMessage}");
    } else {
      return Exception("Network Error: ${e.message}");
    }
  }

}
