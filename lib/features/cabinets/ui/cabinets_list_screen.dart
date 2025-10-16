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
      title: const Row(
        children: [
          Icon(Icons.dashboard, size: 20),
          SizedBox(width: 8),
          Text('Кабинеты'),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () => context.push('/cabinets/add'),
          icon: const Icon(Icons.add),
          tooltip: 'Новый',
        ),
      ],
    ),
    body: BlocBuilder<CabinetsBloc, CabinetsState>(
      builder: (context, state) => switch (state) {
        CabinetsInitial() || CabinetsLoading() => const Center(
          child: CircularProgressIndicator(),
        ),
        CabinetsError(:final error) => Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 48, color: Colors.red),
                const SizedBox(height: 16),
                Text(
                  'Ошибка: $error',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () => context.read<CabinetsBloc>().add(
                    const LoadCabinets(limit: 1000),
                  ),
                  icon: const Icon(Icons.refresh),
                  label: const Text('Повторить'),
                ),
              ],
            ),
          ),
        ),
        CabinetsLoaded(:final cabinets) =>
          cabinets.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.inbox, size: 48, color: Colors.grey),
                      const SizedBox(height: 16),
                      const Text('Нет кабинетов'),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: () => context.push('/cabinets/add'),
                        icon: const Icon(Icons.add),
                        label: const Text('Добавить кабинет'),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: cabinets.length,
                  itemBuilder: (context, index) {
                    final cabinet = cabinets[index];
                    return _CabinetCard(
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
  );
}

class _CabinetCard extends StatelessWidget {
  final Cabinet cabinet;
  final VoidCallback onTap;

  const _CabinetCard({
    required this.cabinet,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => Card(
    margin: const EdgeInsets.only(bottom: 12),
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    cabinet.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert, size: 20),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: onTap,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                // Active status indicator
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: (cabinet.isActive ?? true)
                        ? Colors.green.shade50
                        : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.circle,
                        size: 8,
                        color: (cabinet.isActive ?? true)
                            ? Colors.green
                            : Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        (cabinet.isActive ?? true) ? 'Активен' : 'Неактивен',
                        style: TextStyle(
                          fontSize: 12,
                          color: (cabinet.isActive ?? true)
                              ? Colors.green.shade700
                              : Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                // Marketplace badges
                Row(
                  children: [
                    if (cabinet.wbApiActive ?? false)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFCB11AB),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'wb',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    if (cabinet.wbApiActive ?? false) const SizedBox(width: 4),
                    if (cabinet.ozonApiActive ?? false)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF005BFF),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'ozon',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
