import '../../domain/models/ai_model.dart';
import '../models/ai_model_dto.dart';

abstract final class AiModelMapper {
  static AiModel toDomain(AiModelDto dto) => AiModel(
    providerCode: dto.providerCode,
    providerName: dto.providerName,
    modelCode: dto.modelCode,
    modelName: dto.modelName,
    isDefault: dto.isDefault,
  );
}
