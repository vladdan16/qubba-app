import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

import 'employee.dart';

@immutable
final class Cabinet {
  final String? id;
  final String name;
  final String? organizationName;
  final String? organizationInn;
  final int? legalType;
  final int? taxType;
  final int? taxRate;
  final int? ndsRate;
  final int? taxType2024;
  final int? taxRate2024;
  final int? unitMaintenanceCost;
  final bool? isActive;
  final String? wbApiKey;
  final bool? wbApiActive;
  final String? ozonClientId;
  final String? ozonApiKey;
  final String? ozonPerformanceClientId;
  final String? ozonPerformanceClientSecret;
  final bool? ozonApiActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<Employee> employees;

  const Cabinet({
    required this.id,
    required this.name,
    this.organizationName,
    this.organizationInn,
    this.legalType,
    this.taxType,
    this.taxRate,
    this.ndsRate,
    this.taxType2024,
    this.taxRate2024,
    this.unitMaintenanceCost,
    this.isActive,
    this.wbApiKey,
    this.wbApiActive,
    this.ozonClientId,
    this.ozonApiKey,
    this.ozonPerformanceClientId,
    this.ozonPerformanceClientSecret,
    this.ozonApiActive,
    this.createdAt,
    this.updatedAt,
    this.employees = const [],
  });

  Cabinet copyWith({
    String? id,
    String? name,
    String? organizationName,
    String? organizationInn,
    int? legalType,
    int? taxType,
    int? taxRate,
    int? ndsRate,
    int? taxType2024,
    int? taxRate2024,
    int? unitMaintenanceCost,
    bool? isActive,
    String? wbApiKey,
    bool? wbApiActive,
    String? ozonClientId,
    String? ozonApiKey,
    String? ozonPerformanceClientId,
    String? ozonPerformanceClientSecret,
    bool? ozonApiActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<Employee>? employees,
  }) => Cabinet(
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
    isActive: isActive ?? this.isActive,
    wbApiKey: wbApiKey ?? this.wbApiKey,
    wbApiActive: wbApiActive ?? this.wbApiActive,
    ozonClientId: ozonClientId ?? this.ozonClientId,
    ozonApiKey: ozonApiKey ?? this.ozonApiKey,
    ozonPerformanceClientId:
        ozonPerformanceClientId ?? this.ozonPerformanceClientId,
    ozonPerformanceClientSecret:
        ozonPerformanceClientSecret ?? this.ozonPerformanceClientSecret,
    ozonApiActive: ozonApiActive ?? this.ozonApiActive,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    employees: employees ?? this.employees,
  );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Cabinet &&
        id == other.id &&
        name == other.name &&
        organizationName == other.organizationName &&
        organizationInn == other.organizationInn &&
        legalType == other.legalType &&
        taxType == other.taxType &&
        taxRate == other.taxRate &&
        ndsRate == other.ndsRate &&
        taxType2024 == other.taxType2024 &&
        taxRate2024 == other.taxRate2024 &&
        unitMaintenanceCost == other.unitMaintenanceCost &&
        isActive == other.isActive &&
        wbApiKey == other.wbApiKey &&
        wbApiActive == other.wbApiActive &&
        ozonClientId == other.ozonClientId &&
        ozonApiKey == other.ozonApiKey &&
        ozonPerformanceClientId == other.ozonPerformanceClientId &&
        ozonPerformanceClientSecret == other.ozonPerformanceClientSecret &&
        ozonApiActive == other.ozonApiActive &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        const ListEquality<Employee>().equals(employees, other.employees);
  }

  @override
  int get hashCode => Object.hashAll(
    [
      id,
      name,
      organizationName,
      organizationInn,
      legalType,
      taxType,
      taxRate,
      ndsRate,
      taxType2024,
      taxRate2024,
      unitMaintenanceCost,
      isActive,
      wbApiKey,
      wbApiActive,
      ozonClientId,
      ozonApiKey,
      ozonPerformanceClientId,
      ozonPerformanceClientSecret,
      ozonApiActive,
      createdAt,
      updatedAt,
      employees,
    ],
  );
}
