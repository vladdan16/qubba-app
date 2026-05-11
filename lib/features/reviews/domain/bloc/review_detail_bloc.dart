import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

import '../../domain/models/review.dart';
import '../../domain/repository/reviews_repository.dart';

part 'review_detail_event.dart';
part 'review_detail_state.dart';

final class ReviewDetailBloc
    extends Bloc<ReviewDetailEvent, ReviewDetailState> {
  ReviewDetailBloc({required ReviewsRepository repository})
    : _repository = repository,
      super(const ReviewDetailInitialState()) {
    on<ReviewDetailLoadRequested>(_onLoad, transformer: restartable());
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
}
