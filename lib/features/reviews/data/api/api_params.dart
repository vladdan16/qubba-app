part of 'reviews_api.dart';

abstract final class _ApiParams {
  static const reviews = '/v1/review';
  static String reviewById(String id) => '/v1/review/$id';
}
