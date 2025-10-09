import '../models/auth_tokens.dart';
import '../models/user.dart';

sealed class AuthEvent {
  const AuthEvent();
}

final class AuthLoginRequestedEvent extends AuthEvent {
  const AuthLoginRequestedEvent({required this.email, required this.password});

  final String email;
  final String password;
}

final class AuthLogoutRequestedEvent extends AuthEvent {
  const AuthLogoutRequestedEvent();
}

final class AuthUserChangedEvent extends AuthEvent {
  const AuthUserChangedEvent(this.user, this.tokens);

  final User user;
  final AuthTokens tokens;
}
