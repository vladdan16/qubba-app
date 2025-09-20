import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

extension NavigationExt on BuildContext {
  void goToLoginPage() {
    go('/login');
  }
}
