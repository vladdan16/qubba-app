import '../../domain/models/user_settings.dart';
import '../models/user_settings_dto.dart';

abstract final class UserSettingsMapper {
  static UserSettings toDomain(UserSettingsDto dto) => UserSettings(
    reviewsAiProvider: dto.reviewsAiProvider,
    reviewsAiModel: dto.reviewsAiModel,
    reviewsAiPrompt: dto.reviewsAiPrompt,
    questionsAiProvider: dto.questionsAiProvider,
    questionsAiModel: dto.questionsAiModel,
    questionsAiPrompt: dto.questionsAiPrompt,
  );
}
