import 'package:json_annotation/json_annotation.dart';

part 'user_profile_dto.g.dart';

@JsonSerializable()
class UserProfileDto {
  final String email;

  @JsonKey(name: 'first_name')
  final String firstName;

  @JsonKey(name: 'last_name')
  final String lastName;

  final String phone;

  @JsonKey(name: 'icon')
  final String? icon;

  const UserProfileDto({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phone,
    this.icon,
  });

  factory UserProfileDto.fromJson(Map<String, dynamic> json) =>
      _$UserProfileDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileDtoToJson(this);
}
