import 'package:flutter/material.dart';

import '../../../../common/ui/marketplace_badge.dart';
import '../../../../l10n/l10n.dart';
import '../../domain/models/review.dart';
import 'rating_stars.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({required this.review, required this.onTap, super.key});

  final Review review;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final strings = Strings.of(context);
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  MarketplaceBadge(marketplace: review.marketplace),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      review.buyerName ?? strings.reviewCardAnonymousBuyer,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  RatingStars(rating: review.rating),
                ],
              ),
              if (review.productName != null || review.productIcon != null) ...[
                const SizedBox(height: 8),
                Row(
                  children: [
                    if (review.productIcon case final iconUrl?)
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: _ProductThumb(url: iconUrl, size: 36),
                      ),
                    if (review.productName case final name?)
                      Expanded(
                        child: Text(
                          name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
              const SizedBox(height: 10),
              if (review.text?.isNotEmpty ?? false)
                Text(
                  review.text!,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium,
                )
              else
                Text(
                  strings.reviewCardNoText,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontStyle: FontStyle.italic,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              const SizedBox(height: 10),
              if (review.answer != null) ...[
                ReviewAnswerBlock(
                  answer: review.answer!,
                  isAi: review.isAiAnswered,
                  isPublished: review.isAnswered,
                  maxLines: 2,
                ),
              ] else
                _NoAnswerChip(),
            ],
          ),
        ),
      ),
    );
  }
}

class ReviewAnswerBlock extends StatelessWidget {
  const ReviewAnswerBlock({
    required this.answer,
    required this.isAi,
    required this.isPublished,
    this.maxLines,
    super.key,
  });

  final String answer;
  final bool isAi;
  final bool isPublished;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    final strings = Strings.of(context);
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
        border: Border(
          left: BorderSide(
            color: isPublished
                ? theme.colorScheme.primary
                : theme.colorScheme.outline,
            width: 3,
          ),
        ),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.reply, size: 16),
              const SizedBox(width: 4),
              Text(
                isAi
                    ? strings.reviewCardAiAnswerLabel
                    : strings.reviewCardSellerAnswerLabel,
                style: theme.textTheme.titleSmall,
              ),
              if (isAi) ...[
                const SizedBox(width: 4),
                Icon(
                  Icons.auto_awesome,
                  size: 14,
                  color: theme.colorScheme.secondary,
                ),
              ],
              if (!isPublished) ...[
                const Spacer(),
                const _DraftChip(),
              ],
            ],
          ),
          const SizedBox(height: 6),
          Text(
            answer,
            maxLines: maxLines,
            overflow: maxLines != null
                ? TextOverflow.ellipsis
                : TextOverflow.clip,
            style: theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

class _DraftChip extends StatelessWidget {
  const _DraftChip();

  @override
  Widget build(BuildContext context) {
    final strings = Strings.of(context);
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: theme.colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.edit_outlined,
            size: 11,
            color: theme.colorScheme.onSecondaryContainer,
          ),
          const SizedBox(width: 3),
          Text(
            strings.reviewCardDraftLabel,
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.onSecondaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductThumb extends StatelessWidget {
  const _ProductThumb({required this.url, required this.size});

  final String url;
  final double size;

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(6),
    child: Image.network(
      url,
      width: size,
      height: size,
      fit: BoxFit.cover,
      errorBuilder: (_, _, _) => Container(
        width: size,
        height: size,
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        child: Icon(
          Icons.image_not_supported_outlined,
          size: size * 0.55,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      ),
    ),
  );
}

class _NoAnswerChip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final strings = Strings.of(context);
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: theme.colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        strings.reviewCardNoAnswer,
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.onErrorContainer,
        ),
      ),
    );
  }
}
