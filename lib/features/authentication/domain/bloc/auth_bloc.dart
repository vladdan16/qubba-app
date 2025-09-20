import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:meta/meta.dart';

import '../models/user.dart';
import '../repository/authentication_repository.dart';

part 'auth_event.dart';

part 'auth_state.dart';

final class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthenticationRepository _authenticationRepository;

  late final StreamSubscription<(User, String)> _userSubscription;

  AuthBloc({
    required AuthenticationRepository authRepository,
  }) : _authenticationRepository = authRepository,
       super(
         authRepository.currentUser.isNotEmpty
             ? AuthenticatedAppState(
                 authRepository.currentUser,
                 authRepository.token,
               )
             : const UnauthenticatedAppState(),
       ) {
    on<_UserChanged>(_onUserChanged, transformer: sequential());
    on<LogoutRequested>(_onLogoutRequested, transformer: droppable());

    _userSubscription = _authenticationRepository.user.listen(
      (pair) => add(
        _UserChanged(
          user: pair.$1,
          token: pair.$2,
        ),
      ),
    );
  }

  Future<void> _onUserChanged(
    _UserChanged event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      event.user.isNotEmpty
          ? AuthenticatedAppState(event.user, event.token)
          : const UnauthenticatedAppState(),
    );
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    await _authenticationRepository.logOut();
  }

  @override
  Future<void> close() async {
    await _userSubscription.cancel();

    return super.close();
  }
}
