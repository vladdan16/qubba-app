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
      final dto = await _api.getUser();
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

      await _api.updateUser(body);

      final dto = await _api.getUser();
      final updated = ProfileMapper.toDomain(dto);
      _cached = updated;
      return updated;
    } on DioException {
      rethrow;
    } on Object catch (error, _) {
      throw Exception('Failed to update profile: $error');
    }
  }

  @override
  Future<Uri?> uploadAvatar({required String filePath}) async {
    try {
      await _api.uploadAvatar(filePath: filePath);
      final refreshed = await _refreshFromBackend();
      final busted = refreshed.copyWith(
        avatarUrl: _withBust(refreshed.avatarUrl),
      );
      _cached = busted;
      return busted.avatarUrl;
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
      _cached = await _refreshFromBackend();
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

  Future<UserProfile> _refreshFromBackend() async {
    final dto = await _api.getUser();
    return ProfileMapper.toDomain(dto);
  }

  Uri? _withBust(Uri? url) {
    if (url == null) return null;
    final sep = url.query.isEmpty ? '?' : '&';
    return Uri.parse(
      '$url${sep}v=${DateTime.now().millisecondsSinceEpoch}',
    );
  }
}
