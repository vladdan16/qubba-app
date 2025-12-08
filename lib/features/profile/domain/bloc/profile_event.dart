part of 'profile_bloc.dart';

sealed class ProfileEvent {
  const ProfileEvent();
}

/// Первичная загрузка (например, при входе на экран)
final class ProfileLoadRequested extends ProfileEvent {
  const ProfileLoadRequested();
}

/// Обновление данных
final class ProfileRefreshRequested extends ProfileEvent {
  const ProfileRefreshRequested();
}

/// Сохранение основных полей профиля
final class ProfileUpdateRequested extends ProfileEvent {
  const ProfileUpdateRequested({
    required this.firstName,
    required this.lastName,
    required this.phone,
  });

  final String firstName;
  final String lastName;
  final String phone;
}

/// Загрузка аватара
final class ProfileAvatarUploadRequested extends ProfileEvent {
  const ProfileAvatarUploadRequested({
    required this.filePath,
  });

  final String filePath;
}

/// Удаление аватара
final class ProfileAvatarDeleteRequested extends ProfileEvent {
  const ProfileAvatarDeleteRequested();
}
