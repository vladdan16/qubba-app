part of 'cabinet_employees_bloc.dart';

sealed class CabinetEmployeesEvent {
  final String cabinetId;

  const CabinetEmployeesEvent({required this.cabinetId});
}

final class LoadCabinetEmployees extends CabinetEmployeesEvent {
  const LoadCabinetEmployees({required super.cabinetId});
}

final class AddCabinetEmployee extends CabinetEmployeesEvent {
  final String email;

  const AddCabinetEmployee({
    required super.cabinetId,
    required this.email,
  });
}

final class DeleteCabinetEmployee extends CabinetEmployeesEvent {
  final String email;

  const DeleteCabinetEmployee({
    required super.cabinetId,
    required this.email,
  });
}
