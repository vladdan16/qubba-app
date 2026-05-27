import 'package:dio/dio.dart';

import '../../../../utils/require_data.dart';
import '../models/ai_model_dto.dart';

part 'api_params.dart';

sealed class AiModelsApi {
  factory AiModelsApi(Dio dio) = _AiModelsApiImpl;

  const AiModelsApi._();

  Future<AiModelsResponseDto> getAll();
}

final class _AiModelsApiImpl extends AiModelsApi {
  _AiModelsApiImpl(this._dio) : super._();

  final Dio _dio;

  @override
  Future<AiModelsResponseDto> getAll() async {
    final response = await _dio.get<Map<String, Object?>>(_ApiParams.allModels);
    return AiModelsResponseDto.fromJson(response.requireData);
  }
}
