import 'package:flutter/material.dart';

import '../../app/navigation/navigation_ext.dart';
import '../../l10n/l10n.dart';

class ProfileAppBarAction extends StatelessWidget {
  const ProfileAppBarAction({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = Strings.of(context);
    return IconButton(
      tooltip: strings.profileTooltip,
      icon: const Icon(Icons.person_outline),
      onPressed: () => context.goToProfile(),
    );
  }
}
