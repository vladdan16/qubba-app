import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/navigation/navigation_ext.dart';
import '../../../common/ui/profile_app_bar_action.dart';
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
      centerTitle: true,
      actions: const [ProfileAppBarAction()],
    ),
    body: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 420),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FilledButton(
                onPressed: () => context.goToSales(),
                child: Text(Strings.of(context).salesTitle),
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: () =>
                    context.read<AuthBloc>().add(const AuthLogoutRequested()),
                child: Text(Strings.of(context).logOut),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
