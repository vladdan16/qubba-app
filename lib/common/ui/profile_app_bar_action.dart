import 'package:flutter/material.dart';

import '../../app/navigation/navigation_ext.dart';
import 'profile_avatar_button.dart';

/// An app bar action that displays the user's avatar and navigates to
/// the profile page when pressed.
class ProfileAppBarAction extends StatelessWidget {
  const ProfileAppBarAction({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileAvatarButton(
      onPressed: () => context.goToProfile(),
    );
  }
}
