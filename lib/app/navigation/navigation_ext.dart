import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../features/cabinets/domain/models/cabinet.dart';

extension NavigationExt on BuildContext {
  void goToLoginPage() => go('/login');

  void goToRegistrationPage() => go('/registration');

  void goToHome() => go('/home');

  void goToProfile() => push('/profile');

  void openCabinetAdd() => go('/cabinets/add');

  void openCabinetEdit(Cabinet cabinet) => go(
    '/cabinets/edit/${cabinet.id}',
    extra: cabinet,
  );

  void openCabinetEmployees(String cabinetId, String cabinetName) => go(
    '/cabinets/$cabinetId/employees',
    extra: {'cabinetId': cabinetId, 'cabinetName': cabinetName},
  );

  void openCabinetSales(Cabinet cabinet) => go(
    '/cabinets/${cabinet.id}/sales',
    extra: {'cabinetId': cabinet.id, 'cabinetName': cabinet.name},
  );

  void goToReviews() => go('/reviews');

  void openReviewDetail(String id) => push('/reviews/$id');
}
