import 'package:json_annotation/json_annotation.dart';

part 'employee_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class EmployeeDto {
  final String userId;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? icon;

  const EmployeeDto({
    required this.userId,
    this.email,
    this.firstName,
    this.lastName,
    this.icon,
  });

  factory EmployeeDto.fromJson(Map<String, dynamic> json) =>
      _$EmployeeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeDtoToJson(this);
}
