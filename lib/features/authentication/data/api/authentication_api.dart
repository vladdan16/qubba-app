import 'package:dio/dio.dart';

import '../../../../utils/require_data.dart';
import '../models/auth_response.dart';
import '../models/login_with_email_and_password_request.dart';
import '../models/refresh_request.dart';

part 'api_params.dart';

sealed class AuthenticationApi {
  factory AuthenticationApi(Dio dio) = _AuthenticationApiImpl;

  const AuthenticationApi._();

  Future<Map<String, Object?>> loginWithEmailAndPassword(
    LoginWithEmailAndPasswordRequest dto,
  );

  Future<Map<String, Object?>> refresh(RefreshRequest dto);

  AuthResponse parseAuthResponse(Map<String, Object?> json) =>
      AuthResponse.fromJson(json);
}

final class _AuthenticationApiImpl extends AuthenticationApi {
  final Dio dio;

  _AuthenticationApiImpl(this.dio) : super._();

  @override
  Future<Map<String, Object?>> loginWithEmailAndPassword(
    LoginWithEmailAndPasswordRequest dto,
  ) async {
    final response = await dio.post<Map<String, Object?>>(
      _ApiParams.loginPath,
      data: dto.toJson(),
    );

    return response.requireData;
  }

  @override
  Future<Map<String, Object?>> refresh(RefreshRequest dto) async {
    final response = await dio.post<Map<String, Object?>>(
      _ApiParams.refreshPath,
      data: dto.toJson(),
    );

    return response.requireData;
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

  @override
  Future<Map<String, Object?>> refresh(RefreshRequest dto) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return <String, Object?>{
      'accessToken': 'mock.access.token',
      'refreshToken': 'mock.refresh.token',
      'isSuccess': true,
      'errorMessage': null,
    };
  }
}
