sealed class LoginFormEvent {
  const LoginFormEvent();
}

final class EmailChangedEvent extends LoginFormEvent {
  const EmailChangedEvent({required this.value});

  final String value;
}

final class PasswordChangedEvent extends LoginFormEvent {
  const PasswordChangedEvent({required this.value});

  final String value;
}

final class SubmitPressedEvent extends LoginFormEvent {
  const SubmitPressedEvent();
}
