import 'package:dio/dio.dart';

import '../models/review_detail_response_dto.dart';
import '../models/reviews_list_response_dto.dart';

part 'api_params.dart';

sealed class ReviewsApi {
  factory ReviewsApi(Dio dio) = _ReviewsApiImpl;

  const ReviewsApi._();

  Future<ReviewsListResponseDto> getReviews({
    required int limit,
    required int offset,
    String? cabinetId,
    bool? isAnswered,
    int? marketplace,
  });

  Future<ReviewDetailResponseDto> getReviewById(String id);
}

final class _ReviewsApiImpl extends ReviewsApi {
  final Dio _dio;

  _ReviewsApiImpl(this._dio) : super._();

  @override
  Future<ReviewsListResponseDto> getReviews({
    required int limit,
    required int offset,
    String? cabinetId,
    bool? isAnswered,
    int? marketplace,
  }) async {
    final queryParameters = <String, dynamic>{
      'limit': limit,
      'offset': offset,
      'is_answered': ?isAnswered,
      'marketplace': ?marketplace,
      if (cabinetId != null) 'cabinet_id': [cabinetId],
    };

    final response = await _dio.get<Map<String, dynamic>>(
      _ApiParams.reviews,
      queryParameters: queryParameters,
    );

    final data = response.data;
    if (data == null) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.badResponse,
        error: 'Empty response body',
      );
    }

    return ReviewsListResponseDto.fromJson(data);
  }

  @override
  Future<ReviewDetailResponseDto> getReviewById(String id) async {
    final response = await _dio.get<Map<String, dynamic>>(
      _ApiParams.reviewById(id),
    );

    final data = response.data;
    if (data == null) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.badResponse,
        error: 'Empty response body',
      );
    }

    return ReviewDetailResponseDto.fromJson(data);
  }
}
