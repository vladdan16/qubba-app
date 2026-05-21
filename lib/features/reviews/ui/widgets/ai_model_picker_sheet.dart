import 'package:flutter/material.dart';

import '../../../../features/ai_models/domain/models/ai_model.dart';
import '../../../../l10n/l10n.dart';

Future<AiModel?> showAiModelPickerSheet({
  required BuildContext context,
  required List<AiModel> models,
  AiModel? selectedModel,
}) => showModalBottomSheet<AiModel>(
  context: context,
  isScrollControlled: true,
  builder: (_) => _AiModelPickerSheet(
    models: models,
    selectedModel: selectedModel,
  ),
);

class _AiModelPickerSheet extends StatelessWidget {
  const _AiModelPickerSheet({required this.models, this.selectedModel});

  final List<AiModel> models;
  final AiModel? selectedModel;

  @override
  Widget build(BuildContext context) {
    final strings = Strings.of(context);

    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
            child: Text(
              strings.reviewsAiSettingsModelLabel,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const Divider(height: 1),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.6,
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: models.length,
              itemBuilder: (context, index) {
                final model = models[index];
                final isSelected = model == selectedModel;
                return ListTile(
                  title: Text(model.modelName),
                  subtitle: Text(model.providerName),
                  trailing: isSelected
                      ? Icon(
                          Icons.check,
                          color: Theme.of(context).colorScheme.primary,
                        )
                      : null,
                  onTap: () => Navigator.of(context).pop(model),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
