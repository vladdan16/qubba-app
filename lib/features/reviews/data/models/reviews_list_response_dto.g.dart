// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews_list_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewsListResponseDto _$ReviewsListResponseDtoFromJson(
  Map<String, dynamic> json,
) => ReviewsListResponseDto(
  status: json['status'] as String,
  data: ReviewsListDataDto.fromJson(json['data'] as Map<String, dynamic>),
);

ReviewsListDataDto _$ReviewsListDataDtoFromJson(Map<String, dynamic> json) =>
    ReviewsListDataDto(
      reviews: (json['reviews'] as List<dynamic>)
          .map((e) => ReviewDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      allQuantity: (json['all_quantity'] as num).toInt(),
    );
