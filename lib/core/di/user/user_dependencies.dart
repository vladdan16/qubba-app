import 'package:dio/dio.dart';

import '../../../features/cabinets/domain/repository/cabinets_repository.dart';
import '../../../features/profile/domain/repository/profile_repository.dart';
import '../../../features/sales/domain/repository/sales_repository.dart';

abstract interface class UserDependencies {
  Dio get dio;

  Dio get reportDio;

  CabinetsRepository get cabinetsRepository;

  ProfileRepository get profileRepository;

  SalesRepository get salesRepository;

  Future<void> dispose();
}
