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
            (curr.generationError != null ||
                curr.justGenerated ||
                curr.saveDraftError != null ||
                curr.justSavedDraft ||
                curr.sendError != null ||
                curr.justSent),
        listener: (context, state) {
          final loaded = state as ReviewDetailLoadedState;
          final messenger = ScaffoldMessenger.of(context);
          if (loaded.justGenerated) {
            messenger.showSnackBar(
              SnackBar(content: Text(strings.reviewDetailAnswerGenerated)),
            );
          } else if (loaded.generationError case final error?) {
            messenger.showSnackBar(
              SnackBar(content: Text(strings.reviewsError(error))),
            );
          } else if (loaded.justSavedDraft) {
            messenger.showSnackBar(
              SnackBar(content: Text(strings.reviewDetailDraftSaved)),
            );
          } else if (loaded.saveDraftError case final error?) {
            messenger.showSnackBar(
              SnackBar(content: Text(strings.reviewsError(error))),
            );
          } else if (loaded.justSent) {
            messenger.showSnackBar(
              SnackBar(content: Text(strings.reviewDetailAnswerSent)),
            );
          } else if (loaded.sendError case final error?) {
            messenger.showSnackBar(
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
          ReviewDetailLoadedState(
            :final review,
            :final isGenerating,
            :final isSavingDraft,
            :final isSending,
          ) =>
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
                  if (review.productIcon != null ||
                      review.productName != null) ...[
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        if (review.productIcon case final iconUrl?)
                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                iconUrl,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                                errorBuilder: (_, _, _) => Container(
                                  width: 70,
                                  height: 70,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.surfaceContainerHighest,
                                  child: Icon(
                                    Icons.image_not_supported_outlined,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (review.productName case final name?)
                          Expanded(
                            child: Text(
                              name,
                              style: Theme.of(context).textTheme.bodyMedium,
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                      ],
                    ),
                  ],
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
                  if (review.isAnswered) ...[
                    ReviewAnswerBlock(
                      answer: review.answer!,
                      isAi: review.isAiAnswered,
                    ),
                  ] else ...[
                    _AnswerEditor(
                      initialAnswer: review.answer,
                      isGenerating: isGenerating,
                      isSavingDraft: isSavingDraft,
                      isSending: isSending,
                      onGenerate: () => context.read<ReviewDetailBloc>().add(
                        ReviewDetailGenerateReplyRequested(id: review.id),
                      ),
                      onSaveDraft: (text) =>
                          context.read<ReviewDetailBloc>().add(
                            ReviewDetailSaveDraftPressed(
                              id: review.id,
                              text: text,
                            ),
                          ),
                      onSend: (text) => context.read<ReviewDetailBloc>().add(
                        ReviewDetailSendAnswerPressed(
                          id: review.id,
                          text: text,
                        ),
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

class _AnswerEditor extends StatefulWidget {
  const _AnswerEditor({
    required this.initialAnswer,
    required this.isGenerating,
    required this.isSavingDraft,
    required this.isSending,
    required this.onGenerate,
    required this.onSaveDraft,
    required this.onSend,
  });

  final String? initialAnswer;
  final bool isGenerating;
  final bool isSavingDraft;
  final bool isSending;
  final VoidCallback onGenerate;
  final ValueChanged<String> onSaveDraft;
  final ValueChanged<String> onSend;

  @override
  State<_AnswerEditor> createState() => _AnswerEditorState();
}

class _AnswerEditorState extends State<_AnswerEditor> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialAnswer ?? '');
    _controller.addListener(() => setState(() {}));
  }

  @override
  void didUpdateWidget(_AnswerEditor oldWidget) {
    super.didUpdateWidget(oldWidget);
    final newAnswer = widget.initialAnswer ?? '';
    if (newAnswer != (oldWidget.initialAnswer ?? '') &&
        newAnswer != _controller.text) {
      _controller.text = newAnswer;
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
    final busy =
        widget.isGenerating || widget.isSavingDraft || widget.isSending;
    final currentText = _controller.text.trim();
    final savedText = (widget.initialAnswer ?? '').trim();
    final isModified = currentText != savedText;
    final canSaveDraft = !busy && isModified && currentText.isNotEmpty;
    final canSend = !busy && currentText.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _controller,
          enabled: !busy,
          maxLines: null,
          minLines: 4,
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: strings.reviewDetailAnswerHint,
          ),
        ),
        const SizedBox(height: 16),
        _GenerateReplyButton(
          isGenerating: widget.isGenerating,
          isRegenerate: widget.initialAnswer != null,
          onPressed: busy ? null : widget.onGenerate,
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: canSaveDraft
                    ? () => widget.onSaveDraft(_controller.text.trim())
                    : null,
                child: widget.isSavingDraft
                    ? const SizedBox(
                        height: 18,
                        width: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text(
                        strings.reviewDetailSaveDraftButton,
                        textAlign: .center,
                      ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: FilledButton(
                onPressed: canSend
                    ? () => widget.onSend(_controller.text.trim())
                    : null,
                child: widget.isSending
                    ? const SizedBox(
                        height: 18,
                        width: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : Text(
                        strings.reviewDetailSendButton,
                        textAlign: .center,
                      ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _GenerateReplyButton extends StatefulWidget {
  const _GenerateReplyButton({
    required this.isGenerating,
    required this.onPressed,
    this.isRegenerate = false,
  });

  final bool isGenerating;
  final bool isRegenerate;
  final VoidCallback? onPressed;

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
                      onTap: (generating || widget.onPressed == null)
                          ? null
                          : widget.onPressed,
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
                                  : widget.isRegenerate
                                  ? strings.reviewDetailRegenerateAnswer
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
