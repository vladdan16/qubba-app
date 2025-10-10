import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

import '../models/user.dart';
import '../repository/authentication_repository.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthenticationRepository _authRepository;
  late final StreamSubscription<User> _userSubscription;

  AuthBloc({required AuthenticationRepository authRepository})
    : _authRepository = authRepository,
      super(
        authRepository.currentUser.isNotEmpty
            ? AuthAuthenticated(authRepository.currentUser)
            : const AuthUnauthenticated(),
      ) {
    on<_AuthUserChanged>(_onUserChanged, transformer: sequential());
    on<AuthLogoutRequested>(_onLogoutRequested, transformer: droppable());
    _userSubscription = _authRepository.user.listen(
      (user) => add(_AuthUserChanged(user)),
    );
  }

  Future<void> _onLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> _,
  ) => _authRepository.logOut();

  void _onUserChanged(
    _AuthUserChanged event,
    Emitter<AuthState> emit,
  ) {
    emit(
      event.user.isNotEmpty
          ? AuthAuthenticated(event.user)
          : const AuthUnauthenticated(),
    );
  }

  @override
  Future<void> close() async {
    await _userSubscription.cancel();
    return super.close();
  }
}
