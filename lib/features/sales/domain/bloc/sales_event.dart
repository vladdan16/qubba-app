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
