import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../domain/bloc/cabinets_bloc.dart';
import '../domain/models/cabinet.dart';

class CabinetsListScreen extends StatefulWidget {
  const CabinetsListScreen({super.key});

  @override
  State<CabinetsListScreen> createState() => _CabinetsListScreenState();
}

class _CabinetsListScreenState extends State<CabinetsListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CabinetsBloc>().add(const LoadCabinets(limit: 1000));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Cabinets'),
    ),
    body: BlocBuilder<CabinetsBloc, CabinetsState>(
      builder: (context, state) => switch (state) {
        CabinetsInitial() || CabinetsLoading() => const Center(
          child: CircularProgressIndicator(),
        ),
        CabinetsError(:final error) => Center(
          child: Text('Error: $error'),
        ),
        CabinetsLoaded(:final cabinets) =>
          cabinets.isEmpty
              ? const Center(
                  child: Text('No cabinets found'),
                )
              : ListView.builder(
                  itemCount: cabinets.length,
                  itemBuilder: (context, index) {
                    final cabinet = cabinets[index];
                    return _CabinetListItem(
                      cabinet: cabinet,
                      onTap: () => context.push(
                        '/cabinets/edit/${cabinet.id}',
                        extra: cabinet,
                      ),
                    );
                  },
                ),
      },
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () => context.push('/cabinets/add'),
      child: const Icon(Icons.add),
    ),
  );
}

class _CabinetListItem extends StatelessWidget {
  final Cabinet cabinet;
  final VoidCallback onTap;

  const _CabinetListItem({
    required this.cabinet,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => Card(
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: ListTile(
      onTap: onTap,
      title: Text(
        cabinet.name,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (cabinet.description?.isNotEmpty ?? false) ...[
            const SizedBox(height: 4),
            Text(cabinet.description!),
          ],
          if (cabinet.address?.isNotEmpty ?? false) ...[
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.location_on, size: 16),
                const SizedBox(width: 4),
                Expanded(child: Text(cabinet.address!)),
              ],
            ),
          ],
          if (cabinet.phone?.isNotEmpty ?? false) ...[
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.phone, size: 16),
                const SizedBox(width: 4),
                Text(cabinet.phone!),
              ],
            ),
          ],
          if (cabinet.email?.isNotEmpty ?? false) ...[
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.email, size: 16),
                const SizedBox(width: 4),
                Text(cabinet.email!),
              ],
            ),
          ],
        ],
      ),
      trailing: const Icon(Icons.chevron_right),
    ),
  );
}
