import '../../domain/models/review.dart';
import '../../domain/models/reviews_filter.dart';
import '../../domain/models/reviews_page.dart';
import '../../domain/repository/reviews_repository.dart';
import '../api/reviews_api.dart';
import '../mappers/review_mapper.dart';

final class ReviewsRepositoryImpl implements ReviewsRepository {
  const ReviewsRepositoryImpl({required this._api});

  final ReviewsApi _api;

  @override
  Future<ReviewsPage> getReviews({
    required ReviewsFilter filter,
    required int limit,
    required int offset,
  }) async {
    final response = await _api.getReviews(
      limit: limit,
      offset: offset,
      cabinetId: filter.cabinetId,
      isAnswered: filter.isAnswered,
    );

    return ReviewsPage(
      reviews: response.data.reviews.map(ReviewMapper.toDomain).toList(),
      total: response.data.allQuantity,
    );
  }

  @override
  Future<Review> getReviewById(String id) async {
    final response = await _api.getReviewById(id);
    return ReviewMapper.toDomain(response.data.review);
  }

  @override
  Future<Review> generateReply(String reviewId) async {
    await _api.generateReply(reviewId);
    final response = await _api.getReviewById(reviewId);
    return ReviewMapper.toDomain(response.data.review);
  }

  @override
  Future<Review> saveDraft(String reviewId, String text) async {
    await _api.saveAnswer(reviewId, text);
    final response = await _api.getReviewById(reviewId);
    return ReviewMapper.toDomain(response.data.review);
  }

  @override
  Future<Review> saveAndSendAnswer(String reviewId, String text) async {
    await _api.saveAnswer(reviewId, text);
    await _api.sendAnswer(reviewId);
    final response = await _api.getReviewById(reviewId);
    return ReviewMapper.toDomain(response.data.review);
  }

  @override
  Future<void> dispose() async {}
}
