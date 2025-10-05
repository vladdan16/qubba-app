import '../../domain/models/cabinet.dart';
import '../models/cabinet_dto.dart';
import '../models/update_cabinet_request_dto.dart';

abstract final class CabinetMapper {
  static Cabinet toDomain(CabinetDto dto) => Cabinet(
        id: dto.id,
        name: dto.name,
        description: dto.description,
        address: dto.address,
        phone: dto.phone,
        email: dto.email,
        createdAt: dto.createdAt,
        updatedAt: dto.updatedAt,
      );

  static UpdateCabinetRequestDto toUpdateRequest(Cabinet cabinet) =>
      UpdateCabinetRequestDto(
        name: cabinet.name,
        description: cabinet.description,
        address: cabinet.address,
        phone: cabinet.phone,
        email: cabinet.email,
      );
}
