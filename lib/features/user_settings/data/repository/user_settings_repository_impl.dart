import '../../domain/models/user_settings.dart';
import '../../domain/repository/user_settings_repository.dart';
import '../api/user_settings_api.dart';
import '../mappers/user_settings_mapper.dart';
import '../models/update_user_settings_request_dto.dart';

final class UserSettingsRepositoryImpl implements UserSettingsRepository {
  const UserSettingsRepositoryImpl(this._api);

  final UserSettingsApi _api;

  @override
  Future<UserSettings> getSettings() async {
    final dto = await _api.getSettings();
    return UserSettingsMapper.toDomain(dto);
  }

  @override
  Future<void> updateReviewsAiSettings({
    required String providerCode,
    required String modelCode,
    required String prompt,
  }) async {
    await _api.updateSettings(
      UpdateUserSettingsRequestDto(
        reviewsAiProvider: providerCode,
        reviewsAiModel: modelCode,
        reviewsAiPrompt: prompt,
      ),
    );
  }

  @override
  Future<void> dispose() async {}
}
