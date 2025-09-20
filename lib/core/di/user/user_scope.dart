import 'dart:async';

import 'package:flutter/widgets.dart';

import 'user_dependencies.dart';

class UserScope extends StatefulWidget {
  const UserScope({
    required this.init,
    required this.authorized,
    this.initialization,
    super.key,
  });

  final Future<UserDependencies> Function() init;
  final WidgetBuilder? initialization;
  final WidgetBuilder authorized;

  static UserDependencies of(
    BuildContext context, {
    bool listen = true,
  }) =>
      _UserScopeProvider.maybeOf(
        context,
        listen: false,
      )?.dependencies ??
      (throw Exception('No AuthScope in context'));

  @override
  State<UserScope> createState() => _UserScopeState();
}

class _UserScopeState extends State<UserScope> {
  UserDependencies? _dependencies;

  @override
  void initState() {
    super.initState();

    unawaited(_initDependencies());
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
    unawaited(_dependencies?.dispose());

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_dependencies case final dependencies?) {
      return _UserScopeProvider(
        dependencies: dependencies,
        child: widget.authorized(context),
      );
    }

    return widget.initialization?.call(context) ?? const SizedBox.shrink();
  }
}

class _UserScopeProvider extends InheritedWidget {
  const _UserScopeProvider({
    required this.dependencies,
    required super.child,
  });

  final UserDependencies dependencies;

  static _UserScopeProvider? maybeOf(
    BuildContext context, {
    bool listen = true,
  }) => listen
      ? context.dependOnInheritedWidgetOfExactType<_UserScopeProvider>()
      : context.getInheritedWidgetOfExactType<_UserScopeProvider>();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
