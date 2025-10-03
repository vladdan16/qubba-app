import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_form_event.dart';
import 'login_form_state.dart';

class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {
  LoginFormBloc() : super(const LoginFormState()) {
    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.value));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.value));
    });

    on<ToggleObscure>((event, emit) {
      emit(state.copyWith(obscurePassword: !state.obscurePassword));
    });

    on<SubmitPressed>((event, emit) {
      emit(
        state.copyWith(
          submitted: true,
          autovalidateMode: AutovalidateMode.always,
        ),
      );
    });
  }

  static final RegExp _unicodeLetter = RegExp(r'\p{L}', unicode: true);
  static final RegExp _unicodeDigit = RegExp(r'\p{N}', unicode: true);

  static final RegExp _emailRegExp = RegExp(
    r'^[\p{L}\p{N}._%+\-]+@(?:[\p{L}\p{N}](?:[\p{L}\p{N}\-]{0,61}[\p{L}\p{N}])?\.)+[\p{L}]{2,}$',
    unicode: true,
    caseSensitive: false,
  );

  String? validateEmail(String? value) {
    final v = (value ?? '').trim();
    if (v.isEmpty) return 'Введите email';
    if (!_emailRegExp.hasMatch(v)) return 'Некорректный email';

    return null;
  }

  String? validatePassword(String? value) {
    final v = value ?? '';
    if (v.isEmpty) return 'Введите пароль';
    if (v.length < 8) return 'Минимум 8 символов';

    final hasLetter = _unicodeLetter.hasMatch(v);
    final hasDigit = _unicodeDigit.hasMatch(v);

    if (!hasLetter) return 'Добавьте хотя бы одну букву';
    if (!hasDigit) return 'Добавьте хотя бы одну цифру';

    return null;
  }
}
