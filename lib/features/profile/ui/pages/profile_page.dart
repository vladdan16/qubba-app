import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../common/ui/profile_avatar_button.dart';
import '../../../../l10n/l10n.dart';
import '../../domain/bloc/profile_bloc.dart';
import '../bloc/profile_form_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    required this.email,
    super.key,
    this.initialFirstName = '',
    this.initialLastName = '',
    this.initialPhone = '',
  });

  final String email;
  final String initialFirstName;
  final String initialLastName;
  final String initialPhone;

  @override
  Widget build(BuildContext context) {
    final strings = Strings.of(context);

    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoadingState || state is ProfileInitialState) {
          return const Scaffold(
            appBar: _ProfileAppBar(),
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is ProfileFailureState) {
          return Scaffold(
            appBar: const _ProfileAppBar(),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      strings.profileError(state.message),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    FilledButton(
                      onPressed: () => context.read<ProfileBloc>().add(
                        const ProfileLoadRequested(),
                      ),
                      child: Text(strings.profileRetry),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        final profile = (state is ProfileReadyState) ? state.profile : null;

        if (profile == null) {
          return const Scaffold(
            appBar: _ProfileAppBar(),
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final formKey = ValueKey<String>(
          [
            profile.email,
            profile.firstName,
            profile.lastName,
            profile.phone,
          ].join('|'),
        );

        return BlocProvider<ProfileFormBloc>(
          key: formKey,
          create: (context) => ProfileFormBloc(
            onSave:
                ({
                  required String firstName,
                  required String lastName,
                  required String phone,
                }) async {
                  final bloc = context.read<ProfileBloc>();
                  final finished = bloc.stream.firstWhere(
                    (s) =>
                        s is ProfileReadyIdleState || s is ProfileFailureState,
                  );
                  bloc.add(
                    ProfileUpdateRequested(
                      firstName: firstName,
                      lastName: lastName,
                      phone: phone,
                    ),
                  );
                  await finished;
                },
            email: profile.email.isNotEmpty ? profile.email : email,
            firstName: profile.firstName.isNotEmpty
                ? profile.firstName
                : initialFirstName,
            lastName: profile.lastName.isNotEmpty
                ? profile.lastName
                : initialLastName,
            phone: profile.phone.isNotEmpty ? profile.phone : initialPhone,
          ),
          child: const _ProfileView(),
        );
      },
    );
  }
}

class _ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _ProfileAppBar();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final strings = Strings.of(context);
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          final router = GoRouter.of(context);
          if (router.canPop()) {
            context.pop();
          } else {
            context.go('/cabinets');
          }
        },
      ),
      title: Text(strings.profileTitle),
      centerTitle: true,
      actions: const [ProfileAvatarAction()],
    );
  }
}

/// An app bar action that displays the user's avatar and shows
/// avatar management options (change/delete) in a bottom sheet.
class ProfileAvatarAction extends StatelessWidget {
  const ProfileAvatarAction({super.key});

  Future<void> _showAvatarActions(BuildContext context) async {
    final strings = Strings.of(context);

    await showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (sheetCtx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: Text(strings.changePhotoAction),
              onTap: () async {
                Navigator.of(sheetCtx).pop();
                final bloc = context.read<ProfileBloc>();
                final path = await _pickAvatarImage();
                if (path == null) return;
                bloc.add(
                  ProfileAvatarUploadRequested(filePath: path),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete_outline),
              title: Text(strings.removePhotoAction),
              onTap: () async {
                Navigator.of(sheetCtx).pop();
                context.read<ProfileBloc>().add(
                  const ProfileAvatarDeleteRequested(),
                );
              },
            ),
            const Divider(height: 0),
            ListTile(
              leading: const Icon(Icons.close),
              title: Text(strings.cancelAction),
              onTap: () => Navigator.of(sheetCtx).pop(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) =>
      ProfileAvatarButton(onPressed: () => _showAvatarActions(context));
}

class ProfileAvatarHeader extends StatelessWidget {
  const ProfileAvatarHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = Strings.of(context);

    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (previous, current) {
        Uri? avatarOf(ProfileState s) =>
            s is ProfileReadyState ? s.profile.avatarUrl : null;
        final busyPrev =
            previous is ProfileAvatarUploadingState ||
            previous is ProfileAvatarDeletingState;
        final busyCurr =
            current is ProfileAvatarUploadingState ||
            current is ProfileAvatarDeletingState;
        return avatarOf(previous) != avatarOf(current) || busyPrev != busyCurr;
      },
      builder: (context, state) {
        final ready = state is ProfileReadyState ? state : null;
        final isBusy = state.isBusy;

        final avatarUrl = ready?.profile.avatarUrl?.toString();

        return Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: avatarUrl != null
                      ? NetworkImage(avatarUrl)
                      : null,
                  child: avatarUrl == null
                      ? const Icon(Icons.person_outline, size: 40)
                      : null,
                ),
                if (isBusy)
                  const Positioned.fill(
                    child: ColoredBox(
                      color: Colors.black26,
                      child: Center(
                        child: SizedBox(
                          height: 25,
                          width: 25,
                          child: CircularProgressIndicator(strokeWidth: 2.5),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: isBusy
                        ? null
                        : () async {
                            final bloc = context.read<ProfileBloc>();
                            final path = await _pickAvatarImage();
                            if (path == null) return;
                            bloc.add(
                              ProfileAvatarUploadRequested(filePath: path),
                            );
                          },
                    icon: const Icon(Icons.edit),
                    label: Text(strings.changePhotoAction),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton.icon(
                    onPressed: isBusy
                        ? null
                        : () async {
                            context.read<ProfileBloc>().add(
                              const ProfileAvatarDeleteRequested(),
                            );
                          },
                    icon: const Icon(Icons.delete_outline),
                    label: Text(strings.removePhotoAction),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _ProfileView extends StatelessWidget {
  const _ProfileView();

  @override
  Widget build(BuildContext context) {
    final strings = Strings.of(context);
    return MultiBlocListener(
      listeners: [
        BlocListener<ProfileFormBloc, ProfileFormState>(
          listenWhen: (prev, curr) =>
              curr is ProfileFormSavedState || curr is ProfileFormFailureState,
          listener: (context, state) {
            final messenger = ScaffoldMessenger.of(context);
            if (state is ProfileFormSavedState) {
              messenger.showSnackBar(
                SnackBar(content: Text(strings.profileSaved)),
              );
            } else if (state is ProfileFormFailureState) {
              messenger.showSnackBar(
                SnackBar(content: Text(strings.profileError(state.message))),
              );
            }
          },
        ),
        BlocListener<ProfileBloc, ProfileState>(
          listenWhen: (prev, curr) => curr is ProfileFailureState,
          listener: (context, state) {
            if (state is ProfileFailureState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(strings.profileError(state.message))),
              );
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: const _ProfileAppBar(),
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: _ScrollableContent(),
            ),
          ),
        ),
      ),
    );
  }
}

class _ScrollableContent extends StatelessWidget {
  const _ScrollableContent();

  @override
  Widget build(BuildContext context) => RefreshIndicator(
    onRefresh: () async {
      final bloc = context.read<ProfileBloc>();
      final finished = bloc.stream.firstWhere(
        (s) => s is ProfileReadyIdleState || s is ProfileFailureState,
      );
      bloc.add(const ProfileRefreshRequested());
      await finished;
    },
    child: const SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 12),
          ProfileAvatarHeader(),
          SizedBox(height: 16),
          _EmailField(),
          SizedBox(height: 16),
          _FirstNameField(),
          SizedBox(height: 16),
          _LastNameField(),
          SizedBox(height: 16),
          _PhoneField(),
          SizedBox(height: 24),
          _ActionsRow(),
          SizedBox(height: 8),
        ],
      ),
    ),
  );
}

class _EmailField extends StatelessWidget {
  const _EmailField();

  @override
  Widget build(BuildContext context) {
    final strings = Strings.of(context);
    return BlocBuilder<ProfileFormBloc, ProfileFormState>(
      buildWhen: (prev, curr) => prev.email != curr.email,
      builder: (context, state) => TextFormField(
        initialValue: state.email,
        readOnly: true,
        enabled: false,
        decoration: InputDecoration(
          labelText: strings.emailLabel,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}

class _FirstNameField extends StatelessWidget {
  const _FirstNameField();

  @override
  Widget build(BuildContext context) {
    final strings = Strings.of(context);
    return BlocBuilder<ProfileFormBloc, ProfileFormState>(
      buildWhen: (prev, curr) =>
          prev.firstName != curr.firstName ||
          prev.firstNameStatus != curr.firstNameStatus ||
          (prev is! ProfileFormEditingState &&
              curr is ProfileFormEditingState) ||
          (prev is ProfileFormEditingState && curr is! ProfileFormEditingState),
      builder: (context, state) {
        final isEditing =
            state is ProfileFormEditingState || state is ProfileFormSavingState;
        final errorText = _firstNameErrorText(strings, state.firstNameStatus);

        return TextFormField(
          initialValue: state.firstName,
          enabled: isEditing && state is! ProfileFormSavingState,
          onChanged: isEditing
              ? (v) => context.read<ProfileFormBloc>().add(
                  FirstNameChangedEvent(value: v),
                )
              : null,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: strings.firstNameLabel,
            errorText: errorText,
          ),
        );
      },
    );
  }
}

class _LastNameField extends StatelessWidget {
  const _LastNameField();

  @override
  Widget build(BuildContext context) {
    final strings = Strings.of(context);
    return BlocBuilder<ProfileFormBloc, ProfileFormState>(
      buildWhen: (prev, curr) =>
          prev.lastName != curr.lastName ||
          prev.lastNameStatus != curr.lastNameStatus ||
          (prev is! ProfileFormEditingState &&
              curr is ProfileFormEditingState) ||
          (prev is ProfileFormEditingState && curr is! ProfileFormEditingState),
      builder: (context, state) {
        final isEditing =
            state is ProfileFormEditingState || state is ProfileFormSavingState;
        final errorText = _lastNameErrorText(strings, state.lastNameStatus);

        return TextFormField(
          initialValue: state.lastName,
          enabled: isEditing && state is! ProfileFormSavingState,
          onChanged: isEditing
              ? (v) => context.read<ProfileFormBloc>().add(
                  LastNameChangedEvent(value: v),
                )
              : null,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: strings.lastNameLabel,
            errorText: errorText,
          ),
        );
      },
    );
  }
}

class _PhoneField extends StatelessWidget {
  const _PhoneField();

  @override
  Widget build(BuildContext context) {
    final strings = Strings.of(context);
    return BlocBuilder<ProfileFormBloc, ProfileFormState>(
      buildWhen: (prev, curr) =>
          prev.phone != curr.phone ||
          prev.phoneStatus != curr.phoneStatus ||
          (prev is! ProfileFormEditingState &&
              curr is ProfileFormEditingState) ||
          (prev is ProfileFormEditingState && curr is! ProfileFormEditingState),
      builder: (context, state) {
        final isEditing =
            state is ProfileFormEditingState || state is ProfileFormSavingState;
        final errorText = _phoneErrorText(strings, state.phoneStatus);

        return TextFormField(
          initialValue: state.phone,
          enabled: isEditing && state is! ProfileFormSavingState,
          onChanged: isEditing
              ? (v) => context.read<ProfileFormBloc>().add(
                  PhoneChangedEvent(value: v),
                )
              : null,
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: strings.phoneLabel,
            hintText: strings.phoneHint,
            errorText: errorText,
          ),
        );
      },
    );
  }
}

class _ActionsRow extends StatelessWidget {
  const _ActionsRow();

  @override
  Widget build(BuildContext context) {
    final strings = Strings.of(context);
    return BlocBuilder<ProfileFormBloc, ProfileFormState>(
      buildWhen: (prev, curr) =>
          (prev is ProfileFormEditingState) !=
              (curr is ProfileFormEditingState) ||
          (prev is ProfileFormSavingState) !=
              (curr is ProfileFormSavingState) ||
          prev.isValid != curr.isValid,
      builder: (context, state) {
        final bloc = context.read<ProfileFormBloc>();
        final isEditing =
            state is ProfileFormEditingState || state is ProfileFormSavingState;
        final isSaving = state is ProfileFormSavingState;

        return Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: isEditing || isSaving
                    ? null
                    : () => bloc.add(const EditPressedEvent()),
                child: Text(strings.editAction),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed:
                    (state is ProfileFormEditingState &&
                        state.isValid &&
                        !isSaving)
                    ? () => bloc.add(const SavePressedEvent())
                    : null,
                child: isSaving
                    ? const SizedBox(
                        height: 18,
                        width: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text(strings.saveAction),
              ),
            ),
          ],
        );
      },
    );
  }
}

String? _firstNameErrorText(Strings strings, FirstNameInvalidStatus? s) =>
    switch (s) {
      FirstNameInvalidStatus.empty => strings.firstNameEmpty,
      FirstNameInvalidStatus.tooLong => strings.firstNameTooLong,
      FirstNameInvalidStatus.forbiddenChars => strings.firstNameForbiddenChars,
      null => null,
    };

String? _lastNameErrorText(Strings strings, LastNameInvalidStatus? s) =>
    switch (s) {
      LastNameInvalidStatus.empty => strings.lastNameEmpty,
      LastNameInvalidStatus.tooLong => strings.lastNameTooLong,
      LastNameInvalidStatus.forbiddenChars => strings.lastNameForbiddenChars,
      null => null,
    };

String? _phoneErrorText(Strings strings, PhoneInvalidStatus? s) => switch (s) {
  PhoneInvalidStatus.empty => strings.phoneEmpty,
  PhoneInvalidStatus.invalid => strings.phoneInvalid,
  null => null,
};

/// Picks an image from gallery with consistent parameters.
/// Returns the file path if an image was selected, null otherwise.
Future<String?> _pickAvatarImage() async {
  final picker = ImagePicker();
  final xfile = await picker.pickImage(
    source: ImageSource.gallery,
    maxWidth: 1024,
    imageQuality: 90,
  );
  return xfile?.path;
}
