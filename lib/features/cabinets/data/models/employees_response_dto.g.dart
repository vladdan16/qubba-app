// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employees_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeesResponseDto _$EmployeesResponseDtoFromJson(
  Map<String, dynamic> json,
) => EmployeesResponseDto(
  employees: (json['employees'] as List<dynamic>)
      .map((e) => EmployeeDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$EmployeesResponseDtoToJson(
  EmployeesResponseDto instance,
) => <String, dynamic>{'employees': instance.employees};
