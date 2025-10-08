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

  bool get canSubmit => this is LoginFormSuccess || this is LoginFormSubmitted;

  bool get isSubmitted => this is LoginFormSubmitted;
}

final class LoginFormInitial extends LoginFormState {
  const LoginFormInitial({
    super.email = '',
    super.password = '',
  });
}

final class LoginFormSuccess extends LoginFormState {
  const LoginFormSuccess({
    required super.email,
    required super.password,
  });
}

final class LoginFormSubmitted extends LoginFormState {
  const LoginFormSubmitted({
    required super.email,
    required super.password,
  });
}

final class LoginFormFailure extends LoginFormState {
  @override
  final EmailInvalidStatus? emailStatus;

  @override
  final PasswordInvalidStatus? passwordStatus;

  const LoginFormFailure({
    required super.email,
    required super.password,
    this.emailStatus,
    this.passwordStatus,
  });
}
