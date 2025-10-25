part of 'cabinets_bloc.dart';

@immutable
sealed class CabinetsState {
  const CabinetsState();
}

final class CabinetsInitial extends CabinetsState {
  const CabinetsInitial();
}

final class CabinetsLoading extends CabinetsState {
  const CabinetsLoading();
}

final class CabinetsLoaded extends CabinetsState {
  final List<Cabinet> cabinets;

  const CabinetsLoaded({required this.cabinets});
}

final class CabinetsError extends CabinetsState {
  final Object error;
  final StackTrace stackTrace;

  const CabinetsError({
    required this.error,
    required this.stackTrace,
  });
}
