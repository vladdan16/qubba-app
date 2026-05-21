import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

import '../models/marketplace.dart';
import '../models/sales_point.dart';
import '../models/sales_query.dart';
import '../repository/sales_repository.dart';

part 'sales_event.dart';

part 'sales_state.dart';

final class SalesBloc extends Bloc<SalesEvent, SalesState> {
  SalesBloc({required this._repository}) : super(const SalesInitialState()) {
    on<SalesLoadRequested>(_onLoad, transformer: restartable());
    on<SalesRefreshRequested>(_onRefresh, transformer: restartable());
    on<SalesMarketplaceChanged>(
      _onMarketplaceChanged,
      transformer: restartable(),
    );
    on<SalesDateRangeChanged>(
      _onDateRangeChanged,
      transformer: restartable(),
    );
  }

  final SalesRepository _repository;

  Future<void> _onLoad(
    SalesLoadRequested event,
    Emitter<SalesState> emit,
  ) async {
    emit(const SalesLoadingState());

    final query = event.query ?? _defaultQuery();
    try {
      final points = await _repository.getDailySales(query);
      emit(SalesReadyIdleState(query: query, points: points));
    } on Object catch (error, _) {
      emit(
        SalesFailureState(
          message: error.toString(),
          lastQuery: query,
        ),
      );
    }
  }

  Future<void> _onRefresh(
    SalesRefreshRequested event,
    Emitter<SalesState> emit,
  ) async {
    final previous = state;

    final lastQuery = previous is SalesReadyState ? previous.query : null;
    final lastPoints = previous is SalesReadyState ? previous.points : null;

    if (previous is SalesReadyState) {
      emit(
        SalesRefreshingState(query: previous.query, points: previous.points),
      );
    } else {
      emit(const SalesLoadingState());
    }

    final query = previous is SalesReadyState
        ? previous.query
        : _defaultQuery();

    try {
      final points = await _repository.getDailySales(query);
      emit(SalesReadyIdleState(query: query, points: points));
    } on Object catch (error, _) {
      emit(
        SalesFailureState(
          message: error.toString(),
          lastQuery: lastQuery,
          lastPoints: lastPoints,
        ),
      );
    }
  }

  Future<void> _onMarketplaceChanged(
    SalesMarketplaceChanged event,
    Emitter<SalesState> emit,
  ) async {
    final previous = state;

    final baseQuery = previous is SalesReadyState
        ? previous.query
        : _defaultQuery();

    if (baseQuery.marketplace == event.marketplace) {
      return;
    }

    final nextQuery = baseQuery.copyWith(marketplace: event.marketplace);

    final lastQuery = previous is SalesReadyState ? previous.query : null;
    final lastPoints = previous is SalesReadyState ? previous.points : null;

    if (previous is SalesReadyState) {
      emit(
        SalesLoadingFromReadyState(
          query: nextQuery,
          points: previous.points,
        ),
      );
    } else {
      emit(const SalesLoadingState());
    }

    try {
      final points = await _repository.getDailySales(nextQuery);
      emit(SalesReadyIdleState(query: nextQuery, points: points));
    } on Object catch (error, _) {
      emit(
        SalesFailureState(
          message: error.toString(),
          lastQuery: lastQuery,
          lastPoints: lastPoints,
        ),
      );
    }
  }

  Future<void> _onDateRangeChanged(
    SalesDateRangeChanged event,
    Emitter<SalesState> emit,
  ) async {
    final previous = state;

    final baseQuery = previous is SalesReadyState
        ? previous.query
        : _defaultQuery();

    final nextQuery = baseQuery.copyWith(
      startDate: event.startDate,
      endDate: event.endDate,
    );

    final lastQuery = previous is SalesReadyState ? previous.query : null;
    final lastPoints = previous is SalesReadyState ? previous.points : null;

    if (previous is SalesReadyState) {
      emit(
        SalesLoadingFromReadyState(
          query: nextQuery,
          points: previous.points,
        ),
      );
    } else {
      emit(const SalesLoadingState());
    }

    try {
      final points = await _repository.getDailySales(nextQuery);
      emit(SalesReadyIdleState(query: nextQuery, points: points));
    } on Object catch (error, _) {
      emit(
        SalesFailureState(
          message: error.toString(),
          lastQuery: lastQuery,
          lastPoints: lastPoints,
        ),
      );
    }
  }

  SalesQuery _defaultQuery() {
    final now = DateTime.now();
    final endDate = DateTime(now.year, now.month, now.day);
    final startDate = endDate.subtract(const Duration(days: 30));

    return SalesQuery(
      marketplace: Marketplace.wildberries,
      startDate: startDate,
      endDate: endDate,
    );
  }
}
