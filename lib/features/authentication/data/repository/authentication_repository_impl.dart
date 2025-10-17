import 'dart:async';
import 'dart:developer';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../domain/models/login_error.dart';
import '../../domain/models/refresh_error.dart';
import '../../domain/models/user.dart';
import '../../domain/repository/authentication_repository.dart';
import '../api/authentication_api.dart';
import '../models/login_with_email_and_password_request.dart';
import '../models/refresh_request.dart';

final class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationApi _authenticationApi;
  final FlutterSecureStorage _secureStorage;

  static const _tokenKey = 'auth_token';
  static const _refreshTokenKey = 'refresh_token';
  static const _userIdKey = 'user_id';

  User _currentUser = User.empty;

  final _controller = StreamController<User>.broadcast();

  AuthenticationRepositoryImpl(
    this._authenticationApi,
    this._secureStorage,
  );

  @override
  User get currentUser => _currentUser;

  @override
  Stream<User> get user async* {
    final savedUser = await _loadUser();
    if (savedUser != null) {
      yield savedUser;
    }

    yield* _controller.stream;
  }

  Future<String?> get _refreshToken =>
      _secureStorage.read(key: _refreshTokenKey);

  @override
  Future<String?> get token => _secureStorage.read(key: _tokenKey);

  @override
  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final requestDto = LoginWithEmailAndPasswordRequest(
      email: email,
      password: password,
    );

    try {
      final responseJson = await _authenticationApi.loginWithEmailAndPassword(
        requestDto,
      );

      final authResponse = _authenticationApi.parseAuthResponse(responseJson);

      final data = authResponse.data;
      if (data == null) {
        throw LoginError(
          authResponse.details ?? 'Login failed',
        );
      }

      await _saveTokens(
        data.accessToken.isNotEmpty
            ? data.accessToken
            : (throw Exception('AccessToken is empty')),
        data.refreshToken.isNotEmpty
            ? data.refreshToken
            : (throw Exception('RefreshToken is empty')),
      );

      // TODO(vladdan16): change this to real user model
      _currentUser = User(id: email);
    } on Object catch (e, s) {
      log('Login error: e: $e, s: $s');
      _currentUser = User.empty;
      rethrow;
    } finally {
      await _saveUser(_currentUser);
      _controller.add(_currentUser);
    }
  }

  @override
  Future<void> logOut() async {
    await _clearAll();
    _currentUser = User.empty;
    await _saveUser(_currentUser);
    _controller.add(_currentUser);
  }

  @override
  Future<void> refreshToken() async {
    final refreshToken = await _refreshToken;
    if (refreshToken == null || refreshToken.isEmpty) {
      throw RefreshError(
        'Refresh token is empty; cannot refresh',
        StackTrace.current,
      );
    }

    try {
      final request = RefreshRequest(refreshToken: refreshToken);

      final response = await _authenticationApi.refresh(request);
      final authResponse = _authenticationApi.parseAuthResponse(response);

      final data = authResponse.data;
      if (data == null) {
        throw RefreshError(
          authResponse.details ?? 'Refresh failed',
          StackTrace.current,
        );
      }

      await _saveTokens(
        data.accessToken.isNotEmpty
            ? data.accessToken
            : (throw Exception('AccessToken is empty')),
        data.refreshToken.isNotEmpty
            ? data.refreshToken
            : (throw Exception('RefreshToken is empty')),
      );
    } on RefreshError {
      rethrow;
    } on Object catch (e, s) {
      throw RefreshError(e, s);
    }
  }

  // TODO(vladdan16): make user saving and retrieving correct
  Future<void> _saveUser(User user) =>
      _secureStorage.write(key: _userIdKey, value: user.id);

  Future<User?> _loadUser() async {
    final userId = await _secureStorage.read(key: _userIdKey);
    if (userId != null) {
      return User(id: userId);
    }
    return null;
  }

  Future<void> _saveTokens(String token, String refreshToken) => [
    _secureStorage.write(key: _tokenKey, value: token),
    _secureStorage.write(key: _refreshTokenKey, value: refreshToken),
  ].wait;

  Future<void> _clearAll() => [
    _secureStorage.delete(key: _tokenKey),
    _secureStorage.delete(key: _refreshTokenKey),
  ].wait;

  @override
  Future<void> dispose() async {
    await _controller.close();
  }
}
