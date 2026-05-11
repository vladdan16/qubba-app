part of 'reviews_bloc.dart';

sealed class ReviewsState {
  const ReviewsState({required this.filter});

  final ReviewsFilter filter;
}

final class ReviewsInitialState extends ReviewsState {
  const ReviewsInitialState({required super.filter});
}

final class ReviewsLoadingState extends ReviewsState {
  const ReviewsLoadingState({required super.filter});
}

sealed class ReviewsReadyState extends ReviewsState {
  const ReviewsReadyState({
    required super.filter,
    required this.reviews,
    required this.total,
    required this.hasMore,
  });

  final List<Review> reviews;
  final int total;
  final bool hasMore;
}

final class ReviewsReadyIdleState extends ReviewsReadyState {
  const ReviewsReadyIdleState({
    required super.filter,
    required super.reviews,
    required super.total,
    required super.hasMore,
  });
}

final class ReviewsLoadingMoreState extends ReviewsReadyState {
  const ReviewsLoadingMoreState({
    required super.filter,
    required super.reviews,
    required super.total,
    required super.hasMore,
  });
}

final class ReviewsRefreshingState extends ReviewsReadyState {
  const ReviewsRefreshingState({
    required super.filter,
    required super.reviews,
    required super.total,
    required super.hasMore,
  });
}

final class ReviewsLoadingFromReadyState extends ReviewsReadyState {
  const ReviewsLoadingFromReadyState({
    required super.filter,
    required super.reviews,
    required super.total,
    required super.hasMore,
  });
}

final class ReviewsFailureState extends ReviewsState {
  const ReviewsFailureState({
    required super.filter,
    required this.message,
    this.lastReviews,
    this.lastTotal,
  });

  final String message;
  final List<Review>? lastReviews;
  final int? lastTotal;
}
