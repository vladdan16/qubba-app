import '../models/ai_model.dart';

abstract interface class AiModelsRepository {
  Future<List<AiModel>> getTextModels();

  Future<void> dispose();
}
