part of 'review_detail_bloc.dart';

sealed class ReviewDetailState {
  const ReviewDetailState();
}

final class ReviewDetailInitialState extends ReviewDetailState {
  const ReviewDetailInitialState();
}

final class ReviewDetailLoadingState extends ReviewDetailState {
  const ReviewDetailLoadingState();
}

final class ReviewDetailLoadedState extends ReviewDetailState {
  const ReviewDetailLoadedState({
    required this.review,
    this.isGenerating = false,
    this.generationError,
    this.justGenerated = false,
    this.isSavingDraft = false,
    this.saveDraftError,
    this.justSavedDraft = false,
    this.isSending = false,
    this.sendError,
    this.justSent = false,
  });

  final Review review;
  final bool isGenerating;
  final String? generationError;
  final bool justGenerated;
  final bool isSavingDraft;
  final String? saveDraftError;
  final bool justSavedDraft;
  final bool isSending;
  final String? sendError;
  final bool justSent;
}

final class ReviewDetailFailureState extends ReviewDetailState {
  const ReviewDetailFailureState({required this.message, required this.id});

  final String message;
  final String id;
}
