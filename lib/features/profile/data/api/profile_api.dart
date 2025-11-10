import 'package:dio/dio.dart';

import '../../../../utils/require_data.dart';
import '../models/update_user_request_dto.dart';
import '../models/user_profile_dto.dart';

part 'api_params.dart';

sealed class ProfileApi {
  factory ProfileApi(Dio dio) = _ProfileApiImpl;

  const ProfileApi._();

  Future<Map<String, Object?>> getUser();

  UserProfileDto parseUser(Map<String, Object?> json) =>
      UserProfileDto.fromJson(json);

  Future<Map<String, Object?>> updateUser(UpdateUserRequestDto dto);

  Future<Map<String, Object?>> uploadAvatar({
    required String filePath,
    String? fileName,
  });

  Future<void> deleteAvatar();
}

final class _ProfileApiImpl extends ProfileApi {
  final Dio dio;

  _ProfileApiImpl(this.dio) : super._();

  @override
  Future<Map<String, Object?>> getUser() async {
    final response = await dio.get<Map<String, Object?>>(
      _ApiParams.getUser,
    );
    return response.requireData;
  }

  @override
  Future<Map<String, Object?>> updateUser(UpdateUserRequestDto dto) async {
    final response = await dio.patch<Map<String, Object?>>(
      _ApiParams.updateUser,
      data: dto.toJson(),
    );
    return response.requireData;
  }

  @override
  Future<Map<String, Object?>> uploadAvatar({
    required String filePath,
    String? fileName,
  }) async {
    final form = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        filePath,
        filename: fileName,
      ),
    });

    final response = await dio.post<Map<String, Object?>>(
      _ApiParams.uploadAvatar,
      data: form,
      options: Options(contentType: 'multipart/form-data'),
    );
    return response.requireData;
  }

  @override
  Future<void> deleteAvatar() async {
    await dio.delete<void>(_ApiParams.deleteAvatar);
  }
}
