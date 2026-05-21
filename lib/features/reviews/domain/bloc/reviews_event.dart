part of 'reviews_bloc.dart';

sealed class ReviewsEvent {
  const ReviewsEvent();
}

final class ReviewsLoadRequested extends ReviewsEvent {
  const ReviewsLoadRequested({this.filter});

  final ReviewsFilter? filter;
}

final class ReviewsRefreshRequested extends ReviewsEvent {
  const ReviewsRefreshRequested();
}

final class ReviewsLoadMoreRequested extends ReviewsEvent {
  const ReviewsLoadMoreRequested();
}

final class ReviewsFilterChanged extends ReviewsEvent {
  const ReviewsFilterChanged({this.cabinetId, this.isAnswered});

  final String? cabinetId;
  final bool? isAnswered;
}
