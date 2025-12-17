// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_daily_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesDailyResponseDto _$SalesDailyResponseDtoFromJson(
  Map<String, dynamic> json,
) => SalesDailyResponseDto(
  status: json['status'] as String,
  data: SalesDailyDataDto.fromJson(json['data'] as Map<String, dynamic>),
  details: json['details'],
);

SalesDailyDataDto _$SalesDailyDataDtoFromJson(Map<String, dynamic> json) =>
    SalesDailyDataDto(
      dates: SalesDailyDataDto._datesFromJson(json['dates']),
      total: SalesDailyMetricsDto.fromJson(
        json['total'] as Map<String, dynamic>,
      ),
      asyncMode: json['async_mode'] as bool,
    );

SalesDailyMetricsDto _$SalesDailyMetricsDtoFromJson(
  Map<String, dynamic> json,
) => SalesDailyMetricsDto(
  salesQuantity: (json['sales_quantity'] as num).toInt(),
  salesAmount: json['sales_amount'] as num,
  returnsQuantity: (json['returns_quantity'] as num).toInt(),
  returnsAmount: json['returns_amount'] as num,
  totalCostPrice: json['total_cost_price'] as num,
  adsAmount: json['ads_amount'] as num,
  taxAmount: json['tax_amount'] as num,
  profitAmount: json['profit_amount'] as num,
  ordersQuantity: (json['orders_quantity'] as num?)?.toInt(),
  ordersAmount: json['orders_amount'] as num?,
  wildberriesDiscount: json['wb_discount'] as num?,
  commissionExpensesAmount: json['commission_expenses_amount'] as num?,
);
