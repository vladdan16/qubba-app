import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../l10n/l10n.dart';
import '../../authentication/domain/bloc/auth_bloc.dart';
import '../../authentication/domain/bloc/auth_event.dart';
import '../../authentication/domain/bloc/auth_state.dart';
import 'bloc/login_form_bloc.dart';
import 'bloc/login_form_event.dart';
import 'bloc/login_form_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider<LoginFormBloc>(
    create: (_) => LoginFormBloc(),
    child: const _LoginView(),
  );
}

class _LoginView extends StatelessWidget {
  const _LoginView();

  @override
  Widget build(BuildContext context) {
    final strings = Strings.of(context);
    return MultiBlocListener(
      listeners: [
        BlocListener<LoginFormBloc, LoginFormState>(
          listenWhen: (prev, curr) =>
              prev is! LoginFormSubmitted && curr is LoginFormSubmitted,
          listener: (context, state) {
            if (state case LoginFormSubmitted(:final email, :final password)) {
              FocusScope.of(context).unfocus();
              context.read<AuthBloc>().add(
                AuthLoginRequestedEvent(email: email, password: password),
              );
            }
          },
        ),
        BlocListener<AuthBloc, AuthState>(
          listener: (context, authState) async {
            if (authState is AuthLoading) {
              _showLoading(context);
              return;
            } else {
              _hideLoading(context);
            }
            if (authState is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(authState.message)),
              );
              return;
            }
            if (authState is AuthAuthenticated) {
              if (!context.mounted) return;
              await showModalBottomSheet<void>(
                context: context,
                isScrollControlled: true,
                builder: (_) => _TokensSheet(
                  accessToken: authState.tokens.accessToken,
                  refreshToken: authState.tokens.refreshToken,
                ),
              );
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(strings.loginTitle),
          centerTitle: true,
        ),
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 24),
                    Text(
                      strings.welcomeTitle,
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    const _EmailField(),
                    const SizedBox(height: 16),
                    const _PasswordField(),
                    const SizedBox(height: 24),
                    const _SubmitButton(),
                    const SizedBox(height: 12),
                    TextButton(
                      onPressed: () {},
                      child: Text(strings.forgotPasswordAction),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField();

  @override
  Widget build(BuildContext context) {
    final strings = Strings.of(context);
    return BlocBuilder<LoginFormBloc, LoginFormState>(
      buildWhen: (prev, curr) =>
          prev.email != curr.email || prev.emailStatus != curr.emailStatus,
      builder: (context, state) {
        final bloc = context.read<LoginFormBloc>();
        final errorText = _emailErrorText(state.emailStatus, strings);
        return TextField(
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          autofillHints: const [AutofillHints.username, AutofillHints.email],
          decoration: InputDecoration(
            labelText: strings.emailLabel,
            hintText: strings.emailHint,
            errorText: errorText,
          ),
          onChanged: (v) => bloc.add(EmailChangedEvent(value: v)),
        );
      },
    );
  }
}

class _PasswordField extends StatefulWidget {
  const _PasswordField();

  @override
  State<_PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<_PasswordField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    final strings = Strings.of(context);
    return BlocBuilder<LoginFormBloc, LoginFormState>(
      buildWhen: (prev, curr) =>
          prev.password != curr.password ||
          prev.passwordStatus != curr.passwordStatus,
      builder: (context, state) {
        final bloc = context.read<LoginFormBloc>();
        final errorText = _passwordErrorText(state.passwordStatus, strings);
        return TextField(
          obscureText: _obscure,
          textInputAction: TextInputAction.done,
          autofillHints: const [AutofillHints.password],
          enableSuggestions: false,
          autocorrect: false,
          decoration: InputDecoration(
            labelText: strings.passwordLabel,
            errorText: errorText,
            suffixIcon: IconButton(
              onPressed: () => setState(() => _obscure = !_obscure),
              icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
              tooltip: _obscure
                  ? strings.showPasswordTooltip
                  : strings.hidePasswordTooltip,
            ),
          ),
          onChanged: (v) => bloc.add(PasswordChangedEvent(value: v)),
          onSubmitted: (_) =>
              context.read<LoginFormBloc>().add(const SubmitPressedEvent()),
        );
      },
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    final strings = Strings.of(context);
    return BlocBuilder<LoginFormBloc, LoginFormState>(
      buildWhen: (prev, curr) => prev.canSubmit != curr.canSubmit,
      builder: (context, state) => FilledButton(
        onPressed: state.canSubmit
            ? () =>
                  context.read<LoginFormBloc>().add(const SubmitPressedEvent())
            : null,
        child: Text(strings.loginAction),
      ),
    );
  }
}

String? _emailErrorText(EmailInvalidStatus? status, Strings s) {
  switch (status) {
    case EmailInvalidStatus.empty:
      return s.emailEmpty;
    case EmailInvalidStatus.invalid:
      return s.emailInvalid;
    case null:
      return null;
  }
}

String? _passwordErrorText(PasswordInvalidStatus? status, Strings s) {
  switch (status) {
    case PasswordInvalidStatus.empty:
      return s.passwordEmpty;
    case PasswordInvalidStatus.tooShort:
      return s.passwordTooShort(LoginFormBloc.minLen);
    case PasswordInvalidStatus.needLetter:
      return s.passwordNeedLetter;
    case PasswordInvalidStatus.needDigit:
      return s.passwordNeedDigit;
    case null:
      return null;
  }
}

class _TokensSheet extends StatelessWidget {
  const _TokensSheet({
    required this.accessToken,
    required this.refreshToken,
  });

  final String accessToken;
  final String refreshToken;

  @override
  Widget build(BuildContext context) => SafeArea(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Tokens',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          const Text('accessToken'),
          SelectableText(accessToken),
          const SizedBox(height: 12),
          const Text('refreshToken'),
          SelectableText(refreshToken),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    ),
  );
}

void _showLoading(BuildContext context) {
  unawaited(
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    ),
  );
}

void _hideLoading(BuildContext context) {
  final navigator = Navigator.of(context, rootNavigator: true);
  if (navigator.canPop()) {
    navigator.pop();
  }
}
