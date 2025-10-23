import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../features/cabinets/domain/models/cabinet.dart';

extension NavigationExt on BuildContext {
  void goToLoginPage() => go('/login');

  void goToRegistrationPage() => go('/registration');

  void goToHome(String token) => go('/home', extra: token);

  void goToProfile(String token) => go('/profile', extra: token);

  void openCabinetAdd() => push('/cabinets/add');

  void openCabinetEdit(Cabinet cabinet) => push(
    '/cabinets/edit/${cabinet.id}',
    extra: cabinet,
  );
}
