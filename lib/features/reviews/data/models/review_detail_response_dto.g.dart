// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_detail_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewDetailResponseDto _$ReviewDetailResponseDtoFromJson(
  Map<String, dynamic> json,
) => ReviewDetailResponseDto(
  status: json['status'] as String,
  data: ReviewDetailDataDto.fromJson(json['data'] as Map<String, dynamic>),
);

ReviewDetailDataDto _$ReviewDetailDataDtoFromJson(Map<String, dynamic> json) =>
    ReviewDetailDataDto(
      review: ReviewDto.fromJson(json['review'] as Map<String, dynamic>),
    );
