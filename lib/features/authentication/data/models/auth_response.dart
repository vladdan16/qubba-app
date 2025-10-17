import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'auth_response.g.dart';

@immutable
@JsonSerializable(createToJson: false)
final class AuthResponse {
  final AuthData? data;
  final String? details;

  const AuthResponse({
    required this.data,
    required this.details,
  });

  factory AuthResponse.fromJson(Map<String, Object?> json) =>
      _$AuthResponseFromJson(json);
}

@immutable
@JsonSerializable(createToJson: false)
final class AuthData {
  @JsonKey(name: 'access_token')
  final String accessToken;
  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  const AuthData({required this.accessToken, required this.refreshToken});

  factory AuthData.fromJson(Map<String, Object?> json) =>
      _$AuthDataFromJson(json);
}
