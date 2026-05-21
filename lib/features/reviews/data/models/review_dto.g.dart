// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewDto _$ReviewDtoFromJson(Map<String, dynamic> json) => ReviewDto(
  id: json['id'] as String,
  userId: json['user_id'] as String?,
  cabinetId: json['cabinet_id'] as String?,
  marketplace: (json['marketplace'] as num?)?.toInt(),
  marketplaceReviewId: json['marketplace_review_id'] as String?,
  marketplaceProductId: json['marketplace_product_id'] as String?,
  text: json['text'] as String?,
  rating: (json['rating'] as num?)?.toInt(),
  answer: json['answer'] as String?,
  aiProvider: json['ai_provider'] as String?,
  aiModel: json['ai_model'] as String?,
  isAnswered: json['is_answered'] as bool?,
  isAiAnswered: json['is_ai_answered'] as bool?,
  marketplaceAnswerId: json['marketplace_answer_id'] as String?,
  buyerName: json['buyer_name'] as String?,
  createdDate: json['created_date'] == null
      ? null
      : DateTime.parse(json['created_date'] as String),
);
