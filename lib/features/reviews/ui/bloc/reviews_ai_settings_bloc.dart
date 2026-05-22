import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/foundation.dart';

import '../../../../features/ai_models/domain/models/ai_model.dart';
import '../../../../features/ai_models/domain/repository/ai_models_repository.dart';
import '../../../../features/user_settings/domain/repository/user_settings_repository.dart';
import '../../../../utils/error_message.dart';

part 'reviews_ai_settings_event.dart';
part 'reviews_ai_settings_state.dart';

final class ReviewsAiSettingsBloc
    extends Bloc<ReviewsAiSettingsEvent, ReviewsAiSettingsState> {
  ReviewsAiSettingsBloc({
    required this._settingsRepository,
    required this._modelsRepository,
  }) : super(const ReviewsAiSettingsState()) {
    on<ReviewsAiSettingsLoadRequested>(_onLoad, transformer: restartable());
    on<ReviewsAiSettingsPromptChanged>(_onPromptChanged);
    on<ReviewsAiSettingsModelSelected>(_onModelSelected);
    on<ReviewsAiSettingsSavePressed>(_onSave, transformer: droppable());
  }

  final UserSettingsRepository _settingsRepository;
  final AiModelsRepository _modelsRepository;

  Future<void> _onLoad(
    ReviewsAiSettingsLoadRequested event,
    Emitter<ReviewsAiSettingsState> emit,
  ) async {
    emit(
      state.copyWith(
        loadState: ReviewsAiSettingsLoadState.loading,
        loadError: null,
      ),
    );
    try {
      final (settings, models) = await (
        _settingsRepository.getSettings(),
        _modelsRepository.getTextModels(),
      ).wait;

      AiModel? selectedModel;
      for (final m in models) {
        if (m.isDefault) selectedModel = m;
      }
      if (settings.reviewsAiProvider != null) {
        for (final m in models) {
          if (m.providerCode == settings.reviewsAiProvider &&
              m.modelCode == settings.reviewsAiModel) {
            selectedModel = m;
            break;
          }
        }
      }

      emit(
        state.copyWith(
          loadState: ReviewsAiSettingsLoadState.ready,
          models: models,
          prompt: settings.reviewsAiPrompt ?? '',
          selectedModel: selectedModel,
        ),
      );
    } on Object catch (error, stackTrace) {
      debugPrint('ReviewsAiSettingsBloc._onLoad: $error\n$stackTrace');
      emit(
        state.copyWith(
          loadState: ReviewsAiSettingsLoadState.failure,
          loadError: errorMessage(error),
        ),
      );
    }
  }

  void _onPromptChanged(
    ReviewsAiSettingsPromptChanged event,
    Emitter<ReviewsAiSettingsState> emit,
  ) => emit(state.copyWith(prompt: event.value));

  void _onModelSelected(
    ReviewsAiSettingsModelSelected event,
    Emitter<ReviewsAiSettingsState> emit,
  ) => emit(state.copyWith(selectedModel: event.model));

  Future<void> _onSave(
    ReviewsAiSettingsSavePressed event,
    Emitter<ReviewsAiSettingsState> emit,
  ) async {
    final model = state.selectedModel;
    if (model == null || !state.isValid) return;

    emit(state.copyWith(isSaving: true, saveError: null, saveSuccess: false));
    try {
      await _settingsRepository.updateReviewsAiSettings(
        providerCode: model.providerCode,
        modelCode: model.modelCode,
        prompt: state.prompt,
      );
      emit(state.copyWith(isSaving: false, saveSuccess: true));
    } on Object catch (error, stackTrace) {
      debugPrint('ReviewsAiSettingsBloc._onSave: $error\n$stackTrace');
      emit(
        state.copyWith(
          isSaving: false,
          saveError: errorMessage(error),
          saveSuccess: false,
        ),
      );
    }
  }
}
