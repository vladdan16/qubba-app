import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../authentication/domain/bloc/auth_bloc.dart';

class CabinetsPage extends StatelessWidget {
  const CabinetsPage({super.key});

  // TODO(vladdan16): this is a fake page. Will implement later
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
        onPressed: () => context.read<AuthBloc>(),
        child: const Text('Log out'),
      ),
    ),
  );
}
