import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;

  DioClient(this.dio) {
    dio.options = BaseOptions(
      // Production backend URL - deployed on Render
      baseUrl: "https://glowpulse-backend.onrender.com/api",
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
      // Extract meaningful error message safely for JSON or String bodies
      String errorMessage = "Something went wrong";

      if (e.response != null) {
        final body = e.response!.data;
        if (body is Map<String, dynamic>) {
          final maybeMessage = body["error"] is Map<String, dynamic>
              ? (body["error"]["message"] as String?)
              : (body["message"] as String?);
          if (maybeMessage != null && maybeMessage.isNotEmpty) {
            errorMessage = maybeMessage;
          } else {
            errorMessage = "Error: ${e.response!.statusCode} ${e.response!.statusMessage}";
          }
        } else if (body is String) {
          // Truncate long HTML/text errors
          errorMessage = body.length > 140 ? body.substring(0, 140) + '…' : body;
        } else {
          errorMessage = "Error: ${e.response!.statusCode} ${e.response!.statusMessage}";
        }
      } else if (e.message != null) {
        errorMessage = e.message!;
      }

      throw Exception(errorMessage);
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
