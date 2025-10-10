import '../models/user.dart';

/// Repository which manages user authentication.
abstract interface class AuthenticationRepository {
  /// Stream of [User] which will emit the current user
  /// the authentication state changes.
  ///
  /// Emits [User.empty] if user is not authenticated.
  Stream<User> get user;

  /// Returns the current cached user.
  /// Defaults to [User.empty] is there is no cached user.
  User get currentUser;

  /// Returns the current auth token (if any)
  Future<String?> get token;

  // /// Creates a new user with the provided [email] and [password].
  // Future<void> signUp({required String email, required String password});

  /// Signs in with the provided [email] and [password].
  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Signs out the current user which will emit.
  /// [User.empty] from the [user] Stream.
  Future<void> logOut();

  /// Refreshes the session to ensure valid tokens
  Future<void> refreshToken();

  Future<void> dispose();
}
