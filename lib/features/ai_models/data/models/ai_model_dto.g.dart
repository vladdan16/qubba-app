// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiModelsResponseDto _$AiModelsResponseDtoFromJson(Map<String, dynamic> json) =>
    AiModelsResponseDto(
      data: AiModelsDataDto.fromJson(json['data'] as Map<String, dynamic>),
    );

AiModelsDataDto _$AiModelsDataDtoFromJson(Map<String, dynamic> json) =>
    AiModelsDataDto(
      models: (json['models'] as List<dynamic>)
          .map((e) => AiModelDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

AiModelDto _$AiModelDtoFromJson(Map<String, dynamic> json) => AiModelDto(
  id: (json['id'] as num).toInt(),
  providerCode: json['provider_code'] as String,
  providerName: json['provider_name'] as String,
  modelCode: json['model_code'] as String,
  modelName: json['model_name'] as String,
  type: json['type'] as String,
  isDefault: json['is_default'] as bool,
  isActive: json['is_active'] as bool,
  fileInput: json['file_input'] as bool,
  providerIcon: json['provider_icon'] as String?,
  modelIcon: json['model_icon'] as String?,
  description: json['description'] as String?,
  requestCoef: json['request_coef'] as num?,
  responseCoef: json['response_coef'] as num?,
);
