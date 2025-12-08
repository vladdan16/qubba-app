import 'package:dio/dio.dart';

import '../../domain/exceptions/profile_exceptions.dart';
import '../../domain/models/user_profile.dart';
import '../../domain/repository/profile_repository.dart';
import '../api/profile_api.dart';
import '../mappers/user_profile_mapper.dart';
import '../models/update_user_request_dto.dart';

final class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl(this._profileApi);

  final ProfileApi _profileApi;

  UserProfile? _cachedUserProfile;

  @override
  Future<UserProfile> getProfile() async {
    final cachedUserProfile = _cachedUserProfile;
    if (cachedUserProfile != null) return cachedUserProfile;
    try {
      final userProfileDto = await _profileApi.getUser();
      final userProfile = ProfileMapper.toDomain(userProfileDto);
      _cachedUserProfile = userProfile;
      return userProfile;
    } on DioException catch (dioError, stackTrace) {
      throw ProfileLoadException(
        message: _buildErrorMessage('Failed to load profile', dioError),
        statusCode: dioError.response?.statusCode,
        cause: dioError,
        stackTrace: stackTrace,
      );
    } catch (error, stackTrace) {
      throw ProfileLoadException(
        message: 'Failed to load profile',
        cause: error,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<UserProfile> updateProfile({
    required String firstName,
    required String lastName,
    required String phone,
  }) async {
    try {
      final requestDto = UpdateUserRequestDto(
        firstName: firstName.trim(),
        lastName: lastName.trim(),
        phone: phone,
      );
      await _profileApi.updateUser(requestDto);
      final userProfileDto = await _profileApi.getUser();
      final updatedUserProfile = ProfileMapper.toDomain(userProfileDto);
      _cachedUserProfile = updatedUserProfile;
      return updatedUserProfile;
    } on DioException catch (dioError, stackTrace) {
      throw ProfileUpdateException(
        message: _buildErrorMessage('Failed to update profile', dioError),
        statusCode: dioError.response?.statusCode,
        cause: dioError,
        stackTrace: stackTrace,
      );
    } catch (error, stackTrace) {
      throw ProfileUpdateException(
        message: 'Failed to update profile',
        cause: error,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<Uri?> uploadAvatar({required String filePath}) async {
    try {
      await _profileApi.uploadAvatar(filePath: filePath);
      final refreshedUserProfile = await _fetchUserProfileFromBackend();
      _cachedUserProfile = refreshedUserProfile;
      return refreshedUserProfile.avatarUrl;
    } on DioException catch (dioError, stackTrace) {
      throw ProfileAvatarUploadException(
        message: _buildErrorMessage('Failed to upload avatar', dioError),
        statusCode: dioError.response?.statusCode,
        cause: dioError,
        stackTrace: stackTrace,
      );
    } catch (error, stackTrace) {
      throw ProfileAvatarUploadException(
        message: 'Failed to upload avatar',
        cause: error,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<void> deleteAvatar() async {
    try {
      await _profileApi.deleteAvatar();
      _cachedUserProfile = await _fetchUserProfileFromBackend();
    } on DioException catch (dioError, stackTrace) {
      throw ProfileAvatarDeleteException(
        message: _buildErrorMessage('Failed to delete avatar', dioError),
        statusCode: dioError.response?.statusCode,
        cause: dioError,
        stackTrace: stackTrace,
      );
    } catch (error, stackTrace) {
      throw ProfileAvatarDeleteException(
        message: 'Failed to delete avatar',
        cause: error,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<void> dispose() async {
    _cachedUserProfile = null;
  }

  Future<UserProfile> _fetchUserProfileFromBackend() async {
    final userProfileDto = await _profileApi.getUser();
    return ProfileMapper.toDomain(userProfileDto);
  }

  String _buildErrorMessage(String baseMessage, DioException dioError) {
    final statusCode = dioError.response?.statusCode;
    if (statusCode != null) return '$baseMessage (HTTP $statusCode)';
    return switch (dioError.type) {
      DioExceptionType.connectionTimeout => '$baseMessage (connection timeout)',
      DioExceptionType.sendTimeout => '$baseMessage (send timeout)',
      DioExceptionType.receiveTimeout => '$baseMessage (receive timeout)',
      DioExceptionType.badCertificate => '$baseMessage (bad certificate)',
      DioExceptionType.badResponse => '$baseMessage (bad response)',
      DioExceptionType.cancel => '$baseMessage (cancelled)',
      DioExceptionType.connectionError => '$baseMessage (connection error)',
      DioExceptionType.unknown => baseMessage,
    };
  }
}
