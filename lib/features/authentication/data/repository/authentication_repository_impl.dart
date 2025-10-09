import 'dart:async';
import 'package:dio/dio.dart';
import '../../domain/models/auth_tokens.dart';
import '../../domain/models/user.dart';
import '../../domain/repository/authentication_repository.dart';
import '../api/authentication_api.dart';
import '../models/login_with_email_and_password_request.dart';

final class AuthenticationRepositoryImpl implements AuthenticationRepository {
  AuthenticationRepositoryImpl({
    required AuthenticationApi authenticationApi,
  }) : _authenticationApi = authenticationApi {
    _controller.add((_currentUser, _tokens));
  }

  final AuthenticationApi _authenticationApi;

  User _currentUser = User.empty;
  AuthTokens _tokens = const AuthTokens(accessToken: '', refreshToken: '');

  final _controller = StreamController<(User, AuthTokens)>.broadcast();

  @override
  Stream<(User, AuthTokens)> get user => _controller.stream;

  @override
  User get currentUser => _currentUser;

  @override
  AuthTokens get tokens => _tokens;

  @override
  String get accessToken => _tokens.accessToken;

  @override
  String get refreshToken => _tokens.refreshToken;

  @override
  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final requestDto = LoginWithEmailAndPasswordRequest(
      email: email.trim(),
      password: password,
    );

    final responseJson = await _authenticationApi.loginWithEmailAndPassword(
      requestDto,
    );

    final loginResponse = _authenticationApi.parseLoginResponse(responseJson);

    if (!loginResponse.isSuccess) {
      throw DioException(
        requestOptions: RequestOptions(path: 'auth/login'),
        error: loginResponse.errorMessage ?? 'Login failed',
        response: Response(
          requestOptions: RequestOptions(path: 'auth/login'),
          data: responseJson,
          statusCode: 400,
        ),
      );
    }

    _tokens = AuthTokens(
      accessToken: loginResponse.accessToken,
      refreshToken: loginResponse.refreshToken,
    );

    _currentUser = User.empty;

    _controller.add((_currentUser, _tokens));
  }

  @override
  Future<void> logOut() async {
    _tokens = const AuthTokens(accessToken: '', refreshToken: '');
    _currentUser = User.empty;
    _controller.add((_currentUser, _tokens));
  }

  @override
  Future<void> dispose() async {
    await _controller.close();
  }
}
