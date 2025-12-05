import 'package:dio/dio.dart';

import '../../../features/cabinets/data/api/cabinets_api.dart';
import '../../../features/cabinets/data/repository/cabinets_repository_impl.dart';
import '../../../features/cabinets/domain/repository/cabinets_repository.dart';

import '../../../features/profile/data/api/profile_api.dart';
import '../../../features/profile/data/repository/profile_repository_impl.dart';
import '../../../features/profile/domain/repository/profile_repository.dart';

import '../app/app_dependencies.dart';
import 'user_dependencies.dart';

final class UserDependenciesImpl implements UserDependencies {
  @override
  final Dio dio;

  @override
  final CabinetsRepository cabinetsRepository;

  @override
  final ProfileRepository profileRepository;

  UserDependenciesImpl._({
    required this.dio,
    required this.cabinetsRepository,
    required this.profileRepository,
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

    final profileApi = ProfileApi(dio);
    final profileRepository = ProfileRepositoryImpl(profileApi);

    dio.interceptors.addAll([
      LogInterceptor(requestBody: true, responseBody: true),
    ]);

    return UserDependenciesImpl._(
      dio: dio,
      cabinetsRepository: cabinetsRepository,
      profileRepository: profileRepository,
    );
  }

  @override
  Future<void> dispose() async {
    await cabinetsRepository.dispose();
    await profileRepository.dispose();
    dio.close();
  }
}
