import 'package:dio/dio.dart';

import '../../../features/cabinets/data/api/cabinets_api.dart';
import '../../../features/cabinets/data/repository/cabinets_repository_impl.dart';
import '../../../features/cabinets/domain/repository/cabinets_repository.dart';
import '../app/app_dependencies.dart';
import 'user_dependencies.dart';

final class UserDependenciesImpl implements UserDependencies {
  static final _logInterceptor = LogInterceptor(
    requestBody: true,
    responseBody: true,
  );

  @override
  final Dio dio;

  @override
  final CabinetsRepository cabinetsRepository;

  UserDependenciesImpl._({
    required this.dio,
    required this.cabinetsRepository,
  });

  static Future<UserDependencies> init({
    required AppDependencies appDeps,
  }) async {
    final token = await appDeps.authRepository.token;
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.qubba.io/',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
    );

    final cabinetsApi = CabinetsApi(dio);
    final cabinetsRepository = CabinetsRepositoryImpl(api: cabinetsApi);

    dio.interceptors.add(_logInterceptor);

    return UserDependenciesImpl._(
      dio: dio,
      cabinetsRepository: cabinetsRepository,
    );
  }

  @override
  Future<void> dispose() async {
    await cabinetsRepository.dispose();
    dio.interceptors.remove(_logInterceptor);
    dio.close();
  }
}
