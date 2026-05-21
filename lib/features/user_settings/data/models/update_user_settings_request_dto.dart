import 'package:json_annotation/json_annotation.dart';

part 'update_user_settings_request_dto.g.dart';

@JsonSerializable(includeIfNull: false)
class UpdateUserSettingsRequestDto {
  const UpdateUserSettingsRequestDto({
    this.reviewsAiProvider,
    this.reviewsAiModel,
    this.reviewsAiPrompt,
  });

  factory UpdateUserSettingsRequestDto.fromJson(Map<String, Object?> json) =>
      _$UpdateUserSettingsRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateUserSettingsRequestDtoToJson(this);

  @JsonKey(name: 'REVIEWS_AI_PROVIDER')
  final String? reviewsAiProvider;
  @JsonKey(name: 'REVIEWS_AI_MODEL')
  final String? reviewsAiModel;
  @JsonKey(name: 'REVIEWS_AI_PROMPT')
  final String? reviewsAiPrompt;
}
