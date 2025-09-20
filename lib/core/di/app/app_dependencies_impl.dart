import 'package:dio/dio.dart';

import '../../../features/authentication/data/api/authentication_api.dart';
import '../../../features/authentication/data/repository/authentication_repository_impl.dart';
import '../../../features/authentication/domain/repository/authentication_repository.dart';
import 'app_dependencies.dart';

final class AppDependenciesImpl implements AppDependencies {
  @override
  final Dio dio;

  @override
  final AuthenticationRepository authRepository;

  AppDependenciesImpl._({
    required this.dio,
    required this.authRepository,
  });

  static Future<AppDependencies> init() async {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://example.com',
      ),
    );

    final authenticationApi = AuthenticationApi(dio);
    final authRepository = AuthenticationRepositoryImpl(
      authenticationApi: authenticationApi,
    );

    return AppDependenciesImpl._(
      dio: dio,
      authRepository: authRepository,
    );
  }

  @override
  Future<void> dispose() async {
    // Important! We should dispose dependencies
    // in the reverse order of creation
    await authRepository.dispose();
    dio.close();
  }
}
