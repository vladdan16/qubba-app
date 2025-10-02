import 'package:email_validator/email_validator.dart';
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

  String? validateEmail(String? value) {
    final v = (value ?? '').trim();
    if (v.isEmpty) return 'Введите email';
    if (!EmailValidator.validate(v)) return 'Некорректный email';
    return null;
  }

  String? validatePassword(String? value) {
    final v = value ?? '';
    if (v.isEmpty) return 'Введите пароль';
    if (v.length < 8) return 'Минимум 8 символов';

    final hasDigit = v.codeUnits.any((char) => char >= 48 && char <= 57);
    final hasLetter = v.codeUnits.any((char) {
      final isLatinUpper = char >= 65 && char <= 90;
      final isLatinLower = char >= 97 && char <= 122;
      return isLatinUpper || isLatinLower;
    });

    if (!hasDigit) return 'Добавьте хотя бы одну цифру';
    if (!hasLetter) return 'Добавьте хотя бы одну букву';

    return null;
  }
}
