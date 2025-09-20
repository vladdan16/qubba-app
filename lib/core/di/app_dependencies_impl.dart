import 'package:dio/dio.dart';

import 'app_dependencies.dart';

final class AppDependenciesImpl implements AppDependencies {
  @override
  final Dio dio;

  AppDependenciesImpl._({
    required this.dio,
  });

  static Future<AppDependencies> init() async {
    // all dependencies creation here
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://example.com',
      ),
    );

    return AppDependenciesImpl._(
      dio: dio,
      // and other deps
    );
  }

  @override
  Future<void> dispose() async {
    dio.close();
  }
}
