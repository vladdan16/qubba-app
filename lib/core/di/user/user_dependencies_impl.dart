import 'package:dio/dio.dart';

import '../../../features/cabinets/data/api/cabinets_api.dart';
import '../../../features/cabinets/data/repository/cabinets_repository_impl.dart';
import '../../../features/cabinets/domain/repository/cabinets_repository.dart';

import '../../../features/profile/data/api/profile_api.dart';
import '../../../features/profile/data/repository/profile_repository_impl.dart';
import '../../../features/profile/domain/repository/profile_repository.dart';

import '../../../features/sales/data/api/sales_api.dart';
import '../../../features/sales/data/repository/sales_repository_impl.dart';
import '../../../features/sales/domain/repository/sales_repository.dart';

import '../app/app_dependencies.dart';
import 'user_dependencies.dart';

final class UserDependenciesImpl implements UserDependencies {
  @override
  final Dio dio;

  @override
  final Dio reportDio;

  @override
  final CabinetsRepository cabinetsRepository;

  @override
  final ProfileRepository profileRepository;

  @override
  final SalesRepository salesRepository;

  UserDependenciesImpl._({
    required this.dio,
    required this.reportDio,
    required this.cabinetsRepository,
    required this.profileRepository,
    required this.salesRepository,
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

    dio.interceptors.addAll([
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: false,
        responseHeader: false,
      ),
    ]);

    final reportDio = Dio(
      BaseOptions(
        baseUrl: 'https://report-api.qubba.io/',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
    );

    reportDio.interceptors.addAll([
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: false,
        responseHeader: false,
      ),
    ]);

    final cabinetsApi = CabinetsApi(dio);
    final cabinetsRepository = CabinetsRepositoryImpl(api: cabinetsApi);

    final profileApi = ProfileApi(dio);
    final profileRepository = ProfileRepositoryImpl(profileApi);

    final salesApi = SalesApi(reportDio);
    final salesRepository = SalesRepositoryImpl(salesApi);

    return UserDependenciesImpl._(
      dio: dio,
      reportDio: reportDio,
      cabinetsRepository: cabinetsRepository,
      profileRepository: profileRepository,
      salesRepository: salesRepository,
    );
  }

  @override
  Future<void> dispose() async {
    await cabinetsRepository.dispose();
    await profileRepository.dispose();
    await salesRepository.dispose();
    dio.close();
    reportDio.close();
  }
}
