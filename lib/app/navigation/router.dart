import 'package:go_router/go_router.dart';

abstract final class AppRouter {
  static final router = GoRouter(
    debugLogDiagnostics: true,
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          // TODO(vladdan16): тут создаем скоуп с зависимостями
          //  для логина и регистрации
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
          // TODO(vladdan16): implement auth scope
          // тут создаем скоуп авторизации, все дочерние route'ы
          // будут иметь к нему доступ.
          // return AuthScope(child: child);
          throw UnimplementedError();
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
