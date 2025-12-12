class SalesPoint {
  const SalesPoint({
    required this.date,
    required this.revenue,
    required this.orders,
    required this.units,
  });

  /// Дата продажи.
  final DateTime date;

  /// Выручка за период.
  final num revenue;

  /// Кол-во заказов за период.
  final int orders;

  /// Кол-во проданных единиц за период.
  final int units;
}
