import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/navigation/navigation_ext.dart';
import '../../../../common/ui/profile_app_bar_action.dart';
import '../../../../core/di/user/user_scope.dart';
import '../../../../l10n/l10n.dart';
import '../../domain/bloc/reviews_bloc.dart';
import '../widgets/review_card.dart';
import '../widgets/review_filters_bar.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider<ReviewsBloc>(
    lazy: false,
    create: (context) => ReviewsBloc(
      repository: UserScope.of(context).reviewsRepository,
    )..add(const ReviewsLoadRequested()),
    child: const _ReviewsView(),
  );
}

class _ReviewsView extends StatefulWidget {
  const _ReviewsView();

  @override
  State<_ReviewsView> createState() => _ReviewsViewState();
}

class _ReviewsViewState extends State<_ReviewsView> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final pos = _scrollController.position;
    if (pos.pixels >= pos.maxScrollExtent - 400) {
      context.read<ReviewsBloc>().add(const ReviewsLoadMoreRequested());
    }
  }

  @override
  Widget build(BuildContext context) {
    final strings = Strings.of(context);

    return BlocBuilder<ReviewsBloc, ReviewsState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: Text(strings.reviewsTitle),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.settings_outlined),
              tooltip: strings.reviewsAiSettingsTooltip,
              onPressed: context.openReviewsAiSettings,
            ),
            const ProfileAppBarAction(),
          ],
        ),
        body: switch (state) {
          ReviewsInitialState() || ReviewsLoadingState() => Column(
            children: [
              ReviewFiltersBar(filter: state.filter),
              const Expanded(
                child: Center(child: CircularProgressIndicator()),
              ),
            ],
          ),
          ReviewsFailureState(:final message, lastReviews: null) => Column(
            children: [
              ReviewFiltersBar(filter: state.filter),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.error_outline,
                          size: 48,
                          color: Colors.red,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          strings.reviewsError(message),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        FilledButton(
                          onPressed: () => context.read<ReviewsBloc>().add(
                            ReviewsLoadRequested(filter: state.filter),
                          ),
                          child: Text(strings.reviewsRetry),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          _ => _ReadyBody(
            scrollController: _scrollController,
            state: state,
          ),
        },
      ),
    );
  }
}

class _ReadyBody extends StatelessWidget {
  const _ReadyBody({
    required this.scrollController,
    required this.state,
  });

  final ScrollController scrollController;
  final ReviewsState state;

  @override
  Widget build(BuildContext context) {
    final strings = Strings.of(context);
    final isLoadingFromReady = state is ReviewsLoadingFromReadyState;
    final reviews = state is ReviewsReadyState
        ? (state as ReviewsReadyState).reviews
        : (state as ReviewsFailureState).lastReviews ?? [];
    final hasMore =
        state is ReviewsReadyState && (state as ReviewsReadyState).hasMore;
    final isLoadingMore = state is ReviewsLoadingMoreState;

    return Stack(
      children: [
        Column(
          children: [
            ReviewFiltersBar(filter: state.filter),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  final bloc = context.read<ReviewsBloc>();
                  final finished = bloc.stream.firstWhere(
                    (s) =>
                        s is ReviewsReadyIdleState || s is ReviewsFailureState,
                  );
                  bloc.add(const ReviewsRefreshRequested());
                  await finished;
                },
                child: ListView.builder(
                  controller: scrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(16),
                  itemCount: reviews.isEmpty
                      ? 1
                      : reviews.length + (hasMore ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (reviews.isEmpty) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 48),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.rate_review_outlined,
                                size: 64,
                                color: Theme.of(
                                  context,
                                ).colorScheme.outlineVariant,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                strings.reviewsEmpty,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                    }

                    if (index == reviews.length) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }

                    final review = reviews[index];
                    return ReviewCard(
                      review: review,
                      onTap: () async {
                        final result = await context.openReviewDetail(
                          review.id,
                        );
                        if (!context.mounted) return;
                        if (result == true) {
                          context.read<ReviewsBloc>().add(
                            const ReviewsRefreshRequested(),
                          );
                        }
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        if (isLoadingFromReady || (isLoadingMore && reviews.isEmpty))
          const Positioned.fill(
            child: AbsorbPointer(
              child: ColoredBox(
                color: Colors.black26,
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
          ),
      ],
    );
  }
}
