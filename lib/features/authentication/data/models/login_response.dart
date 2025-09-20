import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'login_response.g.dart';

@immutable
@JsonSerializable(createToJson: false)
final class LoginResponse {
  // TODO(vladdan16): adjust this fields according to backend API
  @JsonKey(name: 'token')
  final String token;
  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  const LoginResponse({
    required this.token,
    required this.refreshToken,
  });

  factory LoginResponse.fromJson(Map<String, Object?> json) =>
      _$LoginResponseFromJson(json);
}
