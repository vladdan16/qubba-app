import 'package:meta/meta.dart';

@immutable
final class UserSettings {
  const UserSettings({
    this.reviewsAiProvider,
    this.reviewsAiModel,
    this.reviewsAiPrompt,
    this.questionsAiProvider,
    this.questionsAiModel,
    this.questionsAiPrompt,
  });

  final String? reviewsAiProvider;
  final String? reviewsAiModel;
  final String? reviewsAiPrompt;
  final String? questionsAiProvider;
  final String? questionsAiModel;
  final String? questionsAiPrompt;

  static const _sentinel = Object();

  UserSettings copyWith({
    Object? reviewsAiProvider = _sentinel,
    Object? reviewsAiModel = _sentinel,
    Object? reviewsAiPrompt = _sentinel,
    Object? questionsAiProvider = _sentinel,
    Object? questionsAiModel = _sentinel,
    Object? questionsAiPrompt = _sentinel,
  }) => UserSettings(
    reviewsAiProvider: reviewsAiProvider == _sentinel
        ? this.reviewsAiProvider
        : reviewsAiProvider as String?,
    reviewsAiModel: reviewsAiModel == _sentinel
        ? this.reviewsAiModel
        : reviewsAiModel as String?,
    reviewsAiPrompt: reviewsAiPrompt == _sentinel
        ? this.reviewsAiPrompt
        : reviewsAiPrompt as String?,
    questionsAiProvider: questionsAiProvider == _sentinel
        ? this.questionsAiProvider
        : questionsAiProvider as String?,
    questionsAiModel: questionsAiModel == _sentinel
        ? this.questionsAiModel
        : questionsAiModel as String?,
    questionsAiPrompt: questionsAiPrompt == _sentinel
        ? this.questionsAiPrompt
        : questionsAiPrompt as String?,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserSettings &&
          runtimeType == other.runtimeType &&
          reviewsAiProvider == other.reviewsAiProvider &&
          reviewsAiModel == other.reviewsAiModel &&
          reviewsAiPrompt == other.reviewsAiPrompt &&
          questionsAiProvider == other.questionsAiProvider &&
          questionsAiModel == other.questionsAiModel &&
          questionsAiPrompt == other.questionsAiPrompt;

  @override
  int get hashCode => Object.hash(
    reviewsAiProvider,
    reviewsAiModel,
    reviewsAiPrompt,
    questionsAiProvider,
    questionsAiModel,
    questionsAiPrompt,
  );
}
