import '../models/cabinet.dart';

abstract interface class CabinetsRepository {
  Future<List<Cabinet>> getAllCabinets({int? limit});
  
  Future<Cabinet> updateCabinet(Cabinet cabinet);
  
  Future<void> dispose();
}
