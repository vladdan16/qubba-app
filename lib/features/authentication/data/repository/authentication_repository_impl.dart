import '../../domain/models/user.dart';
import '../../domain/repository/authentication_repository.dart';
import '../api/authentication_api.dart';

final class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationApi authenticationApi;

  const AuthenticationRepositoryImpl({
    required this.authenticationApi,
  });

  @override
  // TODO(vladdan16): implement currentUser
  User get currentUser => User.empty;

  @override
  // TODO(vladdan16): implement token
  String get token => '';

  @override
  Future<void> logOut() {
    // TODO(vladdan16): implement logOut
    throw UnimplementedError();
  }

  @override
  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    // TODO(vladda16): implement loginWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  // TODO(vladdan16): implement user
  Stream<(User, String)> get user => Stream.value((User.empty, ''));

  @override
  Future<void> dispose() async {
    // TODO(vladdan16): implement dispose
    // close streams, cancel subscriptions, etc.
  }
}
