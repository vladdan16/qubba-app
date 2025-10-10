import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/app/app_scope.dart';
import '../../../l10n/l10n.dart';
import 'bloc/login_form_bloc.dart';
import 'bloc/login_form_event.dart';
import 'bloc/login_form_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider<LoginFormBloc>(
    create: (context) => LoginFormBloc(AppScope.of(context).authRepository),
    child: const _LoginView(),
  );
}

class _LoginView extends StatelessWidget {
  const _LoginView();

  @override
  Widget build(BuildContext context) {
    final strings = Strings.of(context);
    return BlocListener<LoginFormBloc, LoginFormState>(
      listenWhen: (prev, curr) => curr is LoginFormFailure,
      listener: (context, state) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(Strings.of(context).loginFailure)),
      ),
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
      builder: (context, state) => FilledButton(
        onPressed: state.isValid
            ? () =>
                  context.read<LoginFormBloc>().add(const SubmitPressedEvent())
            : null,
        child: state is LoginFormLoading
            ? const CircularProgressIndicator()
            : Text(strings.loginAction),
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
