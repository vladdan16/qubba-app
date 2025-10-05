// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cabinet_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CabinetDto {

@JsonKey(name: 'name') String get name;@JsonKey(name: 'id') String? get id;@JsonKey(name: 'userId') String? get userId;@JsonKey(name: 'legalType') int? get legalType;@JsonKey(name: 'taxType') int? get taxType;@JsonKey(name: 'taxRate') int? get taxRate;@JsonKey(name: 'unitMaintenanceCost') int? get unitMaintenanceCost;@JsonKey(name: 'organizationName') String? get organizationName;@JsonKey(name: 'organizationINN') String? get organizationTin;@JsonKey(name: 'isActive') bool? get isActive;@JsonKey(name: 'wbApiKey') String? get wbApiKey;@JsonKey(name: 'ozonClientId') String? get ozonClientId;@JsonKey(name: 'ozonApiKey') String? get ozonApiKey;@JsonKey(name: 'wbApiActive') bool? get wbApiActive;@JsonKey(name: 'ozonApiActive') bool? get ozonApiActive;@JsonKey(name: 'ozonPerformanceClientId') String? get ozonPerformanceClientId;@JsonKey(name: 'ozonPerformanceClientSecret') String? get ozonPerformanceClientSecret;
/// Create a copy of CabinetDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CabinetDtoCopyWith<CabinetDto> get copyWith => _$CabinetDtoCopyWithImpl<CabinetDto>(this as CabinetDto, _$identity);

  /// Serializes this CabinetDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CabinetDto&&(identical(other.name, name) || other.name == name)&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.legalType, legalType) || other.legalType == legalType)&&(identical(other.taxType, taxType) || other.taxType == taxType)&&(identical(other.taxRate, taxRate) || other.taxRate == taxRate)&&(identical(other.unitMaintenanceCost, unitMaintenanceCost) || other.unitMaintenanceCost == unitMaintenanceCost)&&(identical(other.organizationName, organizationName) || other.organizationName == organizationName)&&(identical(other.organizationTin, organizationTin) || other.organizationTin == organizationTin)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.wbApiKey, wbApiKey) || other.wbApiKey == wbApiKey)&&(identical(other.ozonClientId, ozonClientId) || other.ozonClientId == ozonClientId)&&(identical(other.ozonApiKey, ozonApiKey) || other.ozonApiKey == ozonApiKey)&&(identical(other.wbApiActive, wbApiActive) || other.wbApiActive == wbApiActive)&&(identical(other.ozonApiActive, ozonApiActive) || other.ozonApiActive == ozonApiActive)&&(identical(other.ozonPerformanceClientId, ozonPerformanceClientId) || other.ozonPerformanceClientId == ozonPerformanceClientId)&&(identical(other.ozonPerformanceClientSecret, ozonPerformanceClientSecret) || other.ozonPerformanceClientSecret == ozonPerformanceClientSecret));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,id,userId,legalType,taxType,taxRate,unitMaintenanceCost,organizationName,organizationTin,isActive,wbApiKey,ozonClientId,ozonApiKey,wbApiActive,ozonApiActive,ozonPerformanceClientId,ozonPerformanceClientSecret);

@override
String toString() {
  return 'CabinetDto(name: $name, id: $id, userId: $userId, legalType: $legalType, taxType: $taxType, taxRate: $taxRate, unitMaintenanceCost: $unitMaintenanceCost, organizationName: $organizationName, organizationTin: $organizationTin, isActive: $isActive, wbApiKey: $wbApiKey, ozonClientId: $ozonClientId, ozonApiKey: $ozonApiKey, wbApiActive: $wbApiActive, ozonApiActive: $ozonApiActive, ozonPerformanceClientId: $ozonPerformanceClientId, ozonPerformanceClientSecret: $ozonPerformanceClientSecret)';
}


}

/// @nodoc
abstract mixin class $CabinetDtoCopyWith<$Res>  {
  factory $CabinetDtoCopyWith(CabinetDto value, $Res Function(CabinetDto) _then) = _$CabinetDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'name') String name,@JsonKey(name: 'id') String? id,@JsonKey(name: 'userId') String? userId,@JsonKey(name: 'legalType') int? legalType,@JsonKey(name: 'taxType') int? taxType,@JsonKey(name: 'taxRate') int? taxRate,@JsonKey(name: 'unitMaintenanceCost') int? unitMaintenanceCost,@JsonKey(name: 'organizationName') String? organizationName,@JsonKey(name: 'organizationINN') String? organizationTin,@JsonKey(name: 'isActive') bool? isActive,@JsonKey(name: 'wbApiKey') String? wbApiKey,@JsonKey(name: 'ozonClientId') String? ozonClientId,@JsonKey(name: 'ozonApiKey') String? ozonApiKey,@JsonKey(name: 'wbApiActive') bool? wbApiActive,@JsonKey(name: 'ozonApiActive') bool? ozonApiActive,@JsonKey(name: 'ozonPerformanceClientId') String? ozonPerformanceClientId,@JsonKey(name: 'ozonPerformanceClientSecret') String? ozonPerformanceClientSecret
});




}
/// @nodoc
class _$CabinetDtoCopyWithImpl<$Res>
    implements $CabinetDtoCopyWith<$Res> {
  _$CabinetDtoCopyWithImpl(this._self, this._then);

  final CabinetDto _self;
  final $Res Function(CabinetDto) _then;

/// Create a copy of CabinetDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? id = freezed,Object? userId = freezed,Object? legalType = freezed,Object? taxType = freezed,Object? taxRate = freezed,Object? unitMaintenanceCost = freezed,Object? organizationName = freezed,Object? organizationTin = freezed,Object? isActive = freezed,Object? wbApiKey = freezed,Object? ozonClientId = freezed,Object? ozonApiKey = freezed,Object? wbApiActive = freezed,Object? ozonApiActive = freezed,Object? ozonPerformanceClientId = freezed,Object? ozonPerformanceClientSecret = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,legalType: freezed == legalType ? _self.legalType : legalType // ignore: cast_nullable_to_non_nullable
as int?,taxType: freezed == taxType ? _self.taxType : taxType // ignore: cast_nullable_to_non_nullable
as int?,taxRate: freezed == taxRate ? _self.taxRate : taxRate // ignore: cast_nullable_to_non_nullable
as int?,unitMaintenanceCost: freezed == unitMaintenanceCost ? _self.unitMaintenanceCost : unitMaintenanceCost // ignore: cast_nullable_to_non_nullable
as int?,organizationName: freezed == organizationName ? _self.organizationName : organizationName // ignore: cast_nullable_to_non_nullable
as String?,organizationTin: freezed == organizationTin ? _self.organizationTin : organizationTin // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,wbApiKey: freezed == wbApiKey ? _self.wbApiKey : wbApiKey // ignore: cast_nullable_to_non_nullable
as String?,ozonClientId: freezed == ozonClientId ? _self.ozonClientId : ozonClientId // ignore: cast_nullable_to_non_nullable
as String?,ozonApiKey: freezed == ozonApiKey ? _self.ozonApiKey : ozonApiKey // ignore: cast_nullable_to_non_nullable
as String?,wbApiActive: freezed == wbApiActive ? _self.wbApiActive : wbApiActive // ignore: cast_nullable_to_non_nullable
as bool?,ozonApiActive: freezed == ozonApiActive ? _self.ozonApiActive : ozonApiActive // ignore: cast_nullable_to_non_nullable
as bool?,ozonPerformanceClientId: freezed == ozonPerformanceClientId ? _self.ozonPerformanceClientId : ozonPerformanceClientId // ignore: cast_nullable_to_non_nullable
as String?,ozonPerformanceClientSecret: freezed == ozonPerformanceClientSecret ? _self.ozonPerformanceClientSecret : ozonPerformanceClientSecret // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CabinetDto].
extension CabinetDtoPatterns on CabinetDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CabinetDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CabinetDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CabinetDto value)  $default,){
final _that = this;
switch (_that) {
case _CabinetDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CabinetDto value)?  $default,){
final _that = this;
switch (_that) {
case _CabinetDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'name')  String name, @JsonKey(name: 'id')  String? id, @JsonKey(name: 'userId')  String? userId, @JsonKey(name: 'legalType')  int? legalType, @JsonKey(name: 'taxType')  int? taxType, @JsonKey(name: 'taxRate')  int? taxRate, @JsonKey(name: 'unitMaintenanceCost')  int? unitMaintenanceCost, @JsonKey(name: 'organizationName')  String? organizationName, @JsonKey(name: 'organizationINN')  String? organizationTin, @JsonKey(name: 'isActive')  bool? isActive, @JsonKey(name: 'wbApiKey')  String? wbApiKey, @JsonKey(name: 'ozonClientId')  String? ozonClientId, @JsonKey(name: 'ozonApiKey')  String? ozonApiKey, @JsonKey(name: 'wbApiActive')  bool? wbApiActive, @JsonKey(name: 'ozonApiActive')  bool? ozonApiActive, @JsonKey(name: 'ozonPerformanceClientId')  String? ozonPerformanceClientId, @JsonKey(name: 'ozonPerformanceClientSecret')  String? ozonPerformanceClientSecret)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CabinetDto() when $default != null:
return $default(_that.name,_that.id,_that.userId,_that.legalType,_that.taxType,_that.taxRate,_that.unitMaintenanceCost,_that.organizationName,_that.organizationTin,_that.isActive,_that.wbApiKey,_that.ozonClientId,_that.ozonApiKey,_that.wbApiActive,_that.ozonApiActive,_that.ozonPerformanceClientId,_that.ozonPerformanceClientSecret);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'name')  String name, @JsonKey(name: 'id')  String? id, @JsonKey(name: 'userId')  String? userId, @JsonKey(name: 'legalType')  int? legalType, @JsonKey(name: 'taxType')  int? taxType, @JsonKey(name: 'taxRate')  int? taxRate, @JsonKey(name: 'unitMaintenanceCost')  int? unitMaintenanceCost, @JsonKey(name: 'organizationName')  String? organizationName, @JsonKey(name: 'organizationINN')  String? organizationTin, @JsonKey(name: 'isActive')  bool? isActive, @JsonKey(name: 'wbApiKey')  String? wbApiKey, @JsonKey(name: 'ozonClientId')  String? ozonClientId, @JsonKey(name: 'ozonApiKey')  String? ozonApiKey, @JsonKey(name: 'wbApiActive')  bool? wbApiActive, @JsonKey(name: 'ozonApiActive')  bool? ozonApiActive, @JsonKey(name: 'ozonPerformanceClientId')  String? ozonPerformanceClientId, @JsonKey(name: 'ozonPerformanceClientSecret')  String? ozonPerformanceClientSecret)  $default,) {final _that = this;
switch (_that) {
case _CabinetDto():
return $default(_that.name,_that.id,_that.userId,_that.legalType,_that.taxType,_that.taxRate,_that.unitMaintenanceCost,_that.organizationName,_that.organizationTin,_that.isActive,_that.wbApiKey,_that.ozonClientId,_that.ozonApiKey,_that.wbApiActive,_that.ozonApiActive,_that.ozonPerformanceClientId,_that.ozonPerformanceClientSecret);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'name')  String name, @JsonKey(name: 'id')  String? id, @JsonKey(name: 'userId')  String? userId, @JsonKey(name: 'legalType')  int? legalType, @JsonKey(name: 'taxType')  int? taxType, @JsonKey(name: 'taxRate')  int? taxRate, @JsonKey(name: 'unitMaintenanceCost')  int? unitMaintenanceCost, @JsonKey(name: 'organizationName')  String? organizationName, @JsonKey(name: 'organizationINN')  String? organizationTin, @JsonKey(name: 'isActive')  bool? isActive, @JsonKey(name: 'wbApiKey')  String? wbApiKey, @JsonKey(name: 'ozonClientId')  String? ozonClientId, @JsonKey(name: 'ozonApiKey')  String? ozonApiKey, @JsonKey(name: 'wbApiActive')  bool? wbApiActive, @JsonKey(name: 'ozonApiActive')  bool? ozonApiActive, @JsonKey(name: 'ozonPerformanceClientId')  String? ozonPerformanceClientId, @JsonKey(name: 'ozonPerformanceClientSecret')  String? ozonPerformanceClientSecret)?  $default,) {final _that = this;
switch (_that) {
case _CabinetDto() when $default != null:
return $default(_that.name,_that.id,_that.userId,_that.legalType,_that.taxType,_that.taxRate,_that.unitMaintenanceCost,_that.organizationName,_that.organizationTin,_that.isActive,_that.wbApiKey,_that.ozonClientId,_that.ozonApiKey,_that.wbApiActive,_that.ozonApiActive,_that.ozonPerformanceClientId,_that.ozonPerformanceClientSecret);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CabinetDto implements CabinetDto {
  const _CabinetDto({@JsonKey(name: 'name') required this.name, @JsonKey(name: 'id') this.id, @JsonKey(name: 'userId') this.userId, @JsonKey(name: 'legalType') this.legalType, @JsonKey(name: 'taxType') this.taxType, @JsonKey(name: 'taxRate') this.taxRate, @JsonKey(name: 'unitMaintenanceCost') this.unitMaintenanceCost, @JsonKey(name: 'organizationName') this.organizationName, @JsonKey(name: 'organizationINN') this.organizationTin, @JsonKey(name: 'isActive') this.isActive, @JsonKey(name: 'wbApiKey') this.wbApiKey, @JsonKey(name: 'ozonClientId') this.ozonClientId, @JsonKey(name: 'ozonApiKey') this.ozonApiKey, @JsonKey(name: 'wbApiActive') this.wbApiActive, @JsonKey(name: 'ozonApiActive') this.ozonApiActive, @JsonKey(name: 'ozonPerformanceClientId') this.ozonPerformanceClientId, @JsonKey(name: 'ozonPerformanceClientSecret') this.ozonPerformanceClientSecret});
  factory _CabinetDto.fromJson(Map<String, dynamic> json) => _$CabinetDtoFromJson(json);

@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'id') final  String? id;
@override@JsonKey(name: 'userId') final  String? userId;
@override@JsonKey(name: 'legalType') final  int? legalType;
@override@JsonKey(name: 'taxType') final  int? taxType;
@override@JsonKey(name: 'taxRate') final  int? taxRate;
@override@JsonKey(name: 'unitMaintenanceCost') final  int? unitMaintenanceCost;
@override@JsonKey(name: 'organizationName') final  String? organizationName;
@override@JsonKey(name: 'organizationINN') final  String? organizationTin;
@override@JsonKey(name: 'isActive') final  bool? isActive;
@override@JsonKey(name: 'wbApiKey') final  String? wbApiKey;
@override@JsonKey(name: 'ozonClientId') final  String? ozonClientId;
@override@JsonKey(name: 'ozonApiKey') final  String? ozonApiKey;
@override@JsonKey(name: 'wbApiActive') final  bool? wbApiActive;
@override@JsonKey(name: 'ozonApiActive') final  bool? ozonApiActive;
@override@JsonKey(name: 'ozonPerformanceClientId') final  String? ozonPerformanceClientId;
@override@JsonKey(name: 'ozonPerformanceClientSecret') final  String? ozonPerformanceClientSecret;

/// Create a copy of CabinetDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CabinetDtoCopyWith<_CabinetDto> get copyWith => __$CabinetDtoCopyWithImpl<_CabinetDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CabinetDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CabinetDto&&(identical(other.name, name) || other.name == name)&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.legalType, legalType) || other.legalType == legalType)&&(identical(other.taxType, taxType) || other.taxType == taxType)&&(identical(other.taxRate, taxRate) || other.taxRate == taxRate)&&(identical(other.unitMaintenanceCost, unitMaintenanceCost) || other.unitMaintenanceCost == unitMaintenanceCost)&&(identical(other.organizationName, organizationName) || other.organizationName == organizationName)&&(identical(other.organizationTin, organizationTin) || other.organizationTin == organizationTin)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.wbApiKey, wbApiKey) || other.wbApiKey == wbApiKey)&&(identical(other.ozonClientId, ozonClientId) || other.ozonClientId == ozonClientId)&&(identical(other.ozonApiKey, ozonApiKey) || other.ozonApiKey == ozonApiKey)&&(identical(other.wbApiActive, wbApiActive) || other.wbApiActive == wbApiActive)&&(identical(other.ozonApiActive, ozonApiActive) || other.ozonApiActive == ozonApiActive)&&(identical(other.ozonPerformanceClientId, ozonPerformanceClientId) || other.ozonPerformanceClientId == ozonPerformanceClientId)&&(identical(other.ozonPerformanceClientSecret, ozonPerformanceClientSecret) || other.ozonPerformanceClientSecret == ozonPerformanceClientSecret));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,id,userId,legalType,taxType,taxRate,unitMaintenanceCost,organizationName,organizationTin,isActive,wbApiKey,ozonClientId,ozonApiKey,wbApiActive,ozonApiActive,ozonPerformanceClientId,ozonPerformanceClientSecret);

@override
String toString() {
  return 'CabinetDto(name: $name, id: $id, userId: $userId, legalType: $legalType, taxType: $taxType, taxRate: $taxRate, unitMaintenanceCost: $unitMaintenanceCost, organizationName: $organizationName, organizationTin: $organizationTin, isActive: $isActive, wbApiKey: $wbApiKey, ozonClientId: $ozonClientId, ozonApiKey: $ozonApiKey, wbApiActive: $wbApiActive, ozonApiActive: $ozonApiActive, ozonPerformanceClientId: $ozonPerformanceClientId, ozonPerformanceClientSecret: $ozonPerformanceClientSecret)';
}


}

/// @nodoc
abstract mixin class _$CabinetDtoCopyWith<$Res> implements $CabinetDtoCopyWith<$Res> {
  factory _$CabinetDtoCopyWith(_CabinetDto value, $Res Function(_CabinetDto) _then) = __$CabinetDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'name') String name,@JsonKey(name: 'id') String? id,@JsonKey(name: 'userId') String? userId,@JsonKey(name: 'legalType') int? legalType,@JsonKey(name: 'taxType') int? taxType,@JsonKey(name: 'taxRate') int? taxRate,@JsonKey(name: 'unitMaintenanceCost') int? unitMaintenanceCost,@JsonKey(name: 'organizationName') String? organizationName,@JsonKey(name: 'organizationINN') String? organizationTin,@JsonKey(name: 'isActive') bool? isActive,@JsonKey(name: 'wbApiKey') String? wbApiKey,@JsonKey(name: 'ozonClientId') String? ozonClientId,@JsonKey(name: 'ozonApiKey') String? ozonApiKey,@JsonKey(name: 'wbApiActive') bool? wbApiActive,@JsonKey(name: 'ozonApiActive') bool? ozonApiActive,@JsonKey(name: 'ozonPerformanceClientId') String? ozonPerformanceClientId,@JsonKey(name: 'ozonPerformanceClientSecret') String? ozonPerformanceClientSecret
});




}
/// @nodoc
class __$CabinetDtoCopyWithImpl<$Res>
    implements _$CabinetDtoCopyWith<$Res> {
  __$CabinetDtoCopyWithImpl(this._self, this._then);

  final _CabinetDto _self;
  final $Res Function(_CabinetDto) _then;

/// Create a copy of CabinetDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? id = freezed,Object? userId = freezed,Object? legalType = freezed,Object? taxType = freezed,Object? taxRate = freezed,Object? unitMaintenanceCost = freezed,Object? organizationName = freezed,Object? organizationTin = freezed,Object? isActive = freezed,Object? wbApiKey = freezed,Object? ozonClientId = freezed,Object? ozonApiKey = freezed,Object? wbApiActive = freezed,Object? ozonApiActive = freezed,Object? ozonPerformanceClientId = freezed,Object? ozonPerformanceClientSecret = freezed,}) {
  return _then(_CabinetDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,legalType: freezed == legalType ? _self.legalType : legalType // ignore: cast_nullable_to_non_nullable
as int?,taxType: freezed == taxType ? _self.taxType : taxType // ignore: cast_nullable_to_non_nullable
as int?,taxRate: freezed == taxRate ? _self.taxRate : taxRate // ignore: cast_nullable_to_non_nullable
as int?,unitMaintenanceCost: freezed == unitMaintenanceCost ? _self.unitMaintenanceCost : unitMaintenanceCost // ignore: cast_nullable_to_non_nullable
as int?,organizationName: freezed == organizationName ? _self.organizationName : organizationName // ignore: cast_nullable_to_non_nullable
as String?,organizationTin: freezed == organizationTin ? _self.organizationTin : organizationTin // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,wbApiKey: freezed == wbApiKey ? _self.wbApiKey : wbApiKey // ignore: cast_nullable_to_non_nullable
as String?,ozonClientId: freezed == ozonClientId ? _self.ozonClientId : ozonClientId // ignore: cast_nullable_to_non_nullable
as String?,ozonApiKey: freezed == ozonApiKey ? _self.ozonApiKey : ozonApiKey // ignore: cast_nullable_to_non_nullable
as String?,wbApiActive: freezed == wbApiActive ? _self.wbApiActive : wbApiActive // ignore: cast_nullable_to_non_nullable
as bool?,ozonApiActive: freezed == ozonApiActive ? _self.ozonApiActive : ozonApiActive // ignore: cast_nullable_to_non_nullable
as bool?,ozonPerformanceClientId: freezed == ozonPerformanceClientId ? _self.ozonPerformanceClientId : ozonPerformanceClientId // ignore: cast_nullable_to_non_nullable
as String?,ozonPerformanceClientSecret: freezed == ozonPerformanceClientSecret ? _self.ozonPerformanceClientSecret : ozonPerformanceClientSecret // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
