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
           name: initialCabinet?.name ?? '',
           organizationName: initialCabinet?.organizationName,
           organizationInn: initialCabinet?.organizationInn,
           taxType: initialCabinet?.taxType,
           taxRate: initialCabinet?.taxRate,
           ndsRate: initialCabinet?.ndsRate,
           wbApiActive: initialCabinet?.wbApiActive ?? false,
           wbApiKey: initialCabinet?.wbApiKey,
           ozonApiActive: initialCabinet?.ozonApiActive ?? false,
           ozonClientId: initialCabinet?.ozonClientId,
           ozonApiKey: initialCabinet?.ozonApiKey,
           isActive: initialCabinet?.isActive ?? true,
         ),
       ) {
    on<NameChanged>(_onNameChanged);
    on<OrganizationNameChanged>(_onOrganizationNameChanged);
    on<OrganizationInnChanged>(_onOrganizationInnChanged);
    on<TaxTypeChanged>(_onTaxTypeChanged);
    on<TaxRateChanged>(_onTaxRateChanged);
    on<NdsRateChanged>(_onNdsRateChanged);
    on<WbApiActiveChanged>(_onWbApiActiveChanged);
    on<WbApiKeyChanged>(_onWbApiKeyChanged);
    on<OzonApiActiveChanged>(_onOzonApiActiveChanged);
    on<OzonClientIdChanged>(_onOzonClientIdChanged);
    on<OzonApiKeyChanged>(_onOzonApiKeyChanged);
    on<IsActiveChanged>(_onIsActiveChanged);
    on<SaveCabinet>(_onSaveCabinet);
  }

  void _onNameChanged(NameChanged event, Emitter<CabinetFormState> emit) {
    final nameError = event.value.isEmpty ? 'Название обязательно' : null;
    emit(state.copyWith(name: event.value, nameError: nameError));
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

  void _onTaxTypeChanged(
    TaxTypeChanged event,
    Emitter<CabinetFormState> emit,
  ) {
    emit(state.copyWith(taxType: event.value));
  }

  void _onTaxRateChanged(
    TaxRateChanged event,
    Emitter<CabinetFormState> emit,
  ) {
    emit(state.copyWith(taxRate: event.value));
  }

  void _onNdsRateChanged(
    NdsRateChanged event,
    Emitter<CabinetFormState> emit,
  ) {
    emit(state.copyWith(ndsRate: event.value));
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
        id:
            _initialCabinet?.id ??
            DateTime.now().millisecondsSinceEpoch.toString(),
        name: state.name,
        organizationName: state.organizationName?.isEmpty ?? false
            ? null
            : state.organizationName,
        organizationInn: state.organizationInn?.isEmpty ?? false
            ? null
            : state.organizationInn,
        taxType: state.taxType,
        taxRate: state.taxRate,
        ndsRate: state.ndsRate,
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
}
