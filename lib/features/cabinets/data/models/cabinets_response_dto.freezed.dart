// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cabinets_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CabinetsResponseDto {

@JsonKey(name: 'cabinets') List<CabinetDto> get cabinets;@JsonKey(name: 'all_quantity') int? get total;@JsonKey(name: 'offline_mode') bool get offlineMode;
/// Create a copy of CabinetsResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CabinetsResponseDtoCopyWith<CabinetsResponseDto> get copyWith => _$CabinetsResponseDtoCopyWithImpl<CabinetsResponseDto>(this as CabinetsResponseDto, _$identity);

  /// Serializes this CabinetsResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CabinetsResponseDto&&const DeepCollectionEquality().equals(other.cabinets, cabinets)&&(identical(other.total, total) || other.total == total)&&(identical(other.offlineMode, offlineMode) || other.offlineMode == offlineMode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(cabinets),total,offlineMode);

@override
String toString() {
  return 'CabinetsResponseDto(cabinets: $cabinets, total: $total, offlineMode: $offlineMode)';
}


}

/// @nodoc
abstract mixin class $CabinetsResponseDtoCopyWith<$Res>  {
  factory $CabinetsResponseDtoCopyWith(CabinetsResponseDto value, $Res Function(CabinetsResponseDto) _then) = _$CabinetsResponseDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'cabinets') List<CabinetDto> cabinets,@JsonKey(name: 'all_quantity') int? total,@JsonKey(name: 'offline_mode') bool offlineMode
});




}
/// @nodoc
class _$CabinetsResponseDtoCopyWithImpl<$Res>
    implements $CabinetsResponseDtoCopyWith<$Res> {
  _$CabinetsResponseDtoCopyWithImpl(this._self, this._then);

  final CabinetsResponseDto _self;
  final $Res Function(CabinetsResponseDto) _then;

/// Create a copy of CabinetsResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cabinets = null,Object? total = freezed,Object? offlineMode = null,}) {
  return _then(_self.copyWith(
cabinets: null == cabinets ? _self.cabinets : cabinets // ignore: cast_nullable_to_non_nullable
as List<CabinetDto>,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,offlineMode: null == offlineMode ? _self.offlineMode : offlineMode // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CabinetsResponseDto].
extension CabinetsResponseDtoPatterns on CabinetsResponseDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CabinetsResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CabinetsResponseDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CabinetsResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _CabinetsResponseDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CabinetsResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _CabinetsResponseDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'cabinets')  List<CabinetDto> cabinets, @JsonKey(name: 'all_quantity')  int? total, @JsonKey(name: 'offline_mode')  bool offlineMode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CabinetsResponseDto() when $default != null:
return $default(_that.cabinets,_that.total,_that.offlineMode);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'cabinets')  List<CabinetDto> cabinets, @JsonKey(name: 'all_quantity')  int? total, @JsonKey(name: 'offline_mode')  bool offlineMode)  $default,) {final _that = this;
switch (_that) {
case _CabinetsResponseDto():
return $default(_that.cabinets,_that.total,_that.offlineMode);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'cabinets')  List<CabinetDto> cabinets, @JsonKey(name: 'all_quantity')  int? total, @JsonKey(name: 'offline_mode')  bool offlineMode)?  $default,) {final _that = this;
switch (_that) {
case _CabinetsResponseDto() when $default != null:
return $default(_that.cabinets,_that.total,_that.offlineMode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CabinetsResponseDto implements CabinetsResponseDto {
  const _CabinetsResponseDto({@JsonKey(name: 'cabinets') final  List<CabinetDto> cabinets = const <CabinetDto>[], @JsonKey(name: 'all_quantity') this.total, @JsonKey(name: 'offline_mode') this.offlineMode = false}): _cabinets = cabinets;
  factory _CabinetsResponseDto.fromJson(Map<String, dynamic> json) => _$CabinetsResponseDtoFromJson(json);

 final  List<CabinetDto> _cabinets;
@override@JsonKey(name: 'cabinets') List<CabinetDto> get cabinets {
  if (_cabinets is EqualUnmodifiableListView) return _cabinets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cabinets);
}

@override@JsonKey(name: 'all_quantity') final  int? total;
@override@JsonKey(name: 'offline_mode') final  bool offlineMode;

/// Create a copy of CabinetsResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CabinetsResponseDtoCopyWith<_CabinetsResponseDto> get copyWith => __$CabinetsResponseDtoCopyWithImpl<_CabinetsResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CabinetsResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CabinetsResponseDto&&const DeepCollectionEquality().equals(other._cabinets, _cabinets)&&(identical(other.total, total) || other.total == total)&&(identical(other.offlineMode, offlineMode) || other.offlineMode == offlineMode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_cabinets),total,offlineMode);

@override
String toString() {
  return 'CabinetsResponseDto(cabinets: $cabinets, total: $total, offlineMode: $offlineMode)';
}


}

/// @nodoc
abstract mixin class _$CabinetsResponseDtoCopyWith<$Res> implements $CabinetsResponseDtoCopyWith<$Res> {
  factory _$CabinetsResponseDtoCopyWith(_CabinetsResponseDto value, $Res Function(_CabinetsResponseDto) _then) = __$CabinetsResponseDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'cabinets') List<CabinetDto> cabinets,@JsonKey(name: 'all_quantity') int? total,@JsonKey(name: 'offline_mode') bool offlineMode
});




}
/// @nodoc
class __$CabinetsResponseDtoCopyWithImpl<$Res>
    implements _$CabinetsResponseDtoCopyWith<$Res> {
  __$CabinetsResponseDtoCopyWithImpl(this._self, this._then);

  final _CabinetsResponseDto _self;
  final $Res Function(_CabinetsResponseDto) _then;

/// Create a copy of CabinetsResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cabinets = null,Object? total = freezed,Object? offlineMode = null,}) {
  return _then(_CabinetsResponseDto(
cabinets: null == cabinets ? _self._cabinets : cabinets // ignore: cast_nullable_to_non_nullable
as List<CabinetDto>,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,offlineMode: null == offlineMode ? _self.offlineMode : offlineMode // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
