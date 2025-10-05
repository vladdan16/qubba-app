// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cabinets_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final class _$CabinetsResponseDtoImpl implements _CabinetsResponseDto {
  const _$CabinetsResponseDtoImpl({
    required this.cabinets,
    this.total,
    this.limit,
    this.offset,
  });

  factory _$CabinetsResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CabinetsResponseDtoImplFromJson(json);

  @override
  final List<CabinetDto> cabinets;
  @override
  final int? total;
  @override
  final int? limit;
  @override
  final int? offset;

  @override
  String toString() {
    return 'CabinetsResponseDto(cabinets: $cabinets, total: $total, limit: $limit, offset: $offset)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CabinetsResponseDtoImpl &&
            const DeepCollectionEquality().equals(other.cabinets, cabinets) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.offset, offset) || other.offset == offset));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(cabinets), total, limit, offset);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CabinetsResponseDtoImplCopyWith<_$CabinetsResponseDtoImpl> get copyWith =>
      __$$CabinetsResponseDtoImplCopyWithImpl<_$CabinetsResponseDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CabinetsResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _CabinetsResponseDto implements CabinetsResponseDto {
  const factory _CabinetsResponseDto({
    required final List<CabinetDto> cabinets,
    final int? total,
    final int? limit,
    final int? offset,
  }) = _$CabinetsResponseDtoImpl;

  factory _CabinetsResponseDto.fromJson(Map<String, dynamic> json) =
      _$CabinetsResponseDtoImpl.fromJson;

  @override
  List<CabinetDto> get cabinets;
  @override
  int? get total;
  @override
  int? get limit;
  @override
  int? get offset;
  @override
  @JsonKey(ignore: true)
  _$$CabinetsResponseDtoImplCopyWith<_$CabinetsResponseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

mixin _$CabinetsResponseDto {
  List<CabinetDto> get cabinets => throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;
  int? get limit => throw _privateConstructorUsedError;
  int? get offset => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CabinetsResponseDtoCopyWith<CabinetsResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

abstract class $CabinetsResponseDtoCopyWith<$Res> {
  factory $CabinetsResponseDtoCopyWith(
          CabinetsResponseDto value, $Res Function(CabinetsResponseDto) then) =
      _$CabinetsResponseDtoCopyWithImpl<$Res, CabinetsResponseDto>;
  @useResult
  $Res call({List<CabinetDto> cabinets, int? total, int? limit, int? offset});
}

class _$CabinetsResponseDtoCopyWithImpl<$Res, $Val extends CabinetsResponseDto>
    implements $CabinetsResponseDtoCopyWith<$Res> {
  _$CabinetsResponseDtoCopyWithImpl(this._value, this._then);

  final $Val _value;
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cabinets = null,
    Object? total = freezed,
    Object? limit = freezed,
    Object? offset = freezed,
  }) {
    return _then(_value.copyWith(
      cabinets: null == cabinets
          ? _value.cabinets
          : cabinets as List<CabinetDto>,
      total: freezed == total ? _value.total : total as int?,
      limit: freezed == limit ? _value.limit : limit as int?,
      offset: freezed == offset ? _value.offset : offset as int?,
    ) as $Val);
  }
}

abstract class _$$CabinetsResponseDtoImplCopyWith<$Res>
    implements $CabinetsResponseDtoCopyWith<$Res> {
  factory _$$CabinetsResponseDtoImplCopyWith(_$CabinetsResponseDtoImpl value,
          $Res Function(_$CabinetsResponseDtoImpl) then) =
      __$$CabinetsResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CabinetDto> cabinets, int? total, int? limit, int? offset});
}

class __$$CabinetsResponseDtoImplCopyWithImpl<$Res>
    extends _$CabinetsResponseDtoCopyWithImpl<$Res, _$CabinetsResponseDtoImpl>
    implements _$$CabinetsResponseDtoImplCopyWith<$Res> {
  __$$CabinetsResponseDtoImplCopyWithImpl(_$CabinetsResponseDtoImpl _value,
      $Res Function(_$CabinetsResponseDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cabinets = null,
    Object? total = freezed,
    Object? limit = freezed,
    Object? offset = freezed,
  }) {
    return _then(_$CabinetsResponseDtoImpl(
      cabinets: null == cabinets
          ? _value.cabinets
          : cabinets as List<CabinetDto>,
      total: freezed == total ? _value.total : total as int?,
      limit: freezed == limit ? _value.limit : limit as int?,
      offset: freezed == offset ? _value.offset : offset as int?,
    ));
  }
}
