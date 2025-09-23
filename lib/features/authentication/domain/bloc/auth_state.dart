part of 'auth_bloc.dart';

@immutable
sealed class AuthState {
  const AuthState(this.user);

  final User user;
}

final class AuthenticatedAppState extends AuthState {
  final String token;

  const AuthenticatedAppState(super.user, this.token);
}

final class UnauthenticatedAppState extends AuthState {
  const UnauthenticatedAppState() : super(User.empty);
}
