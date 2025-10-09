import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'login_response.g.dart';

@immutable
@JsonSerializable(createToJson: false)
final class LoginResponse {
  @JsonKey(name: 'accessToken')
  final String accessToken;

  @JsonKey(name: 'refreshToken')
  final String refreshToken;

  @JsonKey(name: 'isSuccess')
  final bool isSuccess;

  @JsonKey(name: 'errorMessage')
  final String? errorMessage;

  const LoginResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.isSuccess,
    this.errorMessage,
  });

  factory LoginResponse.fromJson(Map<String, Object?> json) =>
      _$LoginResponseFromJson(json);
}
