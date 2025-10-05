// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_cabinet_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final class _$UpdateCabinetRequestDtoImpl implements _UpdateCabinetRequestDto {
  const _$UpdateCabinetRequestDtoImpl({
    required this.name,
    this.description,
    this.address,
    this.phone,
    this.email,
  });

  factory _$UpdateCabinetRequestDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateCabinetRequestDtoImplFromJson(json);

  @override
  final String name;
  @override
  final String? description;
  @override
  final String? address;
  @override
  final String? phone;
  @override
  final String? email;

  @override
  String toString() {
    return 'UpdateCabinetRequestDto(name: $name, description: $description, address: $address, phone: $phone, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateCabinetRequestDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, description, address, phone, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateCabinetRequestDtoImplCopyWith<_$UpdateCabinetRequestDtoImpl>
      get copyWith => __$$UpdateCabinetRequestDtoImplCopyWithImpl<
          _$UpdateCabinetRequestDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateCabinetRequestDtoImplToJson(
      this,
    );
  }
}

abstract class _UpdateCabinetRequestDto implements UpdateCabinetRequestDto {
  const factory _UpdateCabinetRequestDto({
    required final String name,
    final String? description,
    final String? address,
    final String? phone,
    final String? email,
  }) = _$UpdateCabinetRequestDtoImpl;

  factory _UpdateCabinetRequestDto.fromJson(Map<String, dynamic> json) =
      _$UpdateCabinetRequestDtoImpl.fromJson;

  @override
  String get name;
  @override
  String? get description;
  @override
  String? get address;
  @override
  String? get phone;
  @override
  String? get email;
  @override
  @JsonKey(ignore: true)
  _$$UpdateCabinetRequestDtoImplCopyWith<_$UpdateCabinetRequestDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

mixin _$UpdateCabinetRequestDto {
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateCabinetRequestDtoCopyWith<UpdateCabinetRequestDto> get copyWith =>
      throw _privateConstructorUsedError;
}

abstract class $UpdateCabinetRequestDtoCopyWith<$Res> {
  factory $UpdateCabinetRequestDtoCopyWith(UpdateCabinetRequestDto value,
          $Res Function(UpdateCabinetRequestDto) then) =
      _$UpdateCabinetRequestDtoCopyWithImpl<$Res, UpdateCabinetRequestDto>;
  @useResult
  $Res call(
      {String name,
      String? description,
      String? address,
      String? phone,
      String? email});
}

class _$UpdateCabinetRequestDtoCopyWithImpl<$Res,
        $Val extends UpdateCabinetRequestDto>
    implements $UpdateCabinetRequestDtoCopyWith<$Res> {
  _$UpdateCabinetRequestDtoCopyWithImpl(this._value, this._then);

  final $Val _value;
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? address = freezed,
    Object? phone = freezed,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name ? _value.name : name as String,
      description: freezed == description
          ? _value.description
          : description as String?,
      address: freezed == address ? _value.address : address as String?,
      phone: freezed == phone ? _value.phone : phone as String?,
      email: freezed == email ? _value.email : email as String?,
    ) as $Val);
  }
}

abstract class _$$UpdateCabinetRequestDtoImplCopyWith<$Res>
    implements $UpdateCabinetRequestDtoCopyWith<$Res> {
  factory _$$UpdateCabinetRequestDtoImplCopyWith(
          _$UpdateCabinetRequestDtoImpl value,
          $Res Function(_$UpdateCabinetRequestDtoImpl) then) =
      __$$UpdateCabinetRequestDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String? description,
      String? address,
      String? phone,
      String? email});
}

class __$$UpdateCabinetRequestDtoImplCopyWithImpl<$Res>
    extends _$UpdateCabinetRequestDtoCopyWithImpl<$Res,
        _$UpdateCabinetRequestDtoImpl>
    implements _$$UpdateCabinetRequestDtoImplCopyWith<$Res> {
  __$$UpdateCabinetRequestDtoImplCopyWithImpl(
      _$UpdateCabinetRequestDtoImpl _value,
      $Res Function(_$UpdateCabinetRequestDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? address = freezed,
    Object? phone = freezed,
    Object? email = freezed,
  }) {
    return _then(_$UpdateCabinetRequestDtoImpl(
      name: null == name ? _value.name : name as String,
      description: freezed == description
          ? _value.description
          : description as String?,
      address: freezed == address ? _value.address : address as String?,
      phone: freezed == phone ? _value.phone : phone as String?,
      email: freezed == email ? _value.email : email as String?,
    ));
  }
}
