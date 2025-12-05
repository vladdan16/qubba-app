import 'package:dio/dio.dart';

import '../../domain/models/user_profile.dart';
import '../../domain/repository/profile_repository.dart';
import '../api/profile_api.dart';
import '../mappers/user_profile_mapper.dart';
import '../models/update_user_request_dto.dart';

final class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl(this._api);

  final ProfileApi _api;

  UserProfile? _cached;

  @override
  Future<UserProfile> getProfile() async {
    final cached = _cached;
    if (cached != null) return cached;

    try {
      final json = await _api.getUser();
      final dto = _api.parseUser(json);
      final profile = ProfileMapper.toDomain(dto);
      _cached = profile;
      return profile;
    } on DioException {
      rethrow;
    } on Object catch (error, _) {
      throw Exception('Failed to load profile: $error');
    }
  }

  @override
  Future<UserProfile> updateProfile({
    required String firstName,
    required String lastName,
    required String phone,
  }) async {
    try {
      final body = UpdateUserRequestDto(
        firstName: firstName.trim(),
        lastName: lastName.trim(),
        phone: phone,
      );

      final json = await _api.updateUser(body);

      try {
        final dto = _api.parseUser(json);
        final profile = ProfileMapper.toDomain(dto);
        _cached = profile;
        return profile;
      } on Object catch (_) {
        final fresh = await _api.getUser();
        final dto = _api.parseUser(fresh);
        final profile = ProfileMapper.toDomain(dto);
        _cached = profile;
        return profile;
      }
    } on DioException {
      rethrow;
    } on Object catch (error, _) {
      throw Exception('Failed to update profile: $error');
    }
  }

  @override
  Future<Uri?> uploadAvatar({required String filePath}) async {
    try {
      final json = await _api.uploadAvatar(filePath: filePath);

      try {
        final dto = _api.parseUser(json);
        final profile = ProfileMapper.toDomain(dto);
        _cached = profile;
        return profile.avatarUrl;
      } on Object catch (_) {
        final icon = _pickString(json, const [
          'icon',
          'avatar_url',
          'avatarUrl',
          'photo',
        ]);

        if (icon != null && icon.isNotEmpty) {
          final url = Uri.tryParse(icon);
          try {
            final fresh = await _api.getUser();
            final dto = _api.parseUser(fresh);
            _cached = ProfileMapper.toDomain(dto);
          } on Object catch (_) {}
          return url;
        }

        final cached = _cached;
        if (cached != null) return cached.avatarUrl;

        final fresh = await _api.getUser();
        final dto = _api.parseUser(fresh);
        final profile = ProfileMapper.toDomain(dto);
        _cached = profile;
        return profile.avatarUrl;
      }
    } on DioException {
      rethrow;
    } on Object catch (error, _) {
      throw Exception('Failed to upload avatar: $error');
    }
  }

  @override
  Future<void> deleteAvatar() async {
    try {
      await _api.deleteAvatar();
      try {
        final fresh = await _api.getUser();
        final dto = _api.parseUser(fresh);
        _cached = ProfileMapper.toDomain(dto);
      } on Object catch (_) {}
    } on DioException {
      rethrow;
    } on Object catch (error, _) {
      throw Exception('Failed to delete avatar: $error');
    }
  }

  @override
  Future<void> dispose() async {
    _cached = null;
  }

  String? _pickString(Map<String, Object?> json, List<String> keys) {
    for (final key in keys) {
      final value = json[key];
      if (value is String && value.isNotEmpty) return value;
    }
    return null;
  }
}
