import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_form_event.freezed.dart';

@freezed
sealed class LoginFormEvent with _$LoginFormEvent {
  const factory LoginFormEvent.emailChanged({required String value}) =
      EmailChanged;

  const factory LoginFormEvent.passwordChanged({required String value}) =
      PasswordChanged;

  const factory LoginFormEvent.toggleObscure() = ToggleObscure;

  const factory LoginFormEvent.submitPressed() = SubmitPressed;
}
