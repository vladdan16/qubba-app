import '../../domain/models/employee.dart';
import '../models/add_employee_request_dto.dart';
import '../models/employee_dto.dart';

abstract final class EmployeeMapper {
  static Employee toDomain(EmployeeDto dto) => Employee(
    userId: dto.userId,
    email: dto.email,
    firstName: dto.firstName,
    lastName: dto.lastName,
    icon: dto.icon,
  );

  static AddEmployeeRequestDto toAddRequest({
    String? email,
    String? firstName,
    String? lastName,
  }) => AddEmployeeRequestDto(
    email: email,
    firstName: firstName,
    lastName: lastName,
  );
}
