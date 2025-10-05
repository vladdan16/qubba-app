import 'package:dio/dio.dart';

import '../models/cabinet_dto.dart';
import '../models/cabinets_response_dto.dart';
import '../models/update_cabinet_request_dto.dart';

part 'api_params.dart';

sealed class CabinetsApi {
  factory CabinetsApi(Dio dio) = _CabinetsApiImpl;

  const CabinetsApi._();

  Future<List<Map<String, Object?>>> getAllCabinets({int? limit});

  CabinetsResponseDto parseCabinetsResponse(List<Map<String, Object?>> json) =>
      CabinetsResponseDto(
        cabinets: json.map((e) => CabinetDto.fromJson(e)).toList(),
        total: json.length,
      );

  Future<Map<String, Object?>> updateCabinet(
    String cabinetId,
    UpdateCabinetRequestDto dto,
  );

  CabinetDto parseCabinetResponse(Map<String, Object?> json) =>
      CabinetDto.fromJson(json);
}

final class _CabinetsApiImpl extends CabinetsApi {
  final Dio dio;

  _CabinetsApiImpl(this.dio) : super._();

  @override
  Future<List<Map<String, Object?>>> getAllCabinets({int? limit}) async {
    final response = await dio.get<List<dynamic>>(
      _ApiParams.getAllCabinets,
      queryParameters: limit != null ? {'limit': limit} : null,
    );
    
    return (response.data as List<dynamic>)
        .cast<Map<String, Object?>>()
        .toList();
  }

  @override
  Future<Map<String, Object?>> updateCabinet(
    String cabinetId,
    UpdateCabinetRequestDto dto,
  ) async {
    final response = await dio.put<Map<String, Object?>>(
      _ApiParams.updateCabinet(cabinetId),
      data: dto.toJson(),
    );
    return response.data!;
  }
}
