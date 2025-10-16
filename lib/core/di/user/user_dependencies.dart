import 'package:dio/dio.dart';

import '../../../features/cabinets/domain/repository/cabinets_repository.dart';

abstract interface class UserDependencies {
  Dio get dio;

  CabinetsRepository get cabinetsRepository;

  Future<void> dispose();
}
