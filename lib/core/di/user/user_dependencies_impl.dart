import 'package:dio/dio.dart';

import '../app/app_dependencies.dart';
import 'user_dependencies.dart';

final class UserDependenciesImpl implements UserDependencies {
  @override
  final Dio dio;

  UserDependenciesImpl._({
    required this.dio,
  });

  static Future<UserDependencies> init({
    required AppDependencies appDeps,
  }) async {
    final token = await appDeps.authRepository.token;
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://user-api.qubba.io',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
    );

    return UserDependenciesImpl._(
      dio: dio,
    );
  }

  @override
  Future<void> dispose() async {
    dio.close();
  }
}
