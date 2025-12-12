import 'package:json_annotation/json_annotation.dart';

part 'sales_daily_response_dto.g.dart';

@JsonSerializable(createToJson: false)
class SalesDailyResponseDto {
  const SalesDailyResponseDto({
    required this.status,
    required this.data,
    this.details,
  });

  final String status;
  final SalesDailyDataDto data;
  final Object? details;

  factory SalesDailyResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SalesDailyResponseDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class SalesDailyDataDto {
  const SalesDailyDataDto({
    required this.dates,
    required this.total,
    required this.asyncMode,
  });

  @JsonKey(fromJson: _datesFromJson)
  final Map<String, SalesDailyMetricsDto> dates;

  final SalesDailyMetricsDto total;

  @JsonKey(name: 'async_mode')
  final bool asyncMode;

  factory SalesDailyDataDto.fromJson(Map<String, dynamic> json) =>
      _$SalesDailyDataDtoFromJson(json);

  static Map<String, SalesDailyMetricsDto> _datesFromJson(Object? value) {
    if (value is! Map) return <String, SalesDailyMetricsDto>{};

    final result = <String, SalesDailyMetricsDto>{};
    for (final entry in value.entries) {
      final key = entry.key;
      final item = entry.value;
      if (key is String && item is Map) {
        result[key] = SalesDailyMetricsDto.fromJson(
          Map<String, dynamic>.from(item),
        );
      }
    }
    return result;
  }
}

@JsonSerializable(createToJson: false)
class SalesDailyMetricsDto {
  const SalesDailyMetricsDto({
    required this.salesQuantity,
    required this.salesAmount,
    required this.returnsQuantity,
    required this.returnsAmount,
    required this.totalCostPrice,
    required this.adsAmount,
    required this.taxAmount,
    required this.profitAmount,
    this.ordersQuantity,
    this.ordersAmount,
    this.wildberriesDiscount,
    this.commissionExpensesAmount,
  });

  @JsonKey(name: 'sales_quantity')
  final int salesQuantity;

  @JsonKey(name: 'sales_amount')
  final num salesAmount;

  @JsonKey(name: 'returns_quantity')
  final int returnsQuantity;

  @JsonKey(name: 'returns_amount')
  final num returnsAmount;

  @JsonKey(name: 'total_cost_price')
  final num totalCostPrice;

  @JsonKey(name: 'ads_amount')
  final num adsAmount;

  @JsonKey(name: 'tax_amount')
  final num taxAmount;

  @JsonKey(name: 'profit_amount')
  final num profitAmount;

  @JsonKey(name: 'orders_quantity')
  final int? ordersQuantity;

  @JsonKey(name: 'orders_amount')
  final num? ordersAmount;

  @JsonKey(name: 'wb_discount')
  final num? wildberriesDiscount;

  @JsonKey(name: 'commission_expenses_amount')
  final num? commissionExpensesAmount;

  factory SalesDailyMetricsDto.fromJson(Map<String, dynamic> json) =>
      _$SalesDailyMetricsDtoFromJson(json);
}
