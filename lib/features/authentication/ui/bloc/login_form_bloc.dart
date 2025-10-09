import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import 'login_form_event.dart';
import 'login_form_state.dart';

class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {
  LoginFormBloc() : super(const LoginFormInitial()) {
    on<EmailChangedEvent>(
      _onEmailChanged,
      transformer: (events, mapper) =>
          events.debounceTime(_debounceDuration).switchMap(mapper),
    );
    on<PasswordChangedEvent>(
      _onPasswordChanged,
      transformer: (events, mapper) =>
          events.debounceTime(_debounceDuration).switchMap(mapper),
    );
    on<SubmitPressedEvent>(
      _onSubmitPressed,
      transformer: droppable(),
    );
  }

  static const _debounceDuration = Duration(milliseconds: 500);
  static const int minLen = 8;

  // static final RegExp _unicodeLetter = RegExp(r'\p{L}', unicode: true);
  // static final RegExp _unicodeDigit = RegExp(r'\p{N}', unicode: true);

  static final RegExp _emailRegExp = RegExp(
    r'^[\p{L}\p{N}._%+\-]+@(?:[\p{L}\p{N}](?:[\p{L}\p{N}\-]{0,61}[\p{L}\p{N}])?\.)+[\p{L}]{2,}$',
    unicode: true,
    caseSensitive: false,
  );

  void _onEmailChanged(EmailChangedEvent event, Emitter<LoginFormState> emit) {
    final email = event.value;
    final password = state.password;

    final emailError = _validateEmail(email);
    final passwordIsValid =
        _validatePassword(password) == null && password.isNotEmpty;

    if (email.isEmpty && password.isEmpty) {
      emit(LoginFormInitial(email: email, password: password));
    } else if (emailError == null && passwordIsValid) {
      emit(LoginFormSuccess(email: email, password: password));
    } else {
      emit(
        LoginFormFailure(
          email: email,
          password: password,
          emailStatus: emailError,
          passwordStatus: state.passwordStatus,
        ),
      );
    }
  }

  void _onPasswordChanged(
    PasswordChangedEvent event,
    Emitter<LoginFormState> emit,
  ) {
    final email = state.email;
    final password = event.value;

    final passwordError = _validatePassword(password);
    final emailIsValid = _validateEmail(email) == null && email.isNotEmpty;

    if (email.isEmpty && password.isEmpty) {
      emit(LoginFormInitial(email: email, password: password));
    } else if (passwordError == null && emailIsValid) {
      emit(LoginFormSuccess(email: email, password: password));
    } else {
      emit(
        LoginFormFailure(
          email: email,
          password: password,
          emailStatus: state.emailStatus,
          passwordStatus: passwordError,
        ),
      );
    }
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

  (EmailInvalidStatus?, PasswordInvalidStatus?) _validate(
    String email,
    String password,
  ) {
    final emailError = _validateEmail(email);
    final passwordError = _validatePassword(password);

    return (emailError, passwordError);
  }

  EmailInvalidStatus? _validateEmail(String email) {
    final trimmed = email.trim();
    if (trimmed.isEmpty) return EmailInvalidStatus.empty;
    if (!_emailRegExp.hasMatch(trimmed)) return EmailInvalidStatus.invalid;

    return null;
  }

  PasswordInvalidStatus? _validatePassword(String password) {
    if (password.isEmpty) return PasswordInvalidStatus.empty;
    if (password.length < minLen) return PasswordInvalidStatus.tooShort;

    // final hasLetter = _unicodeLetter.hasMatch(password);
    // final hasDigit = _unicodeDigit.hasMatch(password);
    // if (!hasLetter) return PasswordInvalidStatus.needLetter;
    // if (!hasDigit) return PasswordInvalidStatus.needDigit;

    return null;
  }
}
