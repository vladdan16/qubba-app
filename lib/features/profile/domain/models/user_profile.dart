import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';

@freezed
abstract class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String email,
    required String firstName,
    required String lastName,
    required String phone,
    Uri? avatarUrl,
  }) = _UserProfile;
}
