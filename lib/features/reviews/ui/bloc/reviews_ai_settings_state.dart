part of 'reviews_ai_settings_bloc.dart';

enum ReviewsAiSettingsLoadState { initial, loading, ready, failure }

final class ReviewsAiSettingsState {
  const ReviewsAiSettingsState({
    this.loadState = ReviewsAiSettingsLoadState.initial,
    this.loadError,
    this.models = const [],
    this.prompt = '',
    this.selectedModel,
    this.isSaving = false,
    this.saveSuccess = false,
    this.saveError,
  });

  final ReviewsAiSettingsLoadState loadState;
  final String? loadError;
  final List<AiModel> models;
  final String prompt;
  final AiModel? selectedModel;
  final bool isSaving;
  final bool saveSuccess;
  final String? saveError;

  bool get isLoading => loadState == ReviewsAiSettingsLoadState.loading;
  bool get isReady => loadState == ReviewsAiSettingsLoadState.ready;
  bool get isFailure => loadState == ReviewsAiSettingsLoadState.failure;
  bool get isValid => prompt.trim().isNotEmpty && selectedModel != null;

  static const _sentinel = Object();

  ReviewsAiSettingsState copyWith({
    ReviewsAiSettingsLoadState? loadState,
    Object? loadError = _sentinel,
    List<AiModel>? models,
    String? prompt,
    Object? selectedModel = _sentinel,
    bool? isSaving,
    bool? saveSuccess,
    Object? saveError = _sentinel,
  }) => ReviewsAiSettingsState(
    loadState: loadState ?? this.loadState,
    loadError: loadError == _sentinel ? this.loadError : loadError as String?,
    models: models ?? this.models,
    prompt: prompt ?? this.prompt,
    selectedModel: selectedModel == _sentinel
        ? this.selectedModel
        : selectedModel as AiModel?,
    isSaving: isSaving ?? this.isSaving,
    saveSuccess: saveSuccess ?? this.saveSuccess,
    saveError: saveError == _sentinel ? this.saveError : saveError as String?,
  );
}
