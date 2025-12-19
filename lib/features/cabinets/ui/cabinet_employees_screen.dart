import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/navigation/navigation_ext.dart';
import '../../../common/ui/profile_app_bar_action.dart';
import '../../../l10n/l10n.dart';
import '../domain/bloc/cabinet_employees_bloc.dart';
import '../domain/models/employee.dart';

class CabinetEmployeesScreen extends StatefulWidget {
  final String cabinetId;
  final String cabinetName;

  const CabinetEmployeesScreen({
    required this.cabinetId,
    required this.cabinetName,
    super.key,
  });

  @override
  State<CabinetEmployeesScreen> createState() => _CabinetEmployeesScreenState();
}

class _CabinetEmployeesScreenState extends State<CabinetEmployeesScreen> {
  // Track the last successful operation for showing success messages
  String? _lastSuccessOperation;

  @override
  void initState() {
    super.initState();
    context.read<CabinetEmployeesBloc>().add(
      LoadCabinetEmployees(cabinetId: widget.cabinetId),
    );
  }

  void _handleStateChange(BuildContext context, CabinetEmployeesState state) {
    final l10n = Strings.of(context);
    switch (state) {
      case CabinetEmployeesError(:final error):
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              l10n.cabinetEmployeesError(error.toString()),
            ),
            backgroundColor: Colors.red,
          ),
        );
      case CabinetEmployeesLoaded() when _lastSuccessOperation != null:
        // Show success message based on the last operation
        final message = _lastSuccessOperation == 'add'
            ? l10n.cabinetEmployeesAdded
            : l10n.cabinetEmployeesRemoved;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: Colors.green,
          ),
        );
        _lastSuccessOperation = null; // Reset after showing
      case CabinetEmployeesLoaded():
      case CabinetEmployeesInitial():
      case CabinetEmployeesLoading():
      // no-op
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = Strings.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            GestureDetector(
              onTap: () => context.goToHome(),
              child: const Icon(Icons.dashboard, size: 20),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                l10n.cabinetEmployeesTitle,
                overflow: .ellipsis,
              ),
            ),
          ],
        ),
        actions: const [
          ProfileAppBarAction(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddEmployeeDialog(context),
        tooltip: l10n.cabinetEmployeesAddButton,
        child: const Icon(Icons.person_add),
      ),
      body: Column(
        crossAxisAlignment: .start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  widget.cabinetName,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: .bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  l10n.cabinetEmployeesTitle,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: BlocConsumer<CabinetEmployeesBloc, CabinetEmployeesState>(
              listener: _handleStateChange,
              builder: (context, state) => switch (state) {
                CabinetEmployeesInitial() ||
                CabinetEmployeesLoading() => const Center(
                  child: CircularProgressIndicator(),
                ),
                CabinetEmployeesError(:final error) => Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: .center,
                      children: [
                        const Icon(
                          Icons.error_outline,
                          size: 48,
                          color: Colors.red,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          l10n.cabinetEmployeesError(error.toString()),
                          textAlign: .center,
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton.icon(
                          onPressed: () =>
                              context.read<CabinetEmployeesBloc>().add(
                                LoadCabinetEmployees(
                                  cabinetId: widget.cabinetId,
                                ),
                              ),
                          icon: const Icon(Icons.refresh),
                          label: Text(l10n.cabinetEmployeesRetry),
                        ),
                      ],
                    ),
                  ),
                ),
                CabinetEmployeesLoaded(:final employees) =>
                  employees.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: .center,
                            children: [
                              const Icon(
                                Icons.people_outline,
                                size: 48,
                                color: Colors.grey,
                              ),
                              const SizedBox(height: 16),
                              Text(l10n.cabinetEmployeesEmpty),
                              const SizedBox(height: 16),
                              ElevatedButton.icon(
                                onPressed: () =>
                                    _showAddEmployeeDialog(context),
                                icon: const Icon(Icons.person_add),
                                label: Text(l10n.cabinetEmployeesAddButton),
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.all(16),
                          itemCount: employees.length,
                          itemBuilder: (context, index) {
                            final employee = employees[index];
                            return _EmployeeCard(
                              employee: employee,
                              onDelete: () => _showDeleteConfirmDialog(
                                context,
                                employee,
                              ),
                            );
                          },
                        ),
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showAddEmployeeDialog(BuildContext context) async {
    final l10n = Strings.of(context);
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();

    await showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.cabinetEmployeesAddTitle),
        content: Form(
          key: formKey,
          child: TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: l10n.cabinetEmployeesEmailLabel,
              hintText: l10n.cabinetEmployeesEmailHint,
              border: const OutlineInputBorder(),
            ),
            keyboardType: .emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return l10n.cabinetEmployeesEmailEmpty;
              }
              // Use a regular expression for email validation
              final emailRegex = RegExp(
                r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z]{2,})+$",
              );
              if (!emailRegex.hasMatch(value)) {
                return l10n.cabinetEmployeesEmailInvalid;
              }
              return null;
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(l10n.cabinetEmployeesCancelAction),
          ),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                setState(() {
                  _lastSuccessOperation = 'add';
                });
                context.read<CabinetEmployeesBloc>().add(
                  AddCabinetEmployee(
                    cabinetId: widget.cabinetId,
                    email: emailController.text.trim(),
                  ),
                );
                Navigator.of(dialogContext).pop();
              }
            },
            child: Text(l10n.cabinetEmployeesAddAction),
          ),
        ],
      ),
    );
  }

  Future<void> _showDeleteConfirmDialog(
    BuildContext context,
    Employee employee,
  ) async {
    final l10n = Strings.of(context);

    await showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.cabinetEmployeesDeleteConfirmTitle),
        content: Text(
          l10n.cabinetEmployeesDeleteConfirmMessage(employee.name),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(l10n.cabinetEmployeesCancelAction),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _lastSuccessOperation = 'delete';
              });
              context.read<CabinetEmployeesBloc>().add(
                DeleteCabinetEmployee(
                  cabinetId: widget.cabinetId,
                  userId: employee.userId,
                ),
              );
              Navigator.of(dialogContext).pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: Text(l10n.cabinetEmployeesDeleteAction),
          ),
        ],
      ),
    );
  }
}

class _EmployeeCard extends StatelessWidget {
  final Employee employee;
  final VoidCallback onDelete;

  const _EmployeeCard({
    required this.employee,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) => Card(
    margin: const EdgeInsets.only(bottom: 12),
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    child: ListTile(
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).primaryColor.withAlpha(25),
        child: Icon(
          Icons.person,
          color: Theme.of(context).primaryColor,
        ),
      ),
      title: Text(
        employee.name,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: .w600,
        ),
      ),
      subtitle: Text(employee.email ?? 'empty email'),
      trailing: IconButton(
        icon: const Icon(Icons.delete, color: Colors.red),
        onPressed: onDelete,
      ),
    ),
  );
}
