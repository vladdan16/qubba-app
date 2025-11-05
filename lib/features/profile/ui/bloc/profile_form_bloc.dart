import 'dart:async';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'profile_form_event.dart';

part 'profile_form_state.dart';

typedef OnSaveProfile =
    Future<void> Function({
      required String firstName,
      required String lastName,
      required String phone,
    });

final class ProfileFormBloc extends Bloc<ProfileFormEvent, ProfileFormState> {
  ProfileFormBloc({
    required OnSaveProfile onSave,
    required String email,
    String firstName = '',
    String lastName = '',
    String phone = '',
    Duration debounce = const Duration(milliseconds: 300),
  }) : _onSave = onSave,
       _debounce = debounce,
       super(
         ProfileFormInitialState(
           email: email,
           firstName: firstName,
           lastName: lastName,
           phone: phone,
         ),
       ) {
    on<FirstNameChangedEvent>(
      _onFirstNameChanged,
      transformer: _debounced<FirstNameChangedEvent>(),
    );
    on<LastNameChangedEvent>(
      _onLastNameChanged,
      transformer: _debounced<LastNameChangedEvent>(),
    );
    on<PhoneChangedEvent>(
      _onPhoneChanged,
      transformer: _debounced<PhoneChangedEvent>(),
    );
    on<EditPressedEvent>(_onEditPressed);
    on<SavePressedEvent>(_onSavePressed, transformer: droppable());
  }

  final OnSaveProfile _onSave;
  final Duration _debounce;

  static final RegExp _nameChars = RegExp(r'^[\p{L}\- ]+$', unicode: true);
  static final RegExp _digits7to20 = RegExp(r'^[0-9]{7,20}$');

  EventTransformer<E> _debounced<E>() =>
      (events, mapper) => events.debounceTime(_debounce).switchMap(mapper);

  void _onEditPressed(
    EditPressedEvent event,
    Emitter<ProfileFormState> emit,
  ) {
    final s = state;
    if (s is ProfileFormInitialState || s is ProfileFormSavedState) {
      final email = s.email;
      final firstName = s.firstName;
      final lastName = s.lastName;
      final normalizedPhone = _normalizePhone(s.phone);

      emit(
        ProfileFormEditingState(
          email: email,
          firstName: firstName,
          lastName: lastName,
          phone: normalizedPhone,
        ),
      );
    }
  }

  void _onFirstNameChanged(
    FirstNameChangedEvent event,
    Emitter<ProfileFormState> emit,
  ) {
    final s = state;
    if (s is! ProfileFormEditingState) return;

    final value = event.value.trim();
    emit(
      s.copyWith(
        firstName: value,
        firstNameStatus: _validateFirstName(value),
      ),
    );
  }

  void _onLastNameChanged(
    LastNameChangedEvent event,
    Emitter<ProfileFormState> emit,
  ) {
    final s = state;
    if (s is! ProfileFormEditingState) return;

    final value = event.value.trim();
    emit(
      s.copyWith(
        lastName: value,
        lastNameStatus: _validateLastName(value),
      ),
    );
  }

  void _onPhoneChanged(
    PhoneChangedEvent event,
    Emitter<ProfileFormState> emit,
  ) {
    final s = state;
    if (s is! ProfileFormEditingState) return;

    final normalizedPhone = _normalizePhone(event.value);
    emit(
      s.copyWith(
        phone: normalizedPhone,
        phoneStatus: _validatePhone(normalizedPhone),
      ),
    );
  }

  Future<void> _onSavePressed(
    SavePressedEvent event,
    Emitter<ProfileFormState> emit,
  ) async {
    final s = state;
    if (s is! ProfileFormEditingState) return;

    final normalizedPhone = _normalizePhone(s.phone);
    final firstStatus = _validateFirstName(s.firstName);
    final lastStatus = _validateLastName(s.lastName);
    final phoneStatus = _validatePhone(normalizedPhone);

    final validated = s.copyWith(
      phone: normalizedPhone,
      firstNameStatus: firstStatus,
      lastNameStatus: lastStatus,
      phoneStatus: phoneStatus,
    );

    if (!validated.isValid) {
      emit(validated);
      return;
    }

    emit(
      ProfileFormSavingState(
        email: validated.email,
        firstName: validated.firstName,
        lastName: validated.lastName,
        phone: validated.phone,
        firstNameStatus: validated.firstNameStatus,
        lastNameStatus: validated.lastNameStatus,
        phoneStatus: validated.phoneStatus,
      ),
    );

    try {
      await _onSave(
        firstName: validated.firstName.trim(),
        lastName: validated.lastName.trim(),
        phone: validated.phone,
      );

      emit(
        ProfileFormSavedState(
          email: validated.email,
          firstName: validated.firstName,
          lastName: validated.lastName,
          phone: validated.phone,
        ),
      );

      emit(
        ProfileFormInitialState(
          email: validated.email,
          firstName: validated.firstName,
          lastName: validated.lastName,
          phone: validated.phone,
        ),
      );
    } on Object catch (e, st) {
      addError(e, st);
      emit(
        ProfileFormFailureState(
          email: s.email,
          firstName: s.firstName,
          lastName: s.lastName,
          phone: s.phone,
          message: e.toString(),
          firstNameStatus: s.firstNameStatus,
          lastNameStatus: s.lastNameStatus,
          phoneStatus: s.phoneStatus,
        ),
      );
    }
  }

  FirstNameInvalidStatus? _validateFirstName(String value) {
    if (value.isEmpty) return FirstNameInvalidStatus.empty;
    if (value.length > 50) return FirstNameInvalidStatus.tooLong;
    if (!_nameChars.hasMatch(value)) {
      return FirstNameInvalidStatus.forbiddenChars;
    }
    return null;
  }

  LastNameInvalidStatus? _validateLastName(String value) {
    if (value.isEmpty) return LastNameInvalidStatus.empty;
    if (value.length > 50) return LastNameInvalidStatus.tooLong;
    if (!_nameChars.hasMatch(value)) {
      return LastNameInvalidStatus.forbiddenChars;
    }
    return null;
  }

  PhoneInvalidStatus? _validatePhone(String value) {
    if (value.isEmpty) return PhoneInvalidStatus.empty;
    if (!_digits7to20.hasMatch(value)) {
      return PhoneInvalidStatus.invalid;
    }
    return null;
  }

  String _normalizePhone(String raw) => raw.replaceAll(RegExp(r'[\s\-]'), '');
}
