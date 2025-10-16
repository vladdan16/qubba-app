// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cabinet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Cabinet {

 String get id; String get name; String? get organizationName; String? get organizationInn; int? get legalType; int? get taxType; int? get taxRate; int? get ndsRate; int? get taxType2024; int? get taxRate2024; int? get unitMaintenanceCost; bool? get isActive; String? get wbApiKey; bool? get wbApiActive; String? get ozonClientId; String? get ozonApiKey; String? get ozonPerformanceClientId; String? get ozonPerformanceClientSecret; bool? get ozonApiActive; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of Cabinet
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CabinetCopyWith<Cabinet> get copyWith => _$CabinetCopyWithImpl<Cabinet>(this as Cabinet, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Cabinet&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.organizationName, organizationName) || other.organizationName == organizationName)&&(identical(other.organizationInn, organizationInn) || other.organizationInn == organizationInn)&&(identical(other.legalType, legalType) || other.legalType == legalType)&&(identical(other.taxType, taxType) || other.taxType == taxType)&&(identical(other.taxRate, taxRate) || other.taxRate == taxRate)&&(identical(other.ndsRate, ndsRate) || other.ndsRate == ndsRate)&&(identical(other.taxType2024, taxType2024) || other.taxType2024 == taxType2024)&&(identical(other.taxRate2024, taxRate2024) || other.taxRate2024 == taxRate2024)&&(identical(other.unitMaintenanceCost, unitMaintenanceCost) || other.unitMaintenanceCost == unitMaintenanceCost)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.wbApiKey, wbApiKey) || other.wbApiKey == wbApiKey)&&(identical(other.wbApiActive, wbApiActive) || other.wbApiActive == wbApiActive)&&(identical(other.ozonClientId, ozonClientId) || other.ozonClientId == ozonClientId)&&(identical(other.ozonApiKey, ozonApiKey) || other.ozonApiKey == ozonApiKey)&&(identical(other.ozonPerformanceClientId, ozonPerformanceClientId) || other.ozonPerformanceClientId == ozonPerformanceClientId)&&(identical(other.ozonPerformanceClientSecret, ozonPerformanceClientSecret) || other.ozonPerformanceClientSecret == ozonPerformanceClientSecret)&&(identical(other.ozonApiActive, ozonApiActive) || other.ozonApiActive == ozonApiActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,name,organizationName,organizationInn,legalType,taxType,taxRate,ndsRate,taxType2024,taxRate2024,unitMaintenanceCost,isActive,wbApiKey,wbApiActive,ozonClientId,ozonApiKey,ozonPerformanceClientId,ozonPerformanceClientSecret,ozonApiActive,createdAt,updatedAt]);

@override
String toString() {
  return 'Cabinet(id: $id, name: $name, organizationName: $organizationName, organizationInn: $organizationInn, legalType: $legalType, taxType: $taxType, taxRate: $taxRate, ndsRate: $ndsRate, taxType2024: $taxType2024, taxRate2024: $taxRate2024, unitMaintenanceCost: $unitMaintenanceCost, isActive: $isActive, wbApiKey: $wbApiKey, wbApiActive: $wbApiActive, ozonClientId: $ozonClientId, ozonApiKey: $ozonApiKey, ozonPerformanceClientId: $ozonPerformanceClientId, ozonPerformanceClientSecret: $ozonPerformanceClientSecret, ozonApiActive: $ozonApiActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CabinetCopyWith<$Res>  {
  factory $CabinetCopyWith(Cabinet value, $Res Function(Cabinet) _then) = _$CabinetCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? organizationName, String? organizationInn, int? legalType, int? taxType, int? taxRate, int? ndsRate, int? taxType2024, int? taxRate2024, int? unitMaintenanceCost, bool? isActive, String? wbApiKey, bool? wbApiActive, String? ozonClientId, String? ozonApiKey, String? ozonPerformanceClientId, String? ozonPerformanceClientSecret, bool? ozonApiActive, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$CabinetCopyWithImpl<$Res>
    implements $CabinetCopyWith<$Res> {
  _$CabinetCopyWithImpl(this._self, this._then);

  final Cabinet _self;
  final $Res Function(Cabinet) _then;

/// Create a copy of Cabinet
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? organizationName = freezed,Object? organizationInn = freezed,Object? legalType = freezed,Object? taxType = freezed,Object? taxRate = freezed,Object? ndsRate = freezed,Object? taxType2024 = freezed,Object? taxRate2024 = freezed,Object? unitMaintenanceCost = freezed,Object? isActive = freezed,Object? wbApiKey = freezed,Object? wbApiActive = freezed,Object? ozonClientId = freezed,Object? ozonApiKey = freezed,Object? ozonPerformanceClientId = freezed,Object? ozonPerformanceClientSecret = freezed,Object? ozonApiActive = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,organizationName: freezed == organizationName ? _self.organizationName : organizationName // ignore: cast_nullable_to_non_nullable
as String?,organizationInn: freezed == organizationInn ? _self.organizationInn : organizationInn // ignore: cast_nullable_to_non_nullable
as String?,legalType: freezed == legalType ? _self.legalType : legalType // ignore: cast_nullable_to_non_nullable
as int?,taxType: freezed == taxType ? _self.taxType : taxType // ignore: cast_nullable_to_non_nullable
as int?,taxRate: freezed == taxRate ? _self.taxRate : taxRate // ignore: cast_nullable_to_non_nullable
as int?,ndsRate: freezed == ndsRate ? _self.ndsRate : ndsRate // ignore: cast_nullable_to_non_nullable
as int?,taxType2024: freezed == taxType2024 ? _self.taxType2024 : taxType2024 // ignore: cast_nullable_to_non_nullable
as int?,taxRate2024: freezed == taxRate2024 ? _self.taxRate2024 : taxRate2024 // ignore: cast_nullable_to_non_nullable
as int?,unitMaintenanceCost: freezed == unitMaintenanceCost ? _self.unitMaintenanceCost : unitMaintenanceCost // ignore: cast_nullable_to_non_nullable
as int?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,wbApiKey: freezed == wbApiKey ? _self.wbApiKey : wbApiKey // ignore: cast_nullable_to_non_nullable
as String?,wbApiActive: freezed == wbApiActive ? _self.wbApiActive : wbApiActive // ignore: cast_nullable_to_non_nullable
as bool?,ozonClientId: freezed == ozonClientId ? _self.ozonClientId : ozonClientId // ignore: cast_nullable_to_non_nullable
as String?,ozonApiKey: freezed == ozonApiKey ? _self.ozonApiKey : ozonApiKey // ignore: cast_nullable_to_non_nullable
as String?,ozonPerformanceClientId: freezed == ozonPerformanceClientId ? _self.ozonPerformanceClientId : ozonPerformanceClientId // ignore: cast_nullable_to_non_nullable
as String?,ozonPerformanceClientSecret: freezed == ozonPerformanceClientSecret ? _self.ozonPerformanceClientSecret : ozonPerformanceClientSecret // ignore: cast_nullable_to_non_nullable
as String?,ozonApiActive: freezed == ozonApiActive ? _self.ozonApiActive : ozonApiActive // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Cabinet].
extension CabinetPatterns on Cabinet {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Cabinet value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Cabinet() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Cabinet value)  $default,){
final _that = this;
switch (_that) {
case _Cabinet():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Cabinet value)?  $default,){
final _that = this;
switch (_that) {
case _Cabinet() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? organizationName,  String? organizationInn,  int? legalType,  int? taxType,  int? taxRate,  int? ndsRate,  int? taxType2024,  int? taxRate2024,  int? unitMaintenanceCost,  bool? isActive,  String? wbApiKey,  bool? wbApiActive,  String? ozonClientId,  String? ozonApiKey,  String? ozonPerformanceClientId,  String? ozonPerformanceClientSecret,  bool? ozonApiActive,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Cabinet() when $default != null:
return $default(_that.id,_that.name,_that.organizationName,_that.organizationInn,_that.legalType,_that.taxType,_that.taxRate,_that.ndsRate,_that.taxType2024,_that.taxRate2024,_that.unitMaintenanceCost,_that.isActive,_that.wbApiKey,_that.wbApiActive,_that.ozonClientId,_that.ozonApiKey,_that.ozonPerformanceClientId,_that.ozonPerformanceClientSecret,_that.ozonApiActive,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? organizationName,  String? organizationInn,  int? legalType,  int? taxType,  int? taxRate,  int? ndsRate,  int? taxType2024,  int? taxRate2024,  int? unitMaintenanceCost,  bool? isActive,  String? wbApiKey,  bool? wbApiActive,  String? ozonClientId,  String? ozonApiKey,  String? ozonPerformanceClientId,  String? ozonPerformanceClientSecret,  bool? ozonApiActive,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Cabinet():
return $default(_that.id,_that.name,_that.organizationName,_that.organizationInn,_that.legalType,_that.taxType,_that.taxRate,_that.ndsRate,_that.taxType2024,_that.taxRate2024,_that.unitMaintenanceCost,_that.isActive,_that.wbApiKey,_that.wbApiActive,_that.ozonClientId,_that.ozonApiKey,_that.ozonPerformanceClientId,_that.ozonPerformanceClientSecret,_that.ozonApiActive,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? organizationName,  String? organizationInn,  int? legalType,  int? taxType,  int? taxRate,  int? ndsRate,  int? taxType2024,  int? taxRate2024,  int? unitMaintenanceCost,  bool? isActive,  String? wbApiKey,  bool? wbApiActive,  String? ozonClientId,  String? ozonApiKey,  String? ozonPerformanceClientId,  String? ozonPerformanceClientSecret,  bool? ozonApiActive,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Cabinet() when $default != null:
return $default(_that.id,_that.name,_that.organizationName,_that.organizationInn,_that.legalType,_that.taxType,_that.taxRate,_that.ndsRate,_that.taxType2024,_that.taxRate2024,_that.unitMaintenanceCost,_that.isActive,_that.wbApiKey,_that.wbApiActive,_that.ozonClientId,_that.ozonApiKey,_that.ozonPerformanceClientId,_that.ozonPerformanceClientSecret,_that.ozonApiActive,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _Cabinet implements Cabinet {
  const _Cabinet({required this.id, required this.name, this.organizationName, this.organizationInn, this.legalType, this.taxType, this.taxRate, this.ndsRate, this.taxType2024, this.taxRate2024, this.unitMaintenanceCost, this.isActive, this.wbApiKey, this.wbApiActive, this.ozonClientId, this.ozonApiKey, this.ozonPerformanceClientId, this.ozonPerformanceClientSecret, this.ozonApiActive, this.createdAt, this.updatedAt});
  

@override final  String id;
@override final  String name;
@override final  String? organizationName;
@override final  String? organizationInn;
@override final  int? legalType;
@override final  int? taxType;
@override final  int? taxRate;
@override final  int? ndsRate;
@override final  int? taxType2024;
@override final  int? taxRate2024;
@override final  int? unitMaintenanceCost;
@override final  bool? isActive;
@override final  String? wbApiKey;
@override final  bool? wbApiActive;
@override final  String? ozonClientId;
@override final  String? ozonApiKey;
@override final  String? ozonPerformanceClientId;
@override final  String? ozonPerformanceClientSecret;
@override final  bool? ozonApiActive;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of Cabinet
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CabinetCopyWith<_Cabinet> get copyWith => __$CabinetCopyWithImpl<_Cabinet>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Cabinet&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.organizationName, organizationName) || other.organizationName == organizationName)&&(identical(other.organizationInn, organizationInn) || other.organizationInn == organizationInn)&&(identical(other.legalType, legalType) || other.legalType == legalType)&&(identical(other.taxType, taxType) || other.taxType == taxType)&&(identical(other.taxRate, taxRate) || other.taxRate == taxRate)&&(identical(other.ndsRate, ndsRate) || other.ndsRate == ndsRate)&&(identical(other.taxType2024, taxType2024) || other.taxType2024 == taxType2024)&&(identical(other.taxRate2024, taxRate2024) || other.taxRate2024 == taxRate2024)&&(identical(other.unitMaintenanceCost, unitMaintenanceCost) || other.unitMaintenanceCost == unitMaintenanceCost)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.wbApiKey, wbApiKey) || other.wbApiKey == wbApiKey)&&(identical(other.wbApiActive, wbApiActive) || other.wbApiActive == wbApiActive)&&(identical(other.ozonClientId, ozonClientId) || other.ozonClientId == ozonClientId)&&(identical(other.ozonApiKey, ozonApiKey) || other.ozonApiKey == ozonApiKey)&&(identical(other.ozonPerformanceClientId, ozonPerformanceClientId) || other.ozonPerformanceClientId == ozonPerformanceClientId)&&(identical(other.ozonPerformanceClientSecret, ozonPerformanceClientSecret) || other.ozonPerformanceClientSecret == ozonPerformanceClientSecret)&&(identical(other.ozonApiActive, ozonApiActive) || other.ozonApiActive == ozonApiActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,name,organizationName,organizationInn,legalType,taxType,taxRate,ndsRate,taxType2024,taxRate2024,unitMaintenanceCost,isActive,wbApiKey,wbApiActive,ozonClientId,ozonApiKey,ozonPerformanceClientId,ozonPerformanceClientSecret,ozonApiActive,createdAt,updatedAt]);

@override
String toString() {
  return 'Cabinet(id: $id, name: $name, organizationName: $organizationName, organizationInn: $organizationInn, legalType: $legalType, taxType: $taxType, taxRate: $taxRate, ndsRate: $ndsRate, taxType2024: $taxType2024, taxRate2024: $taxRate2024, unitMaintenanceCost: $unitMaintenanceCost, isActive: $isActive, wbApiKey: $wbApiKey, wbApiActive: $wbApiActive, ozonClientId: $ozonClientId, ozonApiKey: $ozonApiKey, ozonPerformanceClientId: $ozonPerformanceClientId, ozonPerformanceClientSecret: $ozonPerformanceClientSecret, ozonApiActive: $ozonApiActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CabinetCopyWith<$Res> implements $CabinetCopyWith<$Res> {
  factory _$CabinetCopyWith(_Cabinet value, $Res Function(_Cabinet) _then) = __$CabinetCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? organizationName, String? organizationInn, int? legalType, int? taxType, int? taxRate, int? ndsRate, int? taxType2024, int? taxRate2024, int? unitMaintenanceCost, bool? isActive, String? wbApiKey, bool? wbApiActive, String? ozonClientId, String? ozonApiKey, String? ozonPerformanceClientId, String? ozonPerformanceClientSecret, bool? ozonApiActive, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$CabinetCopyWithImpl<$Res>
    implements _$CabinetCopyWith<$Res> {
  __$CabinetCopyWithImpl(this._self, this._then);

  final _Cabinet _self;
  final $Res Function(_Cabinet) _then;

/// Create a copy of Cabinet
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? organizationName = freezed,Object? organizationInn = freezed,Object? legalType = freezed,Object? taxType = freezed,Object? taxRate = freezed,Object? ndsRate = freezed,Object? taxType2024 = freezed,Object? taxRate2024 = freezed,Object? unitMaintenanceCost = freezed,Object? isActive = freezed,Object? wbApiKey = freezed,Object? wbApiActive = freezed,Object? ozonClientId = freezed,Object? ozonApiKey = freezed,Object? ozonPerformanceClientId = freezed,Object? ozonPerformanceClientSecret = freezed,Object? ozonApiActive = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_Cabinet(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,organizationName: freezed == organizationName ? _self.organizationName : organizationName // ignore: cast_nullable_to_non_nullable
as String?,organizationInn: freezed == organizationInn ? _self.organizationInn : organizationInn // ignore: cast_nullable_to_non_nullable
as String?,legalType: freezed == legalType ? _self.legalType : legalType // ignore: cast_nullable_to_non_nullable
as int?,taxType: freezed == taxType ? _self.taxType : taxType // ignore: cast_nullable_to_non_nullable
as int?,taxRate: freezed == taxRate ? _self.taxRate : taxRate // ignore: cast_nullable_to_non_nullable
as int?,ndsRate: freezed == ndsRate ? _self.ndsRate : ndsRate // ignore: cast_nullable_to_non_nullable
as int?,taxType2024: freezed == taxType2024 ? _self.taxType2024 : taxType2024 // ignore: cast_nullable_to_non_nullable
as int?,taxRate2024: freezed == taxRate2024 ? _self.taxRate2024 : taxRate2024 // ignore: cast_nullable_to_non_nullable
as int?,unitMaintenanceCost: freezed == unitMaintenanceCost ? _self.unitMaintenanceCost : unitMaintenanceCost // ignore: cast_nullable_to_non_nullable
as int?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,wbApiKey: freezed == wbApiKey ? _self.wbApiKey : wbApiKey // ignore: cast_nullable_to_non_nullable
as String?,wbApiActive: freezed == wbApiActive ? _self.wbApiActive : wbApiActive // ignore: cast_nullable_to_non_nullable
as bool?,ozonClientId: freezed == ozonClientId ? _self.ozonClientId : ozonClientId // ignore: cast_nullable_to_non_nullable
as String?,ozonApiKey: freezed == ozonApiKey ? _self.ozonApiKey : ozonApiKey // ignore: cast_nullable_to_non_nullable
as String?,ozonPerformanceClientId: freezed == ozonPerformanceClientId ? _self.ozonPerformanceClientId : ozonPerformanceClientId // ignore: cast_nullable_to_non_nullable
as String?,ozonPerformanceClientSecret: freezed == ozonPerformanceClientSecret ? _self.ozonPerformanceClientSecret : ozonPerformanceClientSecret // ignore: cast_nullable_to_non_nullable
as String?,ozonApiActive: freezed == ozonApiActive ? _self.ozonApiActive : ozonApiActive // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
