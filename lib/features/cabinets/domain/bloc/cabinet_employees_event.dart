part of 'cabinet_employees_bloc.dart';

sealed class CabinetEmployeesEvent {
  const CabinetEmployeesEvent();
}

final class LoadCabinetEmployees extends CabinetEmployeesEvent {
  final String cabinetId;

  const LoadCabinetEmployees({required this.cabinetId});
}

final class AddCabinetEmployee extends CabinetEmployeesEvent {
  final String cabinetId;
  final String email;

  const AddCabinetEmployee({
    required this.cabinetId,
    required this.email,
  });
}

final class DeleteCabinetEmployee extends CabinetEmployeesEvent {
  final String cabinetId;
  final String employeeId;

  const DeleteCabinetEmployee({
    required this.cabinetId,
    required this.employeeId,
  });
}
