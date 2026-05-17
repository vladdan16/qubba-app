import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../common/ui/marketplace_badge.dart';
import '../../../../core/di/user/user_scope.dart';
import '../../../../l10n/l10n.dart';
import '../../domain/bloc/review_detail_bloc.dart';
import '../widgets/rating_stars.dart';
import '../widgets/review_card.dart' show ReviewAnswerBlock;

class ReviewDetailPage extends StatelessWidget {
  const ReviewDetailPage({required this.reviewId, super.key});

  final String reviewId;

  @override
  Widget build(BuildContext context) => BlocProvider<ReviewDetailBloc>(
    lazy: false,
    create: (context) => ReviewDetailBloc(
      repository: UserScope.of(context).reviewsRepository,
    )..add(ReviewDetailLoadRequested(id: reviewId)),
    child: _ReviewDetailView(reviewId: reviewId),
  );
}

class _ReviewDetailView extends StatelessWidget {
  const _ReviewDetailView({required this.reviewId});

  final String reviewId;

  @override
  Widget build(BuildContext context) {
    final strings = Strings.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            final router = GoRouter.of(context);
            if (router.canPop()) {
              context.pop();
            } else {
              context.go('/reviews');
            }
          },
        ),
        title: Text(strings.reviewDetailTitle),
        centerTitle: true,
      ),
      body: BlocConsumer<ReviewDetailBloc, ReviewDetailState>(
        listenWhen: (_, curr) =>
            curr is ReviewDetailLoadedState && curr.generationError != null,
        listener: (context, state) {
          final error = (state as ReviewDetailLoadedState).generationError!;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(strings.reviewsError(error))),
          );
        },
        builder: (context, state) => switch (state) {
          ReviewDetailInitialState() ||
          ReviewDetailLoadingState() => const Center(
            child: CircularProgressIndicator(),
          ),
          ReviewDetailFailureState(:final message, :final id) => Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.error_outline, size: 48, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    strings.reviewsError(message),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  FilledButton(
                    onPressed: () => context.read<ReviewDetailBloc>().add(
                      ReviewDetailLoadRequested(id: id),
                    ),
                    child: Text(strings.reviewsRetry),
                  ),
                ],
              ),
            ),
          ),
          ReviewDetailLoadedState(:final review, :final isGenerating) =>
            SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      MarketplaceBadge(marketplace: review.marketplace),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              review.buyerName ??
                                  strings.reviewCardAnonymousBuyer,
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                            if (review.createdDate != null)
                              Text(
                                DateFormat.yMMMd().add_Hm().format(
                                  review.createdDate!,
                                ),
                                style:
                                    Theme.of(
                                      context,
                                    ).textTheme.bodySmall?.copyWith(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurfaceVariant,
                                    ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      RatingStars(rating: review.rating, size: 20),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 16),
                  if (review.text?.isNotEmpty ?? false)
                    Text(
                      review.text!,
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                  else
                    Text(
                      strings.reviewCardNoText,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontStyle: FontStyle.italic,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  const SizedBox(height: 24),
                  if (review.answer != null) ...[
                    ReviewAnswerBlock(
                      answer: review.answer!,
                      isAi: review.isAiAnswered,
                    ),
                  ] else ...[
                    Text(
                      strings.reviewDetailNoAnswer,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _GenerateReplyButton(
                      isGenerating: isGenerating,
                      onPressed: () => context.read<ReviewDetailBloc>().add(
                        ReviewDetailGenerateReplyRequested(id: review.id),
                      ),
                    ),
                  ],
                ],
              ),
            ),
        },
      ),
    );
  }
}

class _GenerateReplyButton extends StatelessWidget {
  const _GenerateReplyButton({
    required this.isGenerating,
    required this.onPressed,
  });

  final bool isGenerating;
  final VoidCallback onPressed;

  static const _borderRadius = BorderRadius.all(Radius.circular(26));
  static const _gradient = LinearGradient(
    colors: [Color(0xFF8B5CF6), Color(0xFF3B82F6)],
  );

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final strings = Strings.of(context);

    return SizedBox(
      width: double.infinity,
      height: 52,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: isGenerating ? null : _gradient,
          color: isGenerating ? colorScheme.surfaceContainerHighest : null,
          borderRadius: _borderRadius,
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: _borderRadius,
          child: InkWell(
            borderRadius: _borderRadius,
            onTap: isGenerating ? null : onPressed,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isGenerating)
                    SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    )
                  else
                    const Icon(
                      Icons.auto_awesome,
                      color: Colors.white,
                      size: 18,
                    ),
                  const SizedBox(width: 8),
                  Text(
                    isGenerating
                        ? strings.reviewDetailGenerating
                        : strings.reviewDetailGenerateAnswer,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: isGenerating
                          ? colorScheme.onSurfaceVariant
                          : Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
