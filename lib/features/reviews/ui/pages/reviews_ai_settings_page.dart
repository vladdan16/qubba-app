import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/user/user_scope.dart';
import '../../../../features/ai_models/domain/models/ai_model.dart';
import '../../../../l10n/l10n.dart';
import '../bloc/reviews_ai_settings_bloc.dart';
import '../widgets/ai_model_picker_sheet.dart';

class ReviewsAiSettingsPage extends StatelessWidget {
  const ReviewsAiSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final deps = UserScope.of(context);
    return BlocProvider<ReviewsAiSettingsBloc>(
      lazy: false,
      create: (_) => ReviewsAiSettingsBloc(
        settingsRepository: deps.userSettingsRepository,
        modelsRepository: deps.aiModelsRepository,
      )..add(const ReviewsAiSettingsLoadRequested()),
      child: const _ReviewsAiSettingsView(),
    );
  }
}

class _ReviewsAiSettingsView extends StatelessWidget {
  const _ReviewsAiSettingsView();

  @override
  Widget build(BuildContext context) {
    final strings = Strings.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.reviewsAiSettingsTitle),
        centerTitle: true,
      ),
      body: BlocConsumer<ReviewsAiSettingsBloc, ReviewsAiSettingsState>(
        listenWhen: (prev, curr) =>
            (!prev.saveSuccess && curr.saveSuccess) ||
            (prev.saveError != curr.saveError && curr.saveError != null),
        listener: (context, state) {
          final messenger = ScaffoldMessenger.of(context);
          if (state.saveSuccess) {
            messenger.showSnackBar(
              SnackBar(content: Text(strings.reviewsAiSettingsSaved)),
            );
            Navigator.of(context).pop();
          } else if (state.saveError case final error?) {
            messenger.showSnackBar(
              SnackBar(
                content: Text(strings.reviewsAiSettingsSaveError(error)),
              ),
            );
          }
        },
        builder: (context, state) {
          if (!state.isReady && !state.isFailure) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.isFailure) {
            return _ErrorBody(
              message: state.loadError ?? '',
              onRetry: () => context.read<ReviewsAiSettingsBloc>().add(
                const ReviewsAiSettingsLoadRequested(),
              ),
            );
          }

          return _SettingsForm(state: state);
        },
      ),
    );
  }
}

class _ErrorBody extends StatelessWidget {
  const _ErrorBody({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final strings = Strings.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              strings.reviewsAiSettingsLoadError(message),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: onRetry,
              child: Text(strings.reviewsAiSettingsRetry),
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsForm extends StatelessWidget {
  const _SettingsForm({required this.state});

  final ReviewsAiSettingsState state;

  @override
  Widget build(BuildContext context) {
    final strings = Strings.of(context);
    final bloc = context.read<ReviewsAiSettingsBloc>();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _PromptInput(
            initialValue: state.prompt,
            label: strings.reviewsAiSettingsPromptLabel,
            hint: strings.reviewsAiSettingsPromptHint,
            onChanged: (v) => bloc.add(ReviewsAiSettingsPromptChanged(v)),
            enabled: !state.isSaving,
          ),
          const SizedBox(height: 16),
          _ModelPickerField(
            selectedModel: state.selectedModel,
            models: state.models,
            label: strings.reviewsAiSettingsModelLabel,
            notSelectedLabel: strings.reviewsAiSettingsModelNotSelected,
            enabled: !state.isSaving,
            onSelected: (model) =>
                bloc.add(ReviewsAiSettingsModelSelected(model)),
          ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: (state.isValid && !state.isSaving)
                ? () => bloc.add(const ReviewsAiSettingsSavePressed())
                : null,
            child: state.isSaving
                ? const SizedBox(
                    height: 18,
                    width: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : Text(strings.reviewsAiSettingsSaveButton),
          ),
        ],
      ),
    );
  }
}

class _PromptInput extends StatefulWidget {
  const _PromptInput({
    required this.initialValue,
    required this.label,
    required this.hint,
    required this.onChanged,
    required this.enabled,
  });

  final String initialValue;
  final String label;
  final String hint;
  final ValueChanged<String> onChanged;
  final bool enabled;

  @override
  State<_PromptInput> createState() => _PromptInputState();
}

class _PromptInputState extends State<_PromptInput> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TextField(
    controller: _controller,
    enabled: widget.enabled,
    maxLines: null,
    minLines: 6,
    keyboardType: TextInputType.multiline,
    textInputAction: TextInputAction.newline,
    onChanged: widget.onChanged,
    decoration: InputDecoration(
      border: const OutlineInputBorder(),
      labelText: widget.label,
      hintText: widget.hint,
      alignLabelWithHint: true,
    ),
  );
}

class _ModelPickerField extends StatelessWidget {
  const _ModelPickerField({
    required this.selectedModel,
    required this.models,
    required this.label,
    required this.notSelectedLabel,
    required this.enabled,
    required this.onSelected,
  });

  final AiModel? selectedModel;
  final List<AiModel> models;
  final String label;
  final String notSelectedLabel;
  final bool enabled;
  final ValueChanged<AiModel> onSelected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: enabled
          ? () async {
              final picked = await showAiModelPickerSheet(
                context: context,
                models: models,
                selectedModel: selectedModel,
              );
              if (picked != null) onSelected(picked);
            }
          : null,
      borderRadius: BorderRadius.circular(4),
      child: InputDecorator(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
          suffixIcon: const Icon(Icons.arrow_drop_down),
        ),
        child: Text(
          selectedModel?.modelName ?? notSelectedLabel,
          style: textTheme.bodyLarge?.copyWith(
            color: selectedModel == null
                ? colorScheme.onSurfaceVariant
                : colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
