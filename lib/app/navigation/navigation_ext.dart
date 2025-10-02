import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

extension NavigationExt on BuildContext {
  void goToLoginPage() => go('/login');

  void goToRegistrationPage() => go('/registration');

  void goToHome(String token) => go('/home?token=$token');

  void goToProfile(String token) => go('/profile?token=$token');
}
