import 'package:json_annotation/json_annotation.dart';

part 'employee_dto.g.dart';

@JsonSerializable()
class EmployeeDto {
  final String id;
  final String email;
  @JsonKey(name: 'first_name')
  final String? firstName;
  @JsonKey(name: 'last_name')
  final String? lastName;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  const EmployeeDto({
    required this.id,
    required this.email,
    this.firstName,
    this.lastName,
    this.createdAt,
  });

  factory EmployeeDto.fromJson(Map<String, dynamic> json) =>
      _$EmployeeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeDtoToJson(this);
}
