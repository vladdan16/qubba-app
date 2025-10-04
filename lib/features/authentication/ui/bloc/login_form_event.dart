sealed class LoginFormEvent {
  const LoginFormEvent();
}

final class EmailChanged extends LoginFormEvent {
  const EmailChanged({required this.value});

  final String value;
}

final class PasswordChanged extends LoginFormEvent {
  const PasswordChanged({required this.value});

  final String value;
}

final class SubmitPressed extends LoginFormEvent {
  const SubmitPressed();
}
