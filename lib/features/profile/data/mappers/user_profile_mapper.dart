import '../../domain/models/user_profile.dart';
import '../models/update_user_request_dto.dart';
import '../models/user_profile_dto.dart';

abstract final class ProfileMapper {
  static UserProfile toDomain(UserProfileDto dto) => UserProfile(
    email: dto.email,
    firstName: dto.firstName,
    lastName: dto.lastName,
    phone: dto.phone,
    avatarUrl: dto.icon == null ? null : Uri.tryParse(dto.icon!),
  );

  static UpdateUserRequestDto toUpdateRequest(UserProfile profile) =>
      UpdateUserRequestDto(
        firstName: profile.firstName.trim(),
        lastName: profile.lastName.trim(),
        phone: profile.phone,
      );
}
