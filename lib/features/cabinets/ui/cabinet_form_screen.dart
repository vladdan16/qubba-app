import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../domain/bloc/cabinets_bloc.dart';
import '../domain/models/cabinet.dart';
import 'bloc/cabinet_form_bloc.dart';

class CabinetFormScreen extends StatelessWidget {
  final Cabinet? cabinet;

  const CabinetFormScreen({
    super.key,
    this.cabinet,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CabinetFormBloc(
        initialName: cabinet?.name,
        initialDescription: cabinet?.description,
        initialAddress: cabinet?.address,
        initialPhone: cabinet?.phone,
        initialEmail: cabinet?.email,
      ),
      child: _CabinetFormView(cabinet: cabinet),
    );
  }
}

class _CabinetFormView extends StatelessWidget {
  final Cabinet? cabinet;

  const _CabinetFormView({this.cabinet});

  @override
  Widget build(BuildContext context) {
    final isEditing = cabinet != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Cabinet' : 'Add Cabinet'),
      ),
      body: BlocBuilder<CabinetFormBloc, CabinetFormState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Name *',
                    border: OutlineInputBorder(),
                  ),
                  controller: TextEditingController(text: state.name),
                  onChanged: (value) => context
                      .read<CabinetFormBloc>()
                      .add(NameChanged(value)),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                  controller: TextEditingController(text: state.description),
                  onChanged: (value) => context
                      .read<CabinetFormBloc>()
                      .add(DescriptionChanged(value)),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Address',
                    border: OutlineInputBorder(),
                  ),
                  controller: TextEditingController(text: state.address),
                  onChanged: (value) => context
                      .read<CabinetFormBloc>()
                      .add(AddressChanged(value)),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Phone',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                  controller: TextEditingController(text: state.phone),
                  onChanged: (value) => context
                      .read<CabinetFormBloc>()
                      .add(PhoneChanged(value)),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  controller: TextEditingController(text: state.email),
                  onChanged: (value) => context
                      .read<CabinetFormBloc>()
                      .add(EmailChanged(value)),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: state.isValid
                      ? () => _saveCabinet(context, state)
                      : null,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(isEditing ? 'Save Changes' : 'Add Cabinet'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _saveCabinet(BuildContext context, CabinetFormState state) {
    final updatedCabinet = Cabinet(
      id: cabinet?.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
      name: state.name,
      description: state.description.isEmpty ? null : state.description,
      address: state.address.isEmpty ? null : state.address,
      phone: state.phone.isEmpty ? null : state.phone,
      email: state.email.isEmpty ? null : state.email,
      createdAt: cabinet?.createdAt,
      updatedAt: DateTime.now(),
    );

    context.read<CabinetsBloc>().add(UpdateCabinet(cabinet: updatedCabinet));
    context.pop();
  }
}
