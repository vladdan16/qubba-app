import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'auth_response.g.dart';

@immutable
@JsonSerializable(createToJson: false)
final class AuthResponse {
  @JsonKey(name: 'accessToken')
  final String? accessToken;

  @JsonKey(name: 'refreshToken')
  final String? refreshToken;

  @JsonKey(name: 'isSuccess')
  final bool isSuccess;

  @JsonKey(name: 'errorMessage')
  final String? errorMessage;

  const AuthResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.isSuccess,
    this.errorMessage,
  });

  factory AuthResponse.fromJson(Map<String, Object?> json) =>
      _$AuthResponseFromJson(json);
}
