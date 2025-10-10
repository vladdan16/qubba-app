import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/di/app/app_scope.dart';
import '../../core/di/user/user_dependencies_impl.dart';
import '../../core/di/user/user_scope.dart';

import '../../features/authentication/ui/login_page.dart';
import '../../features/cabinets/ui/cabinets_page.dart';

abstract final class AppRouter {
  static final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/login',
    routes: [
      ShellRoute(
        builder: (context, state, child) => child,
        routes: [
          GoRoute(
            path: '/login',
            builder: (context, state) => const LoginPage(),
          ),
          GoRoute(
            path: '/registration',
            builder: (context, state) =>
                // TODO(vladdan16): implement RegistrationScreen
                const _StubPage(title: 'Registration (stub)'),
          ),
        ],
      ),
      ShellRoute(
        builder: (context, state, child) => UserScope(
          init: () => UserDependenciesImpl.init(
            appDeps: AppScope.of(context),
          ),
          authorized: (context) => child,
        ),
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => const CabinetsPage(),
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) =>
                // TODO(vladdan16): implement ProfileScreen
                const _StubPage(title: 'Profile (stub)'),
          ),
        ],
      ),
    ],
  );
}

/// Временная заглушка для экранов, чтобы приложение собиралось
class _StubPage extends StatelessWidget {
  const _StubPage({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(title)),
    body: Center(
      child: Text(title, style: Theme.of(context).textTheme.titleLarge),
    ),
  );
}
