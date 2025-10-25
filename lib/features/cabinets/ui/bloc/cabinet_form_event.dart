// В данном случае уместно использовать такие параметры
// ignore_for_file: avoid_positional_boolean_parameters
part of 'cabinet_form_bloc.dart';

@immutable
sealed class CabinetFormEvent {
  const CabinetFormEvent();
}

final class NameChanged extends CabinetFormEvent {
  final String value;
  const NameChanged(this.value);
}

final class OrganizationNameChanged extends CabinetFormEvent {
  final String value;
  const OrganizationNameChanged(this.value);
}

final class OrganizationInnChanged extends CabinetFormEvent {
  final String value;
  const OrganizationInnChanged(this.value);
}

final class LegalTypeChanged extends CabinetFormEvent {
  final String value;
  const LegalTypeChanged(this.value);
}

final class UnitMaintenanceCostChanged extends CabinetFormEvent {
  final String value;
  const UnitMaintenanceCostChanged(this.value);
}

final class TaxTypeChanged extends CabinetFormEvent {
  final String value;
  const TaxTypeChanged(this.value);
}

final class TaxRateChanged extends CabinetFormEvent {
  final String value;
  const TaxRateChanged(this.value);
}

final class NdsRateChanged extends CabinetFormEvent {
  final String value;
  const NdsRateChanged(this.value);
}

final class TaxType2024Changed extends CabinetFormEvent {
  final String value;
  const TaxType2024Changed(this.value);
}

final class TaxRate2024Changed extends CabinetFormEvent {
  final String value;
  const TaxRate2024Changed(this.value);
}

final class WbApiActiveChanged extends CabinetFormEvent {
  final bool value;
  const WbApiActiveChanged(this.value);
}

final class WbApiKeyChanged extends CabinetFormEvent {
  final String value;
  const WbApiKeyChanged(this.value);
}

final class OzonApiActiveChanged extends CabinetFormEvent {
  final bool value;
  const OzonApiActiveChanged(this.value);
}

final class OzonClientIdChanged extends CabinetFormEvent {
  final String value;
  const OzonClientIdChanged(this.value);
}

final class OzonApiKeyChanged extends CabinetFormEvent {
  final String value;
  const OzonApiKeyChanged(this.value);
}

final class OzonPerformanceClientIdChanged extends CabinetFormEvent {
  final String value;
  const OzonPerformanceClientIdChanged(this.value);
}

final class OzonPerformanceClientSecretChanged extends CabinetFormEvent {
  final String value;
  const OzonPerformanceClientSecretChanged(this.value);
}

final class IsActiveChanged extends CabinetFormEvent {
  final bool value;
  const IsActiveChanged(this.value);
}

final class SaveCabinet extends CabinetFormEvent {
  final void Function(Cabinet) onSuccess;
  const SaveCabinet({required this.onSuccess});
}
