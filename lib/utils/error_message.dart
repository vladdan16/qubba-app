import 'package:dio/dio.dart';

String errorMessage(Object error) {
  if (error is DioException) {
    final response = error.response;
    if (response == null) {
      return switch (error.type) {
        DioExceptionType.connectionTimeout ||
        DioExceptionType.sendTimeout ||
        DioExceptionType.receiveTimeout => 'Connection timed out',
        DioExceptionType.connectionError => 'No internet connection',
        DioExceptionType.cancel => 'Request cancelled',
        _ => 'Network error',
      };
    }
    final data = response.data;
    if (data is Map) {
      final msg = data['detail'] ?? data['message'] ?? data['error'];
      if (msg is String && msg.isNotEmpty) return msg;
    }
    return 'Server error (${response.statusCode})';
  }
  return error.toString();
}
