part of 'profile_form_bloc.dart';

sealed class ProfileFormEvent {
  const ProfileFormEvent();
}

final class FirstNameChangedEvent extends ProfileFormEvent {
  const FirstNameChangedEvent({required this.value});

  final String value;
}

final class LastNameChangedEvent extends ProfileFormEvent {
  const LastNameChangedEvent({required this.value});

  final String value;
}

final class PhoneChangedEvent extends ProfileFormEvent {
  const PhoneChangedEvent({required this.value});

  final String value;
}

final class EditPressedEvent extends ProfileFormEvent {
  const EditPressedEvent();
}

final class SavePressedEvent extends ProfileFormEvent {
  const SavePressedEvent();
}
