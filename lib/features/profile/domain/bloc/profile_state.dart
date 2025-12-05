part of 'profile_bloc.dart';

sealed class ProfileState {
  const ProfileState();
}

final class ProfileInitialState extends ProfileState {
  const ProfileInitialState();
}

final class ProfileLoadingState extends ProfileState {
  const ProfileLoadingState();
}

class ProfileReadyState extends ProfileState {
  const ProfileReadyState({required this.profile});

  final UserProfile profile;
}

final class ProfileRefreshingState extends ProfileReadyState {
  const ProfileRefreshingState({required super.profile});
}

final class ProfileUpdatingState extends ProfileReadyState {
  const ProfileUpdatingState({required super.profile});
}

final class ProfileAvatarUploadingState extends ProfileReadyState {
  const ProfileAvatarUploadingState({required super.profile});
}

final class ProfileAvatarDeletingState extends ProfileReadyState {
  const ProfileAvatarDeletingState({required super.profile});
}

final class ProfileFailureState extends ProfileState {
  const ProfileFailureState({required this.message, this.lastKnown});

  final String message;
  final UserProfile? lastKnown;
}
