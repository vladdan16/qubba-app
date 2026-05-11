import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../l10n/l10n.dart';
import '../../../cabinets/domain/bloc/cabinets_bloc.dart';
import '../../../cabinets/domain/models/cabinet.dart';
import '../../domain/bloc/reviews_bloc.dart';
import '../../domain/models/reviews_filter.dart';
import 'cabinet_filter_sheet.dart';

class ReviewFiltersBar extends StatelessWidget {
  const ReviewFiltersBar({required this.filter, super.key});

  final ReviewsFilter filter;

  Future<void> _onCabinetChipTap(BuildContext context) async {
    final result = await showModalBottomSheet<String?>(
      context: context,
      builder: (_) => BlocProvider.value(
        value: context.read<CabinetsBloc>(),
        child: CabinetFilterSheet(selectedId: filter.cabinetId),
      ),
    );

    if (!context.mounted) return;

    if (result != filter.cabinetId) {
      context.read<ReviewsBloc>().add(
        ReviewsFilterChanged(
          cabinetId: result,
          isAnswered: filter.isAnswered,
        ),
      );
    }
  }

  void _onAnsweredChanged(BuildContext context, bool? isAnswered) {
    if (isAnswered == filter.isAnswered) return;
    context.read<ReviewsBloc>().add(
      ReviewsFilterChanged(
        cabinetId: filter.cabinetId,
        isAnswered: isAnswered,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final strings = Strings.of(context);

    String cabinetLabel;
    if (filter.cabinetId == null) {
      cabinetLabel = strings.reviewsFilterCabinetAll;
    } else {
      final cabinets = context.select<CabinetsBloc, List<Cabinet>>(
        (b) => b.state is CabinetsLoaded
            ? (b.state as CabinetsLoaded).cabinets
            : [],
      );
      final cabinet = cabinets
          .where((c) => c.id == filter.cabinetId)
          .firstOrNull;
      cabinetLabel = cabinet != null
          ? strings.reviewsFilterCabinetSelect(cabinet.name)
          : strings.reviewsFilterCabinetAll;
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          ActionChip(
            avatar: const Icon(Icons.business, size: 16),
            label: Text(cabinetLabel),
            onPressed: () => _onCabinetChipTap(context),
          ),
          const SizedBox(width: 8),
          ChoiceChip(
            label: Text(strings.reviewsFilterAnsweredAll),
            selected: filter.isAnswered == null,
            onSelected: (_) => _onAnsweredChanged(context, null),
          ),
          const SizedBox(width: 8),
          ChoiceChip(
            label: Text(strings.reviewsFilterAnsweredYes),
            selected: filter.isAnswered ?? false,
            onSelected: (_) => _onAnsweredChanged(context, true),
          ),
          const SizedBox(width: 8),
          ChoiceChip(
            label: Text(strings.reviewsFilterAnsweredNo),
            selected: filter.isAnswered == false,
            onSelected: (_) => _onAnsweredChanged(context, false),
          ),
        ],
      ),
    );
  }
}
