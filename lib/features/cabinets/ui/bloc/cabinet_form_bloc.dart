import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cabinet_form_event.dart';
part 'cabinet_form_state.dart';

final class CabinetFormBloc extends Bloc<CabinetFormEvent, CabinetFormState> {
  CabinetFormBloc({
    String? initialName,
    String? initialDescription,
    String? initialAddress,
    String? initialPhone,
    String? initialEmail,
  }) : super(
         CabinetFormState(
           name: initialName ?? '',
           description: initialDescription ?? '',
           address: initialAddress ?? '',
           phone: initialPhone ?? '',
           email: initialEmail ?? '',
         ),
       ) {
    on<NameChanged>(_onNameChanged);
    on<DescriptionChanged>(_onDescriptionChanged);
    on<AddressChanged>(_onAddressChanged);
    on<PhoneChanged>(_onPhoneChanged);
    on<EmailChanged>(_onEmailChanged);
  }

  void _onNameChanged(
    NameChanged event,
    Emitter<CabinetFormState> emit,
  ) {
    emit(state.copyWith(name: event.name));
  }

  void _onDescriptionChanged(
    DescriptionChanged event,
    Emitter<CabinetFormState> emit,
  ) {
    emit(state.copyWith(description: event.description));
  }

  void _onAddressChanged(
    AddressChanged event,
    Emitter<CabinetFormState> emit,
  ) {
    emit(state.copyWith(address: event.address));
  }

  void _onPhoneChanged(
    PhoneChanged event,
    Emitter<CabinetFormState> emit,
  ) {
    emit(state.copyWith(phone: event.phone));
  }

  void _onEmailChanged(
    EmailChanged event,
    Emitter<CabinetFormState> emit,
  ) {
    emit(state.copyWith(email: event.email));
  }
}
