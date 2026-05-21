import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

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
    } on Object catch (error, _) {
      emit(ReviewDetailFailureState(message: error.toString(), id: event.id));
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
      await Future<void>.delayed(const Duration(seconds: 10));
      final updated = await _repository.generateReply(event.id);
      emit(ReviewDetailLoadedState(review: updated));
    } on Object catch (error, _) {
      emit(
        ReviewDetailLoadedState(
          review: current.review,
          generationError: error.toString(),
        ),
      );
    }
  }
}
