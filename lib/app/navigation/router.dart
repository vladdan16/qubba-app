import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../common/ui/splash_screen.dart';
import '../../core/di/app/app_scope.dart';
import '../../core/di/user/user_dependencies_impl.dart';
import '../../core/di/user/user_scope.dart';
import '../../features/authentication/domain/bloc/auth_bloc.dart';
import '../../features/authentication/ui/login_page.dart';
import '../../features/cabinets/domain/bloc/cabinet_employees_bloc.dart';
import '../../features/cabinets/domain/bloc/cabinets_bloc.dart';
import '../../features/cabinets/domain/models/cabinet.dart';
import '../../features/cabinets/ui/cabinet_employees_screen.dart';
import '../../features/cabinets/ui/cabinet_form_screen.dart';
import '../../features/cabinets/ui/cabinets_list_screen.dart';
import '../../features/profile/domain/bloc/profile_bloc.dart';
import '../../features/profile/ui/pages/profile_page.dart';
import '../../features/reviews/ui/pages/review_detail_page.dart';
import '../../features/reviews/ui/pages/reviews_page.dart';
import '../../features/sales/ui/pages/sales_page.dart';
import 'main_shell.dart';

abstract final class AppRouter {
  static final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/splash',
    routes: [
      ShellRoute(
        builder: (context, state, child) => child,
        routes: [
          GoRoute(
            path: '/splash',
            builder: (context, state) => const SplashScreen(),
          ),
          GoRoute(
            path: '/login',
            builder: (context, state) => const LoginPage(),
          ),
          GoRoute(
            path: '/registration',
            builder: (context, state) =>
                const _StubPage(title: 'Registration (stub)'),
          ),
        ],
      ),
      ShellRoute(
        builder: (context, state, child) => UserScope(
          init: () => UserDependenciesImpl.init(
            appDeps: AppScope.of(context),
          ),
          authorized: (context) => BlocProvider<ProfileBloc>(
            lazy: false,
            create: (context) {
              final profileRepository = UserScope.of(context).profileRepository;
              final bloc = ProfileBloc(repository: profileRepository)
                ..add(const ProfileLoadRequested());
              return bloc;
            },
            child: child,
          ),
        ),
        routes: [
          GoRoute(
            path: '/profile',
            builder: (context, state) {
              final authState = context.watch<AuthBloc>().state;
              final email = switch (authState) {
                AuthAuthenticated(:final user) => user.id,
                _ => '',
              };
              return ProfilePage(email: email);
            },
          ),
          StatefulShellRoute.indexedStack(
            builder: (context, state, navigationShell) =>
                BlocProvider<CabinetsBloc>(
                  create: (context) => CabinetsBloc(
                    repository: UserScope.of(context).cabinetsRepository,
                  ),
                  child: MainShell(navigationShell: navigationShell),
                ),
            branches: [
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/cabinets',
                    builder: (context, state) => const CabinetsListScreen(),
                    routes: [
                      GoRoute(
                        path: 'add',
                        builder: (context, state) => const CabinetFormScreen(),
                      ),
                      GoRoute(
                        path: 'edit/:id',
                        builder: (context, state) {
                          final cabinet = state.extra as Cabinet?;
                          return CabinetFormScreen(cabinet: cabinet);
                        },
                      ),
                      GoRoute(
                        path: ':id/employees',
                        builder: (context, state) {
                          final extra = state.extra;
                          if (extra is Map<String, String> &&
                              extra['cabinetId'] != null &&
                              extra['cabinetName'] != null) {
                            final cabinetId = extra['cabinetId']!;
                            final cabinetName = extra['cabinetName']!;
                            return BlocProvider(
                              create: (context) => CabinetEmployeesBloc(
                                repository: UserScope.of(
                                  context,
                                ).cabinetsRepository,
                              ),
                              child: CabinetEmployeesScreen(
                                cabinetId: cabinetId,
                                cabinetName: cabinetName,
                              ),
                            );
                          }
                          return const _StubPage(
                            title: 'Invalid cabinet data',
                          );
                        },
                      ),
                      GoRoute(
                        path: ':id/sales',
                        builder: (context, state) {
                          final cabinetId = state.pathParameters['id'];
                          if (cabinetId == null || cabinetId.isEmpty) {
                            return const _StubPage(title: 'Invalid cabinet id');
                          }

                          final extra = state.extra;
                          final cabinetName = (extra is Map<String, String>)
                              ? extra['cabinetName']
                              : null;

                          return SalesPage(
                            cabinetId: cabinetId,
                            cabinetName: cabinetName,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/reviews',
                    builder: (context, state) => const ReviewsPage(),
                    routes: [
                      GoRoute(
                        path: ':id',
                        builder: (context, state) {
                          final id = state.pathParameters['id'];
                          if (id == null || id.isEmpty) {
                            return const _StubPage(title: 'Invalid review id');
                          }
                          return ReviewDetailPage(reviewId: id);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

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
