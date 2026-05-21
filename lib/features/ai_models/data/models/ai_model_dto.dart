import 'package:json_annotation/json_annotation.dart';

part 'ai_model_dto.g.dart';

@JsonSerializable(createToJson: false)
class AiModelsResponseDto {
  const AiModelsResponseDto({required this.data});

  factory AiModelsResponseDto.fromJson(Map<String, Object?> json) =>
      _$AiModelsResponseDtoFromJson(json);

  final AiModelsDataDto data;
}

@JsonSerializable(createToJson: false)
class AiModelsDataDto {
  const AiModelsDataDto({required this.models});

  factory AiModelsDataDto.fromJson(Map<String, Object?> json) =>
      _$AiModelsDataDtoFromJson(json);

  final List<AiModelDto> models;
}

@JsonSerializable(createToJson: false)
class AiModelDto {
  const AiModelDto({
    required this.id,
    required this.providerCode,
    required this.providerName,
    required this.modelCode,
    required this.modelName,
    required this.type,
    required this.isDefault,
    required this.isActive,
    required this.fileInput,
    this.providerIcon,
    this.modelIcon,
    this.description,
    this.requestCoef,
    this.responseCoef,
  });

  factory AiModelDto.fromJson(Map<String, Object?> json) =>
      _$AiModelDtoFromJson(json);

  final int id;
  @JsonKey(name: 'provider_code')
  final String providerCode;
  @JsonKey(name: 'provider_name')
  final String providerName;
  @JsonKey(name: 'provider_icon')
  final String? providerIcon;
  @JsonKey(name: 'model_code')
  final String modelCode;
  @JsonKey(name: 'model_name')
  final String modelName;
  @JsonKey(name: 'model_icon')
  final String? modelIcon;
  final String type;
  final String? description;
  @JsonKey(name: 'is_default')
  final bool isDefault;
  @JsonKey(name: 'is_active')
  final bool isActive;
  @JsonKey(name: 'file_input')
  final bool fileInput;
  @JsonKey(name: 'request_coef')
  final num? requestCoef;
  @JsonKey(name: 'response_coef')
  final num? responseCoef;
}
