import 'package:flutter/widgets.dart';

import 'app_dependencies.dart';

class AppScope extends StatefulWidget {
  const AppScope({
    required this.init,
    required this.initialized,
    this.initialization,
    super.key,
  });

  final Future<AppDependencies> Function() init;
  final WidgetBuilder? initialization;
  final WidgetBuilder initialized;

  static AppDependencies of(
    BuildContext context, {
    bool listen = true,
  }) =>
      _AppScopeProvider.maybeOf(
        context,
        listen: false,
      )?.dependencies ??
      (throw Exception('No AppScope in context'));

  @override
  State<AppScope> createState() => _AppScopeState();
}

class _AppScopeState extends State<AppScope> {
  AppDependencies? _dependencies;

  @override
  void initState() {
    super.initState();
    _initDependencies();
  }

  Future<void> _initDependencies() async {
    final dependencies = await widget.init();

    if (mounted) {
      setState(() {
        _dependencies = dependencies;
      });
    }
  }

  @override
  void dispose() {
    _dependencies?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_dependencies case final dependencies?) {
      return _AppScopeProvider(
        dependencies: dependencies,
        child: widget.initialized(context),
      );
    }

    return widget.initialization?.call(context) ?? const SizedBox.shrink();
  }
}

class _AppScopeProvider extends InheritedWidget {
  const _AppScopeProvider({
    required this.dependencies,
    required super.child,
  });

  final AppDependencies dependencies;

  static _AppScopeProvider? maybeOf(
    BuildContext context, {
    bool listen = true,
  }) => listen
      ? context.dependOnInheritedWidgetOfExactType<_AppScopeProvider>()
      : context.getInheritedWidgetOfExactType<_AppScopeProvider>();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
