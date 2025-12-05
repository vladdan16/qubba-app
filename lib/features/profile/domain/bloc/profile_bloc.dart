import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

import '../models/user_profile.dart';
import '../repository/profile_repository.dart';

part 'profile_event.dart';

part 'profile_state.dart';

final class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({required ProfileRepository repository})
    : _repository = repository,
      super(const ProfileInitialState()) {
    on<ProfileLoadRequested>(_onLoad, transformer: restartable());
    on<ProfileRefreshRequested>(_onRefresh, transformer: restartable());
    on<ProfileUpdateRequested>(_onUpdate, transformer: droppable());
    on<ProfileAvatarUploadRequested>(_onUploadAvatar, transformer: droppable());
    on<ProfileAvatarDeleteRequested>(_onDeleteAvatar, transformer: droppable());
  }

  final ProfileRepository _repository;

  Future<UserProfile> load() {
    final comp = Completer<UserProfile>();
    add(ProfileLoadRequested(completer: comp));
    return comp.future;
  }

  Future<UserProfile> refresh() {
    final comp = Completer<UserProfile>();
    add(ProfileRefreshRequested(completer: comp));
    return comp.future;
  }

  Future<UserProfile> updateProfile({
    required String firstName,
    required String lastName,
    required String phone,
  }) {
    final comp = Completer<UserProfile>();
    add(
      ProfileUpdateRequested(
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        completer: comp,
      ),
    );
    return comp.future;
  }

  Future<Uri?> uploadAvatar(String filePath) {
    final comp = Completer<Uri?>();
    add(ProfileAvatarUploadRequested(filePath: filePath, completer: comp));
    return comp.future;
  }

  Future<void> deleteAvatar() {
    final comp = Completer<void>();
    add(ProfileAvatarDeleteRequested(completer: comp));
    return comp.future;
  }

  Future<void> _onLoad(
    ProfileLoadRequested event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileLoadingState());
    try {
      final profile = await _repository.getProfile();
      emit(ProfileReadyState(profile: profile));
      event.completer.complete(profile);
    } on Object catch (error, _) {
      emit(ProfileFailureState(message: error.toString()));
      event.completer.completeError(error);
    }
  }

  Future<void> _onRefresh(
    ProfileRefreshRequested event,
    Emitter<ProfileState> emit,
  ) async {
    final prev = state;
    if (prev is ProfileReadyState) {
      emit(ProfileRefreshingState(profile: prev.profile));
    } else {
      emit(const ProfileLoadingState());
    }
    try {
      final profile = await _repository.getProfile();
      emit(ProfileReadyState(profile: profile));
      event.completer.complete(profile);
    } on Object catch (error, _) {
      emit(
        ProfileFailureState(
          message: error.toString(),
          lastKnown: prev is ProfileReadyState ? prev.profile : null,
        ),
      );
      event.completer.completeError(error);
    }
  }

  Future<void> _onUpdate(
    ProfileUpdateRequested event,
    Emitter<ProfileState> emit,
  ) async {
    final prev = state;
    if (prev is ProfileReadyState) {
      emit(ProfileUpdatingState(profile: prev.profile));
    }
    try {
      final updated = await _repository.updateProfile(
        firstName: event.firstName,
        lastName: event.lastName,
        phone: event.phone,
      );
      emit(ProfileReadyState(profile: updated));
      event.completer.complete(updated);
    } on Object catch (error, _) {
      emit(
        ProfileFailureState(
          message: error.toString(),
          lastKnown: prev is ProfileReadyState ? prev.profile : null,
        ),
      );
      event.completer.completeError(error);
    }
  }

  Future<void> _onUploadAvatar(
    ProfileAvatarUploadRequested event,
    Emitter<ProfileState> emit,
  ) async {
    final prev = state;
    if (prev is ProfileReadyState) {
      emit(ProfileAvatarUploadingState(profile: prev.profile));
    }
    try {
      final uri = await _repository.uploadAvatar(filePath: event.filePath);
      final fresh = await _repository.getProfile();
      emit(ProfileReadyState(profile: fresh));
      event.completer.complete(uri);
    } on Object catch (error, _) {
      emit(
        ProfileFailureState(
          message: error.toString(),
          lastKnown: prev is ProfileReadyState ? prev.profile : null,
        ),
      );
      event.completer.completeError(error);
    }
  }

  Future<void> _onDeleteAvatar(
    ProfileAvatarDeleteRequested event,
    Emitter<ProfileState> emit,
  ) async {
    final prev = state;
    if (prev is ProfileReadyState) {
      emit(ProfileAvatarDeletingState(profile: prev.profile));
    }
    try {
      await _repository.deleteAvatar();
      final fresh = await _repository.getProfile();
      emit(ProfileReadyState(profile: fresh));
      event.completer.complete();
    } on Object catch (error, _) {
      emit(
        ProfileFailureState(
          message: error.toString(),
          lastKnown: prev is ProfileReadyState ? prev.profile : null,
        ),
      );
      event.completer.completeError(error);
    }
  }
}
