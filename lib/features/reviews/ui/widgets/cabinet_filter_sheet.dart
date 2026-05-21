import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../l10n/l10n.dart';
import '../../../cabinets/domain/bloc/cabinets_bloc.dart';
import '../../../cabinets/domain/models/cabinet.dart';

class CabinetFilterSheet extends StatelessWidget {
  const CabinetFilterSheet({required this.selectedId, super.key});

  final String? selectedId;

  @override
  Widget build(BuildContext context) {
    final strings = Strings.of(context);
    final theme = Theme.of(context);

    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 8),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: theme.colorScheme.outlineVariant,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),
          BlocBuilder<CabinetsBloc, CabinetsState>(
            builder: (context, state) {
              final cabinets = state is CabinetsLoaded
                  ? state.cabinets
                  : <Cabinet>[];

              return ListView(
                shrinkWrap: true,
                children: [
                  _CabinetTile(
                    label: strings.reviewsFilterCabinetAll,
                    isSelected: selectedId == null,
                    onTap: () => Navigator.of(context).pop<String?>(),
                  ),
                  ...cabinets.map(
                    (c) => _CabinetTile(
                      label: c.name,
                      isSelected: selectedId == c.id,
                      onTap: () => Navigator.of(context).pop(c.id),
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _CabinetTile extends StatelessWidget {
  const _CabinetTile({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      title: Text(label),
      trailing: isSelected
          ? Icon(Icons.check, color: theme.colorScheme.primary)
          : null,
      onTap: onTap,
    );
  }
}
