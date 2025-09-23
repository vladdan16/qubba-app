import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../core/di/app/app_dependencies_impl.dart';
import '../core/di/app/app_scope.dart';
import '../features/authentication/domain/bloc/auth_bloc.dart';
import '../l10n/l10n.dart';
import 'navigation/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => AppScope(
    init: AppDependenciesImpl.init,
    // initialization: () => const SplashScreen(),
    initialized: (context) => BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(
        authRepository: AppScope.of(context).authRepository,
      ),
      child: BlocListener<AuthBloc, AuthState>(
        listener: _handleChangeAuth,
        child: MaterialApp.router(
          title: 'Flutter Demo',
          routerConfig: AppRouter.router,
          localizationsDelegates: const [
            Strings.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: Strings.supportedLocales,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            pageTransitionsTheme: const PageTransitionsTheme(
              builders: <TargetPlatform, PageTransitionsBuilder>{
                TargetPlatform.android: PredictiveBackPageTransitionsBuilder(),
              },
            ),
          ),
        ),
      ),
    ),
  );

  void _handleChangeAuth(BuildContext context, AuthState state) =>
      switch (state) {
        AuthenticatedAppState(:final token) => AppRouter.router.go(
          '/home?token=$token',
        ),
        UnauthenticatedAppState() => AppRouter.router.go('/login'),
      };
}
