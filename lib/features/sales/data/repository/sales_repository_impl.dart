import 'package:dio/dio.dart';

import '../../domain/exceptions/sales_exceptions.dart';
import '../../domain/models/marketplace.dart';
import '../../domain/models/sales_point.dart';
import '../../domain/models/sales_query.dart';
import '../../domain/repository/sales_repository.dart';
import '../api/sales_api.dart';

final class SalesRepositoryImpl implements SalesRepository {
  SalesRepositoryImpl(this._salesApi);

  final SalesApi _salesApi;

  @override
  Future<List<SalesPoint>> getDailySales(SalesQuery query) async {
    try {
      final response = await switch (query.marketplace) {
        Marketplace.wildberries => _salesApi.getWildberriesDaily(query),
        Marketplace.ozon => _salesApi.getOzonDaily(query),
      };

      if (response.status != 'success') {
        throw SalesDailyLoadException(
          message: 'Sales API status: ${response.status}',
        );
      }

      if (response.data.asyncMode) {
        throw const SalesDailyLoadException(
          message: 'Report is being generated. Try again later.',
        );
      }

      final points = <SalesPoint>[];

      response.data.dates.forEach((dateString, metrics) {
        final date = DateTime.tryParse(dateString);
        if (date == null) return;

        points.add(
          SalesPoint(
            date: date,
            revenue: metrics.salesAmount,
            orders: metrics.ordersQuantity ?? 0,
            units: metrics.salesQuantity,
          ),
        );
      });

      points.sort((a, b) => a.date.compareTo(b.date));
      return points;
    } on SalesDailyLoadException {
      rethrow;
    } on DioException catch (dioException, stackTrace) {
      final statusCode = dioException.response?.statusCode;
      final statusText = statusCode?.toString() ?? 'unknown';

      throw SalesDailyLoadException(
        message: 'Failed to load daily sales (HTTP $statusText)',
        statusCode: statusCode,
        cause: dioException,
        stackTrace: stackTrace,
      );
    } catch (error, stackTrace) {
      throw SalesDailyLoadException(
        message: 'Failed to load daily sales',
        cause: error,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<void> dispose() async {}
}
