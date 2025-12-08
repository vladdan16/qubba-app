class UserProfile {
  const UserProfile({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phone,
    this.avatarUrl,
  });

  final String email;
  final String firstName;
  final String lastName;
  final String phone;
  final Uri? avatarUrl;
}
