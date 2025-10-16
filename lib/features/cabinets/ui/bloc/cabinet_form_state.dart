part of 'cabinet_form_bloc.dart';

@immutable
final class CabinetFormState {
  final String name;
  final String? organizationName;
  final String? organizationInn;
  final int? taxType;
  final int? taxRate;
  final int? ndsRate;
  final bool wbApiActive;
  final String? wbApiKey;
  final bool ozonApiActive;
  final String? ozonClientId;
  final String? ozonApiKey;
  final bool isActive;
  final bool isSaving;
  final bool saveSuccess;
  final String? error;
  final String? nameError;

  const CabinetFormState({
    this.name = '',
    this.organizationName,
    this.organizationInn,
    this.taxType,
    this.taxRate,
    this.ndsRate,
    this.wbApiActive = false,
    this.wbApiKey,
    this.ozonApiActive = false,
    this.ozonClientId,
    this.ozonApiKey,
    this.isActive = true,
    this.isSaving = false,
    this.saveSuccess = false,
    this.error,
    this.nameError,
  });

  bool get isValid => name.isNotEmpty && nameError == null;

  CabinetFormState copyWith({
    String? name,
    String? organizationName,
    String? organizationInn,
    int? taxType,
    int? taxRate,
    int? ndsRate,
    bool? wbApiActive,
    String? wbApiKey,
    bool? ozonApiActive,
    String? ozonClientId,
    String? ozonApiKey,
    bool? isActive,
    bool? isSaving,
    bool? saveSuccess,
    String? error,
    String? nameError,
  }) => CabinetFormState(
    name: name ?? this.name,
    organizationName: organizationName ?? this.organizationName,
    organizationInn: organizationInn ?? this.organizationInn,
    taxType: taxType ?? this.taxType,
    taxRate: taxRate ?? this.taxRate,
    ndsRate: ndsRate ?? this.ndsRate,
    wbApiActive: wbApiActive ?? this.wbApiActive,
    wbApiKey: wbApiKey ?? this.wbApiKey,
    ozonApiActive: ozonApiActive ?? this.ozonApiActive,
    ozonClientId: ozonClientId ?? this.ozonClientId,
    ozonApiKey: ozonApiKey ?? this.ozonApiKey,
    isActive: isActive ?? this.isActive,
    isSaving: isSaving ?? this.isSaving,
    saveSuccess: saveSuccess ?? this.saveSuccess,
    error: error,
    nameError: nameError,
  );
}
