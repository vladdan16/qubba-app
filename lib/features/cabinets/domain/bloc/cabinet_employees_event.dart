part of 'cabinet_employees_bloc.dart';

sealed class CabinetEmployeesEvent {
  final String cabinetId;

  const CabinetEmployeesEvent({required this.cabinetId});
}

final class LoadCabinetEmployees extends CabinetEmployeesEvent {
  const LoadCabinetEmployees({required super.cabinetId});
}

final class AddCabinetEmployee extends CabinetEmployeesEvent {
  final String? email;
  final String? firstName;
  final String? lastName;

  const AddCabinetEmployee({
    required super.cabinetId,
    this.email,
    this.firstName,
    this.lastName,
  });
}

final class DeleteCabinetEmployee extends CabinetEmployeesEvent {
  final String userId;

  const DeleteCabinetEmployee({
    required super.cabinetId,
    required this.userId,
  });
}
