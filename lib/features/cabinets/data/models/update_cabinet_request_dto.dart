import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_cabinet_request_dto.freezed.dart';
part 'update_cabinet_request_dto.g.dart';

@freezed
class UpdateCabinetRequestDto with _$UpdateCabinetRequestDto {
  const factory UpdateCabinetRequestDto({
    required String name,
    String? description,
    String? address,
    String? phone,
    String? email,
  }) = _UpdateCabinetRequestDto;

  factory UpdateCabinetRequestDto.fromJson(Map<String, Object?> json) =>
      _$UpdateCabinetRequestDtoFromJson(json);
}
