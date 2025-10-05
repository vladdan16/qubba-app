part of 'cabinet_form_bloc.dart';

@immutable
sealed class CabinetFormEvent {
  const CabinetFormEvent();
}

final class NameChanged extends CabinetFormEvent {
  final String name;

  const NameChanged(this.name);
}

final class DescriptionChanged extends CabinetFormEvent {
  final String description;

  const DescriptionChanged(this.description);
}

final class AddressChanged extends CabinetFormEvent {
  final String address;

  const AddressChanged(this.address);
}

final class PhoneChanged extends CabinetFormEvent {
  final String phone;

  const PhoneChanged(this.phone);
}

final class EmailChanged extends CabinetFormEvent {
  final String email;

  const EmailChanged(this.email);
}
