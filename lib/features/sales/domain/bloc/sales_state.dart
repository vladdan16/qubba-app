part of 'sales_bloc.dart';

sealed class SalesState {
  const SalesState();
}

final class SalesInitialState extends SalesState {
  const SalesInitialState();
}

final class SalesLoadingState extends SalesState {
  const SalesLoadingState();
}

sealed class SalesReadyState extends SalesState {
  const SalesReadyState({
    required this.query,
    required this.points,
  });

  final SalesQuery query;
  final List<SalesPoint> points;
}

final class SalesReadyIdleState extends SalesReadyState {
  const SalesReadyIdleState({
    required super.query,
    required super.points,
  });
}

final class SalesRefreshingState extends SalesReadyState {
  const SalesRefreshingState({
    required super.query,
    required super.points,
  });
}

final class SalesLoadingFromReadyState extends SalesReadyState {
  const SalesLoadingFromReadyState({
    required super.query,
    required super.points,
  });
}

final class SalesFailureState extends SalesState {
  const SalesFailureState({
    required this.message,
    this.lastQuery,
    this.lastPoints,
  });

  final String message;
  final SalesQuery? lastQuery;
  final List<SalesPoint>? lastPoints;
}
