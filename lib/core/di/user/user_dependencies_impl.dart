import 'package:dio/dio.dart';

import '../../../features/ai_models/data/api/ai_models_api.dart';
import '../../../features/ai_models/data/repository/ai_models_repository_impl.dart';
import '../../../features/ai_models/domain/repository/ai_models_repository.dart';
import '../../../features/authentication/data/utils/auth_interceptor.dart';
import '../../../features/cabinets/data/api/cabinets_api.dart';
import '../../../features/cabinets/data/repository/cabinets_repository_impl.dart';
import '../../../features/cabinets/domain/repository/cabinets_repository.dart';
import '../../../features/profile/data/api/profile_api.dart';
import '../../../features/profile/data/repository/profile_repository_impl.dart';
import '../../../features/profile/domain/repository/profile_repository.dart';
import '../../../features/reviews/data/api/reviews_api.dart';
import '../../../features/reviews/data/repository/reviews_repository_impl.dart';
import '../../../features/reviews/domain/repository/reviews_repository.dart';
import '../../../features/sales/data/api/sales_api.dart';
import '../../../features/sales/data/repository/sales_repository_impl.dart';
import '../../../features/sales/domain/repository/sales_repository.dart';
import '../../../features/user_settings/data/api/user_settings_api.dart';
import '../../../features/user_settings/data/repository/user_settings_repository_impl.dart';
import '../../../features/user_settings/domain/repository/user_settings_repository.dart';
import '../../network/retry_on_connection_closed_interceptor.dart';
import '../app/app_dependencies.dart';
import 'user_dependencies.dart';

final class UserDependenciesImpl implements UserDependencies {
  @override
  final Dio dio;

  @override
  final Dio reportDio;

  @override
  final Dio aiDio;

  @override
  final CabinetsRepository cabinetsRepository;

  @override
  final ProfileRepository profileRepository;

  @override
  final SalesRepository salesRepository;

  @override
  final ReviewsRepository reviewsRepository;

  @override
  final UserSettingsRepository userSettingsRepository;

  @override
  final AiModelsRepository aiModelsRepository;

  UserDependenciesImpl._({
    required this.dio,
    required this.reportDio,
    required this.aiDio,
    required this.cabinetsRepository,
    required this.profileRepository,
    required this.salesRepository,
    required this.reviewsRepository,
    required this.userSettingsRepository,
    required this.aiModelsRepository,
  });

  static Future<UserDependencies> init({
    required AppDependencies appDeps,
  }) async {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.qubba.io/',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.addAll([
      RetryOnConnectionClosedInterceptor(dio),
      AuthInterceptor(dio, appDeps.authRepository),
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
        },
      ),
    );

    reportDio.interceptors.addAll([
      RetryOnConnectionClosedInterceptor(reportDio),
      AuthInterceptor(reportDio, appDeps.authRepository),
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: false,
        responseHeader: false,
      ),
    ]);

    final aiDio = Dio(
      BaseOptions(
        baseUrl: 'https://ai-api.qubba.io/',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    aiDio.interceptors.addAll([
      RetryOnConnectionClosedInterceptor(aiDio),
      AuthInterceptor(aiDio, appDeps.authRepository),
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

    final reviewsApi = ReviewsApi(dio);
    final reviewsRepository = ReviewsRepositoryImpl(api: reviewsApi);

    final userSettingsApi = UserSettingsApi(dio);
    final userSettingsRepository = UserSettingsRepositoryImpl(userSettingsApi);

    final aiModelsApi = AiModelsApi(aiDio);
    final aiModelsRepository = AiModelsRepositoryImpl(aiModelsApi);

    return UserDependenciesImpl._(
      dio: dio,
      reportDio: reportDio,
      aiDio: aiDio,
      cabinetsRepository: cabinetsRepository,
      profileRepository: profileRepository,
      salesRepository: salesRepository,
      reviewsRepository: reviewsRepository,
      userSettingsRepository: userSettingsRepository,
      aiModelsRepository: aiModelsRepository,
    );
  }

  @override
  Future<void> dispose() async {
    await cabinetsRepository.dispose();
    await profileRepository.dispose();
    await salesRepository.dispose();
    await reviewsRepository.dispose();
    await userSettingsRepository.dispose();
    await aiModelsRepository.dispose();
    dio.close();
    reportDio.close();
    aiDio.close();
  }
}
