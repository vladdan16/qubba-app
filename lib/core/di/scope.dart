import 'package:flutter/material.dart';

import 'dependencies.dart';

class Scope<Deps extends Dependencies> extends StatefulWidget {
  const Scope({
    required this.init,
    required this.initialization,
    required this.initialized,
    super.key,
  });

  final Future<Deps> Function() init;
  final WidgetBuilder initialization;
  final WidgetBuilder initialized;

  static Deps of<Deps extends Dependencies>(
    BuildContext context, {
    bool listen = true,
  }) =>
      _ScopeProvider.maybeOf<Deps>(
        context,
        listen: listen,
      )?.dependencies ??
      (throw Exception('No Scope<$Deps> in context'));

  @override
  State<Scope> createState() => _ScopeState();
}

class _ScopeState<Deps extends Dependencies> extends State<Scope<Deps>> {
  Deps? _dependencies;

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
      return _ScopeProvider<Deps>(
        dependencies: dependencies,
        child: widget.initialized(context),
      );
    }

    return widget.initialization(context);
  }
}

class _ScopeProvider<Deps extends Dependencies> extends InheritedWidget {
  const _ScopeProvider({
    required this.dependencies,
    required super.child,
  });

  final Deps dependencies;

  static _ScopeProvider<Deps>? maybeOf<Deps extends Dependencies>(
    BuildContext context, {
    bool listen = true,
  }) => listen
      ? context.dependOnInheritedWidgetOfExactType<_ScopeProvider<Deps>>()
      : context.getInheritedWidgetOfExactType<_ScopeProvider<Deps>>();

  // updateShouldNotify => false, since dependencies won't change
  // during widget's lifecycle
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
