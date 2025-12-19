import '../../domain/models/cabinet.dart';
import '../../domain/repository/cabinets_repository.dart';
import '../api/cabinets_api.dart';
import '../mappers/cabinet_mapper.dart';
import '../mappers/employee_mapper.dart';

final class CabinetsRepositoryImpl implements CabinetsRepository {
  final CabinetsApi _api;

  const CabinetsRepositoryImpl({
    required CabinetsApi api,
  }) : _api = api;

  @override
  Future<List<Cabinet>> getAllCabinets({int? limit, int? offset}) async {
    final json = await _api.getAllCabinets(limit: limit, offset: offset);
    final data = json['data']! as Map<String, Object?>;
    final response = _api.parseCabinetsResponse(data);
    return response.cabinets.map(CabinetMapper.toDomain).toList();
  }

  @override
  Future<Cabinet> getCabinetById(String cabinetId) async {
    final json = await _api.getCabinetById(cabinetId);
    final data = json['data']! as Map<String, Object?>;
    final cabinetResponse = data['cabinet']! as Map<String, Object?>;
    final dto = _api.parseCabinetResponse(cabinetResponse);
    return CabinetMapper.toDomain(dto);
  }

  @override
  Future<Cabinet> createCabinet(Cabinet cabinet) async {
    final dto = CabinetMapper.toAddRequest(cabinet);
    final json = await _api.createCabinet(dto);
    final data = json['data']! as Map<String, Object?>;
    final cabinetResponse = data['cabinet']! as Map<String, Object?>;
    final responseDto = _api.parseCabinetResponse(cabinetResponse);
    return CabinetMapper.toDomain(responseDto);
  }

  @override
  Future<Cabinet> updateCabinet(Cabinet cabinet) async {
    final dto = CabinetMapper.toUpdateRequest(cabinet);
    await _api.updateCabinet(
      cabinet.id ??
          (throw Exception('Id cannot be empty when updating cabinet')),
      dto,
    );
    return cabinet;
    // TODO(vladdan16): выяснилось что бэк не присылает модельку в ответ
    //  на апдейт, узнать почему
    // final data = json['data']! as Map<String, Object?>;
    // final cabinetResponse = data['cabinet']! as Map<String, Object?>;
    // final responseDto = _api.parseCabinetResponse(cabinetResponse);
    // return CabinetMapper.toDomain(responseDto);
  }

  @override
  Future<void> deleteCabinet(String cabinetId) async {
    await _api.deleteCabinet(cabinetId);
  }

  @override
  Future<void> addCabinetEmployee(
    String cabinetId, {
    String? email,
    String? firstName,
    String? lastName,
  }) async {
    final dto = EmployeeMapper.toAddRequest(
      email: email,
      firstName: firstName,
      lastName: lastName,
    );
    await _api.addCabinetEmployee(cabinetId, dto);
  }

  @override
  Future<void> deleteCabinetEmployee(
    String cabinetId,
    String userId,
  ) async {
    await _api.deleteCabinetEmployee(cabinetId, userId);
  }

  @override
  Future<void> dispose() async {
    // No cleanup needed for this repository
  }
}
