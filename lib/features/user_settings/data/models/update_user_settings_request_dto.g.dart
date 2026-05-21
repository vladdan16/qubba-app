// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_settings_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserSettingsRequestDto _$UpdateUserSettingsRequestDtoFromJson(
  Map<String, dynamic> json,
) => UpdateUserSettingsRequestDto(
  reviewsAiProvider: json['REVIEWS_AI_PROVIDER'] as String?,
  reviewsAiModel: json['REVIEWS_AI_MODEL'] as String?,
  reviewsAiPrompt: json['REVIEWS_AI_PROMPT'] as String?,
);

Map<String, dynamic> _$UpdateUserSettingsRequestDtoToJson(
  UpdateUserSettingsRequestDto instance,
) => <String, dynamic>{
  'REVIEWS_AI_PROVIDER': ?instance.reviewsAiProvider,
  'REVIEWS_AI_MODEL': ?instance.reviewsAiModel,
  'REVIEWS_AI_PROMPT': ?instance.reviewsAiPrompt,
};
