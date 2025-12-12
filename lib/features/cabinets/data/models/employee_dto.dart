import 'package:json_annotation/json_annotation.dart';

part 'employee_dto.g.dart';

@JsonSerializable()
class EmployeeDto {
  final String? id;
  final String email;

  const EmployeeDto({
    required this.email,
    this.id,
  });

  factory EmployeeDto.fromJson(Map<String, dynamic> json) =>
      _$EmployeeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeDtoToJson(this);
}
