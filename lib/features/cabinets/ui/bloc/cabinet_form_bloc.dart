import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/models/cabinet.dart';

part 'cabinet_form_event.dart';

part 'cabinet_form_state.dart';

final class CabinetFormBloc extends Bloc<CabinetFormEvent, CabinetFormState> {
  final Cabinet? _initialCabinet;

  CabinetFormBloc({
    Cabinet? initialCabinet,
  }) : _initialCabinet = initialCabinet,
       super(
         CabinetFormState(
           id: initialCabinet?.id,
           name: initialCabinet?.name ?? '',
           organizationName: initialCabinet?.organizationName,
           organizationInn: initialCabinet?.organizationInn,
           legalType: initialCabinet?.legalType?.toString() ?? '',
           taxType: initialCabinet?.taxType?.toString() ?? '',
           taxRate: initialCabinet?.taxRate?.toString() ?? '',
           ndsRate: initialCabinet?.ndsRate?.toString() ?? '',
           taxType2024: initialCabinet?.taxType2024?.toString() ?? '',
           taxRate2024: initialCabinet?.taxRate2024?.toString() ?? '',
           unitMaintenanceCost:
               initialCabinet?.unitMaintenanceCost?.toString() ?? '',
           wbApiActive: initialCabinet?.wbApiActive ?? false,
           wbApiKey: initialCabinet?.wbApiKey,
           ozonApiActive: initialCabinet?.ozonApiActive ?? false,
           ozonClientId: initialCabinet?.ozonClientId,
           ozonApiKey: initialCabinet?.ozonApiKey,
           ozonPerformanceClientId: initialCabinet?.ozonPerformanceClientId,
           ozonPerformanceClientSecret:
               initialCabinet?.ozonPerformanceClientSecret,
           isActive: initialCabinet?.isActive ?? true,
         ),
       ) {
    on<NameChanged>(_onNameChanged);
    on<OrganizationNameChanged>(_onOrganizationNameChanged);
    on<OrganizationInnChanged>(_onOrganizationInnChanged);
    on<LegalTypeChanged>(_onLegalTypeChanged);
    on<TaxTypeChanged>(_onTaxTypeChanged);
    on<TaxRateChanged>(_onTaxRateChanged);
    on<NdsRateChanged>(_onNdsRateChanged);
    on<TaxType2024Changed>(_onTaxType2024Changed);
    on<TaxRate2024Changed>(_onTaxRate2024Changed);
    on<UnitMaintenanceCostChanged>(_onUnitMaintenanceCostChanged);
    on<WbApiActiveChanged>(_onWbApiActiveChanged);
    on<WbApiKeyChanged>(_onWbApiKeyChanged);
    on<OzonApiActiveChanged>(_onOzonApiActiveChanged);
    on<OzonClientIdChanged>(_onOzonClientIdChanged);
    on<OzonApiKeyChanged>(_onOzonApiKeyChanged);
    on<OzonPerformanceClientIdChanged>(_onOzonPerformanceClientIdChanged);
    on<OzonPerformanceClientSecretChanged>(
      _onOzonPerformanceClientSecretChanged,
    );
    on<IsActiveChanged>(_onIsActiveChanged);
    on<SaveCabinet>(_onSaveCabinet);
  }

  void _onNameChanged(NameChanged event, Emitter<CabinetFormState> emit) {
    final nameStatus = _validateName(event.value);
    emit(state.copyWith(name: event.value, nameStatus: nameStatus));
  }

  void _onOrganizationNameChanged(
    OrganizationNameChanged event,
    Emitter<CabinetFormState> emit,
  ) {
    emit(state.copyWith(organizationName: event.value));
  }

  void _onOrganizationInnChanged(
    OrganizationInnChanged event,
    Emitter<CabinetFormState> emit,
  ) {
    emit(state.copyWith(organizationInn: event.value));
  }

  void _onLegalTypeChanged(
    LegalTypeChanged event,
    Emitter<CabinetFormState> emit,
  ) {
    final legalTypeStatus = _validateRequiredInt(event.value);
    emit(
      state.copyWith(legalType: event.value, legalTypeStatus: legalTypeStatus),
    );
  }

  void _onTaxTypeChanged(
    TaxTypeChanged event,
    Emitter<CabinetFormState> emit,
  ) {
    final taxTypeStatus = _validateRequiredInt(event.value);
    emit(state.copyWith(taxType: event.value, taxTypeStatus: taxTypeStatus));
  }

  void _onTaxRateChanged(
    TaxRateChanged event,
    Emitter<CabinetFormState> emit,
  ) {
    final taxRateStatus = _validateRequiredInt(event.value);
    emit(state.copyWith(taxRate: event.value, taxRateStatus: taxRateStatus));
  }

  void _onNdsRateChanged(
    NdsRateChanged event,
    Emitter<CabinetFormState> emit,
  ) {
    final ndsRateStatus = _validateRequiredInt(event.value);
    emit(state.copyWith(ndsRate: event.value, ndsRateStatus: ndsRateStatus));
  }

  void _onTaxType2024Changed(
    TaxType2024Changed event,
    Emitter<CabinetFormState> emit,
  ) {
    final taxType2024Status = _validateRequiredInt(event.value);
    emit(
      state.copyWith(
        taxType2024: event.value,
        taxType2024Status: taxType2024Status,
      ),
    );
  }

  void _onTaxRate2024Changed(
    TaxRate2024Changed event,
    Emitter<CabinetFormState> emit,
  ) {
    final taxRate2024Status = _validateRequiredInt(event.value);
    emit(
      state.copyWith(
        taxRate2024: event.value,
        taxRate2024Status: taxRate2024Status,
      ),
    );
  }

  void _onUnitMaintenanceCostChanged(
    UnitMaintenanceCostChanged event,
    Emitter<CabinetFormState> emit,
  ) {
    final unitMaintenanceCostStatus = _validateOptionalInt(event.value);
    emit(
      state.copyWith(
        unitMaintenanceCost: event.value,
        unitMaintenanceCostStatus: unitMaintenanceCostStatus,
      ),
    );
  }

  void _onWbApiActiveChanged(
    WbApiActiveChanged event,
    Emitter<CabinetFormState> emit,
  ) {
    emit(state.copyWith(wbApiActive: event.value));
  }

  void _onWbApiKeyChanged(
    WbApiKeyChanged event,
    Emitter<CabinetFormState> emit,
  ) {
    emit(state.copyWith(wbApiKey: event.value));
  }

  void _onOzonApiActiveChanged(
    OzonApiActiveChanged event,
    Emitter<CabinetFormState> emit,
  ) {
    emit(state.copyWith(ozonApiActive: event.value));
  }

  void _onOzonClientIdChanged(
    OzonClientIdChanged event,
    Emitter<CabinetFormState> emit,
  ) {
    emit(state.copyWith(ozonClientId: event.value));
  }

  void _onOzonApiKeyChanged(
    OzonApiKeyChanged event,
    Emitter<CabinetFormState> emit,
  ) {
    emit(state.copyWith(ozonApiKey: event.value));
  }

  void _onOzonPerformanceClientIdChanged(
    OzonPerformanceClientIdChanged event,
    Emitter<CabinetFormState> emit,
  ) {
    emit(state.copyWith(ozonPerformanceClientId: event.value));
  }

  void _onOzonPerformanceClientSecretChanged(
    OzonPerformanceClientSecretChanged event,
    Emitter<CabinetFormState> emit,
  ) {
    emit(state.copyWith(ozonPerformanceClientSecret: event.value));
  }

  void _onIsActiveChanged(
    IsActiveChanged event,
    Emitter<CabinetFormState> emit,
  ) {
    emit(state.copyWith(isActive: event.value));
  }

  Future<void> _onSaveCabinet(
    SaveCabinet event,
    Emitter<CabinetFormState> emit,
  ) async {
    if (!state.isValid) return;

    emit(state.copyWith(isSaving: true));

    try {
      final cabinet = Cabinet(
        id: _initialCabinet?.id,
        name: state.name,
        organizationName: state.organizationName?.isEmpty ?? false
            ? null
            : state.organizationName,
        organizationInn: state.organizationInn?.isEmpty ?? false
            ? null
            : state.organizationInn,
        legalType: int.tryParse(state.legalType),
        taxType: int.tryParse(state.taxType),
        taxRate: int.tryParse(state.taxRate),
        ndsRate: int.tryParse(state.ndsRate),
        taxType2024: int.tryParse(state.taxType2024),
        taxRate2024: int.tryParse(state.taxRate2024),
        unitMaintenanceCost: state.unitMaintenanceCost.isEmpty
            ? null
            : int.tryParse(state.unitMaintenanceCost),
        isActive: state.isActive,
        wbApiActive: state.wbApiActive,
        wbApiKey: state.wbApiKey?.isEmpty ?? false ? null : state.wbApiKey,
        ozonApiActive: state.ozonApiActive,
        ozonClientId: state.ozonClientId?.isEmpty ?? false
            ? null
            : state.ozonClientId,
        ozonApiKey: state.ozonApiKey?.isEmpty ?? false
            ? null
            : state.ozonApiKey,
        ozonPerformanceClientId: state.ozonPerformanceClientId?.isEmpty ?? false
            ? null
            : state.ozonPerformanceClientId,
        ozonPerformanceClientSecret:
            state.ozonPerformanceClientSecret?.isEmpty ?? false
            ? null
            : state.ozonPerformanceClientSecret,
        createdAt: _initialCabinet?.createdAt,
        updatedAt: DateTime.now(),
      );

      event.onSuccess(cabinet);
      emit(state.copyWith(isSaving: false, saveSuccess: true));
    } on Object catch (e) {
      emit(
        state.copyWith(
          isSaving: false,
          error: e.toString(),
        ),
      );
    }
  }

  // Validation methods
  NameInvalidStatus? _validateName(String value) {
    if (value.trim().isEmpty) return NameInvalidStatus.empty;
    return null;
  }

  IntFieldInvalidStatus? _validateRequiredInt(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) return IntFieldInvalidStatus.empty;
    if (int.tryParse(trimmed) == null) return IntFieldInvalidStatus.invalid;
    return null;
  }

  IntFieldInvalidStatus? _validateOptionalInt(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) return null; // Optional field can be empty
    if (int.tryParse(trimmed) == null) return IntFieldInvalidStatus.invalid;
    return null;
  }
}
