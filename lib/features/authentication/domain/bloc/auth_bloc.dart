import 'dart:async';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/auth_tokens.dart';
import '../models/user.dart';
import '../repository/authentication_repository.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._repo) : super(const AuthUnknown()) {
    _subscription = _repo.user.listen((pair) {
      final user = pair.$1;
      final tokens = pair.$2;
      add(AuthUserChangedEvent(user, tokens));
    });

    on<AuthLoginRequestedEvent>(
      _onLoginRequested,
      transformer: droppable(),
    );
    on<AuthLogoutRequestedEvent>(_onLogoutRequested);
    on<AuthUserChangedEvent>(_onUserChanged);
  }

  final AuthenticationRepository _repo;
  StreamSubscription<(User, AuthTokens)>? _subscription;

  Future<void> _onLoginRequested(
    AuthLoginRequestedEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      await _repo.loginWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
    } on DioException catch (_) {
      emit(const AuthFailure('Login failed'));
    } on Object catch (_) {
      emit(const AuthFailure('Login failed'));
    }
  }

  Future<void> _onLogoutRequested(
    AuthLogoutRequestedEvent event,
    Emitter<AuthState> emit,
  ) async {
    await _repo.logOut();
  }

  void _onUserChanged(
    AuthUserChangedEvent event,
    Emitter<AuthState> emit,
  ) {
    if (event.tokens.accessToken.isEmpty) {
      emit(const AuthUnauthenticated());
    } else {
      emit(AuthAuthenticated(user: event.user, tokens: event.tokens));
    }
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
