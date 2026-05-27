import 'package:dio/dio.dart';

import '../../../../utils/require_data.dart';
import '../models/update_user_settings_request_dto.dart';
import '../models/user_settings_dto.dart';

part 'api_params.dart';

sealed class UserSettingsApi {
  factory UserSettingsApi(Dio dio) = _UserSettingsApiImpl;

  const UserSettingsApi._();

  Future<UserSettingsDto> getSettings();

  Future<void> updateSettings(UpdateUserSettingsRequestDto request);
}

final class _UserSettingsApiImpl extends UserSettingsApi {
  _UserSettingsApiImpl(this._dio) : super._();

  final Dio _dio;

  @override
  Future<UserSettingsDto> getSettings() async {
    final response = await _dio.get<Map<String, Object?>>(
      _ApiParams.userSettings,
    );
    return UserSettingsDto.fromJson(_extractData(response.requireData));
  }

  @override
  Future<void> updateSettings(UpdateUserSettingsRequestDto request) async {
    await _dio.patch<void>(
      _ApiParams.userSettings,
      data: request.toJson(),
    );
  }
}

Map<String, dynamic> _extractData(Map<String, Object?> json) {
  final data = json['data'];
  if (data is Map) return Map<String, dynamic>.from(data);
  return Map<String, dynamic>.from(json);
}
