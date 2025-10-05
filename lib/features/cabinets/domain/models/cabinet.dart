import 'package:freezed_annotation/freezed_annotation.dart';

part 'cabinet.freezed.dart';

@freezed
class Cabinet with _$Cabinet {
  const factory Cabinet({
    required String id,
    required String name,
    String? description,
    String? address,
    String? phone,
    String? email,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Cabinet;
}
