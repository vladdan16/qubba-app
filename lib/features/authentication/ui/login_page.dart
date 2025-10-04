import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../l10n/l10n.dart';
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
    final strings = Strings.of(context)!;
    return BlocListener<LoginFormBloc, LoginFormState>(
      listenWhen: (prev, curr) =>
          curr.maybeWhen(submitted: (_, _) => true, orElse: () => false),
      listener: (context, state) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(strings.formValidSnack)));
      },
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
                padding: EdgeInsets.only(
                  bottom: MediaQuery.viewInsetsOf(context).bottom,
                ),
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
    final strings = Strings.of(context)!;
    return BlocBuilder<LoginFormBloc, LoginFormState>(
      buildWhen: (prev, curr) =>
          _emailOf(prev) != _emailOf(curr) ||
          _emailStatusOf(prev) != _emailStatusOf(curr),
      builder: (context, state) {
        final bloc = context.read<LoginFormBloc>();
        final errorText = _mapEmailError(state, strings);
        return TextField(
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          autofillHints: const [AutofillHints.username, AutofillHints.email],
          decoration: InputDecoration(
            labelText: strings.emailLabel,
            hintText: strings.emailHint,
            errorText: errorText,
          ),
          onChanged: (v) => bloc.add(EmailChanged(value: v)),
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
    final strings = Strings.of(context)!;
    return BlocBuilder<LoginFormBloc, LoginFormState>(
      buildWhen: (prev, curr) =>
          _passwordOf(prev) != _passwordOf(curr) ||
          _passwordStatusOf(prev) != _passwordStatusOf(curr),
      builder: (context, state) {
        final bloc = context.read<LoginFormBloc>();
        final errorText = _mapPasswordError(state, strings);
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
          onChanged: (v) => bloc.add(PasswordChanged(value: v)),
          onSubmitted: (_) =>
              context.read<LoginFormBloc>().add(const SubmitPressed()),
        );
      },
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    final strings = Strings.of(context)!;
    return BlocBuilder<LoginFormBloc, LoginFormState>(
      buildWhen: (prev, curr) => _canSubmit(prev) != _canSubmit(curr),
      builder: (context, state) {
        final enabled = _canSubmit(state);
        return FilledButton(
          onPressed: enabled
              ? () => context.read<LoginFormBloc>().add(const SubmitPressed())
              : null,
          child: Text(strings.loginAction),
        );
      },
    );
  }
}

bool _canSubmit(LoginFormState s) => s.maybeWhen(
  success: (_, _) => true,
  submitted: (_, _) => true,
  orElse: () => false,
);

String _emailOf(LoginFormState s) => s.map(
  initial: (v) => v.email,
  success: (v) => v.email,
  failure: (v) => v.email,
  submitted: (v) => v.email,
);

String _passwordOf(LoginFormState s) => s.map(
  initial: (v) => v.password,
  success: (v) => v.password,
  failure: (v) => v.password,
  submitted: (v) => v.password,
);

EmailInvalidStatus? _emailStatusOf(LoginFormState s) => s.maybeWhen(
  failure: (_, _, emailStatus, _) => emailStatus,
  orElse: () => null,
);

PasswordInvalidStatus? _passwordStatusOf(LoginFormState s) => s.maybeWhen(
  failure: (_, _, _, passwordStatus) => passwordStatus,
  orElse: () => null,
);

String? _mapEmailError(LoginFormState state, Strings s) => state.maybeWhen(
  failure: (_, _, emailStatus, _) {
    switch (emailStatus) {
      case EmailInvalidStatus.empty:
        return s.emailEmpty;
      case EmailInvalidStatus.invalid:
        return s.emailInvalid;
      case null:
        return null;
    }
  },
  orElse: () => null,
);

String? _mapPasswordError(LoginFormState state, Strings s) => state.maybeWhen(
  failure: (_, _, _, passwordStatus) {
    switch (passwordStatus) {
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
  },
  orElse: () => null,
);
