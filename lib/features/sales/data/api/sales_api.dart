import 'package:dio/dio.dart';

import '../../domain/models/sales_query.dart';
import '../mappers/sales_request_body_mapper.dart';
import '../models/sales_daily_response_dto.dart';

part 'api_params.dart';

sealed class SalesApi {
  factory SalesApi(Dio dio) = _SalesApiImpl;

  const SalesApi._();

  Future<SalesDailyResponseDto> getWildberriesDaily(SalesQuery query);

  Future<SalesDailyResponseDto> getOzonDaily(SalesQuery query);
}

final class _SalesApiImpl extends SalesApi {
  final Dio dio;

  _SalesApiImpl(this.dio) : super._();

  @override
  Future<SalesDailyResponseDto> getWildberriesDaily(SalesQuery query) async {
    final response = await dio.post<Map<String, dynamic>>(
      _ApiParams.wildberriesDaily,
      data: SalesRequestBodyMapper.toRequestBody(query),
    );

    final data = response.data;
    if (data == null) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.badResponse,
        error: 'Empty response body',
      );
    }

    return SalesDailyResponseDto.fromJson(data);
  }

  @override
  Future<SalesDailyResponseDto> getOzonDaily(SalesQuery query) async {
    final response = await dio.post<Map<String, dynamic>>(
      _ApiParams.ozonDaily,
      data: SalesRequestBodyMapper.toRequestBody(query),
    );

    final data = response.data;
    if (data == null) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.badResponse,
        error: 'Empty response body',
      );
    }

    return SalesDailyResponseDto.fromJson(data);
  }
}
