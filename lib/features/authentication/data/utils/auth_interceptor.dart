import 'package:dio/dio.dart';

import '../../domain/repository/authentication_repository.dart';

final class AuthInterceptor extends QueuedInterceptor {
  final Dio _dio;
  final AuthenticationRepository _authRepository;

  static const _retriedKey = 'auth_retried';

  AuthInterceptor(this._dio, this._authRepository);

  bool _isAuthPath(String rawPath) {
    final normalizedPath = _normalizePath(rawPath);

    return normalizedPath.startsWith('/v1/auth/');
  }

  String _normalizePath(String raw) {
    final uri = Uri.tryParse(raw);
    final onlyPath = (uri != null && uri.hasScheme) ? uri.path : raw;

    return onlyPath.startsWith('/') ? onlyPath : '/$onlyPath';
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (_isAuthPath(options.path)) {
      return handler.next(options);
    }

    final token = await _authRepository.token;
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final req = err.requestOptions;
    final status = err.response?.statusCode ?? 0;
    final isAuthCall = _isAuthPath(req.path);
    final alreadyRetried = req.extra[_retriedKey] == true;

    if (status == 401 && !isAuthCall && !alreadyRetried) {
      try {
        await _authRepository.refreshToken();

        req.extra = {...req.extra, _retriedKey: true};

        final newToken = await _authRepository.token;
        if (newToken != null && newToken.isNotEmpty) {
          req.headers['Authorization'] = 'Bearer $newToken';
        }

        final response = await _dio.fetch<Map<String, Object?>>(req);

        return handler.resolve(response);
      } on Object catch (_) {
        await _authRepository.logOut();

        return handler.reject(err);
      }
    }

    handler.next(err);
  }
}
