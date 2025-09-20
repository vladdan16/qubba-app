import 'package:dio/dio.dart';

abstract interface class UserDependencies {
  Dio get dio;

  Future<void> dispose();
}
