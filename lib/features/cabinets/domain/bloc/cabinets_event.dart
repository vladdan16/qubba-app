part of 'cabinets_bloc.dart';

@immutable
sealed class CabinetsEvent {
  const CabinetsEvent();
}

final class LoadCabinets extends CabinetsEvent {
  final int? limit;

  const LoadCabinets({this.limit});
}

final class CreateCabinet extends CabinetsEvent {
  final Cabinet cabinet;

  const CreateCabinet({required this.cabinet});
}

final class UpdateCabinet extends CabinetsEvent {
  final Cabinet cabinet;

  const UpdateCabinet({required this.cabinet});
}

final class DeleteCabinet extends CabinetsEvent {
  final String cabinetId;

  const DeleteCabinet({required this.cabinetId});
}
