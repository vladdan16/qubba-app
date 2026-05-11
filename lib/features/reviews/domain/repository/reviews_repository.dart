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

  Future<void> dispose();
}
