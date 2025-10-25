import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../features/cabinets/domain/models/cabinet.dart';

extension NavigationExt on BuildContext {
  void goToLoginPage() => go('/login');

  void goToRegistrationPage() => go('/registration');

  void goToHome() => go('/home');

  void goToProfile() => go('/profile');

  void openCabinetAdd() => go('/cabinets/add');

  void openCabinetEdit(Cabinet cabinet) => go(
    '/cabinets/edit/${cabinet.id}',
    extra: cabinet,
  );
}
