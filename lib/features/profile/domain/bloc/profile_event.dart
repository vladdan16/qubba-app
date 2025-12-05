part of 'profile_bloc.dart';

sealed class ProfileEvent {
  const ProfileEvent();
}

/// Первичная загрузка (например, при входе на экран)
final class ProfileLoadRequested extends ProfileEvent {
  const ProfileLoadRequested({required this.completer});

  final Completer<UserProfile> completer;
}

/// Обновление данных
final class ProfileRefreshRequested extends ProfileEvent {
  const ProfileRefreshRequested({required this.completer});

  final Completer<UserProfile> completer;
}

/// Сохранение основных полей профиля
final class ProfileUpdateRequested extends ProfileEvent {
  const ProfileUpdateRequested({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.completer,
  });

  final String firstName;
  final String lastName;
  final String phone;
  final Completer<UserProfile> completer;
}

/// Загрузка аватара
final class ProfileAvatarUploadRequested extends ProfileEvent {
  const ProfileAvatarUploadRequested({
    required this.filePath,
    required this.completer,
  });

  final String filePath;
  final Completer<Uri?> completer;
}

/// Удаление аватара
final class ProfileAvatarDeleteRequested extends ProfileEvent {
  const ProfileAvatarDeleteRequested({required this.completer});

  final Completer<void> completer;
}
