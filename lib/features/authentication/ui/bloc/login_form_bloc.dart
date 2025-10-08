import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_form_event.dart';
import 'login_form_state.dart';

class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {
  LoginFormBloc() : super(const LoginFormInitial()) {
    on<EmailChangedEvent>(_onEmailChanged);
    on<PasswordChangedEvent>(_onPasswordChanged);
    on<SubmitPressedEvent>(_onSubmitPressed);
  }

  static const int minLen = 8;
  static final RegExp _unicodeLetter = RegExp(r'\p{L}', unicode: true);
  static final RegExp _unicodeDigit = RegExp(r'\p{N}', unicode: true);
  static final RegExp _emailRegExp = RegExp(
    r'^[\p{L}\p{N}._%+\-]+@(?:[\p{L}\p{N}](?:[\p{L}\p{N}\-]{0,61}[\p{L}\p{N}])?\.)+[\p{L}]{2,}$',
    unicode: true,
    caseSensitive: false,
  );

  void _onEmailChanged(EmailChangedEvent event, Emitter<LoginFormState> emit) {
    final password = state.password;
    _emitValidated(event.value, password, emit);
  }

  void _onPasswordChanged(
    PasswordChangedEvent event,
    Emitter<LoginFormState> emit,
  ) {
    final email = state.email;
    _emitValidated(email, event.value, emit);
  }

  void _onSubmitPressed(
    SubmitPressedEvent event,
    Emitter<LoginFormState> emit,
  ) {
    final email = state.email;
    final password = state.password;

    final (emailError, passwordError) = _validate(email, password);
    if (emailError == null && passwordError == null) {
      emit(LoginFormSubmitted(email: email, password: password));
    } else {
      emit(
        LoginFormFailure(
          email: email,
          password: password,
          emailStatus: emailError,
          passwordStatus: passwordError,
        ),
      );
    }
  }

  void _emitValidated(
    String email,
    String password,
    Emitter<LoginFormState> emit,
  ) {
    final (emailError, passwordError) = _validate(email, password);

    if (email.isEmpty && password.isEmpty) {
      emit(LoginFormInitial(email: email, password: password));
    } else if (emailError == null && passwordError == null) {
      emit(LoginFormSuccess(email: email, password: password));
    } else {
      emit(
        LoginFormFailure(
          email: email,
          password: password,
          emailStatus: emailError,
          passwordStatus: passwordError,
        ),
      );
    }
  }

  (EmailInvalidStatus?, PasswordInvalidStatus?) _validate(
    String email,
    String password,
  ) {
    EmailInvalidStatus? emailError;
    PasswordInvalidStatus? passwordError;

    final trimmed = email.trim();
    if (trimmed.isEmpty) {
      emailError = EmailInvalidStatus.empty;
    } else if (!_emailRegExp.hasMatch(trimmed)) {
      emailError = EmailInvalidStatus.invalid;
    }

    if (password.isEmpty) {
      passwordError = PasswordInvalidStatus.empty;
    } else if (password.length < minLen) {
      passwordError = PasswordInvalidStatus.tooShort;
    } else {
      final hasLetter = _unicodeLetter.hasMatch(password);
      final hasDigit = _unicodeDigit.hasMatch(password);
      if (!hasLetter) {
        passwordError = PasswordInvalidStatus.needLetter;
      } else if (!hasDigit) {
        passwordError = PasswordInvalidStatus.needDigit;
      }
    }

    return (emailError, passwordError);
  }
}
