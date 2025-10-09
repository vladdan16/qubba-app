import '../models/auth_tokens.dart';
import '../models/user.dart';

abstract interface class AuthenticationRepository {
  Stream<(User, AuthTokens)> get user;

  User get currentUser;

  AuthTokens get tokens;

  String get accessToken;

  String get refreshToken;

  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> logOut();

  Future<void> dispose();
}
