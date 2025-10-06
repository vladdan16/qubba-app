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

 String get id; String get name; String? get description; String? get address; String? get phone; String? get email; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of Cabinet
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CabinetCopyWith<Cabinet> get copyWith => _$CabinetCopyWithImpl<Cabinet>(this as Cabinet, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Cabinet&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.address, address) || other.address == address)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,address,phone,email,createdAt,updatedAt);

@override
String toString() {
  return 'Cabinet(id: $id, name: $name, description: $description, address: $address, phone: $phone, email: $email, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CabinetCopyWith<$Res>  {
  factory $CabinetCopyWith(Cabinet value, $Res Function(Cabinet) _then) = _$CabinetCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? description, String? address, String? phone, String? email, DateTime? createdAt, DateTime? updatedAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? address = freezed,Object? phone = freezed,Object? email = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  String? address,  String? phone,  String? email,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Cabinet() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.address,_that.phone,_that.email,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  String? address,  String? phone,  String? email,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Cabinet():
return $default(_that.id,_that.name,_that.description,_that.address,_that.phone,_that.email,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? description,  String? address,  String? phone,  String? email,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Cabinet() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.address,_that.phone,_that.email,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _Cabinet implements Cabinet {
  const _Cabinet({required this.id, required this.name, this.description, this.address, this.phone, this.email, this.createdAt, this.updatedAt});
  

@override final  String id;
@override final  String name;
@override final  String? description;
@override final  String? address;
@override final  String? phone;
@override final  String? email;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of Cabinet
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CabinetCopyWith<_Cabinet> get copyWith => __$CabinetCopyWithImpl<_Cabinet>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Cabinet&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.address, address) || other.address == address)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,address,phone,email,createdAt,updatedAt);

@override
String toString() {
  return 'Cabinet(id: $id, name: $name, description: $description, address: $address, phone: $phone, email: $email, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CabinetCopyWith<$Res> implements $CabinetCopyWith<$Res> {
  factory _$CabinetCopyWith(_Cabinet value, $Res Function(_Cabinet) _then) = __$CabinetCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? description, String? address, String? phone, String? email, DateTime? createdAt, DateTime? updatedAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? address = freezed,Object? phone = freezed,Object? email = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_Cabinet(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
