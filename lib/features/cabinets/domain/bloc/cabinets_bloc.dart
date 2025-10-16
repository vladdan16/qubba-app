import 'dart:async';

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

      // Add the cabinet if it's new (shouldn't happen with update,
      // but safety check)
      if (!cabinets.any((c) => c.id == updatedCabinet.id)) {
        cabinets.add(updatedCabinet);
      }

      emit(CabinetsLoaded(cabinets: cabinets));
    } on Object catch (error, stackTrace) {
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
      emit(CabinetsError(error: error, stackTrace: stackTrace));
    }
  }
}
