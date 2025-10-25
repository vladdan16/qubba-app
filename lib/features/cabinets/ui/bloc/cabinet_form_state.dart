part of 'cabinet_form_bloc.dart';

// Validation status enums
enum NameInvalidStatus { empty }

enum IntFieldInvalidStatus { empty, invalid }

@immutable
final class CabinetFormState {
  final String? id;
  final String name;
  final String? organizationName;
  final String? organizationInn;
  final String legalType;
  final String taxType;
  final String taxRate;
  final String ndsRate;
  final String taxType2024;
  final String taxRate2024;
  final String unitMaintenanceCost;
  final bool wbApiActive;
  final String? wbApiKey;
  final bool ozonApiActive;
  final String? ozonClientId;
  final String? ozonApiKey;
  final String? ozonPerformanceClientId;
  final String? ozonPerformanceClientSecret;
  final bool isActive;
  final bool isSaving;
  final bool saveSuccess;
  final String? error;
  
  // Validation statuses
  final NameInvalidStatus? nameStatus;
  final IntFieldInvalidStatus? legalTypeStatus;
  final IntFieldInvalidStatus? taxTypeStatus;
  final IntFieldInvalidStatus? taxRateStatus;
  final IntFieldInvalidStatus? ndsRateStatus;
  final IntFieldInvalidStatus? taxType2024Status;
  final IntFieldInvalidStatus? taxRate2024Status;
  final IntFieldInvalidStatus? unitMaintenanceCostStatus;

  const CabinetFormState({
    this.id,
    this.name = '',
    this.organizationName,
    this.organizationInn,
    this.legalType = '',
    this.taxType = '',
    this.taxRate = '',
    this.ndsRate = '',
    this.taxType2024 = '',
    this.taxRate2024 = '',
    this.unitMaintenanceCost = '',
    this.wbApiActive = false,
    this.wbApiKey,
    this.ozonApiActive = false,
    this.ozonClientId,
    this.ozonApiKey,
    this.ozonPerformanceClientId,
    this.ozonPerformanceClientSecret,
    this.isActive = true,
    this.isSaving = false,
    this.saveSuccess = false,
    this.error,
    this.nameStatus,
    this.legalTypeStatus,
    this.taxTypeStatus,
    this.taxRateStatus,
    this.ndsRateStatus,
    this.taxType2024Status,
    this.taxRate2024Status,
    this.unitMaintenanceCostStatus,
  });

  bool get isValid =>
      name.isNotEmpty &&
      nameStatus == null &&
      legalTypeStatus == null &&
      taxTypeStatus == null &&
      taxRateStatus == null &&
      ndsRateStatus == null &&
      taxType2024Status == null &&
      taxRate2024Status == null &&
      unitMaintenanceCostStatus == null;

  CabinetFormState copyWith({
    String? id,
    String? name,
    String? organizationName,
    String? organizationInn,
    String? legalType,
    String? taxType,
    String? taxRate,
    String? ndsRate,
    String? taxType2024,
    String? taxRate2024,
    String? unitMaintenanceCost,
    bool? wbApiActive,
    String? wbApiKey,
    bool? ozonApiActive,
    String? ozonClientId,
    String? ozonApiKey,
    String? ozonPerformanceClientId,
    String? ozonPerformanceClientSecret,
    bool? isActive,
    bool? isSaving,
    bool? saveSuccess,
    String? error,
    NameInvalidStatus? nameStatus,
    IntFieldInvalidStatus? legalTypeStatus,
    IntFieldInvalidStatus? taxTypeStatus,
    IntFieldInvalidStatus? taxRateStatus,
    IntFieldInvalidStatus? ndsRateStatus,
    IntFieldInvalidStatus? taxType2024Status,
    IntFieldInvalidStatus? taxRate2024Status,
    IntFieldInvalidStatus? unitMaintenanceCostStatus,
  }) => CabinetFormState(
    id: id ?? this.id,
    name: name ?? this.name,
    organizationName: organizationName ?? this.organizationName,
    organizationInn: organizationInn ?? this.organizationInn,
    legalType: legalType ?? this.legalType,
    taxType: taxType ?? this.taxType,
    taxRate: taxRate ?? this.taxRate,
    ndsRate: ndsRate ?? this.ndsRate,
    taxType2024: taxType2024 ?? this.taxType2024,
    taxRate2024: taxRate2024 ?? this.taxRate2024,
    unitMaintenanceCost: unitMaintenanceCost ?? this.unitMaintenanceCost,
    wbApiActive: wbApiActive ?? this.wbApiActive,
    wbApiKey: wbApiKey ?? this.wbApiKey,
    ozonApiActive: ozonApiActive ?? this.ozonApiActive,
    ozonClientId: ozonClientId ?? this.ozonClientId,
    ozonApiKey: ozonApiKey ?? this.ozonApiKey,
    ozonPerformanceClientId: ozonPerformanceClientId ?? this.ozonPerformanceClientId,
    ozonPerformanceClientSecret: ozonPerformanceClientSecret ?? this.ozonPerformanceClientSecret,
    isActive: isActive ?? this.isActive,
    isSaving: isSaving ?? this.isSaving,
    saveSuccess: saveSuccess ?? this.saveSuccess,
    error: error,
    nameStatus: nameStatus,
    legalTypeStatus: legalTypeStatus,
    taxTypeStatus: taxTypeStatus,
    taxRateStatus: taxRateStatus,
    ndsRateStatus: ndsRateStatus,
    taxType2024Status: taxType2024Status,
    taxRate2024Status: taxRate2024Status,
    unitMaintenanceCostStatus: unitMaintenanceCostStatus,
  );
}
