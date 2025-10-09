import '../models/auth_tokens.dart';
import '../models/user.dart';

sealed class AuthState {
  const AuthState();
}

final class AuthUnknown extends AuthState {
  const AuthUnknown();
}

final class AuthLoading extends AuthState {
  const AuthLoading();
}

final class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated();
}

final class AuthAuthenticated extends AuthState {
  const AuthAuthenticated({required this.user, required this.tokens});

  final User user;
  final AuthTokens tokens;
}

final class AuthFailure extends AuthState {
  const AuthFailure(this.message);

  final String message;
}
