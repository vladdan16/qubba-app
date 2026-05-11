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
  const ReviewDetailLoadedState({required this.review});

  final Review review;
}

final class ReviewDetailFailureState extends ReviewDetailState {
  const ReviewDetailFailureState({required this.message, required this.id});

  final String message;
  final String id;
}
