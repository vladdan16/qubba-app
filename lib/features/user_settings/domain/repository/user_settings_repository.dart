import '../models/user_settings.dart';

abstract interface class UserSettingsRepository {
  Future<UserSettings> getSettings();

  Future<void> updateReviewsAiSettings({
    required String providerCode,
    required String modelCode,
    required String prompt,
  });

  Future<void> dispose();
}
