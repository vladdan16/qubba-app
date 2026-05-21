import 'package:json_annotation/json_annotation.dart';

import 'review_dto.dart';

part 'review_detail_response_dto.g.dart';

@JsonSerializable(createToJson: false)
class ReviewDetailResponseDto {
  const ReviewDetailResponseDto({required this.status, required this.data});

  final String status;
  final ReviewDetailDataDto data;

  factory ReviewDetailResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ReviewDetailResponseDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class ReviewDetailDataDto {
  const ReviewDetailDataDto({required this.review});

  final ReviewDto review;

  factory ReviewDetailDataDto.fromJson(Map<String, dynamic> json) =>
      _$ReviewDetailDataDtoFromJson(json);
}
