import '../../domain/models/sales_query.dart';

abstract final class SalesRequestBodyMapper {
  static Map<String, Object?> toRequestBody(SalesQuery query) =>
      <String, Object?>{
        'start_date': _formatDate(query.startDate),
        'end_date': _formatDate(query.endDate),
        'cabinets': query.cabinetIds,
        'split_by_dates': query.splitByDates,
        'split_by_products': query.splitByProducts,
        'split_by_barcodes': query.splitByBarcodes,
      };

  static String _formatDate(DateTime date) {
    final year = date.year.toString().padLeft(4, '0');
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '$year-$month-$day';
  }
}
