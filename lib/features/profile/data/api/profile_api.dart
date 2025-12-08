import 'dart:io' as io;
import 'package:dio/dio.dart';

import '../../../../utils/require_data.dart';
import '../models/update_user_request_dto.dart';
import '../models/user_profile_dto.dart';

part 'api_params.dart';

sealed class ProfileApi {
  factory ProfileApi(Dio dio) = _ProfileApiImpl;

  const ProfileApi._();

  Future<UserProfileDto> getUser();

  Future<void> updateUser(UpdateUserRequestDto dto);

  Future<void> uploadAvatar({
    required String filePath,
    String? fileName,
  });

  Future<void> deleteAvatar();
}

final class _ProfileApiImpl extends ProfileApi {
  final Dio dio;

  _ProfileApiImpl(this.dio) : super._();

  @override
  Future<UserProfileDto> getUser() async {
    final response = await dio.get<Map<String, Object?>>(_ApiParams.getUser);
    return UserProfileDto.fromJson(_extractData(response.requireData));
  }

  @override
  Future<void> updateUser(UpdateUserRequestDto dto) async {
    await dio.patch<void>(
      _ApiParams.updateUser,
      data: dto.toJson(),
    );
  }

  @override
  Future<void> uploadAvatar({
    required String filePath,
    String? fileName,
  }) async {
    MultipartFile filePart;
    try {
      final file = io.File(filePath);
      if (!file.existsSync()) {
        throw io.FileSystemException('Avatar file not found', filePath);
      }
      filePart = await MultipartFile.fromFile(filePath, filename: fileName);
    } on Object catch (error, stackTrace) {
      throw DioException(
        requestOptions: RequestOptions(path: _ApiParams.uploadAvatar),
        error: error,
        message: 'Failed to attach avatar file: $filePath',
        stackTrace: stackTrace,
      );
    }

    final form = FormData.fromMap({'file': filePart});

    await dio.post<void>(
      _ApiParams.uploadAvatar,
      data: form,
      options: Options(contentType: 'multipart/form-data'),
    );
  }

  @override
  Future<void> deleteAvatar() async {
    await dio.delete<void>(_ApiParams.deleteAvatar);
  }
}

Map<String, dynamic> _extractData(Map<String, Object?> json) {
  final data = json['data'];
  if (data is Map) return Map<String, dynamic>.from(data);
  return Map<String, dynamic>.from(json);
}
