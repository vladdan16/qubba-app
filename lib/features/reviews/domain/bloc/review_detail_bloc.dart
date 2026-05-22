import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/foundation.dart';

import '../../../../utils/error_message.dart';
import '../../domain/models/review.dart';
import '../../domain/repository/reviews_repository.dart';

part 'review_detail_event.dart';
part 'review_detail_state.dart';

final class ReviewDetailBloc
    extends Bloc<ReviewDetailEvent, ReviewDetailState> {
  ReviewDetailBloc({required this._repository})
    : super(const ReviewDetailInitialState()) {
    on<ReviewDetailLoadRequested>(_onLoad, transformer: restartable());
    on<ReviewDetailGenerateReplyRequested>(
      _onGenerateReply,
      transformer: droppable(),
    );
    on<ReviewDetailSaveDraftPressed>(
      _onSaveDraft,
      transformer: droppable(),
    );
    on<ReviewDetailSendAnswerPressed>(
      _onSendAnswer,
      transformer: droppable(),
    );
  }

  final ReviewsRepository _repository;

  Future<void> _onLoad(
    ReviewDetailLoadRequested event,
    Emitter<ReviewDetailState> emit,
  ) async {
    emit(const ReviewDetailLoadingState());

    try {
      final review = await _repository.getReviewById(event.id);
      emit(ReviewDetailLoadedState(review: review));
    } on Object catch (error, stackTrace) {
      debugPrint('ReviewDetailBloc._onLoad: $error\n$stackTrace');
      emit(ReviewDetailFailureState(message: errorMessage(error), id: event.id),
      );
    }
  }

  Future<void> _onGenerateReply(
    ReviewDetailGenerateReplyRequested event,
    Emitter<ReviewDetailState> emit,
  ) async {
    final current = state;
    if (current is! ReviewDetailLoadedState) return;

    emit(ReviewDetailLoadedState(review: current.review, isGenerating: true));

    try {
      final updated = await _repository.generateReply(event.id);
      emit(ReviewDetailLoadedState(review: updated, justGenerated: true));
    } on Object catch (error, stackTrace) {
      debugPrint('ReviewDetailBloc._onGenerateReply: $error\n$stackTrace');
      emit(
        ReviewDetailLoadedState(
          review: current.review,
          generationError: errorMessage(error),
        ),
      );
    }
  }

  Future<void> _onSaveDraft(
    ReviewDetailSaveDraftPressed event,
    Emitter<ReviewDetailState> emit,
  ) async {
    final current = state;
    if (current is! ReviewDetailLoadedState) return;

    emit(ReviewDetailLoadedState(review: current.review, isSavingDraft: true));

    try {
      final updated = await _repository.saveDraft(event.id, event.text);
      emit(ReviewDetailLoadedState(review: updated, justSavedDraft: true));
    } on Object catch (error, stackTrace) {
      debugPrint('ReviewDetailBloc._onSaveDraft: $error\n$stackTrace');
      emit(
        ReviewDetailLoadedState(
          review: current.review,
          saveDraftError: errorMessage(error),
        ),
      );
    }
  }

  Future<void> _onSendAnswer(
    ReviewDetailSendAnswerPressed event,
    Emitter<ReviewDetailState> emit,
  ) async {
    final current = state;
    if (current is! ReviewDetailLoadedState) return;

    emit(ReviewDetailLoadedState(review: current.review, isSending: true));

    try {
      final updated = await _repository.saveAndSendAnswer(event.id, event.text);
      emit(ReviewDetailLoadedState(review: updated, justSent: true));
    } on Object catch (error, stackTrace) {
      debugPrint('ReviewDetailBloc._onSendAnswer: $error\n$stackTrace');
      emit(
        ReviewDetailLoadedState(
          review: current.review,
          sendError: errorMessage(error),
        ),
      );
    }
  }
}
