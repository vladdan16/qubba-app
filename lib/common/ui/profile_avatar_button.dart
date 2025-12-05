import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/profile/domain/bloc/profile_bloc.dart';
import '../../l10n/l10n.dart';

/// A reusable profile avatar button widget that displays the user's avatar
/// with busy state handling.
///
/// This widget shows a circular avatar with a loading indicator overlay
/// when the profile is performing avatar operations (upload/delete).
class ProfileAvatarButton extends StatelessWidget {
  const ProfileAvatarButton({
    required this.onPressed,
    super.key,
  });

  /// Callback invoked when the button is pressed.
  /// The button is disabled during busy states (avatar upload/delete).
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final strings = Strings.of(context);

    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (previous, current) {
        Uri? avatarOf(ProfileState s) => switch (s) {
          ProfileReadyState(:final profile) => profile.avatarUrl,
          _ => null,
        };

        return avatarOf(previous) != avatarOf(current) ||
            previous.runtimeType != current.runtimeType;
      },
      builder: (context, state) {
        final profile = switch (state) {
          ProfileReadyState(:final profile) => profile,
          _ => null,
        };

        final isBusy =
            state is ProfileAvatarUploadingState ||
            state is ProfileAvatarDeletingState;

        final avatarUrlString = profile?.avatarUrl?.toString();

        final icon = CircleAvatar(
          radius: 16,
          backgroundImage: avatarUrlString != null
              ? NetworkImage(avatarUrlString)
              : null,
          child: avatarUrlString == null
              ? const Icon(Icons.person_outline)
              : null,
        );

        return Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                tooltip: strings.profileTooltip,
                onPressed: isBusy ? null : onPressed,
                icon: icon,
              ),
              if (isBusy)
                const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
            ],
          ),
        );
      },
    );
  }
}
