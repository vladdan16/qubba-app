part of 'reviews_api.dart';

abstract final class _ApiParams {
  static const reviews = '/v1/review';
  static String reviewById(String id) => '/v1/review/$id';
  // TODO(reviews-ai): verify endpoint path with backend
  static String generateReply(String id) => '/v1/review/$id/generate-answer';
}
