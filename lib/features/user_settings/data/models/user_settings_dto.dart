import 'package:json_annotation/json_annotation.dart';

part 'user_settings_dto.g.dart';

@JsonSerializable(createToJson: false)
class UserSettingsDto {
  const UserSettingsDto({
    this.reviewsAiProvider,
    this.reviewsAiModel,
    this.reviewsAiPrompt,
    this.questionsAiProvider,
    this.questionsAiModel,
    this.questionsAiPrompt,
  });

  factory UserSettingsDto.fromJson(Map<String, Object?> json) =>
      _$UserSettingsDtoFromJson(json);

  @JsonKey(name: 'REVIEWS_AI_PROVIDER')
  final String? reviewsAiProvider;
  @JsonKey(name: 'REVIEWS_AI_MODEL')
  final String? reviewsAiModel;
  @JsonKey(name: 'REVIEWS_AI_PROMPT')
  final String? reviewsAiPrompt;
  @JsonKey(name: 'QUESTIONS_AI_PROVIDER')
  final String? questionsAiProvider;
  @JsonKey(name: 'QUESTIONS_AI_MODEL')
  final String? questionsAiModel;
  @JsonKey(name: 'QUESTIONS_AI_PROMPT')
  final String? questionsAiPrompt;
}
