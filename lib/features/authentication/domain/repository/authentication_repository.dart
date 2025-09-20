import '../models/user.dart';

/// Repository which manages user authentication.
abstract interface class AuthenticationRepository {
  /// Stream of [User] which will emit the current user
  /// the authentication state changes.
  ///
  /// Emits [User.empty] if user is not authenticated.
  Stream<(User, String)> get user;

  /// The current cached user.
  User get currentUser;

  /// The current cached token.
  String get token;

  // For now there is no signUp available
  // Future<void> signUp({required String email, required String password});

  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> logOut();

  Future<void> dispose();
}
