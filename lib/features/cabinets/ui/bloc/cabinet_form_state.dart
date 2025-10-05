part of 'cabinet_form_bloc.dart';

@immutable
final class CabinetFormState {
  final String name;
  final String description;
  final String address;
  final String phone;
  final String email;

  const CabinetFormState({
    required this.name,
    required this.description,
    required this.address,
    required this.phone,
    required this.email,
  });

  CabinetFormState copyWith({
    String? name,
    String? description,
    String? address,
    String? phone,
    String? email,
  }) {
    return CabinetFormState(
      name: name ?? this.name,
      description: description ?? this.description,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      email: email ?? this.email,
    );
  }

  bool get isValid => name.isNotEmpty;
}
