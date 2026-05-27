import '../../domain/models/ai_model.dart';
import '../../domain/repository/ai_models_repository.dart';
import '../api/ai_models_api.dart';
import '../mappers/ai_model_mapper.dart';

final class AiModelsRepositoryImpl implements AiModelsRepository {
  const AiModelsRepositoryImpl(this._api);

  final AiModelsApi _api;

  @override
  Future<List<AiModel>> getTextModels() async {
    final response = await _api.getAll();
    return response.data.models
        .where((dto) => dto.type == 'text' && dto.isActive)
        .map(AiModelMapper.toDomain)
        .toList();
  }

  @override
  Future<void> dispose() async {}
}
