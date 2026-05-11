import '../../../sales/domain/models/marketplace.dart';
import '../../domain/models/review.dart';
import '../models/review_dto.dart';

abstract final class ReviewMapper {
  static Review toDomain(ReviewDto dto) => Review(
    id: dto.id,
    userId: dto.userId,
    cabinetId: dto.cabinetId,
    marketplace: _marketplaceFromCode(dto.marketplace),
    marketplaceReviewId: dto.marketplaceReviewId,
    marketplaceProductId: dto.marketplaceProductId,
    text: dto.text,
    rating: dto.rating,
    answer: dto.answer,
    aiProvider: dto.aiProvider,
    aiModel: dto.aiModel,
    isAnswered: dto.isAnswered ?? false,
    isAiAnswered: dto.isAiAnswered ?? false,
    marketplaceAnswerId: dto.marketplaceAnswerId,
    buyerName: dto.buyerName,
    createdDate: dto.createdDate,
  );

  static Marketplace? _marketplaceFromCode(int? code) => switch (code) {
    1 => Marketplace.wildberries,
    2 => Marketplace.ozon,
    _ => null,
  };
}
