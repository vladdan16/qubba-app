import 'package:meta/meta.dart';

@immutable
class ReviewsFilter {
  const ReviewsFilter({
    this.cabinetId,
    this.isAnswered,
    // TODO(reviews): add hasText when backend confirms the parameter
  });

  final String? cabinetId;
  final bool? isAnswered;

  ReviewsFilter copyWith({
    Object? cabinetId = _sentinel,
    Object? isAnswered = _sentinel,
  }) => ReviewsFilter(
    cabinetId: cabinetId == _sentinel ? this.cabinetId : cabinetId as String?,
    isAnswered: isAnswered == _sentinel ? this.isAnswered : isAnswered as bool?,
  );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReviewsFilter &&
        cabinetId == other.cabinetId &&
        isAnswered == other.isAnswered;
  }

  @override
  int get hashCode => Object.hash(cabinetId, isAnswered);
}

const _sentinel = Object();
