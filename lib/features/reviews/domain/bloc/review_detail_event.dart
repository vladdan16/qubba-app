part of 'review_detail_bloc.dart';

sealed class ReviewDetailEvent {
  const ReviewDetailEvent();
}

final class ReviewDetailLoadRequested extends ReviewDetailEvent {
  const ReviewDetailLoadRequested({required this.id});

  final String id;
}

final class ReviewDetailGenerateReplyRequested extends ReviewDetailEvent {
  const ReviewDetailGenerateReplyRequested({required this.id});

  final String id;
}

final class ReviewDetailSaveDraftPressed extends ReviewDetailEvent {
  const ReviewDetailSaveDraftPressed({required this.id, required this.text});

  final String id;
  final String text;
}

final class ReviewDetailSendAnswerPressed extends ReviewDetailEvent {
  const ReviewDetailSendAnswerPressed({required this.id, required this.text});

  final String id;
  final String text;
}
