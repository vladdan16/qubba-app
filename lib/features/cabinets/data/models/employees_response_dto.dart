import 'package:json_annotation/json_annotation.dart';

import 'employee_dto.dart';

part 'employees_response_dto.g.dart';

@JsonSerializable()
class EmployeesResponseDto {
  final List<EmployeeDto> employees;

  const EmployeesResponseDto({
    required this.employees,
  });

  factory EmployeesResponseDto.fromJson(Map<String, dynamic> json) =>
      _$EmployeesResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeesResponseDtoToJson(this);
}
