import 'dart:async';
import 'dart:math' as math;

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
            if (GoRouter.of(context).canPop()) {
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
            curr is ReviewDetailLoadedState &&
            (curr.generationError != null || curr.justGenerated),
        listener: (context, state) {
          final loaded = state as ReviewDetailLoadedState;
          if (loaded.justGenerated) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(strings.reviewDetailAnswerGenerated)),
            );
          } else if (loaded.generationError case final error?) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(strings.reviewsError(error))),
            );
          }
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

class _GenerateReplyButton extends StatefulWidget {
  const _GenerateReplyButton({
    required this.isGenerating,
    required this.onPressed,
  });

  final bool isGenerating;
  final VoidCallback onPressed;

  @override
  State<_GenerateReplyButton> createState() => _GenerateReplyButtonState();
}

class _GenerateReplyButtonState extends State<_GenerateReplyButton>
    with SingleTickerProviderStateMixin {
  static const _height = 56.0;
  static const _borderRadius = BorderRadius.all(Radius.circular(_height / 2));

  static const _idleGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF7C3AED), Color(0xFF4338CA)],
  );

  // First color equals last — guarantees a seamless rotation loop.
  static const _spinColors = [
    Color(0xFF6366F1),
    Color(0xFFA855F7),
    Color(0xFFEC4899),
    Color(0xFFA855F7),
    Color(0xFF6366F1),
  ];
  static const _glowColor = Color(0xFF8B5CF6);

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    if (widget.isGenerating) unawaited(_controller.repeat());
  }

  @override
  void didUpdateWidget(_GenerateReplyButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isGenerating == oldWidget.isGenerating) return;
    if (widget.isGenerating) {
      unawaited(_controller.repeat());
    } else {
      _controller
        ..stop()
        ..value = 0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final strings = Strings.of(context);
    final textStyle = Theme.of(context).textTheme.labelLarge?.copyWith(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.3,
    );

    return SizedBox(
      width: double.infinity,
      height: _height,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          final generating = widget.isGenerating;
          final t = _controller.value;
          final angle = t * 2 * math.pi;
          final glowAlpha = generating ? 0.35 + 0.15 * math.sin(angle) : 0.22;

          return DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: _borderRadius,
              boxShadow: [
                BoxShadow(
                  color: _glowColor.withValues(alpha: glowAlpha),
                  blurRadius: generating ? 28 : 14,
                  spreadRadius: generating ? 2 : 0,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: _borderRadius,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: generating
                          ? SweepGradient(
                              transform: GradientRotation(angle),
                              colors: _spinColors,
                            )
                          : _idleGradient,
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: generating ? null : widget.onPressed,
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.auto_awesome,
                              color: Colors.white,
                              size: 20,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              generating
                                  ? strings.reviewDetailGenerating
                                  : strings.reviewDetailGenerateAnswer,
                              style: textStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
