part of 'sales_bloc.dart';

sealed class SalesEvent {
  const SalesEvent();
}

final class SalesLoadRequested extends SalesEvent {
  const SalesLoadRequested({this.query});

  final SalesQuery? query;
}

final class SalesRefreshRequested extends SalesEvent {
  const SalesRefreshRequested();
}

final class SalesMarketplaceChanged extends SalesEvent {
  const SalesMarketplaceChanged({required this.marketplace});

  final Marketplace marketplace;
}

final class SalesDateRangeChanged extends SalesEvent {
  const SalesDateRangeChanged({
    required this.startDate,
    required this.endDate,
  });

  final DateTime startDate;
  final DateTime endDate;
}
