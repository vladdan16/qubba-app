part of 'cabinets_api.dart';

abstract final class _ApiParams {
  static const getAllCabinets = '/v1/cabinet';
  static const createCabinet = '/v1/cabinet';
  static String getCabinetById(String id) => '/v1/cabinet/$id';
  static String updateCabinet(String id) => '/v1/cabinet/$id';
  static String deleteCabinet(String id) => '/v1/cabinet/$id';
}
