import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../l10n/l10n.dart';
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
    final l10n = Strings.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEditing ? l10n.cabinetFormEditTitle : l10n.cabinetFormNewTitle,
        ),
      ),
      body: BlocConsumer<CabinetFormBloc, CabinetFormState>(
        listener: (context, state) {
          if (state.saveSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(l10n.cabinetFormSaved)),
            );
            context.pop();
          }
          if (state.error case final error?) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(l10n.cabinetFormError(error))),
            );
          }
        },
        builder: (context, state) => SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildSection(
                title: l10n.cabinetFormBasicInfo,
                children: [
                  _TextInput(
                    label: l10n.cabinetFormNameLabel,
                    initialValue: state.name,
                    onChanged: (value) =>
                        context.read<CabinetFormBloc>().add(NameChanged(value)),
                    errorText: state.nameError,
                  ),
                  const SizedBox(height: 16),
                  _TextInput(
                    label: l10n.cabinetFormOrganizationNameLabel,
                    initialValue: state.organizationName,
                    onChanged: (value) => context.read<CabinetFormBloc>().add(
                      OrganizationNameChanged(value),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _TextInput(
                    label: l10n.cabinetFormOrganizationInnLabel,
                    initialValue: state.organizationInn,
                    onChanged: (value) => context.read<CabinetFormBloc>().add(
                      OrganizationInnChanged(value),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _buildSection(
                title: l10n.cabinetFormTaxesSection,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _NumberInput(
                          label: l10n.cabinetFormTaxTypeLabel,
                          initialValue: state.taxType?.toString(),
                          onChanged: (value) => context
                              .read<CabinetFormBloc>()
                              .add(TaxTypeChanged(int.tryParse(value))),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _NumberInput(
                          label: l10n.cabinetFormTaxRateLabel,
                          initialValue: state.taxRate?.toString(),
                          onChanged: (value) => context
                              .read<CabinetFormBloc>()
                              .add(TaxRateChanged(int.tryParse(value))),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _NumberInput(
                    label: l10n.cabinetFormNdsRateLabel,
                    initialValue: state.ndsRate?.toString(),
                    onChanged: (value) => context.read<CabinetFormBloc>().add(
                      NdsRateChanged(int.tryParse(value)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _buildSection(
                title: l10n.cabinetFormWbApiSection,
                children: [
                  SwitchListTile(
                    title: Text(l10n.cabinetFormActivateApi),
                    value: state.wbApiActive,
                    onChanged: (value) => context.read<CabinetFormBloc>().add(
                      WbApiActiveChanged(value),
                    ),
                    contentPadding: EdgeInsets.zero,
                  ),
                  if (state.wbApiActive) ...[
                    const SizedBox(height: 16),
                    _TextInput(
                      label: l10n.cabinetFormApiKeyLabel,
                      initialValue: state.wbApiKey,
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
                title: l10n.cabinetFormOzonApiSection,
                children: [
                  SwitchListTile(
                    title: Text(l10n.cabinetFormActivateApi),
                    value: state.ozonApiActive,
                    onChanged: (value) => context.read<CabinetFormBloc>().add(
                      OzonApiActiveChanged(value),
                    ),
                    contentPadding: EdgeInsets.zero,
                  ),
                  if (state.ozonApiActive) ...[
                    const SizedBox(height: 16),
                    _TextInput(
                      label: l10n.cabinetFormOzonClientIdLabel,
                      initialValue: state.ozonClientId,
                      onChanged: (value) => context.read<CabinetFormBloc>().add(
                        OzonClientIdChanged(value),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _TextInput(
                      label: l10n.cabinetFormApiKeyLabel,
                      initialValue: state.ozonApiKey,
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
                title: Text(l10n.cabinetFormIsActiveLabel),
                subtitle: Text(l10n.cabinetFormIsActiveSubtitle),
                value: state.isActive,
                onChanged: (value) =>
                    context.read<CabinetFormBloc>().add(IsActiveChanged(value)),
                contentPadding: EdgeInsets.zero,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: state.isValid && !state.isSaving
                    ? () => _saveCabinet(context, state, isEditing: isEditing)
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
                    : Text(
                        isEditing
                            ? l10n.cabinetFormSaveButton
                            : l10n.cabinetFormCreateButton,
                      ),
              ),
              const SizedBox(height: 16),
              if (isEditing) ...[
                ElevatedButton(
                  onPressed: !state.isSaving && state.id != null
                      ? () => _deleteCabinet(context, state.id!)
                      : null,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.tertiaryContainer,
                    foregroundColor: Theme.of(
                      context,
                    ).colorScheme.onTertiaryContainer,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.delete_forever),
                      Text(l10n.cabinetFormDelete),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],
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

  void _saveCabinet(
    BuildContext context,
    CabinetFormState state, {
    bool isEditing = true,
  }) {
    final cabinetsBloc = context.read<CabinetsBloc>();
    context.read<CabinetFormBloc>().add(
      SaveCabinet(
        onSuccess: (cabinet) => cabinetsBloc.add(
          isEditing
              ? UpdateCabinet(cabinet: cabinet)
              : CreateCabinet(cabinet: cabinet),
        ),
      ),
    );
  }

  void _deleteCabinet(BuildContext context, String cabinetId) {
    context.read<CabinetsBloc>().add(DeleteCabinet(cabinetId: cabinetId));
    Navigator.pop(context);
  }
}

class _TextInput extends StatefulWidget {
  const _TextInput({
    required this.label,
    this.initialValue,
    this.onChanged,
    this.errorText,
    this.keyboardType,
    this.obscureText = false,
  });

  final String label;
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final String? errorText;
  final TextInputType? keyboardType;
  final bool obscureText;

  @override
  State<_TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<_TextInput> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  Widget build(BuildContext context) => TextField(
    decoration: InputDecoration(
      labelText: widget.label,
      border: const OutlineInputBorder(),
      errorText: widget.errorText,
    ),
    keyboardType: widget.keyboardType,
    obscureText: widget.obscureText,
    controller: _controller,
    onChanged: widget.onChanged,
  );
}

class _NumberInput extends StatefulWidget {
  const _NumberInput({
    required this.label,
    this.initialValue,
    this.onChanged,
  });

  final String label;
  final String? initialValue;
  final ValueChanged<String>? onChanged;

  @override
  State<_NumberInput> createState() => _NumberInputState();
}

class _NumberInputState extends State<_NumberInput> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  Widget build(BuildContext context) => TextField(
    decoration: InputDecoration(
      labelText: widget.label,
      border: const OutlineInputBorder(),
    ),
    keyboardType: TextInputType.number,
    controller: _controller,
    onChanged: widget.onChanged,
  );
}
