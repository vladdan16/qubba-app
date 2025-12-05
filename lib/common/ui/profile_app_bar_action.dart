import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/navigation/navigation_ext.dart';
import '../../features/profile/domain/bloc/profile_bloc.dart';
import '../../l10n/l10n.dart';

class ProfileAppBarAction extends StatelessWidget {
  const ProfileAppBarAction({super.key});

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
                onPressed: isBusy ? null : () => context.goToProfile(),
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
