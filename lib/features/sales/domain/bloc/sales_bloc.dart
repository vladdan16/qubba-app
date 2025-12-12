import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

import '../models/marketplace.dart';
import '../models/sales_point.dart';
import '../models/sales_query.dart';
import '../repository/sales_repository.dart';

part 'sales_event.dart';

part 'sales_state.dart';

final class SalesBloc extends Bloc<SalesEvent, SalesState> {
  SalesBloc({required SalesRepository repository})
    : _repository = repository,
      super(const SalesInitialState()) {
    on<SalesLoadRequested>(_onLoad, transformer: restartable());
    on<SalesRefreshRequested>(_onRefresh, transformer: restartable());
    on<SalesMarketplaceChanged>(
      _onMarketplaceChanged,
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
          lastQuery: previous is SalesReadyState ? previous.query : null,
          lastPoints: previous is SalesReadyState ? previous.points : null,
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

    final nextQuery = baseQuery.copyWith(marketplace: event.marketplace);

    if (previous is SalesReadyState) {
      emit(
        SalesLoadingFromReadyState(
          query: previous.query,
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
          lastQuery: previous is SalesReadyState ? previous.query : null,
          lastPoints: previous is SalesReadyState ? previous.points : null,
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
