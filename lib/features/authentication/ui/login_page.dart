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

class _LoginView extends StatefulWidget {
  const _LoginView();

  @override
  State<_LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<_LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  static const int _minPasswordLength = 8;
  static final RegExp _unicodeLetter = RegExp(r'\p{L}', unicode: true);
  static final RegExp _unicodeDigit = RegExp(r'\p{N}', unicode: true);
  static final RegExp _emailRegExp = RegExp(
    r'^[\p{L}\p{N}._%+\-]+@(?:[\p{L}\p{N}](?:[\p{L}\p{N}\-]{0,61}[\p{L}\p{N}])?\.)+[\p{L}]{2,}$',
    unicode: true,
    caseSensitive: false,
  );

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<LoginFormBloc, LoginFormState>(
        builder: (context, state) {
          final bloc = context.read<LoginFormBloc>();
          final strings = Strings.of(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(strings!.loginTitle),
              centerTitle: true,
            ),
            body: SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) => Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 420),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: SingleChildScrollView(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: Form(
                          key: _formKey,
                          autovalidateMode: state.autovalidateMode,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const SizedBox(height: 24),
                              Text(
                                strings.welcomeTitle,
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineSmall,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 24),
                              TextFormField(
                                controller: _emailCtrl,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  labelText: strings.emailLabel,
                                  hintText: strings.emailHint,
                                ),
                                onChanged: (v) => bloc.add(
                                  LoginFormEvent.emailChanged(value: v),
                                ),
                                validator: (value) =>
                                    _validateEmail(value, strings),
                              ),
                              const SizedBox(height: 16),
                              TextFormField(
                                controller: _passwordCtrl,
                                obscureText: state.obscurePassword,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                  labelText: strings.passwordLabel,
                                  suffixIcon: IconButton(
                                    onPressed: () => bloc.add(
                                      const LoginFormEvent.toggleObscure(),
                                    ),
                                    icon: Icon(
                                      state.obscurePassword
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                    tooltip: state.obscurePassword
                                        ? strings.showPasswordTooltip
                                        : strings.hidePasswordTooltip,
                                  ),
                                ),
                                onChanged: (v) => bloc.add(
                                  LoginFormEvent.passwordChanged(value: v),
                                ),
                                onFieldSubmitted: (_) => _onSubmit(context),
                                validator: (value) =>
                                    _validatePassword(value, strings),
                              ),
                              const SizedBox(height: 24),
                              FilledButton(
                                onPressed: () => _onSubmit(context),
                                child: Text(strings.loginAction),
                              ),
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
              ),
            ),
          );
        },
      );

  String? _validateEmail(String? value, Strings strings) {
    final v = (value ?? '').trim();
    if (v.isEmpty) return strings.emailEmpty;
    if (!_emailRegExp.hasMatch(v)) return strings.emailInvalid;
    return null;
  }

  String? _validatePassword(String? value, Strings strings) {
    final v = value ?? '';
    if (v.isEmpty) return strings.passwordEmpty;
    if (v.length < _minPasswordLength) {
      return strings.passwordTooShort(_minPasswordLength);
    }
    final hasLetter = _unicodeLetter.hasMatch(v);
    final hasDigit = _unicodeDigit.hasMatch(v);
    if (!hasLetter) return strings.passwordNeedLetter;
    if (!hasDigit) return strings.passwordNeedDigit;
    return null;
  }

  void _onSubmit(BuildContext context) {
    final bloc = context.read<LoginFormBloc>().add(
      const LoginFormEvent.submitPressed(),
    );
    final valid = _formKey.currentState?.validate() ?? false;
    if (!valid) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(Strings.of(context)!.formValidSnack)),
    );
  }
}
