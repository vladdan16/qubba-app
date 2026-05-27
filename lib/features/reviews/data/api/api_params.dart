part of 'reviews_api.dart';

abstract final class _ApiParams {
  static const reviews = '/v1/review';
  static String reviewById(String id) => '/v1/review/$id';
  static String generateReply(String id) => '/v1/review/$id/answer/generate';
  static String saveAnswer(String id) => '/v1/review/$id/answer';
  static String sendAnswer(String id) => '/v1/review/$id/answer/send';
}
