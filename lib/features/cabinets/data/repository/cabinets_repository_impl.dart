import '../../domain/models/cabinet.dart';
import '../../domain/repository/cabinets_repository.dart';
import '../api/cabinets_api.dart';
import '../mappers/cabinet_mapper.dart';

final class CabinetsRepositoryImpl implements CabinetsRepository {
  final CabinetsApi _api;

  const CabinetsRepositoryImpl({
    required CabinetsApi api,
  }) : _api = api;

  @override
  Future<List<Cabinet>> getAllCabinets({int? limit, int? offset}) async {
    final json = await _api.getAllCabinets(limit: limit, offset: offset);
    final response = _api.parseCabinetsResponse(json!);
    return response.cabinets.map(CabinetMapper.toDomain).toList();
  }

  @override
  Future<Cabinet> getCabinetById(String cabinetId) async {
    final json = await _api.getCabinetById(cabinetId);
    final dto = _api.parseCabinetResponse(json!);
    return CabinetMapper.toDomain(dto);
  }

  @override
  Future<Cabinet> createCabinet(Cabinet cabinet) async {
    final dto = CabinetMapper.toAddRequest(cabinet);
    final json = await _api.createCabinet(dto);
    final responseDto = _api.parseCabinetResponse(json!);
    return CabinetMapper.toDomain(responseDto);
  }

  @override
  Future<Cabinet> updateCabinet(Cabinet cabinet) async {
    final dto = CabinetMapper.toUpdateRequest(cabinet);
    final json = await _api.updateCabinet(cabinet.id, dto);
    final responseDto = _api.parseCabinetResponse(json!);
    return CabinetMapper.toDomain(responseDto);
  }

  @override
  Future<void> deleteCabinet(String cabinetId) async {
    await _api.deleteCabinet(cabinetId);
  }

  @override
  Future<void> dispose() async {
    // No cleanup needed for this repository
  }
}
