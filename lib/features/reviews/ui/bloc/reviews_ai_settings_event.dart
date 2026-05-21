part of 'reviews_ai_settings_bloc.dart';

sealed class ReviewsAiSettingsEvent {
  const ReviewsAiSettingsEvent();
}

final class ReviewsAiSettingsLoadRequested extends ReviewsAiSettingsEvent {
  const ReviewsAiSettingsLoadRequested();
}

final class ReviewsAiSettingsPromptChanged extends ReviewsAiSettingsEvent {
  const ReviewsAiSettingsPromptChanged(this.value);

  final String value;
}

final class ReviewsAiSettingsModelSelected extends ReviewsAiSettingsEvent {
  const ReviewsAiSettingsModelSelected(this.model);

  final AiModel model;
}

final class ReviewsAiSettingsSavePressed extends ReviewsAiSettingsEvent {
  const ReviewsAiSettingsSavePressed();
}
