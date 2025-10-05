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
  Future<List<Cabinet>> getAllCabinets({int? limit}) async {
    final json = await _api.getAllCabinets(limit: limit);
    final response = _api.parseCabinetsResponse(json);
    return response.cabinets.map(CabinetMapper.toDomain).toList();
  }

  @override
  Future<Cabinet> updateCabinet(Cabinet cabinet) async {
    final dto = CabinetMapper.toUpdateRequest(cabinet);
    final json = await _api.updateCabinet(cabinet.id, dto);
    final response = _api.parseCabinetResponse(json);
    return CabinetMapper.toDomain(response);
  }

  @override
  Future<void> dispose() async {
    // No cleanup needed for this repository
  }
}
