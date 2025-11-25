import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/employee.dart';
import '../repository/cabinets_repository.dart';

part 'cabinet_employees_event.dart';
part 'cabinet_employees_state.dart';

final class CabinetEmployeesBloc
    extends Bloc<CabinetEmployeesEvent, CabinetEmployeesState> {
  final CabinetsRepository _repository;

  CabinetEmployeesBloc({
    required CabinetsRepository repository,
  }) : _repository = repository,
       super(const CabinetEmployeesInitial()) {
    on<LoadCabinetEmployees>(_onLoadCabinetEmployees);
    on<AddCabinetEmployee>(_onAddCabinetEmployee);
    on<DeleteCabinetEmployee>(_onDeleteCabinetEmployee);
  }

  Future<void> _onLoadCabinetEmployees(
    LoadCabinetEmployees event,
    Emitter<CabinetEmployeesState> emit,
  ) async {
    emit(const CabinetEmployeesLoading());
    try {
      final employees = await _repository.getCabinetEmployees(event.cabinetId);
      emit(CabinetEmployeesLoaded(employees: employees));
    } on Object catch (error, stackTrace) {
      log('_onLoadCabinetEmployees', error: error, stackTrace: stackTrace);
      emit(CabinetEmployeesError(error: error, stackTrace: stackTrace));
    }
  }

  Future<void> _onAddCabinetEmployee(
    AddCabinetEmployee event,
    Emitter<CabinetEmployeesState> emit,
  ) async {
    final currentState = state;
    if (currentState is! CabinetEmployeesLoaded) {
      emit(
        CabinetEmployeesError(
          error: StateError('Cannot add employee: employees not loaded'),
          stackTrace: .current,
        ),
      );
      return;
    }

    emit(const CabinetEmployeesLoading());
    try {
      final newEmployee = await _repository.addCabinetEmployee(
        event.cabinetId,
        event.email,
      );
      final employees = [...currentState.employees, newEmployee];
      emit(CabinetEmployeesLoaded(employees: employees));
    } on Object catch (error, stackTrace) {
      log('_onAddCabinetEmployee', error: error, stackTrace: stackTrace);
      emit(CabinetEmployeesError(error: error, stackTrace: stackTrace));
    }
  }

  Future<void> _onDeleteCabinetEmployee(
    DeleteCabinetEmployee event,
    Emitter<CabinetEmployeesState> emit,
  ) async {
    final currentState = state;
    if (currentState is! CabinetEmployeesLoaded) {
      emit(
        CabinetEmployeesError(
          error: StateError('Cannot delete employee: employees not loaded'),
          stackTrace: .current,
        ),
      );
      return;
    }

    emit(const CabinetEmployeesLoading());
    try {
      await _repository.deleteCabinetEmployee(
        event.cabinetId,
        event.employeeId,
      );
      final employees = currentState.employees
          .where((e) => e.id != event.employeeId)
          .toList();
      emit(CabinetEmployeesLoaded(employees: employees));
    } on Object catch (error, stackTrace) {
      log('_onDeleteCabinetEmployee', error: error, stackTrace: stackTrace);
      emit(CabinetEmployeesError(error: error, stackTrace: stackTrace));
    }
  }
}
