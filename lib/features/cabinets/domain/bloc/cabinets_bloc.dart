import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/cabinet.dart';
import '../repository/cabinets_repository.dart';

part 'cabinets_event.dart';

part 'cabinets_state.dart';

final class CabinetsBloc extends Bloc<CabinetsEvent, CabinetsState> {
  final CabinetsRepository _repository;

  CabinetsBloc({
    required CabinetsRepository repository,
  }) : _repository = repository,
       super(const CabinetsInitial()) {
    on<LoadCabinets>(_onLoadCabinets);
    on<CreateCabinet>(_onCreateCabinet);
    on<UpdateCabinet>(_onUpdateCabinet);
    on<DeleteCabinet>(_onDeleteCabinet);
  }

  Future<void> _onLoadCabinets(
    LoadCabinets event,
    Emitter<CabinetsState> emit,
  ) async {
    emit(const CabinetsLoading());
    try {
      final cabinets = await _repository.getAllCabinets(limit: event.limit);
      emit(CabinetsLoaded(cabinets: cabinets));
    } on Object catch (error, stackTrace) {
      log('_onLoadCabinets', error: error, stackTrace: stackTrace);
      emit(CabinetsError(error: error, stackTrace: stackTrace));
    }
  }

  Future<void> _onCreateCabinet(
    CreateCabinet event,
    Emitter<CabinetsState> emit,
  ) async {
    final currentState = state;
    if (currentState is! CabinetsLoaded) return;

    emit(const CabinetsLoading());
    try {
      final createdCabinet = await _repository.createCabinet(event.cabinet);
      final cabinets = [...currentState.cabinets, createdCabinet];
      emit(CabinetsLoaded(cabinets: cabinets));
    } on Object catch (error, stackTrace) {
      log('_onCreateCabinet', error: error, stackTrace: stackTrace);
      emit(CabinetsError(error: error, stackTrace: stackTrace));
    }
  }

  Future<void> _onUpdateCabinet(
    UpdateCabinet event,
    Emitter<CabinetsState> emit,
  ) async {
    final currentState = state;
    if (currentState is! CabinetsLoaded) return;

    emit(const CabinetsLoading());
    try {
      final updatedCabinet = await _repository.updateCabinet(event.cabinet);

      // Update the cabinet in the list
      final cabinets = currentState.cabinets
          .map((c) => c.id == updatedCabinet.id ? updatedCabinet : c)
          .toList();

      // If the updated cabinet is not found, this indicates a bug.
      if (!cabinets.any((c) => c.id == updatedCabinet.id)) {
        emit(CabinetsError(
          error: StateError(
            'Updated cabinet with id ${updatedCabinet.id} not found in current state. This should not happen.',
          ),
          stackTrace: StackTrace.current,
        ));
        return;
      }

      emit(CabinetsLoaded(cabinets: cabinets));
    } on Object catch (error, stackTrace) {
      log('_onUpdateCabinet', error: error, stackTrace: stackTrace);
      emit(CabinetsError(error: error, stackTrace: stackTrace));
    }
  }

  Future<void> _onDeleteCabinet(
    DeleteCabinet event,
    Emitter<CabinetsState> emit,
  ) async {
    final currentState = state;
    if (currentState is! CabinetsLoaded) return;

    emit(const CabinetsLoading());
    try {
      await _repository.deleteCabinet(event.cabinetId);
      final cabinets = currentState.cabinets
          .where((c) => c.id != event.cabinetId)
          .toList();
      emit(CabinetsLoaded(cabinets: cabinets));
    } on Object catch (error, stackTrace) {
      log('_onDeleteCabinet', error: error, stackTrace: stackTrace);
      emit(CabinetsError(error: error, stackTrace: stackTrace));
    }
  }
}
