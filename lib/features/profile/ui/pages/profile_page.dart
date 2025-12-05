import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/ui/profile_app_bar_action.dart';
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
          return Scaffold(
            appBar: AppBar(
              title: Text(strings.profileTitle),
              centerTitle: true,
              actions: const [ProfileAppBarAction()],
            ),
            body: const Center(child: CircularProgressIndicator()),
          );
        }

        if (state is ProfileFailureState) {
          return Scaffold(
            appBar: AppBar(
              title: Text(strings.profileTitle),
              centerTitle: true,
              actions: const [ProfileAppBarAction()],
            ),
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
                      onPressed: () => context.read<ProfileBloc>().load(),
                      child: Text(strings.profileRetry),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        final profile = state is ProfileReadyState ? state.profile : null;

        if (profile == null) {
          return Scaffold(
            appBar: AppBar(
              title: Text(strings.profileTitle),
              centerTitle: true,
              actions: const [ProfileAppBarAction()],
            ),
            body: const Center(child: CircularProgressIndicator()),
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
                }) => context.read<ProfileBloc>().updateProfile(
                  firstName: firstName,
                  lastName: lastName,
                  phone: phone,
                ),
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
                SnackBar(
                  content: Text(
                    strings.profileError(state.message),
                  ),
                ),
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
        appBar: AppBar(
          title: Text(strings.profileTitle),
          centerTitle: true,
          actions: const [ProfileAppBarAction()],
        ),
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
    onRefresh: () => context.read<ProfileBloc>().refresh(),
    child: const SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 12),
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
