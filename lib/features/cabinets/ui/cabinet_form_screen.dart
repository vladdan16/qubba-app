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
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => CabinetFormBloc(
      initialCabinet: cabinet,
    ),
    child: _CabinetFormView(cabinet: cabinet),
  );
}

class _CabinetFormView extends StatelessWidget {
  final Cabinet? cabinet;

  const _CabinetFormView({this.cabinet});

  @override
  Widget build(BuildContext context) {
    final isEditing = cabinet != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Редактировать кабинет' : 'Новый кабинет'),
      ),
      body: BlocConsumer<CabinetFormBloc, CabinetFormState>(
        listener: (context, state) {
          if (state.saveSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Кабинет сохранен')),
            );
            context.pop();
          }
          if (state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Ошибка: ${state.error}')),
            );
          }
        },
        builder: (context, state) => SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildSection(
                title: 'Основная информация',
                children: [
                  _buildTextField(
                    label: 'Название *',
                    value: state.name,
                    onChanged: (value) =>
                        context.read<CabinetFormBloc>().add(NameChanged(value)),
                    errorText: state.nameError,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    label: 'Название организации',
                    value: state.organizationName,
                    onChanged: (value) => context.read<CabinetFormBloc>().add(
                      OrganizationNameChanged(value),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    label: 'ИНН организации',
                    value: state.organizationInn,
                    onChanged: (value) => context.read<CabinetFormBloc>().add(
                      OrganizationInnChanged(value),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _buildSection(
                title: 'Налоги и сборы',
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _buildNumberField(
                          label: 'Тип налога *',
                          value: state.taxType?.toString(),
                          onChanged: (value) => context
                              .read<CabinetFormBloc>()
                              .add(TaxTypeChanged(int.tryParse(value))),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildNumberField(
                          label: 'Ставка налога *',
                          value: state.taxRate?.toString(),
                          onChanged: (value) => context
                              .read<CabinetFormBloc>()
                              .add(TaxRateChanged(int.tryParse(value))),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildNumberField(
                    label: 'Ставка НДС *',
                    value: state.ndsRate?.toString(),
                    onChanged: (value) => context.read<CabinetFormBloc>().add(
                      NdsRateChanged(int.tryParse(value)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _buildSection(
                title: 'Wildberries API',
                children: [
                  SwitchListTile(
                    title: const Text('Активировать API'),
                    value: state.wbApiActive,
                    onChanged: (value) => context.read<CabinetFormBloc>().add(
                      WbApiActiveChanged(value),
                    ),
                    contentPadding: EdgeInsets.zero,
                  ),
                  if (state.wbApiActive) ...[
                    const SizedBox(height: 16),
                    _buildTextField(
                      label: 'API ключ',
                      value: state.wbApiKey,
                      onChanged: (value) => context.read<CabinetFormBloc>().add(
                        WbApiKeyChanged(value),
                      ),
                      obscureText: true,
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 24),
              _buildSection(
                title: 'Ozon API',
                children: [
                  SwitchListTile(
                    title: const Text('Активировать API'),
                    value: state.ozonApiActive,
                    onChanged: (value) => context.read<CabinetFormBloc>().add(
                      OzonApiActiveChanged(value),
                    ),
                    contentPadding: EdgeInsets.zero,
                  ),
                  if (state.ozonApiActive) ...[
                    const SizedBox(height: 16),
                    _buildTextField(
                      label: 'Client ID',
                      value: state.ozonClientId,
                      onChanged: (value) => context.read<CabinetFormBloc>().add(
                        OzonClientIdChanged(value),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      label: 'API ключ',
                      value: state.ozonApiKey,
                      onChanged: (value) => context.read<CabinetFormBloc>().add(
                        OzonApiKeyChanged(value),
                      ),
                      obscureText: true,
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 24),
              SwitchListTile(
                title: const Text('Активен'),
                subtitle: const Text('Кабинет доступен для работы'),
                value: state.isActive,
                onChanged: (value) =>
                    context.read<CabinetFormBloc>().add(IsActiveChanged(value)),
                contentPadding: EdgeInsets.zero,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: state.isValid && !state.isSaving
                    ? () => _saveCabinet(context, state)
                    : null,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                ),
                child: state.isSaving
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        ),
                      )
                    : Text(isEditing ? 'Сохранить' : 'Создать'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<Widget> children,
  }) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(height: 12),
      ...children,
    ],
  );

  Widget _buildTextField({
    required String label,
    required String? value,
    required ValueChanged<String> onChanged,
    String? errorText,
    TextInputType? keyboardType,
    bool obscureText = false,
  }) => TextField(
    decoration: InputDecoration(
      labelText: label,
      border: const OutlineInputBorder(),
      errorText: errorText,
    ),
    keyboardType: keyboardType,
    obscureText: obscureText,
    controller: TextEditingController(text: value)
      ..selection = TextSelection.collapsed(offset: value?.length ?? 0),
    onChanged: onChanged,
  );

  Widget _buildNumberField({
    required String label,
    required String? value,
    required ValueChanged<String> onChanged,
  }) => TextField(
    decoration: InputDecoration(
      labelText: label,
      border: const OutlineInputBorder(),
    ),
    keyboardType: TextInputType.number,
    controller: TextEditingController(text: value ?? '')
      ..selection = TextSelection.collapsed(offset: value?.length ?? 0),
    onChanged: onChanged,
  );

  void _saveCabinet(BuildContext context, CabinetFormState state) {
    context.read<CabinetFormBloc>().add(
      SaveCabinet(
        onSuccess: (cabinet) {
          context.read<CabinetsBloc>().add(UpdateCabinet(cabinet: cabinet));
        },
      ),
    );
  }
}
