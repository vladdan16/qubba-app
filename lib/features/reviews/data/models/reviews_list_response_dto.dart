import 'package:json_annotation/json_annotation.dart';

import 'review_dto.dart';

part 'reviews_list_response_dto.g.dart';

@JsonSerializable(createToJson: false)
class ReviewsListResponseDto {
  const ReviewsListResponseDto({required this.status, required this.data});

  final String status;
  final ReviewsListDataDto data;

  factory ReviewsListResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ReviewsListResponseDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class ReviewsListDataDto {
  const ReviewsListDataDto({required this.reviews, required this.allQuantity});

  final List<ReviewDto> reviews;

  @JsonKey(name: 'all_quantity')
  final int allQuantity;

  factory ReviewsListDataDto.fromJson(Map<String, dynamic> json) =>
      _$ReviewsListDataDtoFromJson(json);
}
