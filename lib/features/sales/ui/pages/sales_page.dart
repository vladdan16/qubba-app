import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/di/user/user_scope.dart';
import '../../../../l10n/l10n.dart';
import '../../domain/bloc/sales_bloc.dart';
import '../../domain/models/marketplace.dart';
import '../../domain/models/sales_point.dart';
import '../../domain/models/sales_query.dart';

class SalesPage extends StatelessWidget {
  const SalesPage({
    required this.cabinetId,
    this.cabinetName,
    super.key,
  });

  final String cabinetId;
  final String? cabinetName;

  @override
  Widget build(BuildContext context) => BlocProvider<SalesBloc>(
    lazy: false,
    create: (context) {
      final bloc = SalesBloc(
        repository: UserScope.of(context).salesRepository,
      );

      final now = DateTime.now();
      final endDate = DateTime(now.year, now.month, now.day);
      final startDate = endDate.subtract(const Duration(days: 30));

      bloc.add(
        SalesLoadRequested(
          query: SalesQuery(
            marketplace: Marketplace.wildberries,
            startDate: startDate,
            endDate: endDate,
            cabinetIds: [cabinetId],
          ),
        ),
      );

      return bloc;
    },
    child: _SalesView(cabinetName: cabinetName),
  );
}

class _SalesView extends StatelessWidget {
  const _SalesView({required this.cabinetName});

  final String? cabinetName;

  @override
  Widget build(BuildContext context) {
    final strings = Strings.of(context);

    return BlocBuilder<SalesBloc, SalesState>(
      builder: (context, state) => switch (state) {
        SalesInitialState() || SalesLoadingState() => Scaffold(
          appBar: _SalesAppBar(cabinetName: cabinetName),
          body: const Center(child: CircularProgressIndicator()),
        ),
        SalesFailureState(
          :final message,
          :final lastQuery,
          :final lastPoints,
        ) =>
          Scaffold(
            appBar: _SalesAppBar(cabinetName: cabinetName),
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
          cabinetName: cabinetName,
          isSwitchingMarketplace: state is SalesLoadingFromReadyState,
          selectedMarketplace: query.marketplace,
          startDate: query.startDate,
          endDate: query.endDate,
          points: points,
        ),
      },
    );
  }
}

class _ReadySalesScaffold extends StatelessWidget {
  const _ReadySalesScaffold({
    required this.cabinetName,
    required this.isSwitchingMarketplace,
    required this.selectedMarketplace,
    required this.startDate,
    required this.endDate,
    required this.points,
  });

  final String? cabinetName;
  final bool isSwitchingMarketplace;
  final Marketplace selectedMarketplace;
  final DateTime startDate;
  final DateTime endDate;
  final List<SalesPoint> points;

  void _onDateRangePicked(BuildContext context) async {
    final bloc = context.read<SalesBloc>();
    final now = DateTime.now();

    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: now,
      initialDateRange: DateTimeRange(start: startDate, end: endDate),
    );

    if (picked != null) {
      bloc.add(
        SalesDateRangeChanged(
          startDate: picked.start,
          endDate: picked.end,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final strings = Strings.of(context);

    return Scaffold(
      appBar: _SalesAppBar(cabinetName: cabinetName),
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
                _DateRangeSelector(
                  startDate: startDate,
                  endDate: endDate,
                  onTap: () => _onDateRangePicked(context),
                ),
                const SizedBox(height: 16),
                if (points.isEmpty)
                  const _EmptyState()
                else ...[
                  _StatisticsSummary(points: points),
                  const SizedBox(height: 24),
                  _ChartCard(
                    title: strings.salesRevenueChart,
                    child: _RevenueChart(points: points),
                  ),
                  const SizedBox(height: 16),
                  _ChartCard(
                    title: strings.salesQuantityChart,
                    child: _SalesQuantityChart(points: points),
                  ),
                  const SizedBox(height: 16),
                  _ChartCard(
                    title: strings.salesProfitChart,
                    child: _ProfitChart(points: points),
                  ),
                ],
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
}

class _SalesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _SalesAppBar({required this.cabinetName});

  final String? cabinetName;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final strings = Strings.of(context);
    final title = (cabinetName == null || cabinetName!.isEmpty)
        ? strings.salesTitle
        : '${strings.salesTitle} · $cabinetName';

    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          final router = GoRouter.of(context);
          if (router.canPop()) {
            context.pop();
          } else {
            context.go('/cabinets');
          }
        },
      ),
      title: Text(title),
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

class _DateRangeSelector extends StatelessWidget {
  const _DateRangeSelector({
    required this.startDate,
    required this.endDate,
    required this.onTap,
  });

  final DateTime startDate;
  final DateTime endDate;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final strings = Strings.of(context);
    final dateFormat = DateFormat.yMMMd();

    return OutlinedButton.icon(
      onPressed: onTap,
      icon: const Icon(Icons.calendar_today),
      label: Text(
        '${dateFormat.format(startDate)} - ${dateFormat.format(endDate)}',
      ),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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

class _StatisticsSummary extends StatelessWidget {
  const _StatisticsSummary({required this.points});

  final List<SalesPoint> points;

  @override
  Widget build(BuildContext context) {
    final strings = Strings.of(context);
    final theme = Theme.of(context);
    final currencySymbol = strings.salesCurrencySymbol;

    final totalRevenue = points.fold<num>(
      0,
      (sum, p) => sum + p.salesAmount,
    );
    final totalProfit = points.fold<num>(
      0,
      (sum, p) => sum + p.profitAmount,
    );
    final totalSales = points.fold<int>(
      0,
      (sum, p) => sum + p.salesQuantity,
    );
    final totalReturns = points.fold<int>(
      0,
      (sum, p) => sum + p.returnsQuantity,
    );
    final totalAds = points.fold<num>(
      0,
      (sum, p) => sum + p.adsAmount,
    );

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            _StatRow(
              label: strings.salesTotalRevenue,
              value: '${_formatNumber(totalRevenue)} $currencySymbol',
              valueColor: theme.colorScheme.primary,
            ),
            const SizedBox(height: 8),
            _StatRow(
              label: strings.salesTotalProfit,
              value: '${_formatNumber(totalProfit)} $currencySymbol',
              valueColor: totalProfit >= 0
                  ? theme.colorScheme.tertiary
                  : theme.colorScheme.error,
            ),
            const SizedBox(height: 8),
            _StatRow(
              label: strings.salesTotalSales,
              value: totalSales.toString(),
            ),
            const SizedBox(height: 8),
            _StatRow(
              label: strings.salesTotalReturns,
              value: totalReturns.toString(),
              valueColor: theme.colorScheme.error,
            ),
            const SizedBox(height: 8),
            _StatRow(
              label: strings.salesAdsExpenses,
              value: '${_formatNumber(totalAds)} $currencySymbol',
            ),
          ],
        ),
      ),
    );
  }

  String _formatNumber(num value) =>
      NumberFormat.decimalPattern().format(value.round());
}

class _StatRow extends StatelessWidget {
  const _StatRow({
    required this.label,
    required this.value,
    this.valueColor,
  });

  final String label;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Text(label, style: theme.textTheme.bodyMedium),
        Text(
          value,
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: valueColor,
          ),
        ),
      ],
    );
  }
}

class _ChartCard extends StatelessWidget {
  const _ChartCard({
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}

class _RevenueChart extends StatelessWidget {
  const _RevenueChart({required this.points});

  final List<SalesPoint> points;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final spots = _buildSpots();
    final minY = spots.isEmpty ? 0.0 : spots.map((s) => s.y).reduce((a, b) => a < b ? a : b);
    final maxY = spots.isEmpty ? 100.0 : spots.map((s) => s.y).reduce((a, b) => a > b ? a : b);

    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: _calculateInterval(maxY - minY),
          getDrawingHorizontalLine: (value) => FlLine(
            color: theme.colorScheme.outline.withValues(alpha: 0.2),
            strokeWidth: 1,
          ),
        ),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 50,
              getTitlesWidget: (value, meta) => Text(
                _formatAxisValue(value),
                style: theme.textTheme.bodySmall,
              ),
            ),
          ),
          rightTitles: const AxisTitles(),
          topTitles: const AxisTitles(),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: _calculateDateInterval(),
              getTitlesWidget: (value, meta) => _buildDateLabel(
                context,
                value,
              ),
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            color: theme.colorScheme.primary,
            barWidth: 2,
            isStrokeCapRound: true,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              color: theme.colorScheme.primary.withValues(alpha: 0.1),
            ),
          ),
        ],
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            getTooltipItems: (touchedSpots) => touchedSpots
                .map((spot) => LineTooltipItem(
                      _formatTooltipValue(spot.y),
                      TextStyle(color: theme.colorScheme.onSurface),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }

  List<FlSpot> _buildSpots() {
    if (points.isEmpty) return [];

    final sortedPoints = List<SalesPoint>.from(points)
      ..sort((a, b) => a.date.compareTo(b.date));
    final firstDate = sortedPoints.first.date;

    return sortedPoints.map((point) {
      final x = point.date.difference(firstDate).inDays.toDouble();
      return FlSpot(x, point.salesAmount.toDouble());
    }).toList();
  }

  double _calculateDateInterval() {
    if (points.length <= 7) return 1;
    if (points.length <= 14) return 2;
    if (points.length <= 30) return 7;
    return 14;
  }

  Widget _buildDateLabel(BuildContext context, double value) {
    if (points.isEmpty) return const SizedBox.shrink();

    final sortedPoints = List<SalesPoint>.from(points)
      ..sort((a, b) => a.date.compareTo(b.date));
    final firstDate = sortedPoints.first.date;
    final date = firstDate.add(Duration(days: value.toInt()));

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        DateFormat.MMMd().format(date),
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }

  double _calculateInterval(double range) {
    if (range <= 0) return 100;
    if (range <= 1000) return 200;
    if (range <= 10000) return 2000;
    if (range <= 100000) return 20000;
    return range / 5;
  }

  String _formatAxisValue(double value) {
    if (value >= 1000000) return '${(value / 1000000).toStringAsFixed(1)}M';
    if (value >= 1000) return '${(value / 1000).toStringAsFixed(0)}K';
    return value.toStringAsFixed(0);
  }

  String _formatTooltipValue(double value) =>
      NumberFormat.decimalPattern().format(value.round());
}

class _SalesQuantityChart extends StatelessWidget {
  const _SalesQuantityChart({required this.points});

  final List<SalesPoint> points;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final barGroups = _buildBarGroups(context);

    return BarChart(
      BarChartData(
        barGroups: barGroups,
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          getDrawingHorizontalLine: (value) => FlLine(
            color: theme.colorScheme.outline.withValues(alpha: 0.2),
            strokeWidth: 1,
          ),
        ),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) => Text(
                value.toInt().toString(),
                style: theme.textTheme.bodySmall,
              ),
            ),
          ),
          rightTitles: const AxisTitles(),
          topTitles: const AxisTitles(),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              getTitlesWidget: (value, meta) => _buildDateLabel(
                context,
                value,
              ),
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            getTooltipItem: (group, groupIndex, rod, rodIndex) =>
                BarTooltipItem(
              rod.toY.toInt().toString(),
              TextStyle(color: theme.colorScheme.onSurface),
            ),
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> _buildBarGroups(BuildContext context) {
    if (points.isEmpty) return [];

    final theme = Theme.of(context);
    final sortedPoints = List<SalesPoint>.from(points)
      ..sort((a, b) => a.date.compareTo(b.date));
    final firstDate = sortedPoints.first.date;

    return sortedPoints.map((point) {
      final x = point.date.difference(firstDate).inDays;
      return BarChartGroupData(
        x: x,
        barRods: [
          BarChartRodData(
            toY: point.salesQuantity.toDouble(),
            color: theme.colorScheme.secondary,
            width: _calculateBarWidth(),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
          ),
        ],
      );
    }).toList();
  }

  double _calculateBarWidth() {
    if (points.length <= 7) return 20;
    if (points.length <= 14) return 12;
    if (points.length <= 30) return 6;
    return 3;
  }

  Widget _buildDateLabel(BuildContext context, double value) {
    if (points.isEmpty) return const SizedBox.shrink();

    final sortedPoints = List<SalesPoint>.from(points)
      ..sort((a, b) => a.date.compareTo(b.date));
    final firstDate = sortedPoints.first.date;
    final date = firstDate.add(Duration(days: value.toInt()));

    // Show label only for some bars to avoid clutter
    final interval = _calculateLabelInterval();
    if (value.toInt() % interval != 0) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        DateFormat.MMMd().format(date),
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }

  int _calculateLabelInterval() {
    if (points.length <= 7) return 1;
    if (points.length <= 14) return 2;
    if (points.length <= 30) return 7;
    return 14;
  }
}

class _ProfitChart extends StatelessWidget {
  const _ProfitChart({required this.points});

  final List<SalesPoint> points;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final spots = _buildSpots();
    final minY = spots.isEmpty
        ? 0.0
        : spots.map((s) => s.y).reduce((a, b) => a < b ? a : b);
    final maxY = spots.isEmpty
        ? 100.0
        : spots.map((s) => s.y).reduce((a, b) => a > b ? a : b);

    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: _calculateInterval(maxY - minY),
          getDrawingHorizontalLine: (value) => FlLine(
            color: theme.colorScheme.outline.withValues(alpha: 0.2),
            strokeWidth: 1,
          ),
        ),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 50,
              getTitlesWidget: (value, meta) => Text(
                _formatAxisValue(value),
                style: theme.textTheme.bodySmall,
              ),
            ),
          ),
          rightTitles: const AxisTitles(),
          topTitles: const AxisTitles(),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: _calculateDateInterval(),
              getTitlesWidget: (value, meta) => _buildDateLabel(
                context,
                value,
              ),
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            color: theme.colorScheme.tertiary,
            barWidth: 2,
            isStrokeCapRound: true,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              color: theme.colorScheme.tertiary.withValues(alpha: 0.1),
            ),
          ),
        ],
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            getTooltipItems: (touchedSpots) => touchedSpots
                .map((spot) => LineTooltipItem(
                      _formatTooltipValue(spot.y),
                      TextStyle(color: theme.colorScheme.onSurface),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }

  List<FlSpot> _buildSpots() {
    if (points.isEmpty) return [];

    final sortedPoints = List<SalesPoint>.from(points)
      ..sort((a, b) => a.date.compareTo(b.date));
    final firstDate = sortedPoints.first.date;

    return sortedPoints.map((point) {
      final x = point.date.difference(firstDate).inDays.toDouble();
      return FlSpot(x, point.profitAmount.toDouble());
    }).toList();
  }

  double _calculateDateInterval() {
    if (points.length <= 7) return 1;
    if (points.length <= 14) return 2;
    if (points.length <= 30) return 7;
    return 14;
  }

  Widget _buildDateLabel(BuildContext context, double value) {
    if (points.isEmpty) return const SizedBox.shrink();

    final sortedPoints = List<SalesPoint>.from(points)
      ..sort((a, b) => a.date.compareTo(b.date));
    final firstDate = sortedPoints.first.date;
    final date = firstDate.add(Duration(days: value.toInt()));

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        DateFormat.MMMd().format(date),
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }

  double _calculateInterval(double range) {
    if (range <= 0) return 100;
    if (range <= 1000) return 200;
    if (range <= 10000) return 2000;
    if (range <= 100000) return 20000;
    return range / 5;
  }

  String _formatAxisValue(double value) {
    if (value >= 1000000) return '${(value / 1000000).toStringAsFixed(1)}M';
    if (value >= 1000) return '${(value / 1000).toStringAsFixed(0)}K';
    return value.toStringAsFixed(0);
  }

  String _formatTooltipValue(double value) =>
      NumberFormat.decimalPattern().format(value.round());
}
