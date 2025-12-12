import 'package:dio/dio.dart';

import '../../../../utils/require_data.dart';
import '../models/add_cabinet_request_dto.dart';
import '../models/add_employee_request_dto.dart';
import '../models/cabinet_dto.dart';
import '../models/cabinets_response_dto.dart';
import '../models/employee_dto.dart';
import '../models/employees_response_dto.dart';
import '../models/update_cabinet_request_dto.dart';

part 'api_params.dart';

sealed class CabinetsApi {
  factory CabinetsApi(Dio dio) = _CabinetsApiImpl;

  const CabinetsApi._();

  Future<Map<String, Object?>> getAllCabinets({int? limit, int? offset});

  CabinetsResponseDto parseCabinetsResponse(Map<String, Object?> json) =>
      CabinetsResponseDto.fromJson(json);

  Future<Map<String, Object?>> getCabinetById(String cabinetId);

  Future<Map<String, Object?>> createCabinet(AddCabinetRequestDto dto);

  Future<Map<String, Object?>> updateCabinet(
    String cabinetId,
    UpdateCabinetRequestDto dto,
  );

  Future<void> deleteCabinet(String cabinetId);

  CabinetDto parseCabinetResponse(Map<String, Object?> json) =>
      CabinetDto.fromJson(json);

  Future<Map<String, Object?>> addCabinetEmployee(
    String cabinetId,
    AddEmployeeRequestDto dto,
  );

  Future<void> deleteCabinetEmployee(String cabinetId, String employeeId);

  EmployeesResponseDto parseEmployeesResponse(Map<String, Object?> json) =>
      EmployeesResponseDto.fromJson(json);

  EmployeeDto parseEmployeeResponse(Map<String, Object?> json) =>
      EmployeeDto.fromJson(json);
}

final class _CabinetsApiImpl extends CabinetsApi {
  final Dio dio;

  _CabinetsApiImpl(this.dio) : super._();

  @override
  Future<Map<String, Object?>> getAllCabinets({
    int? limit,
    int? offset,
  }) async {
    final response = await dio.get<Map<String, Object?>>(
      _ApiParams.getAllCabinets,
      queryParameters: {
        'limit': ?limit,
        'offset': ?offset,
      },
    );

    return response.requireData;
  }

  @override
  Future<Map<String, Object?>> getCabinetById(String cabinetId) async {
    final response = await dio.get<Map<String, Object?>>(
      _ApiParams.getCabinetById(cabinetId),
    );
    return response.requireData;
  }

  @override
  Future<Map<String, Object?>> createCabinet(
    AddCabinetRequestDto dto,
  ) async {
    final response = await dio.post<Map<String, Object?>>(
      _ApiParams.createCabinet,
      data: dto.toJson(),
    );
    return response.requireData;
  }

  @override
  Future<Map<String, Object?>> updateCabinet(
    String cabinetId,
    UpdateCabinetRequestDto dto,
  ) async {
    final response = await dio.patch<Map<String, Object?>>(
      _ApiParams.updateCabinet(cabinetId),
      data: dto.toJson(),
    );
    return response.requireData;
  }

  @override
  Future<void> deleteCabinet(String cabinetId) async {
    await dio.delete<void>(
      _ApiParams.deleteCabinet(cabinetId),
    );
  }

  @override
  Future<Map<String, Object?>> addCabinetEmployee(
    String cabinetId,
    AddEmployeeRequestDto dto,
  ) async {
    final response = await dio.post<Map<String, Object?>>(
      _ApiParams.addCabinetEmployee(cabinetId),
      data: dto.toJson(),
    );
    return response.requireData;
  }

  @override
  Future<void> deleteCabinetEmployee(
    String cabinetId,
    String employeeId,
  ) async {
    await dio.delete<void>(
      _ApiParams.deleteCabinetEmployee(cabinetId, employeeId),
    );
  }
}
