import 'package:meta/meta.dart';

@immutable
class SalesPoint {
  const SalesPoint({
    required this.date,
    required this.salesQuantity,
    required this.salesAmount,
    required this.returnsQuantity,
    required this.returnsAmount,
    required this.profitAmount,
    required this.adsAmount,
    required this.taxAmount,
    required this.totalCostPrice,
    this.ordersQuantity,
    this.ordersAmount,
  });

  /// Date of the sale.
  final DateTime date;

  /// Number of units sold.
  final int salesQuantity;

  /// Revenue amount from sales.
  final num salesAmount;

  /// Number of returned items.
  final int returnsQuantity;

  /// Amount from returns.
  final num returnsAmount;

  /// Profit amount.
  final num profitAmount;

  /// Advertising expenses.
  final num adsAmount;

  /// Tax amount.
  final num taxAmount;

  /// Total cost price.
  final num totalCostPrice;

  /// Number of orders (optional, not always present in response).
  final int? ordersQuantity;

  /// Order amount (optional, not always present in response).
  final num? ordersAmount;
}
