import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

import '../models/user_profile.dart';
import '../repository/profile_repository.dart';

part 'profile_event.dart';

part 'profile_state.dart';

final class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({required this._repository})
    : super(const ProfileInitialState()) {
    on<ProfileLoadRequested>(_onLoad, transformer: restartable());
    on<ProfileRefreshRequested>(_onRefresh, transformer: restartable());
    on<ProfileUpdateRequested>(_onUpdate, transformer: droppable());
    on<ProfileAvatarUploadRequested>(_onUploadAvatar, transformer: droppable());
    on<ProfileAvatarDeleteRequested>(_onDeleteAvatar, transformer: droppable());
  }

  final ProfileRepository _repository;

  Future<void> _onLoad(
    ProfileLoadRequested event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileLoadingState());
    try {
      final profile = await _repository.getProfile();
      emit(ProfileReadyIdleState(profile: profile));
    } on Object catch (error, _) {
      emit(ProfileFailureState(message: error.toString()));
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
      emit(ProfileReadyIdleState(profile: profile));
    } on Object catch (error, _) {
      emit(
        ProfileFailureState(
          message: error.toString(),
          lastKnown: prev is ProfileReadyState ? prev.profile : null,
        ),
      );
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
      emit(ProfileReadyIdleState(profile: updated));
    } on Object catch (error, _) {
      emit(
        ProfileFailureState(
          message: error.toString(),
          lastKnown: prev is ProfileReadyState ? prev.profile : null,
        ),
      );
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
      await _repository.uploadAvatar(filePath: event.filePath);
      final fresh = await _repository.getProfile();
      emit(ProfileReadyIdleState(profile: fresh));
    } on Object catch (error, _) {
      emit(
        ProfileFailureState(
          message: error.toString(),
          lastKnown: prev is ProfileReadyState ? prev.profile : null,
        ),
      );
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
      emit(ProfileReadyIdleState(profile: fresh));
    } on Object catch (error, _) {
      emit(
        ProfileFailureState(
          message: error.toString(),
          lastKnown: prev is ProfileReadyState ? prev.profile : null,
        ),
      );
    }
  }
}
