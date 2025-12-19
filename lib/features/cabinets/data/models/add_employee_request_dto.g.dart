// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_employee_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddEmployeeRequestDto _$AddEmployeeRequestDtoFromJson(
  Map<String, dynamic> json,
) => AddEmployeeRequestDto(
  email: json['email'] as String?,
  firstName: json['first_name'] as String?,
  lastName: json['last_name'] as String?,
);

Map<String, dynamic> _$AddEmployeeRequestDtoToJson(
  AddEmployeeRequestDto instance,
) => <String, dynamic>{
  'email': instance.email,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
};
