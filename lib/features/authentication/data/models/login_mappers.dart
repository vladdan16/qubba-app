import '../../domain/models/auth_tokens.dart';
import 'login_response.dart';

extension LoginResponseX on LoginResponse {
  AuthTokens toDomainTokens() => AuthTokens(
    accessToken: accessToken,
    refreshToken: refreshToken,
  );
}
