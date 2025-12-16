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
      builder: (context, state) => switch (state) {
        SalesInitialState() || SalesLoadingState() => const Scaffold(
          appBar: _SalesAppBar(),
          body: Center(child: CircularProgressIndicator()),
        ),

        SalesFailureState(
          :final message,
          :final lastQuery,
          :final lastPoints,
        ) =>
          Scaffold(
            appBar: const _SalesAppBar(),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(message, textAlign: TextAlign.center),
                    const SizedBox(height: 16),
                    FilledButton(
                      onPressed: () => context.read<SalesBloc>().add(
                        SalesLoadRequested(query: lastQuery),
                      ),
                      child: Text(strings.salesRetry),
                    ),
                    if (lastPoints != null) ...[
                      const SizedBox(height: 12),
                      Text(
                        strings.salesLastLoadedPoints(lastPoints.length),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),

        SalesReadyState(:final query, :final points) => _ReadySalesScaffold(
          strings: strings,
          isSwitchingMarketplace: state is SalesLoadingFromReadyState,
          selectedMarketplace: query.marketplace,
          pointsCount: points.length,
          isEmpty: points.isEmpty,
        ),
      },
    );
  }
}

class _ReadySalesScaffold extends StatelessWidget {
  const _ReadySalesScaffold({
    required this.strings,
    required this.isSwitchingMarketplace,
    required this.selectedMarketplace,
    required this.pointsCount,
    required this.isEmpty,
  });

  final Strings strings;
  final bool isSwitchingMarketplace;
  final Marketplace selectedMarketplace;
  final int pointsCount;
  final bool isEmpty;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const _SalesAppBar(),
    body: Stack(
      children: [
        RefreshIndicator(
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
                selected: selectedMarketplace,
                isEnabled: !isSwitchingMarketplace,
                onChanged: (m) => context.read<SalesBloc>().add(
                  SalesMarketplaceChanged(marketplace: m),
                ),
              ),
              const SizedBox(height: 16),
              _SummaryCard(pointsCount: pointsCount),
              const SizedBox(height: 16),
              if (isEmpty)
                const _EmptyState()
              else
                _PointsPreview(pointsCount: pointsCount),
            ],
          ),
        ),
        if (isSwitchingMarketplace)
          const Positioned.fill(
            child: AbsorbPointer(
              child: ColoredBox(
                color: Colors.black26,
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
          ),
      ],
    ),
  );
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
    required this.isEnabled,
  });

  final Marketplace selected;
  final ValueChanged<Marketplace> onChanged;
  final bool isEnabled;

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
      onSelectionChanged: isEnabled
          ? (value) {
              if (value.isEmpty) return;
              final next = value.first;
              if (next == selected) return;
              onChanged(next);
            }
          : null,
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
