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
                  _buildTextField(
                    label: l10n.cabinetFormNameLabel,
                    value: state.name,
                    onChanged: (value) =>
                        context.read<CabinetFormBloc>().add(NameChanged(value)),
                    errorText: state.nameError,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    label: l10n.cabinetFormOrganizationNameLabel,
                    value: state.organizationName,
                    onChanged: (value) => context.read<CabinetFormBloc>().add(
                      OrganizationNameChanged(value),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    label: l10n.cabinetFormOrganizationInnLabel,
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
                title: l10n.cabinetFormTaxesSection,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _buildNumberField(
                          label: l10n.cabinetFormTaxTypeLabel,
                          value: state.taxType?.toString(),
                          onChanged: (value) => context
                              .read<CabinetFormBloc>()
                              .add(TaxTypeChanged(int.tryParse(value))),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildNumberField(
                          label: l10n.cabinetFormTaxRateLabel,
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
                    label: l10n.cabinetFormNdsRateLabel,
                    value: state.ndsRate?.toString(),
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
                    _buildTextField(
                      label: l10n.cabinetFormApiKeyLabel,
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
                    _buildTextField(
                      label: l10n.cabinetFormOzonClientIdLabel,
                      value: state.ozonClientId,
                      onChanged: (value) => context.read<CabinetFormBloc>().add(
                        OzonClientIdChanged(value),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      label: l10n.cabinetFormApiKeyLabel,
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
    onChanged: onChanged,
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
