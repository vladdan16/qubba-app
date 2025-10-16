// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_cabinet_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddCabinetRequestDto {

 String get name;@JsonKey(name: 'organization_name') String? get organizationName;@JsonKey(name: 'organization_inn') String? get organizationInn;@JsonKey(name: 'legal_type') int get legalType;@JsonKey(name: 'tax_type') int get taxType;@JsonKey(name: 'tax_rate') int get taxRate;@JsonKey(name: 'nds_rate') int get ndsRate;@JsonKey(name: 'tax_type_2024') int get taxType2024;@JsonKey(name: 'tax_rate_2024') int get taxRate2024;@JsonKey(name: 'unit_maintenance_cost') int get unitMaintenanceCost;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'wb_api_key') String? get wbApiKey;@JsonKey(name: 'wb_api_active') bool get wbApiActive;@JsonKey(name: 'ozon_client_id') String? get ozonClientId;@JsonKey(name: 'ozon_api_key') String? get ozonApiKey;@JsonKey(name: 'ozon_performance_client_id') String? get ozonPerformanceClientId;@JsonKey(name: 'ozon_performance_client_secret') String? get ozonPerformanceClientSecret;@JsonKey(name: 'ozon_api_active') bool get ozonApiActive;
/// Create a copy of AddCabinetRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddCabinetRequestDtoCopyWith<AddCabinetRequestDto> get copyWith => _$AddCabinetRequestDtoCopyWithImpl<AddCabinetRequestDto>(this as AddCabinetRequestDto, _$identity);

  /// Serializes this AddCabinetRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddCabinetRequestDto&&(identical(other.name, name) || other.name == name)&&(identical(other.organizationName, organizationName) || other.organizationName == organizationName)&&(identical(other.organizationInn, organizationInn) || other.organizationInn == organizationInn)&&(identical(other.legalType, legalType) || other.legalType == legalType)&&(identical(other.taxType, taxType) || other.taxType == taxType)&&(identical(other.taxRate, taxRate) || other.taxRate == taxRate)&&(identical(other.ndsRate, ndsRate) || other.ndsRate == ndsRate)&&(identical(other.taxType2024, taxType2024) || other.taxType2024 == taxType2024)&&(identical(other.taxRate2024, taxRate2024) || other.taxRate2024 == taxRate2024)&&(identical(other.unitMaintenanceCost, unitMaintenanceCost) || other.unitMaintenanceCost == unitMaintenanceCost)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.wbApiKey, wbApiKey) || other.wbApiKey == wbApiKey)&&(identical(other.wbApiActive, wbApiActive) || other.wbApiActive == wbApiActive)&&(identical(other.ozonClientId, ozonClientId) || other.ozonClientId == ozonClientId)&&(identical(other.ozonApiKey, ozonApiKey) || other.ozonApiKey == ozonApiKey)&&(identical(other.ozonPerformanceClientId, ozonPerformanceClientId) || other.ozonPerformanceClientId == ozonPerformanceClientId)&&(identical(other.ozonPerformanceClientSecret, ozonPerformanceClientSecret) || other.ozonPerformanceClientSecret == ozonPerformanceClientSecret)&&(identical(other.ozonApiActive, ozonApiActive) || other.ozonApiActive == ozonApiActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,organizationName,organizationInn,legalType,taxType,taxRate,ndsRate,taxType2024,taxRate2024,unitMaintenanceCost,isActive,wbApiKey,wbApiActive,ozonClientId,ozonApiKey,ozonPerformanceClientId,ozonPerformanceClientSecret,ozonApiActive);

@override
String toString() {
  return 'AddCabinetRequestDto(name: $name, organizationName: $organizationName, organizationInn: $organizationInn, legalType: $legalType, taxType: $taxType, taxRate: $taxRate, ndsRate: $ndsRate, taxType2024: $taxType2024, taxRate2024: $taxRate2024, unitMaintenanceCost: $unitMaintenanceCost, isActive: $isActive, wbApiKey: $wbApiKey, wbApiActive: $wbApiActive, ozonClientId: $ozonClientId, ozonApiKey: $ozonApiKey, ozonPerformanceClientId: $ozonPerformanceClientId, ozonPerformanceClientSecret: $ozonPerformanceClientSecret, ozonApiActive: $ozonApiActive)';
}


}

/// @nodoc
abstract mixin class $AddCabinetRequestDtoCopyWith<$Res>  {
  factory $AddCabinetRequestDtoCopyWith(AddCabinetRequestDto value, $Res Function(AddCabinetRequestDto) _then) = _$AddCabinetRequestDtoCopyWithImpl;
@useResult
$Res call({
 String name,@JsonKey(name: 'organization_name') String? organizationName,@JsonKey(name: 'organization_inn') String? organizationInn,@JsonKey(name: 'legal_type') int legalType,@JsonKey(name: 'tax_type') int taxType,@JsonKey(name: 'tax_rate') int taxRate,@JsonKey(name: 'nds_rate') int ndsRate,@JsonKey(name: 'tax_type_2024') int taxType2024,@JsonKey(name: 'tax_rate_2024') int taxRate2024,@JsonKey(name: 'unit_maintenance_cost') int unitMaintenanceCost,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'wb_api_key') String? wbApiKey,@JsonKey(name: 'wb_api_active') bool wbApiActive,@JsonKey(name: 'ozon_client_id') String? ozonClientId,@JsonKey(name: 'ozon_api_key') String? ozonApiKey,@JsonKey(name: 'ozon_performance_client_id') String? ozonPerformanceClientId,@JsonKey(name: 'ozon_performance_client_secret') String? ozonPerformanceClientSecret,@JsonKey(name: 'ozon_api_active') bool ozonApiActive
});




}
/// @nodoc
class _$AddCabinetRequestDtoCopyWithImpl<$Res>
    implements $AddCabinetRequestDtoCopyWith<$Res> {
  _$AddCabinetRequestDtoCopyWithImpl(this._self, this._then);

  final AddCabinetRequestDto _self;
  final $Res Function(AddCabinetRequestDto) _then;

/// Create a copy of AddCabinetRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? organizationName = freezed,Object? organizationInn = freezed,Object? legalType = null,Object? taxType = null,Object? taxRate = null,Object? ndsRate = null,Object? taxType2024 = null,Object? taxRate2024 = null,Object? unitMaintenanceCost = null,Object? isActive = null,Object? wbApiKey = freezed,Object? wbApiActive = null,Object? ozonClientId = freezed,Object? ozonApiKey = freezed,Object? ozonPerformanceClientId = freezed,Object? ozonPerformanceClientSecret = freezed,Object? ozonApiActive = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,organizationName: freezed == organizationName ? _self.organizationName : organizationName // ignore: cast_nullable_to_non_nullable
as String?,organizationInn: freezed == organizationInn ? _self.organizationInn : organizationInn // ignore: cast_nullable_to_non_nullable
as String?,legalType: null == legalType ? _self.legalType : legalType // ignore: cast_nullable_to_non_nullable
as int,taxType: null == taxType ? _self.taxType : taxType // ignore: cast_nullable_to_non_nullable
as int,taxRate: null == taxRate ? _self.taxRate : taxRate // ignore: cast_nullable_to_non_nullable
as int,ndsRate: null == ndsRate ? _self.ndsRate : ndsRate // ignore: cast_nullable_to_non_nullable
as int,taxType2024: null == taxType2024 ? _self.taxType2024 : taxType2024 // ignore: cast_nullable_to_non_nullable
as int,taxRate2024: null == taxRate2024 ? _self.taxRate2024 : taxRate2024 // ignore: cast_nullable_to_non_nullable
as int,unitMaintenanceCost: null == unitMaintenanceCost ? _self.unitMaintenanceCost : unitMaintenanceCost // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,wbApiKey: freezed == wbApiKey ? _self.wbApiKey : wbApiKey // ignore: cast_nullable_to_non_nullable
as String?,wbApiActive: null == wbApiActive ? _self.wbApiActive : wbApiActive // ignore: cast_nullable_to_non_nullable
as bool,ozonClientId: freezed == ozonClientId ? _self.ozonClientId : ozonClientId // ignore: cast_nullable_to_non_nullable
as String?,ozonApiKey: freezed == ozonApiKey ? _self.ozonApiKey : ozonApiKey // ignore: cast_nullable_to_non_nullable
as String?,ozonPerformanceClientId: freezed == ozonPerformanceClientId ? _self.ozonPerformanceClientId : ozonPerformanceClientId // ignore: cast_nullable_to_non_nullable
as String?,ozonPerformanceClientSecret: freezed == ozonPerformanceClientSecret ? _self.ozonPerformanceClientSecret : ozonPerformanceClientSecret // ignore: cast_nullable_to_non_nullable
as String?,ozonApiActive: null == ozonApiActive ? _self.ozonApiActive : ozonApiActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AddCabinetRequestDto].
extension AddCabinetRequestDtoPatterns on AddCabinetRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddCabinetRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddCabinetRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddCabinetRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _AddCabinetRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddCabinetRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _AddCabinetRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name, @JsonKey(name: 'organization_name')  String? organizationName, @JsonKey(name: 'organization_inn')  String? organizationInn, @JsonKey(name: 'legal_type')  int legalType, @JsonKey(name: 'tax_type')  int taxType, @JsonKey(name: 'tax_rate')  int taxRate, @JsonKey(name: 'nds_rate')  int ndsRate, @JsonKey(name: 'tax_type_2024')  int taxType2024, @JsonKey(name: 'tax_rate_2024')  int taxRate2024, @JsonKey(name: 'unit_maintenance_cost')  int unitMaintenanceCost, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'wb_api_key')  String? wbApiKey, @JsonKey(name: 'wb_api_active')  bool wbApiActive, @JsonKey(name: 'ozon_client_id')  String? ozonClientId, @JsonKey(name: 'ozon_api_key')  String? ozonApiKey, @JsonKey(name: 'ozon_performance_client_id')  String? ozonPerformanceClientId, @JsonKey(name: 'ozon_performance_client_secret')  String? ozonPerformanceClientSecret, @JsonKey(name: 'ozon_api_active')  bool ozonApiActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddCabinetRequestDto() when $default != null:
return $default(_that.name,_that.organizationName,_that.organizationInn,_that.legalType,_that.taxType,_that.taxRate,_that.ndsRate,_that.taxType2024,_that.taxRate2024,_that.unitMaintenanceCost,_that.isActive,_that.wbApiKey,_that.wbApiActive,_that.ozonClientId,_that.ozonApiKey,_that.ozonPerformanceClientId,_that.ozonPerformanceClientSecret,_that.ozonApiActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name, @JsonKey(name: 'organization_name')  String? organizationName, @JsonKey(name: 'organization_inn')  String? organizationInn, @JsonKey(name: 'legal_type')  int legalType, @JsonKey(name: 'tax_type')  int taxType, @JsonKey(name: 'tax_rate')  int taxRate, @JsonKey(name: 'nds_rate')  int ndsRate, @JsonKey(name: 'tax_type_2024')  int taxType2024, @JsonKey(name: 'tax_rate_2024')  int taxRate2024, @JsonKey(name: 'unit_maintenance_cost')  int unitMaintenanceCost, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'wb_api_key')  String? wbApiKey, @JsonKey(name: 'wb_api_active')  bool wbApiActive, @JsonKey(name: 'ozon_client_id')  String? ozonClientId, @JsonKey(name: 'ozon_api_key')  String? ozonApiKey, @JsonKey(name: 'ozon_performance_client_id')  String? ozonPerformanceClientId, @JsonKey(name: 'ozon_performance_client_secret')  String? ozonPerformanceClientSecret, @JsonKey(name: 'ozon_api_active')  bool ozonApiActive)  $default,) {final _that = this;
switch (_that) {
case _AddCabinetRequestDto():
return $default(_that.name,_that.organizationName,_that.organizationInn,_that.legalType,_that.taxType,_that.taxRate,_that.ndsRate,_that.taxType2024,_that.taxRate2024,_that.unitMaintenanceCost,_that.isActive,_that.wbApiKey,_that.wbApiActive,_that.ozonClientId,_that.ozonApiKey,_that.ozonPerformanceClientId,_that.ozonPerformanceClientSecret,_that.ozonApiActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name, @JsonKey(name: 'organization_name')  String? organizationName, @JsonKey(name: 'organization_inn')  String? organizationInn, @JsonKey(name: 'legal_type')  int legalType, @JsonKey(name: 'tax_type')  int taxType, @JsonKey(name: 'tax_rate')  int taxRate, @JsonKey(name: 'nds_rate')  int ndsRate, @JsonKey(name: 'tax_type_2024')  int taxType2024, @JsonKey(name: 'tax_rate_2024')  int taxRate2024, @JsonKey(name: 'unit_maintenance_cost')  int unitMaintenanceCost, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'wb_api_key')  String? wbApiKey, @JsonKey(name: 'wb_api_active')  bool wbApiActive, @JsonKey(name: 'ozon_client_id')  String? ozonClientId, @JsonKey(name: 'ozon_api_key')  String? ozonApiKey, @JsonKey(name: 'ozon_performance_client_id')  String? ozonPerformanceClientId, @JsonKey(name: 'ozon_performance_client_secret')  String? ozonPerformanceClientSecret, @JsonKey(name: 'ozon_api_active')  bool ozonApiActive)?  $default,) {final _that = this;
switch (_that) {
case _AddCabinetRequestDto() when $default != null:
return $default(_that.name,_that.organizationName,_that.organizationInn,_that.legalType,_that.taxType,_that.taxRate,_that.ndsRate,_that.taxType2024,_that.taxRate2024,_that.unitMaintenanceCost,_that.isActive,_that.wbApiKey,_that.wbApiActive,_that.ozonClientId,_that.ozonApiKey,_that.ozonPerformanceClientId,_that.ozonPerformanceClientSecret,_that.ozonApiActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AddCabinetRequestDto implements AddCabinetRequestDto {
  const _AddCabinetRequestDto({required this.name, @JsonKey(name: 'organization_name') this.organizationName, @JsonKey(name: 'organization_inn') this.organizationInn, @JsonKey(name: 'legal_type') required this.legalType, @JsonKey(name: 'tax_type') required this.taxType, @JsonKey(name: 'tax_rate') required this.taxRate, @JsonKey(name: 'nds_rate') required this.ndsRate, @JsonKey(name: 'tax_type_2024') required this.taxType2024, @JsonKey(name: 'tax_rate_2024') required this.taxRate2024, @JsonKey(name: 'unit_maintenance_cost') this.unitMaintenanceCost = 0, @JsonKey(name: 'is_active') this.isActive = true, @JsonKey(name: 'wb_api_key') this.wbApiKey, @JsonKey(name: 'wb_api_active') this.wbApiActive = false, @JsonKey(name: 'ozon_client_id') this.ozonClientId, @JsonKey(name: 'ozon_api_key') this.ozonApiKey, @JsonKey(name: 'ozon_performance_client_id') this.ozonPerformanceClientId, @JsonKey(name: 'ozon_performance_client_secret') this.ozonPerformanceClientSecret, @JsonKey(name: 'ozon_api_active') this.ozonApiActive = false});
  factory _AddCabinetRequestDto.fromJson(Map<String, dynamic> json) => _$AddCabinetRequestDtoFromJson(json);

@override final  String name;
@override@JsonKey(name: 'organization_name') final  String? organizationName;
@override@JsonKey(name: 'organization_inn') final  String? organizationInn;
@override@JsonKey(name: 'legal_type') final  int legalType;
@override@JsonKey(name: 'tax_type') final  int taxType;
@override@JsonKey(name: 'tax_rate') final  int taxRate;
@override@JsonKey(name: 'nds_rate') final  int ndsRate;
@override@JsonKey(name: 'tax_type_2024') final  int taxType2024;
@override@JsonKey(name: 'tax_rate_2024') final  int taxRate2024;
@override@JsonKey(name: 'unit_maintenance_cost') final  int unitMaintenanceCost;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'wb_api_key') final  String? wbApiKey;
@override@JsonKey(name: 'wb_api_active') final  bool wbApiActive;
@override@JsonKey(name: 'ozon_client_id') final  String? ozonClientId;
@override@JsonKey(name: 'ozon_api_key') final  String? ozonApiKey;
@override@JsonKey(name: 'ozon_performance_client_id') final  String? ozonPerformanceClientId;
@override@JsonKey(name: 'ozon_performance_client_secret') final  String? ozonPerformanceClientSecret;
@override@JsonKey(name: 'ozon_api_active') final  bool ozonApiActive;

/// Create a copy of AddCabinetRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddCabinetRequestDtoCopyWith<_AddCabinetRequestDto> get copyWith => __$AddCabinetRequestDtoCopyWithImpl<_AddCabinetRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddCabinetRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddCabinetRequestDto&&(identical(other.name, name) || other.name == name)&&(identical(other.organizationName, organizationName) || other.organizationName == organizationName)&&(identical(other.organizationInn, organizationInn) || other.organizationInn == organizationInn)&&(identical(other.legalType, legalType) || other.legalType == legalType)&&(identical(other.taxType, taxType) || other.taxType == taxType)&&(identical(other.taxRate, taxRate) || other.taxRate == taxRate)&&(identical(other.ndsRate, ndsRate) || other.ndsRate == ndsRate)&&(identical(other.taxType2024, taxType2024) || other.taxType2024 == taxType2024)&&(identical(other.taxRate2024, taxRate2024) || other.taxRate2024 == taxRate2024)&&(identical(other.unitMaintenanceCost, unitMaintenanceCost) || other.unitMaintenanceCost == unitMaintenanceCost)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.wbApiKey, wbApiKey) || other.wbApiKey == wbApiKey)&&(identical(other.wbApiActive, wbApiActive) || other.wbApiActive == wbApiActive)&&(identical(other.ozonClientId, ozonClientId) || other.ozonClientId == ozonClientId)&&(identical(other.ozonApiKey, ozonApiKey) || other.ozonApiKey == ozonApiKey)&&(identical(other.ozonPerformanceClientId, ozonPerformanceClientId) || other.ozonPerformanceClientId == ozonPerformanceClientId)&&(identical(other.ozonPerformanceClientSecret, ozonPerformanceClientSecret) || other.ozonPerformanceClientSecret == ozonPerformanceClientSecret)&&(identical(other.ozonApiActive, ozonApiActive) || other.ozonApiActive == ozonApiActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,organizationName,organizationInn,legalType,taxType,taxRate,ndsRate,taxType2024,taxRate2024,unitMaintenanceCost,isActive,wbApiKey,wbApiActive,ozonClientId,ozonApiKey,ozonPerformanceClientId,ozonPerformanceClientSecret,ozonApiActive);

@override
String toString() {
  return 'AddCabinetRequestDto(name: $name, organizationName: $organizationName, organizationInn: $organizationInn, legalType: $legalType, taxType: $taxType, taxRate: $taxRate, ndsRate: $ndsRate, taxType2024: $taxType2024, taxRate2024: $taxRate2024, unitMaintenanceCost: $unitMaintenanceCost, isActive: $isActive, wbApiKey: $wbApiKey, wbApiActive: $wbApiActive, ozonClientId: $ozonClientId, ozonApiKey: $ozonApiKey, ozonPerformanceClientId: $ozonPerformanceClientId, ozonPerformanceClientSecret: $ozonPerformanceClientSecret, ozonApiActive: $ozonApiActive)';
}


}

/// @nodoc
abstract mixin class _$AddCabinetRequestDtoCopyWith<$Res> implements $AddCabinetRequestDtoCopyWith<$Res> {
  factory _$AddCabinetRequestDtoCopyWith(_AddCabinetRequestDto value, $Res Function(_AddCabinetRequestDto) _then) = __$AddCabinetRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 String name,@JsonKey(name: 'organization_name') String? organizationName,@JsonKey(name: 'organization_inn') String? organizationInn,@JsonKey(name: 'legal_type') int legalType,@JsonKey(name: 'tax_type') int taxType,@JsonKey(name: 'tax_rate') int taxRate,@JsonKey(name: 'nds_rate') int ndsRate,@JsonKey(name: 'tax_type_2024') int taxType2024,@JsonKey(name: 'tax_rate_2024') int taxRate2024,@JsonKey(name: 'unit_maintenance_cost') int unitMaintenanceCost,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'wb_api_key') String? wbApiKey,@JsonKey(name: 'wb_api_active') bool wbApiActive,@JsonKey(name: 'ozon_client_id') String? ozonClientId,@JsonKey(name: 'ozon_api_key') String? ozonApiKey,@JsonKey(name: 'ozon_performance_client_id') String? ozonPerformanceClientId,@JsonKey(name: 'ozon_performance_client_secret') String? ozonPerformanceClientSecret,@JsonKey(name: 'ozon_api_active') bool ozonApiActive
});




}
/// @nodoc
class __$AddCabinetRequestDtoCopyWithImpl<$Res>
    implements _$AddCabinetRequestDtoCopyWith<$Res> {
  __$AddCabinetRequestDtoCopyWithImpl(this._self, this._then);

  final _AddCabinetRequestDto _self;
  final $Res Function(_AddCabinetRequestDto) _then;

/// Create a copy of AddCabinetRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? organizationName = freezed,Object? organizationInn = freezed,Object? legalType = null,Object? taxType = null,Object? taxRate = null,Object? ndsRate = null,Object? taxType2024 = null,Object? taxRate2024 = null,Object? unitMaintenanceCost = null,Object? isActive = null,Object? wbApiKey = freezed,Object? wbApiActive = null,Object? ozonClientId = freezed,Object? ozonApiKey = freezed,Object? ozonPerformanceClientId = freezed,Object? ozonPerformanceClientSecret = freezed,Object? ozonApiActive = null,}) {
  return _then(_AddCabinetRequestDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,organizationName: freezed == organizationName ? _self.organizationName : organizationName // ignore: cast_nullable_to_non_nullable
as String?,organizationInn: freezed == organizationInn ? _self.organizationInn : organizationInn // ignore: cast_nullable_to_non_nullable
as String?,legalType: null == legalType ? _self.legalType : legalType // ignore: cast_nullable_to_non_nullable
as int,taxType: null == taxType ? _self.taxType : taxType // ignore: cast_nullable_to_non_nullable
as int,taxRate: null == taxRate ? _self.taxRate : taxRate // ignore: cast_nullable_to_non_nullable
as int,ndsRate: null == ndsRate ? _self.ndsRate : ndsRate // ignore: cast_nullable_to_non_nullable
as int,taxType2024: null == taxType2024 ? _self.taxType2024 : taxType2024 // ignore: cast_nullable_to_non_nullable
as int,taxRate2024: null == taxRate2024 ? _self.taxRate2024 : taxRate2024 // ignore: cast_nullable_to_non_nullable
as int,unitMaintenanceCost: null == unitMaintenanceCost ? _self.unitMaintenanceCost : unitMaintenanceCost // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,wbApiKey: freezed == wbApiKey ? _self.wbApiKey : wbApiKey // ignore: cast_nullable_to_non_nullable
as String?,wbApiActive: null == wbApiActive ? _self.wbApiActive : wbApiActive // ignore: cast_nullable_to_non_nullable
as bool,ozonClientId: freezed == ozonClientId ? _self.ozonClientId : ozonClientId // ignore: cast_nullable_to_non_nullable
as String?,ozonApiKey: freezed == ozonApiKey ? _self.ozonApiKey : ozonApiKey // ignore: cast_nullable_to_non_nullable
as String?,ozonPerformanceClientId: freezed == ozonPerformanceClientId ? _self.ozonPerformanceClientId : ozonPerformanceClientId // ignore: cast_nullable_to_non_nullable
as String?,ozonPerformanceClientSecret: freezed == ozonPerformanceClientSecret ? _self.ozonPerformanceClientSecret : ozonPerformanceClientSecret // ignore: cast_nullable_to_non_nullable
as String?,ozonApiActive: null == ozonApiActive ? _self.ozonApiActive : ozonApiActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
