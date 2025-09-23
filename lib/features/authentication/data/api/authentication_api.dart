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
    // TODO(vladdan16): implement loginWithEmailAndPassword
    // await dio.post<Map<String, Object?>>(
    //   _ApiParams.login,
    //   data: dto.toJson(),
    // );
    await Future<void>.delayed(const Duration(seconds: 1));
    return {};
  }
}

final class MockAuthenticationApi extends AuthenticationApi {
  const MockAuthenticationApi() : super._();

  @override
  Future<Map<String, Object?>> loginWithEmailAndPassword(
    LoginWithEmailAndPasswordRequest dto,
  ) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    // TODO(vladdan16): adjust this mock according to API
    return {
      'token': 'token',
      'refresh_token': 'refreshToken',
    };
  }
}
