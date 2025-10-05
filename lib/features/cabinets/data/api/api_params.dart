part of 'cabinets_api.dart';

abstract final class _ApiParams {
  static const getAllCabinets = 'https://bot-api.qubba.io/cabinet/all';
  static String updateCabinet(String id) =>
      'https://user-api.qubba.io/v1/cabinet/$id';
}
