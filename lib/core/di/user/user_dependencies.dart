import 'package:dio/dio.dart';

import '../../../features/cabinets/domain/repository/cabinets_repository.dart';
import '../../../features/profile/domain/repository/profile_repository.dart';

abstract interface class UserDependencies {
  Dio get dio;

  CabinetsRepository get cabinetsRepository;

  ProfileRepository get profileRepository;

  Future<void> dispose();
}
