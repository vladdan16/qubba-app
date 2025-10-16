// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_cabinet_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateCabinetRequestDto {

 String get name; String? get description; String? get address; String? get phone; String? get email;
/// Create a copy of UpdateCabinetRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateCabinetRequestDtoCopyWith<UpdateCabinetRequestDto> get copyWith => _$UpdateCabinetRequestDtoCopyWithImpl<UpdateCabinetRequestDto>(this as UpdateCabinetRequestDto, _$identity);

  /// Serializes this UpdateCabinetRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateCabinetRequestDto&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.address, address) || other.address == address)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,address,phone,email);

@override
String toString() {
  return 'UpdateCabinetRequestDto(name: $name, description: $description, address: $address, phone: $phone, email: $email)';
}


}

/// @nodoc
abstract mixin class $UpdateCabinetRequestDtoCopyWith<$Res>  {
  factory $UpdateCabinetRequestDtoCopyWith(UpdateCabinetRequestDto value, $Res Function(UpdateCabinetRequestDto) _then) = _$UpdateCabinetRequestDtoCopyWithImpl;
@useResult
$Res call({
 String name, String? description, String? address, String? phone, String? email
});




}
/// @nodoc
class _$UpdateCabinetRequestDtoCopyWithImpl<$Res>
    implements $UpdateCabinetRequestDtoCopyWith<$Res> {
  _$UpdateCabinetRequestDtoCopyWithImpl(this._self, this._then);

  final UpdateCabinetRequestDto _self;
  final $Res Function(UpdateCabinetRequestDto) _then;

/// Create a copy of UpdateCabinetRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = freezed,Object? address = freezed,Object? phone = freezed,Object? email = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateCabinetRequestDto].
extension UpdateCabinetRequestDtoPatterns on UpdateCabinetRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateCabinetRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateCabinetRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateCabinetRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _UpdateCabinetRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateCabinetRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateCabinetRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? description,  String? address,  String? phone,  String? email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateCabinetRequestDto() when $default != null:
return $default(_that.name,_that.description,_that.address,_that.phone,_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? description,  String? address,  String? phone,  String? email)  $default,) {final _that = this;
switch (_that) {
case _UpdateCabinetRequestDto():
return $default(_that.name,_that.description,_that.address,_that.phone,_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? description,  String? address,  String? phone,  String? email)?  $default,) {final _that = this;
switch (_that) {
case _UpdateCabinetRequestDto() when $default != null:
return $default(_that.name,_that.description,_that.address,_that.phone,_that.email);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateCabinetRequestDto implements UpdateCabinetRequestDto {
  const _UpdateCabinetRequestDto({required this.name, this.description, this.address, this.phone, this.email});
  factory _UpdateCabinetRequestDto.fromJson(Map<String, dynamic> json) => _$UpdateCabinetRequestDtoFromJson(json);

@override final  String name;
@override final  String? description;
@override final  String? address;
@override final  String? phone;
@override final  String? email;

/// Create a copy of UpdateCabinetRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateCabinetRequestDtoCopyWith<_UpdateCabinetRequestDto> get copyWith => __$UpdateCabinetRequestDtoCopyWithImpl<_UpdateCabinetRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateCabinetRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateCabinetRequestDto&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.address, address) || other.address == address)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,address,phone,email);

@override
String toString() {
  return 'UpdateCabinetRequestDto(name: $name, description: $description, address: $address, phone: $phone, email: $email)';
}


}

/// @nodoc
abstract mixin class _$UpdateCabinetRequestDtoCopyWith<$Res> implements $UpdateCabinetRequestDtoCopyWith<$Res> {
  factory _$UpdateCabinetRequestDtoCopyWith(_UpdateCabinetRequestDto value, $Res Function(_UpdateCabinetRequestDto) _then) = __$UpdateCabinetRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 String name, String? description, String? address, String? phone, String? email
});




}
/// @nodoc
class __$UpdateCabinetRequestDtoCopyWithImpl<$Res>
    implements _$UpdateCabinetRequestDtoCopyWith<$Res> {
  __$UpdateCabinetRequestDtoCopyWithImpl(this._self, this._then);

  final _UpdateCabinetRequestDto _self;
  final $Res Function(_UpdateCabinetRequestDto) _then;

/// Create a copy of UpdateCabinetRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = freezed,Object? address = freezed,Object? phone = freezed,Object? email = freezed,}) {
  return _then(_UpdateCabinetRequestDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
