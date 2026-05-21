import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// Retries once when the server closes the connection before sending headers.
/// This is a transient network/server-side condition (stale keep-alive,
/// proxy reset, brief server hiccup) and is safe to retry transparently.
final class RetryOnConnectionClosedInterceptor extends Interceptor {
  RetryOnConnectionClosedInterceptor(this._dio);

  final Dio _dio;

  static const _retriedKey = 'connection_closed_retried';

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final error = err.error;
    final isConnectionClosed =
        err.type == DioExceptionType.unknown &&
        error is HttpException &&
        error.message.contains(
          'Connection closed before full header was received',
        );

    final alreadyRetried = err.requestOptions.extra[_retriedKey] == true;

    if (isConnectionClosed && !alreadyRetried) {
      debugPrint(
        '[network] connection closed before full header — retrying: '
        '${err.requestOptions.uri}',
      );

      try {
        final req = err.requestOptions
          ..extra = {...err.requestOptions.extra, _retriedKey: true};
        final response = await _dio.fetch<Object?>(req);
        return handler.resolve(response);
      } on Object catch (_) {
        return handler.next(err);
      }
    }

    handler.next(err);
  }
}
