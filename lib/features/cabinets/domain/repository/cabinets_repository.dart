import '../models/cabinet.dart';

abstract interface class CabinetsRepository {
  Future<List<Cabinet>> getAllCabinets({int? limit, int? offset});

  Future<Cabinet> getCabinetById(String cabinetId);

  Future<Cabinet> createCabinet(Cabinet cabinet);

  Future<Cabinet> updateCabinet(Cabinet cabinet);

  Future<void> deleteCabinet(String cabinetId);

  Future<void> dispose();
}
