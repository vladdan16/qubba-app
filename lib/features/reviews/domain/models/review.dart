import 'package:meta/meta.dart';

import '../../../sales/domain/models/marketplace.dart';

@immutable
final class Review {
  const Review({
    required this.id,
    required this.isAnswered,
    required this.isAiAnswered,
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
    this.marketplaceAnswerId,
    this.buyerName,
    this.createdDate,
  });

  final String id;
  final String? userId;
  final String? cabinetId;
  final Marketplace? marketplace;
  final String? marketplaceReviewId;
  final String? marketplaceProductId;
  final String? productName;
  final String? productIcon;
  final String? text;
  final int? rating;
  final String? answer;
  final String? aiProvider;
  final String? aiModel;
  final bool isAnswered;
  final bool isAiAnswered;
  final String? marketplaceAnswerId;
  final String? buyerName;
  final DateTime? createdDate;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Review &&
        id == other.id &&
        userId == other.userId &&
        cabinetId == other.cabinetId &&
        marketplace == other.marketplace &&
        productName == other.productName &&
        productIcon == other.productIcon &&
        text == other.text &&
        rating == other.rating &&
        answer == other.answer &&
        isAnswered == other.isAnswered &&
        isAiAnswered == other.isAiAnswered &&
        buyerName == other.buyerName &&
        createdDate == other.createdDate;
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    userId,
    cabinetId,
    marketplace,
    productName,
    productIcon,
    text,
    rating,
    answer,
    isAnswered,
    isAiAnswered,
    buyerName,
    createdDate,
  ]);
}
