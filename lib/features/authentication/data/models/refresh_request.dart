import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'refresh_request.g.dart';

@immutable
@JsonSerializable(createToJson: true)
final class RefreshRequest {
  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  const RefreshRequest({
    required this.refreshToken,
  });

  factory RefreshRequest.fromJson(Map<String, Object?> json) =>
      _$RefreshRequestFromJson(json);

  Map<String, Object?> toJson() => _$RefreshRequestToJson(this);
}
