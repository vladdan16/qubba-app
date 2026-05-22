import 'package:dio/dio.dart';

import '../../../../utils/require_data.dart';
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

  Future<void> generateReply(String id);

  Future<void> saveAnswer(String id, String text);

  Future<void> sendAnswer(String id);
}

final class _ReviewsApiImpl extends ReviewsApi {
  _ReviewsApiImpl(this._dio) : super._();

  final Dio _dio;

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

    final response = await _dio.get<Map<String, Object?>>(
      _ApiParams.reviews,
      queryParameters: queryParameters,
    );

    return ReviewsListResponseDto.fromJson(response.requireData);
  }

  @override
  Future<ReviewDetailResponseDto> getReviewById(String id) async {
    final response = await _dio.get<Map<String, Object?>>(
      _ApiParams.reviewById(id),
    );
    return ReviewDetailResponseDto.fromJson(response.requireData);
  }

  @override
  Future<void> generateReply(String id) async {
    await _dio.post<void>(_ApiParams.generateReply(id));
  }

  @override
  Future<void> saveAnswer(String id, String text) async {
    await _dio.post<void>(
      _ApiParams.saveAnswer(id),
      data: {'text': text},
    );
  }

  @override
  Future<void> sendAnswer(String id) async {
    await _dio.post<void>(_ApiParams.sendAnswer(id));
  }
}
