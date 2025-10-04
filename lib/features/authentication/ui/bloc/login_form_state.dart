import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_form_state.freezed.dart';

enum EmailInvalidStatus { empty, invalid }

enum PasswordInvalidStatus { empty, tooShort, needLetter, needDigit }

@freezed
sealed class LoginFormState with _$LoginFormState {
  const factory LoginFormState.initial({
    @Default('') String email,
    @Default('') String password,
  }) = _LoginFormInitial;

  const factory LoginFormState.success({
    required String email,
    required String password,
  }) = _LoginFormSuccess;

  const factory LoginFormState.submitted({
    required String email,
    required String password,
  }) = _LoginFormSubmitted;

  const factory LoginFormState.failure({
    required String email,
    required String password,
    EmailInvalidStatus? emailStatus,
    PasswordInvalidStatus? passwordStatus,
  }) = _LoginFormFailure;
}
