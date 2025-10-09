import 'package:dio/dio.dart';

import '../models/login_response.dart';
import '../models/login_with_email_and_password_request.dart';

part 'api_params.dart';

sealed class AuthenticationApi {
  factory AuthenticationApi(Dio dio) = _AuthenticationApiImpl;

  const AuthenticationApi._();

  Future<Map<String, Object?>> loginWithEmailAndPassword(
    LoginWithEmailAndPasswordRequest dto,
  );

  LoginResponse parseLoginResponse(Map<String, Object?> json) =>
      LoginResponse.fromJson(json);
}

final class _AuthenticationApiImpl extends AuthenticationApi {
  final Dio dio;

  _AuthenticationApiImpl(this.dio) : super._();

  @override
  Future<Map<String, Object?>> loginWithEmailAndPassword(
    LoginWithEmailAndPasswordRequest dto,
  ) async {
    const url = '${ApiParams.baseUrl}${ApiParams.loginPath}';
    try {
      final response = await dio.post<Map<String, dynamic>>(
        url,
        data: dto.toJson(),
        options: Options(
          headers: const {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      final data = response.data ?? const <String, dynamic>{};

      return Map<String, Object?>.from(data);
    } on DioException {
      rethrow;
    }
  }
}

final class MockAuthenticationApi extends AuthenticationApi {
  const MockAuthenticationApi() : super._();

  @override
  Future<Map<String, Object?>> loginWithEmailAndPassword(
    LoginWithEmailAndPasswordRequest dto,
  ) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return <String, Object?>{
      'accessToken': 'mock.access.token',
      'refreshToken': 'mock.refresh.token',
      'isSuccess': true,
      'errorMessage': null,
    };
  }
}
