import '../../domain/models/cabinet.dart';
import '../models/add_cabinet_request_dto.dart';
import '../models/cabinet_dto.dart';
import '../models/update_cabinet_request_dto.dart';

abstract final class CabinetMapper {
  static Cabinet toDomain(CabinetDto dto) => Cabinet(
    id: dto.id,
    name: dto.name,
    organizationName: dto.organizationName,
    organizationInn: dto.organizationInn,
    legalType: dto.legalType,
    taxType: dto.taxType,
    taxRate: dto.taxRate,
    ndsRate: dto.ndsRate,
    taxType2024: dto.taxType2024,
    taxRate2024: dto.taxRate2024,
    unitMaintenanceCost: dto.unitMaintenanceCost,
    isActive: dto.isActive,
    wbApiKey: dto.wbApiKey,
    wbApiActive: dto.wbApiActive,
    ozonClientId: dto.ozonClientId,
    ozonApiKey: dto.ozonApiKey,
    ozonPerformanceClientId: dto.ozonPerformanceClientId,
    ozonPerformanceClientSecret: dto.ozonPerformanceClientSecret,
    ozonApiActive: dto.ozonApiActive,
    createdAt: dto.createdAt,
    updatedAt: dto.updatedAt,
  );

  static UpdateCabinetRequestDto toUpdateRequest(Cabinet cabinet) =>
      UpdateCabinetRequestDto(
        name: cabinet.name,
        organizationName: cabinet.organizationName,
        organizationInn: cabinet.organizationInn,
        legalType: cabinet.legalType,
        taxType: cabinet.taxType,
        taxRate: cabinet.taxRate,
        ndsRate: cabinet.ndsRate,
        taxType2024: cabinet.taxType2024,
        taxRate2024: cabinet.taxRate2024,
        unitMaintenanceCost: cabinet.unitMaintenanceCost,
        isActive: cabinet.isActive,
        wbApiKey: cabinet.wbApiKey,
        wbApiActive: cabinet.wbApiActive,
        ozonClientId: cabinet.ozonClientId,
        ozonApiKey: cabinet.ozonApiKey,
        ozonPerformanceClientId: cabinet.ozonPerformanceClientId,
        ozonPerformanceClientSecret: cabinet.ozonPerformanceClientSecret,
        ozonApiActive: cabinet.ozonApiActive,
      );

  static AddCabinetRequestDto toAddRequest(Cabinet cabinet) =>
      AddCabinetRequestDto(
        name: cabinet.name,
        organizationName: cabinet.organizationName,
        organizationInn: cabinet.organizationInn,
        legalType: cabinet.legalType ?? 0,
        taxType: cabinet.taxType ?? 0,
        taxRate: cabinet.taxRate ?? 0,
        ndsRate: cabinet.ndsRate ?? 0,
        taxType2024: cabinet.taxType2024 ?? 0,
        taxRate2024: cabinet.taxRate2024 ?? 0,
        unitMaintenanceCost: cabinet.unitMaintenanceCost ?? 0,
        isActive: cabinet.isActive ?? true,
        wbApiKey: cabinet.wbApiKey,
        wbApiActive: cabinet.wbApiActive ?? false,
        ozonClientId: cabinet.ozonClientId,
        ozonApiKey: cabinet.ozonApiKey,
        ozonPerformanceClientId: cabinet.ozonPerformanceClientId,
        ozonPerformanceClientSecret: cabinet.ozonPerformanceClientSecret,
        ozonApiActive: cabinet.ozonApiActive ?? false,
      );
}
