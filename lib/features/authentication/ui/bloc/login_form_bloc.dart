import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_form_event.dart';
import 'login_form_state.dart';

class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {
  LoginFormBloc() : super(const LoginFormState.initial()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<SubmitPressed>(_onSubmitPressed);
  }

  static const int minLen = 8;
  static final RegExp _unicodeLetter = RegExp(r'\p{L}', unicode: true);
  static final RegExp _unicodeDigit = RegExp(r'\p{N}', unicode: true);
  static final RegExp _emailRe = RegExp(
    r'^[\p{L}\p{N}._%+\-]+@(?:[\p{L}\p{N}](?:[\p{L}\p{N}\-]{0,61}[\p{L}\p{N}])?\.)+[\p{L}]{2,}$',
    unicode: true,
    caseSensitive: false,
  );

  void _onEmailChanged(EmailChanged event, Emitter<LoginFormState> emit) {
    final password = _selectPassword(state);
    _emitValidated(event.value, password, emit);
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginFormState> emit) {
    final email = _selectEmail(state);
    _emitValidated(email, event.value, emit);
  }

  void _onSubmitPressed(SubmitPressed event, Emitter<LoginFormState> emit) {
    final email = _selectEmail(state);
    final password = _selectPassword(state);

    final (emailErr, passErr) = _validate(email, password);
    if (emailErr == null && passErr == null) {
      emit(LoginFormState.submitted(email: email, password: password));
    } else {
      emit(
        LoginFormState.failure(
          email: email,
          password: password,
          emailStatus: emailErr,
          passwordStatus: passErr,
        ),
      );
    }
  }

  void _emitValidated(
    String email,
    String password,
    Emitter<LoginFormState> emit,
  ) {
    final (emailErr, passErr) = _validate(email, password);

    if (email.isEmpty && password.isEmpty) {
      emit(LoginFormState.initial(email: email, password: password));
    } else if (emailErr == null && passErr == null) {
      emit(LoginFormState.success(email: email, password: password));
    } else {
      emit(
        LoginFormState.failure(
          email: email,
          password: password,
          emailStatus: emailErr,
          passwordStatus: passErr,
        ),
      );
    }
  }

  (EmailInvalidStatus?, PasswordInvalidStatus?) _validate(
    String email,
    String password,
  ) {
    EmailInvalidStatus? emailErr;
    PasswordInvalidStatus? passErr;

    final trimmed = email.trim();
    if (trimmed.isEmpty) {
      emailErr = EmailInvalidStatus.empty;
    } else if (!_emailRe.hasMatch(trimmed)) {
      emailErr = EmailInvalidStatus.invalid;
    }

    if (password.isEmpty) {
      passErr = PasswordInvalidStatus.empty;
    } else if (password.length < minLen) {
      passErr = PasswordInvalidStatus.tooShort;
    } else {
      final hasL = _unicodeLetter.hasMatch(password);
      final hasD = _unicodeDigit.hasMatch(password);
      if (!hasL) {
        passErr = PasswordInvalidStatus.needLetter;
      } else if (!hasD) {
        passErr = PasswordInvalidStatus.needDigit;
      }
    }

    return (emailErr, passErr);
  }

  String _selectEmail(LoginFormState s) => s.map(
    initial: (v) => v.email,
    success: (v) => v.email,
    failure: (v) => v.email,
    submitted: (v) => v.email,
  );

  String _selectPassword(LoginFormState s) => s.map(
    initial: (v) => v.password,
    success: (v) => v.password,
    failure: (v) => v.password,
    submitted: (v) => v.password,
  );
}
