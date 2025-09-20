import 'package:dio/dio.dart';

import 'dependencies.dart';

abstract interface class AppDependencies implements Dependencies {
  Dio get dio;
}
