import '../models/review.dart';
import '../models/reviews_filter.dart';
import '../models/reviews_page.dart';

abstract interface class ReviewsRepository {
  Future<ReviewsPage> getReviews({
    required ReviewsFilter filter,
    required int limit,
    required int offset,
  });

  Future<Review> getReviewById(String id);

  Future<Review> generateReply(String reviewId);

  Future<Review> saveDraft(String reviewId, String text);

  Future<Review> saveAndSendAnswer(String reviewId, String text);

  Future<void> dispose();
}
