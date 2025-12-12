import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/user/user_scope.dart';
import '../../../../l10n/l10n.dart';
import '../../domain/bloc/sales_bloc.dart';
import '../../domain/models/marketplace.dart';

class SalesPage extends StatelessWidget {
  const SalesPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider<SalesBloc>(
    lazy: false,
    create: (context) => SalesBloc(
      repository: UserScope.of(context).salesRepository,
    )..add(const SalesLoadRequested()),
    child: const _SalesView(),
  );
}

class _SalesView extends StatelessWidget {
  const _SalesView();

  @override
  Widget build(BuildContext context) {
    final strings = Strings.of(context);

    return BlocBuilder<SalesBloc, SalesState>(
      builder: (context, state) {
        if (state is SalesInitialState || state is SalesLoadingState) {
          return const Scaffold(
            appBar: _SalesAppBar(),
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is SalesFailureState) {
          final lastQuery = state.lastQuery;
          return Scaffold(
            appBar: const _SalesAppBar(),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      state.message,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    FilledButton(
                      onPressed: () => context.read<SalesBloc>().add(
                        SalesLoadRequested(query: lastQuery),
                      ),
                      child: Text(strings.salesRetry),
                    ),
                    if (state.lastPoints != null) ...[
                      const SizedBox(height: 12),
                      Text(
                        strings.salesLastLoadedPoints(state.lastPoints!.length),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        }

        final ready = state is SalesReadyState ? state : null;
        if (ready == null) {
          return const Scaffold(
            appBar: _SalesAppBar(),
            body: Center(child: CircularProgressIndicator()),
          );
        }

        return Scaffold(
          appBar: const _SalesAppBar(),
          body: RefreshIndicator(
            onRefresh: () async {
              final bloc = context.read<SalesBloc>();
              final finished = bloc.stream.firstWhere(
                (s) => s is SalesReadyIdleState || s is SalesFailureState,
              );
              bloc.add(const SalesRefreshRequested());
              await finished;
            },
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              children: [
                _MarketplaceSwitcher(
                  selected: ready.query.marketplace,
                  onChanged: (m) => context.read<SalesBloc>().add(
                    SalesMarketplaceChanged(marketplace: m),
                  ),
                ),
                const SizedBox(height: 16),
                _SummaryCard(pointsCount: ready.points.length),
                const SizedBox(height: 16),
                if (ready.points.isEmpty)
                  const _EmptyState()
                else
                  _PointsPreview(pointsCount: ready.points.length),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _SalesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _SalesAppBar();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final strings = Strings.of(context);

    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          final router = GoRouter.of(context);
          if (router.canPop()) {
            context.pop();
          } else {
            context.go('/home');
          }
        },
      ),
      title: Text(strings.salesTitle),
      centerTitle: true,
    );
  }
}

class _MarketplaceSwitcher extends StatelessWidget {
  const _MarketplaceSwitcher({
    required this.selected,
    required this.onChanged,
  });

  final Marketplace selected;
  final ValueChanged<Marketplace> onChanged;

  @override
  Widget build(BuildContext context) {
    final strings = Strings.of(context);

    return SegmentedButton<Marketplace>(
      segments: [
        ButtonSegment(
          value: Marketplace.wildberries,
          label: Text(strings.salesMarketplaceWildberries),
        ),
        ButtonSegment(
          value: Marketplace.ozon,
          label: Text(strings.salesMarketplaceOzon),
        ),
      ],
      selected: {selected},
      onSelectionChanged: (value) {
        if (value.isEmpty) return;
        onChanged(value.first);
      },
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({required this.pointsCount});

  final int pointsCount;

  @override
  Widget build(BuildContext context) {
    final strings = Strings.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(strings.salesPointsLabel(pointsCount)),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    final strings = Strings.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 32),
        child: Text(strings.salesEmptyMessage),
      ),
    );
  }
}

class _PointsPreview extends StatelessWidget {
  const _PointsPreview({required this.pointsCount});

  final int pointsCount;

  @override
  Widget build(BuildContext context) {
    final strings = Strings.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(strings.salesPreviewMessage(pointsCount)),
      ),
    );
  }
}
