import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_with_email_and_password_request.g.dart';

@immutable
@JsonSerializable(createToJson: true)
final class LoginWithEmailAndPasswordRequest {
  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'password')
  final String password;

  const LoginWithEmailAndPasswordRequest({
    required this.email,
    required this.password,
  });

  factory LoginWithEmailAndPasswordRequest.fromJson(
    Map<String, Object?> json,
  ) => _$LoginWithEmailAndPasswordRequestFromJson(json);

  Map<String, Object?> toJson() =>
      _$LoginWithEmailAndPasswordRequestToJson(this);
}
