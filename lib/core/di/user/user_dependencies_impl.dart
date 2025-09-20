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
    required String token,
    required AppDependencies appDeps,
  }) async {
    final dio = appDeps.dio.clone(
      options: appDeps.dio.options.copyWith(
        headers: {
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
