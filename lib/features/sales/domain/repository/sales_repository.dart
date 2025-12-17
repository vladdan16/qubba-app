import '../models/sales_point.dart';
import '../models/sales_query.dart';

abstract interface class SalesRepository {
  Future<List<SalesPoint>> getDailySales(SalesQuery query);

  Future<void> dispose();
}
