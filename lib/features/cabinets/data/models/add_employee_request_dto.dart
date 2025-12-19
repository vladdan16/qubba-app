import 'package:json_annotation/json_annotation.dart';

part 'add_employee_request_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AddEmployeeRequestDto {
  final String? email;
  final String? firstName;
  final String? lastName;

  const AddEmployeeRequestDto({
    this.email,
    this.firstName,
    this.lastName,
  });

  factory AddEmployeeRequestDto.fromJson(Map<String, dynamic> json) =>
      _$AddEmployeeRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AddEmployeeRequestDtoToJson(this);
}
