import 'package:json_annotation/json_annotation.dart';

part 'add_employee_request_dto.g.dart';

@JsonSerializable()
class AddEmployeeRequestDto {
  final String email;

  const AddEmployeeRequestDto({
    required this.email,
  });

  factory AddEmployeeRequestDto.fromJson(Map<String, dynamic> json) =>
      _$AddEmployeeRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AddEmployeeRequestDtoToJson(this);
}
