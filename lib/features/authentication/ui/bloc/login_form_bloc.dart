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
}
