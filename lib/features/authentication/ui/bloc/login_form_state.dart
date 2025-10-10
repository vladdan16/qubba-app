enum EmailInvalidStatus { empty, invalid }

enum PasswordInvalidStatus { empty, tooShort, needLetter, needDigit }

sealed class LoginFormState {
  final String email;
  final String password;

  const LoginFormState({
    required this.email,
    required this.password,
  });

  EmailInvalidStatus? get emailStatus => null;

  PasswordInvalidStatus? get passwordStatus => null;

  bool get isValid =>
      email.isNotEmpty &&
      password.isNotEmpty &&
      emailStatus == null &&
      passwordStatus == null;
}

final class LoginFormInitial extends LoginFormState {
  const LoginFormInitial({
    super.email = '',
    super.password = '',
  });
}

final class LoginFormFilling extends LoginFormState {
  @override
  final EmailInvalidStatus? emailStatus;

  @override
  final PasswordInvalidStatus? passwordStatus;

  const LoginFormFilling({
    super.email = '',
    super.password = '',
    this.emailStatus,
    this.passwordStatus,
  });
}

final class LoginFormLoading extends LoginFormState {
  const LoginFormLoading({
    required super.email,
    required super.password,
  });
}

final class LoginFormFailure extends LoginFormState {
  final String? message;

  const LoginFormFailure({
    required super.email,
    required super.password,
    this.message,
  });
}
