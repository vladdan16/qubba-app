import 'package:json_annotation/json_annotation.dart';

part 'review_dto.g.dart';

int? _intFromJson(dynamic value) {
  if (value == null) return null;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value);
  return null;
}

@JsonSerializable(createToJson: false)
class ReviewDto {
  const ReviewDto({
    required this.id,
    this.userId,
    this.cabinetId,
    this.marketplace,
    this.marketplaceReviewId,
    this.marketplaceProductId,
    this.productName,
    this.productIcon,
    this.text,
    this.rating,
    this.answer,
    this.aiProvider,
    this.aiModel,
    this.isAnswered,
    this.isAiAnswered,
    this.marketplaceAnswerId,
    this.buyerName,
    this.createdDate,
  });

  final String id;

  @JsonKey(name: 'user_id')
  final String? userId;

  @JsonKey(name: 'cabinet_id')
  final String? cabinetId;

  final String? marketplace;

  @JsonKey(name: 'marketplace_review_id')
  final String? marketplaceReviewId;

  @JsonKey(name: 'marketplace_product_id')
  final String? marketplaceProductId;

  @JsonKey(name: 'product_name')
  final String? productName;

  @JsonKey(name: 'product_icon')
  final String? productIcon;

  final String? text;
  @JsonKey(fromJson: _intFromJson)
  final int? rating;
  final String? answer;

  @JsonKey(name: 'ai_provider')
  final String? aiProvider;

  @JsonKey(name: 'ai_model')
  final String? aiModel;

  @JsonKey(name: 'is_answered')
  final bool? isAnswered;

  @JsonKey(name: 'is_ai_answered')
  final bool? isAiAnswered;

  @JsonKey(name: 'marketplace_answer_id')
  final String? marketplaceAnswerId;

  @JsonKey(name: 'buyer_name')
  final String? buyerName;

  @JsonKey(name: 'created_date')
  final DateTime? createdDate;

  factory ReviewDto.fromJson(Map<String, dynamic> json) =>
      _$ReviewDtoFromJson(json);
}
