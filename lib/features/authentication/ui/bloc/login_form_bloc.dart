import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../domain/models/login_error.dart';
import '../../domain/repository/authentication_repository.dart';
import 'login_form_event.dart';
import 'login_form_state.dart';

class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {
  final AuthenticationRepository _authRepository;

  LoginFormBloc(this._authRepository) : super(const LoginFormInitial()) {
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

    if (email.isEmpty && password.isEmpty) {
      emit(const LoginFormInitial());
    } else {
      emit(
        LoginFormFilling(
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

    if (email.isEmpty && password.isEmpty) {
      emit(const LoginFormInitial());
    } else {
      emit(
        LoginFormFilling(
          email: email,
          password: password,
          emailStatus: state.emailStatus,
          passwordStatus: passwordError,
        ),
      );
    }
  }

  Future<void> _onSubmitPressed(
    SubmitPressedEvent event,
    Emitter<LoginFormState> emit,
  ) async {
    final email = state.email;
    final password = state.password;

    emit(LoginFormLoading(email: email, password: password));

    final (emailError, passwordError) = _validate(email, password);
    if (emailError == null && passwordError == null) {
      try {
        await _authRepository.loginWithEmailAndPassword(
          email: email.trim(),
          password: password,
        );

        // Явно ставим стейт загрузки, так как при успешном логине пользователя
        // должно перебросить на главный экран автоматически
        emit(LoginFormLoading(email: email, password: password));
      } on LoginError catch (error) {
        emit(
          LoginFormFailure(
            email: email,
            password: password,
            message: error.message,
          ),
        );
      } on Object catch (_) {
        LoginFormFailure(email: email, password: password);
      }
    } else {
      emit(
        LoginFormFilling(
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
