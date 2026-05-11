part of 'review_detail_bloc.dart';

sealed class ReviewDetailEvent {
  const ReviewDetailEvent();
}

final class ReviewDetailLoadRequested extends ReviewDetailEvent {
  const ReviewDetailLoadRequested({required this.id});

  final String id;
}
