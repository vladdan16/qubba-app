part of 'auth_bloc.dart';

sealed class AuthEvent {
  const AuthEvent();
}

class LogoutRequested extends AuthEvent {
  const LogoutRequested();
}

class _UserChanged extends AuthEvent {
  final User user;
  final String token;

  const _UserChanged({
    required this.user,
    required this.token,
  });
}
