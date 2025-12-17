import 'marketplace.dart';

class SalesQuery {
  const SalesQuery({
    required this.marketplace,
    required this.startDate,
    required this.endDate,
    this.cabinetIds = const [],
    this.splitByDates = true,
    this.splitByProducts = false,
    this.splitByBarcodes = false,
  });

  final Marketplace marketplace;

  final DateTime startDate;
  final DateTime endDate;

  final List<String> cabinetIds;

  final bool splitByDates;
  final bool splitByProducts;
  final bool splitByBarcodes;

  SalesQuery copyWith({
    Marketplace? marketplace,
    DateTime? startDate,
    DateTime? endDate,
    List<String>? cabinetIds,
    bool? splitByDates,
    bool? splitByProducts,
    bool? splitByBarcodes,
  }) => SalesQuery(
    marketplace: marketplace ?? this.marketplace,
    startDate: startDate ?? this.startDate,
    endDate: endDate ?? this.endDate,
    cabinetIds: cabinetIds ?? this.cabinetIds,
    splitByDates: splitByDates ?? this.splitByDates,
    splitByProducts: splitByProducts ?? this.splitByProducts,
    splitByBarcodes: splitByBarcodes ?? this.splitByBarcodes,
  );
}
