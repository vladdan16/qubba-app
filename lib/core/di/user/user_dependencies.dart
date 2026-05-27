import 'package:dio/dio.dart';

import '../../../features/ai_models/domain/repository/ai_models_repository.dart';
import '../../../features/cabinets/domain/repository/cabinets_repository.dart';
import '../../../features/profile/domain/repository/profile_repository.dart';
import '../../../features/reviews/domain/repository/reviews_repository.dart';
import '../../../features/sales/domain/repository/sales_repository.dart';
import '../../../features/user_settings/domain/repository/user_settings_repository.dart';

abstract interface class UserDependencies {
  Dio get dio;

  Dio get reportDio;

  Dio get aiDio;

  CabinetsRepository get cabinetsRepository;

  ProfileRepository get profileRepository;

  SalesRepository get salesRepository;

  ReviewsRepository get reviewsRepository;

  UserSettingsRepository get userSettingsRepository;

  AiModelsRepository get aiModelsRepository;

  Future<void> dispose();
}
