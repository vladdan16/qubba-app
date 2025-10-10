import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'refresh_request.g.dart';

// TODO(vladdan16): adjust this request to real API

@immutable
@JsonSerializable(createToJson: true)
final class RefreshRequest {
  @JsonKey(name: 'refreshToken')
  final String refreshToken;

  const RefreshRequest({
    required this.refreshToken,
  });

  factory RefreshRequest.fromJson(Map<String, Object?> json) =>
      _$RefreshRequestFromJson(json);

  Map<String, Object?> toJson() => _$RefreshRequestToJson(this);
}
