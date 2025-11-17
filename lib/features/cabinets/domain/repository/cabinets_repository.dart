import '../models/cabinet.dart';
import '../models/employee.dart';

abstract interface class CabinetsRepository {
  Future<List<Cabinet>> getAllCabinets({int? limit, int? offset});

  Future<Cabinet> getCabinetById(String cabinetId);

  Future<Cabinet> createCabinet(Cabinet cabinet);

  Future<Cabinet> updateCabinet(Cabinet cabinet);

  Future<void> deleteCabinet(String cabinetId);

  // Employee management methods
  Future<List<Employee>> getCabinetEmployees(String cabinetId);

  Future<Employee> addCabinetEmployee(String cabinetId, String email);

  Future<void> deleteCabinetEmployee(String cabinetId, String employeeId);

  Future<void> dispose();
}
