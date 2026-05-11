import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

import '../../domain/models/review.dart';
import '../../domain/models/reviews_filter.dart';
import '../../domain/repository/reviews_repository.dart';

part 'reviews_event.dart';
part 'reviews_state.dart';

final class ReviewsBloc extends Bloc<ReviewsEvent, ReviewsState> {
  ReviewsBloc({required ReviewsRepository repository})
    : _repository = repository,
      super(const ReviewsInitialState(filter: ReviewsFilter())) {
    on<ReviewsLoadRequested>(_onLoad, transformer: restartable());
    on<ReviewsRefreshRequested>(_onRefresh, transformer: restartable());
    on<ReviewsFilterChanged>(_onFilterChanged, transformer: restartable());
    on<ReviewsLoadMoreRequested>(_onLoadMore, transformer: droppable());
  }

  final ReviewsRepository _repository;

  static const _pageSize = 20;

  Future<void> _onLoad(
    ReviewsLoadRequested event,
    Emitter<ReviewsState> emit,
  ) async {
    final filter = event.filter ?? state.filter;
    emit(ReviewsLoadingState(filter: filter));

    try {
      final page = await _repository.getReviews(
        filter: filter,
        limit: _pageSize,
        offset: 0,
      );
      emit(
        ReviewsReadyIdleState(
          filter: filter,
          reviews: page.reviews,
          total: page.total,
          hasMore: page.reviews.length >= _pageSize,
        ),
      );
    } on Object catch (error, _) {
      emit(ReviewsFailureState(filter: filter, message: error.toString()));
    }
  }

  Future<void> _onRefresh(
    ReviewsRefreshRequested event,
    Emitter<ReviewsState> emit,
  ) async {
    final previous = state;
    final filter = previous.filter;

    if (previous is ReviewsReadyState) {
      emit(
        ReviewsRefreshingState(
          filter: filter,
          reviews: previous.reviews,
          total: previous.total,
          hasMore: previous.hasMore,
        ),
      );
    } else {
      emit(ReviewsLoadingState(filter: filter));
    }

    try {
      final page = await _repository.getReviews(
        filter: filter,
        limit: _pageSize,
        offset: 0,
      );
      emit(
        ReviewsReadyIdleState(
          filter: filter,
          reviews: page.reviews,
          total: page.total,
          hasMore: page.reviews.length >= _pageSize,
        ),
      );
    } on Object catch (error, _) {
      emit(
        ReviewsFailureState(
          filter: filter,
          message: error.toString(),
          lastReviews: previous is ReviewsReadyState ? previous.reviews : null,
          lastTotal: previous is ReviewsReadyState ? previous.total : null,
        ),
      );
    }
  }

  Future<void> _onFilterChanged(
    ReviewsFilterChanged event,
    Emitter<ReviewsState> emit,
  ) async {
    final previous = state;
    final newFilter = ReviewsFilter(
      cabinetId: event.cabinetId,
      isAnswered: event.isAnswered,
    );

    if (newFilter == previous.filter) return;

    if (previous is ReviewsReadyState) {
      emit(
        ReviewsLoadingFromReadyState(
          filter: newFilter,
          reviews: previous.reviews,
          total: previous.total,
          hasMore: previous.hasMore,
        ),
      );
    } else {
      emit(ReviewsLoadingState(filter: newFilter));
    }

    try {
      final page = await _repository.getReviews(
        filter: newFilter,
        limit: _pageSize,
        offset: 0,
      );
      emit(
        ReviewsReadyIdleState(
          filter: newFilter,
          reviews: page.reviews,
          total: page.total,
          hasMore: page.reviews.length >= _pageSize,
        ),
      );
    } on Object catch (error, _) {
      emit(
        ReviewsFailureState(
          filter: newFilter,
          message: error.toString(),
        ),
      );
    }
  }

  Future<void> _onLoadMore(
    ReviewsLoadMoreRequested event,
    Emitter<ReviewsState> emit,
  ) async {
    final previous = state;
    if (previous is! ReviewsReadyIdleState) return;
    if (!previous.hasMore) return;

    emit(
      ReviewsLoadingMoreState(
        filter: previous.filter,
        reviews: previous.reviews,
        total: previous.total,
        hasMore: previous.hasMore,
      ),
    );

    try {
      final page = await _repository.getReviews(
        filter: previous.filter,
        limit: _pageSize,
        offset: previous.reviews.length,
      );
      final merged = [...previous.reviews, ...page.reviews];
      emit(
        ReviewsReadyIdleState(
          filter: previous.filter,
          reviews: merged,
          total: page.total,
          hasMore: page.reviews.length >= _pageSize,
        ),
      );
    } on Object catch (error, _) {
      emit(
        ReviewsReadyIdleState(
          filter: previous.filter,
          reviews: previous.reviews,
          total: previous.total,
          hasMore: previous.hasMore,
        ),
      );
    }
  }
}
