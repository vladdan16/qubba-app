import 'package:dio/dio.dart';

import '../../domain/repository/authentication_repository.dart';

final class AuthInterceptor extends QueuedInterceptor {
  final Dio _dio;
  final AuthenticationRepository _authRepository;

  static const _authUrl = 'https://api.qubba.io/';

  AuthInterceptor(this._dio, this._authRepository);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.baseUrl == _authUrl) {
      return handler.next(options);
    }

    final token = await _authRepository.token;

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    return handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      try {
        await _authRepository.refreshToken();

        final options = err.requestOptions;
        final newToken = await _authRepository.token;
        options.headers['Authorization'] = 'Bearer $newToken';

        final response = await _dio.fetch<Map<String, Object?>>(options);
        return handler.resolve(response);
      } on Object catch (_) {
        await _authRepository.logOut();
        return handler.reject(err);
      }
    }

    return handler.next(err);
  }
}
