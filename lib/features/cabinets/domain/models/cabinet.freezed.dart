// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cabinet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final class _$CabinetImpl implements _Cabinet {
  const _$CabinetImpl({
    required this.id,
    required this.name,
    this.description,
    this.address,
    this.phone,
    this.email,
    this.createdAt,
    this.updatedAt,
  });

  @override
  final String id;
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
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Cabinet(id: $id, name: $name, description: $description, address: $address, phone: $phone, email: $email, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CabinetImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, address,
      phone, email, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CabinetImplCopyWith<_$CabinetImpl> get copyWith =>
      __$$CabinetImplCopyWithImpl<_$CabinetImpl>(this, _$identity);
}

abstract class _Cabinet implements Cabinet {
  const factory _Cabinet({
    required final String id,
    required final String name,
    final String? description,
    final String? address,
    final String? phone,
    final String? email,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) = _$CabinetImpl;

  @override
  String get id;
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
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$CabinetImplCopyWith<_$CabinetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

mixin _$Cabinet {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CabinetCopyWith<Cabinet> get copyWith => throw _privateConstructorUsedError;
}

abstract class $CabinetCopyWith<$Res> {
  factory $CabinetCopyWith(Cabinet value, $Res Function(Cabinet) then) =
      _$CabinetCopyWithImpl<$Res, Cabinet>;
  @useResult
  $Res call({
    String id,
    String name,
    String? description,
    String? address,
    String? phone,
    String? email,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

class _$CabinetCopyWithImpl<$Res, $Val extends Cabinet>
    implements $CabinetCopyWith<$Res> {
  _$CabinetCopyWithImpl(this._value, this._then);

  final $Val _value;
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? address = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id,
      name: null == name
          ? _value.name
          : name,
      description: freezed == description
          ? _value.description
          : description,
      address: freezed == address
          ? _value.address
          : address,
      phone: freezed == phone
          ? _value.phone
          : phone,
      email: freezed == email
          ? _value.email
          : email,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt,
    ) as $Val);
  }
}

abstract class _$$CabinetImplCopyWith<$Res> implements $CabinetCopyWith<$Res> {
  factory _$$CabinetImplCopyWith(
          _$CabinetImpl value, $Res Function(_$CabinetImpl) then) =
      __$$CabinetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String? description,
    String? address,
    String? phone,
    String? email,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

class __$$CabinetImplCopyWithImpl<$Res>
    extends _$CabinetCopyWithImpl<$Res, _$CabinetImpl>
    implements _$$CabinetImplCopyWith<$Res> {
  __$$CabinetImplCopyWithImpl(
      _$CabinetImpl _value, $Res Function(_$CabinetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? address = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$CabinetImpl(
      id: null == id
          ? _value.id
          : id as String,
      name: null == name
          ? _value.name
          : name as String,
      description: freezed == description
          ? _value.description
          : description as String?,
      address: freezed == address
          ? _value.address
          : address as String?,
      phone: freezed == phone
          ? _value.phone
          : phone as String?,
      email: freezed == email
          ? _value.email
          : email as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt as DateTime?,
    ));
  }
}
