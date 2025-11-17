class Employee {
  final String id;
  final String email;
  final String? firstName;
  final String? lastName;
  final DateTime? createdAt;

  const Employee({
    required this.id,
    required this.email,
    this.firstName,
    this.lastName,
    this.createdAt,
  });

  String get displayName {
    if (firstName != null && lastName != null) {
      return '$firstName $lastName';
    }
    if (firstName != null) {
      return firstName!;
    }
    if (lastName != null) {
      return lastName!;
    }
    return email;
  }
}
