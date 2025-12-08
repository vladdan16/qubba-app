sealed class ProfileException implements Exception {
  const ProfileException({
    required this.message,
    this.statusCode,
    this.cause,
    this.stackTrace,
  });

  final String message;
  final int? statusCode;
  final Object? cause;
  final StackTrace? stackTrace;

  @override
  String toString() => message;
}

final class ProfileLoadException extends ProfileException {
  const ProfileLoadException({
    required super.message,
    super.statusCode,
    super.cause,
    super.stackTrace,
  });
}

final class ProfileUpdateException extends ProfileException {
  const ProfileUpdateException({
    required super.message,
    super.statusCode,
    super.cause,
    super.stackTrace,
  });
}

final class ProfileAvatarUploadException extends ProfileException {
  const ProfileAvatarUploadException({
    required super.message,
    super.statusCode,
    super.cause,
    super.stackTrace,
  });
}

final class ProfileAvatarDeleteException extends ProfileException {
  const ProfileAvatarDeleteException({
    required super.message,
    super.statusCode,
    super.cause,
    super.stackTrace,
  });
}
