import 'package:meta/meta.dart';

@immutable
class Employee {
  final String email;

  const Employee({
    required this.email,
  });

  Employee copyWith({
    String? email,
  }) => Employee(
    email: email ?? this.email,
  );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Employee && email == other.email;
  }

  @override
  int get hashCode => email.hashCode;
}
