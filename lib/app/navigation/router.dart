import 'package:go_router/go_router.dart';

import '../../core/di/app/app_scope.dart';
import '../../core/di/user/user_dependencies_impl.dart';
import '../../core/di/user/user_scope.dart';

abstract final class AppRouter {
  static final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/home',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          // TODO(vladdan16): тут создаем скоуп с зависимостями
          //  для логина и регистрации (если нужно)
          // return RegistrationScope(child: child);
          throw UnimplementedError();
        },
        routes: [
          GoRoute(
            path: '/login',
            builder: (context, state) {
              // TODO(vladdan16): implement LoginScreen
              // return LoginScreen();
              throw UnimplementedError();
            },
          ),
          GoRoute(
            path: '/registration',
            builder: (context, state) {
              // TODO(vladdan16): implement RegistrationScreen
              // return RegistrationScreen();
              throw UnimplementedError();
            },
          ),
        ],
      ),
      ShellRoute(
        builder: (context, state, child) {
          final token =
              state.uri.queryParameters['token'] ??
              (throw Exception('token should be provided'));

          return UserScope(
            init: () => UserDependenciesImpl.init(
              token: token,
              appDeps: AppScope.of(context),
            ),
            authorized: (context) => child,
          );
        },
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) {
              // TODO(vladdan16): implement HomeScreen
              // return HomeScreen();
              throw UnimplementedError();
            },
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) {
              // TODO(vladdan16): implement ProfileScreen
              // return ProfileScreen();
              throw UnimplementedError();
            },
          ),
        ],
      ),
    ],
  );
}
