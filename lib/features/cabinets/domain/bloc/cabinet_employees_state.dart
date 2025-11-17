part of 'cabinet_employees_bloc.dart';

@immutable
sealed class CabinetEmployeesState {
  const CabinetEmployeesState();
}

final class CabinetEmployeesInitial extends CabinetEmployeesState {
  const CabinetEmployeesInitial();
}

final class CabinetEmployeesLoading extends CabinetEmployeesState {
  const CabinetEmployeesLoading();
}

final class CabinetEmployeesLoaded extends CabinetEmployeesState {
  final List<Employee> employees;

  const CabinetEmployeesLoaded({required this.employees});
}

final class CabinetEmployeesError extends CabinetEmployeesState {
  final Object error;
  final StackTrace stackTrace;

  const CabinetEmployeesError({
    required this.error,
    required this.stackTrace,
  });
}
