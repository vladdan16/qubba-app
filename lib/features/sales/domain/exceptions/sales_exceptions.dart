sealed class SalesException implements Exception {
  const SalesException({
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

final class SalesDailyLoadException extends SalesException {
  const SalesDailyLoadException({
    required super.message,
    super.statusCode,
    super.cause,
    super.stackTrace,
  });
}
