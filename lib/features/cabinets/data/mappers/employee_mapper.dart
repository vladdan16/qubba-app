import '../../domain/models/employee.dart';
import '../models/add_employee_request_dto.dart';
import '../models/employee_dto.dart';

abstract final class EmployeeMapper {
  static Employee toDomain(EmployeeDto dto) => Employee(
    email: dto.email,
  );

  static AddEmployeeRequestDto toAddRequest(String email) =>
      AddEmployeeRequestDto(email: email);
}
