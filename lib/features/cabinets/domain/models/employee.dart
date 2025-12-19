import 'package:meta/meta.dart';

@immutable
class Employee {
  final String userId;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? icon;

  const Employee({
    required this.userId,
    this.email,
    this.firstName,
    this.lastName,
    this.icon,
  });

  Employee copyWith({
    String? userId,
    String? email,
    String? firstName,
    String? lastName,
    String? icon,
  }) => Employee(
    userId: userId ?? this.userId,
    email: email ?? this.email,
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    icon: icon ?? this.icon,
  );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Employee &&
        userId == other.userId &&
        email == other.email &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        icon == other.icon;
  }

  @override
  int get hashCode => Object.hash(
    userId,
    email,
    firstName,
    lastName,
    icon,
  );

  String get name => [
    ?firstName,
    ?lastName,
    ?email,
  ].take(2).join(' ');
}
