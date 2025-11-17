import '../../domain/models/employee.dart';
import '../models/add_employee_request_dto.dart';
import '../models/employee_dto.dart';

abstract final class EmployeeMapper {
  static Employee toDomain(EmployeeDto dto) => Employee(
    id: dto.id,
    email: dto.email,
    firstName: dto.firstName,
    lastName: dto.lastName,
    createdAt: dto.createdAt,
  );

  static AddEmployeeRequestDto toAddRequest(String email) =>
      AddEmployeeRequestDto(email: email);
}
