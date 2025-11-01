part of 'profile_form_bloc.dart';

enum FirstNameInvalidStatus { empty, tooLong, forbiddenChars }

enum LastNameInvalidStatus { empty, tooLong, forbiddenChars }

enum PhoneInvalidStatus { empty, invalid }

// Sentinel Value Pattern
const _nothingPassed = Object();

sealed class ProfileFormState {
  const ProfileFormState({
    required this.email,
    this.firstName = '',
    this.lastName = '',
    this.phone = '',
  });

  final String email;
  final String firstName;
  final String lastName;
  final String phone;

  FirstNameInvalidStatus? get firstNameStatus => null;

  LastNameInvalidStatus? get lastNameStatus => null;

  PhoneInvalidStatus? get phoneStatus => null;

  bool get isValid =>
      firstName.isNotEmpty &&
      lastName.isNotEmpty &&
      phone.isNotEmpty &&
      firstNameStatus == null &&
      lastNameStatus == null &&
      phoneStatus == null;
}

final class ProfileFormInitialState extends ProfileFormState {
  const ProfileFormInitialState({
    required super.email,
    super.firstName,
    super.lastName,
    super.phone,
  });
}

final class ProfileFormEditingState extends ProfileFormState {
  const ProfileFormEditingState({
    required super.email,
    required super.firstName,
    required super.lastName,
    required super.phone,
    this.firstNameStatus,
    this.lastNameStatus,
    this.phoneStatus,
  });

  @override
  final FirstNameInvalidStatus? firstNameStatus;

  @override
  final LastNameInvalidStatus? lastNameStatus;

  @override
  final PhoneInvalidStatus? phoneStatus;

  ProfileFormEditingState copyWith({
    String? email,
    String? firstName,
    String? lastName,
    String? phone,
    Object? firstNameStatus = _nothingPassed,
    Object? lastNameStatus = _nothingPassed,
    Object? phoneStatus = _nothingPassed,
  }) => ProfileFormEditingState(
    email: email ?? this.email,
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    phone: phone ?? this.phone,
    firstNameStatus: firstNameStatus == _nothingPassed
        ? this.firstNameStatus
        : firstNameStatus as FirstNameInvalidStatus?,
    lastNameStatus: lastNameStatus == _nothingPassed
        ? this.lastNameStatus
        : lastNameStatus as LastNameInvalidStatus?,
    phoneStatus: phoneStatus == _nothingPassed
        ? this.phoneStatus
        : phoneStatus as PhoneInvalidStatus?,
  );
}

final class ProfileFormSavingState extends ProfileFormEditingState {
  const ProfileFormSavingState({
    required super.email,
    required super.firstName,
    required super.lastName,
    required super.phone,
    super.firstNameStatus,
    super.lastNameStatus,
    super.phoneStatus,
  });
}

final class ProfileFormSavedState extends ProfileFormEditingState {
  const ProfileFormSavedState({
    required super.email,
    required super.firstName,
    required super.lastName,
    required super.phone,
  });
}

final class ProfileFormFailureState extends ProfileFormEditingState {
  const ProfileFormFailureState({
    required super.email,
    required super.firstName,
    required super.lastName,
    required super.phone,
    required this.message,
    super.firstNameStatus,
    super.lastNameStatus,
    super.phoneStatus,
  });

  final String message;
}
