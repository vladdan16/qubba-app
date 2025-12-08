import '../models/user_profile.dart';

abstract interface class ProfileRepository {
  Future<UserProfile> getProfile();

  Future<UserProfile> updateProfile({
    required String firstName,
    required String lastName,
    required String phone,
  });

  Future<Uri?> uploadAvatar({required String filePath});

  Future<void> deleteAvatar();

  Future<void> dispose();
}
