final class RefreshError implements Exception {
  final Object? error;
  final StackTrace? stackTrace;

  const RefreshError([this.error, this.stackTrace]);
}
