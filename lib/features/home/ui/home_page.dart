import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../l10n/l10n.dart';
import '../../authentication/domain/bloc/auth_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(
        'Qubba App',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    ),
    body: Center(
      child: TextButton(
        onPressed: () =>
            context.read<AuthBloc>().add(const AuthLogoutRequested()),
        child: Text(Strings.of(context).logOut),
      ),
    ),
  );
}
