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

 List<CabinetDto> get cabinets; int? get total; int? get limit; int? get offset;
/// Create a copy of CabinetsResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CabinetsResponseDtoCopyWith<CabinetsResponseDto> get copyWith => _$CabinetsResponseDtoCopyWithImpl<CabinetsResponseDto>(this as CabinetsResponseDto, _$identity);

  /// Serializes this CabinetsResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CabinetsResponseDto&&const DeepCollectionEquality().equals(other.cabinets, cabinets)&&(identical(other.total, total) || other.total == total)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(cabinets),total,limit,offset);

@override
String toString() {
  return 'CabinetsResponseDto(cabinets: $cabinets, total: $total, limit: $limit, offset: $offset)';
}


}

/// @nodoc
abstract mixin class $CabinetsResponseDtoCopyWith<$Res>  {
  factory $CabinetsResponseDtoCopyWith(CabinetsResponseDto value, $Res Function(CabinetsResponseDto) _then) = _$CabinetsResponseDtoCopyWithImpl;
@useResult
$Res call({
 List<CabinetDto> cabinets, int? total, int? limit, int? offset
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
@pragma('vm:prefer-inline') @override $Res call({Object? cabinets = null,Object? total = freezed,Object? limit = freezed,Object? offset = freezed,}) {
  return _then(_self.copyWith(
cabinets: null == cabinets ? _self.cabinets : cabinets // ignore: cast_nullable_to_non_nullable
as List<CabinetDto>,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int?,offset: freezed == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CabinetDto> cabinets,  int? total,  int? limit,  int? offset)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CabinetsResponseDto() when $default != null:
return $default(_that.cabinets,_that.total,_that.limit,_that.offset);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CabinetDto> cabinets,  int? total,  int? limit,  int? offset)  $default,) {final _that = this;
switch (_that) {
case _CabinetsResponseDto():
return $default(_that.cabinets,_that.total,_that.limit,_that.offset);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CabinetDto> cabinets,  int? total,  int? limit,  int? offset)?  $default,) {final _that = this;
switch (_that) {
case _CabinetsResponseDto() when $default != null:
return $default(_that.cabinets,_that.total,_that.limit,_that.offset);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CabinetsResponseDto implements CabinetsResponseDto {
  const _CabinetsResponseDto({required final  List<CabinetDto> cabinets, this.total, this.limit, this.offset}): _cabinets = cabinets;
  factory _CabinetsResponseDto.fromJson(Map<String, dynamic> json) => _$CabinetsResponseDtoFromJson(json);

 final  List<CabinetDto> _cabinets;
@override List<CabinetDto> get cabinets {
  if (_cabinets is EqualUnmodifiableListView) return _cabinets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cabinets);
}

@override final  int? total;
@override final  int? limit;
@override final  int? offset;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CabinetsResponseDto&&const DeepCollectionEquality().equals(other._cabinets, _cabinets)&&(identical(other.total, total) || other.total == total)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_cabinets),total,limit,offset);

@override
String toString() {
  return 'CabinetsResponseDto(cabinets: $cabinets, total: $total, limit: $limit, offset: $offset)';
}


}

/// @nodoc
abstract mixin class _$CabinetsResponseDtoCopyWith<$Res> implements $CabinetsResponseDtoCopyWith<$Res> {
  factory _$CabinetsResponseDtoCopyWith(_CabinetsResponseDto value, $Res Function(_CabinetsResponseDto) _then) = __$CabinetsResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 List<CabinetDto> cabinets, int? total, int? limit, int? offset
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
@override @pragma('vm:prefer-inline') $Res call({Object? cabinets = null,Object? total = freezed,Object? limit = freezed,Object? offset = freezed,}) {
  return _then(_CabinetsResponseDto(
cabinets: null == cabinets ? _self._cabinets : cabinets // ignore: cast_nullable_to_non_nullable
as List<CabinetDto>,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int?,offset: freezed == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
