import 'package:dio/dio.dart';

import '../../../features/authentication/domain/repository/authentication_repository.dart';

abstract interface class AppDependencies {
  Dio get dio;

  AuthenticationRepository get authRepository;

  Future<void> dispose();
}
