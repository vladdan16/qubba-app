import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../features/authentication/data/api/authentication_api.dart';
import '../../../features/authentication/data/repository/authentication_repository_impl.dart';
import '../../../features/authentication/data/utils/auth_interceptor.dart';
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
        baseUrl: 'https://api.qubba.io/',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    AndroidOptions getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
    );
    final secureStorage = FlutterSecureStorage(aOptions: getAndroidOptions());

    final authenticationApi = AuthenticationApi(dio);
    final authRepository = AuthenticationRepositoryImpl(
      authenticationApi,
      secureStorage,
    );

    dio.interceptors.add(AuthInterceptor(dio, authRepository));

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
    dio.interceptors.clear();
    dio.close();
  }
}
