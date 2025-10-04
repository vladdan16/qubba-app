// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginFormState {

 String get email; String get password;
/// Create a copy of LoginFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginFormStateCopyWith<LoginFormState> get copyWith => _$LoginFormStateCopyWithImpl<LoginFormState>(this as LoginFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginFormState&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'LoginFormState(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $LoginFormStateCopyWith<$Res>  {
  factory $LoginFormStateCopyWith(LoginFormState value, $Res Function(LoginFormState) _then) = _$LoginFormStateCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class _$LoginFormStateCopyWithImpl<$Res>
    implements $LoginFormStateCopyWith<$Res> {
  _$LoginFormStateCopyWithImpl(this._self, this._then);

  final LoginFormState _self;
  final $Res Function(LoginFormState) _then;

/// Create a copy of LoginFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? password = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginFormState].
extension LoginFormStatePatterns on LoginFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoginFormInitial value)?  initial,TResult Function( _LoginFormSuccess value)?  success,TResult Function( _LoginFormSubmitted value)?  submitted,TResult Function( _LoginFormFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginFormInitial() when initial != null:
return initial(_that);case _LoginFormSuccess() when success != null:
return success(_that);case _LoginFormSubmitted() when submitted != null:
return submitted(_that);case _LoginFormFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoginFormInitial value)  initial,required TResult Function( _LoginFormSuccess value)  success,required TResult Function( _LoginFormSubmitted value)  submitted,required TResult Function( _LoginFormFailure value)  failure,}){
final _that = this;
switch (_that) {
case _LoginFormInitial():
return initial(_that);case _LoginFormSuccess():
return success(_that);case _LoginFormSubmitted():
return submitted(_that);case _LoginFormFailure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoginFormInitial value)?  initial,TResult? Function( _LoginFormSuccess value)?  success,TResult? Function( _LoginFormSubmitted value)?  submitted,TResult? Function( _LoginFormFailure value)?  failure,}){
final _that = this;
switch (_that) {
case _LoginFormInitial() when initial != null:
return initial(_that);case _LoginFormSuccess() when success != null:
return success(_that);case _LoginFormSubmitted() when submitted != null:
return submitted(_that);case _LoginFormFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String email,  String password)?  initial,TResult Function( String email,  String password)?  success,TResult Function( String email,  String password)?  submitted,TResult Function( String email,  String password,  EmailInvalidStatus? emailStatus,  PasswordInvalidStatus? passwordStatus)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginFormInitial() when initial != null:
return initial(_that.email,_that.password);case _LoginFormSuccess() when success != null:
return success(_that.email,_that.password);case _LoginFormSubmitted() when submitted != null:
return submitted(_that.email,_that.password);case _LoginFormFailure() when failure != null:
return failure(_that.email,_that.password,_that.emailStatus,_that.passwordStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String email,  String password)  initial,required TResult Function( String email,  String password)  success,required TResult Function( String email,  String password)  submitted,required TResult Function( String email,  String password,  EmailInvalidStatus? emailStatus,  PasswordInvalidStatus? passwordStatus)  failure,}) {final _that = this;
switch (_that) {
case _LoginFormInitial():
return initial(_that.email,_that.password);case _LoginFormSuccess():
return success(_that.email,_that.password);case _LoginFormSubmitted():
return submitted(_that.email,_that.password);case _LoginFormFailure():
return failure(_that.email,_that.password,_that.emailStatus,_that.passwordStatus);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String email,  String password)?  initial,TResult? Function( String email,  String password)?  success,TResult? Function( String email,  String password)?  submitted,TResult? Function( String email,  String password,  EmailInvalidStatus? emailStatus,  PasswordInvalidStatus? passwordStatus)?  failure,}) {final _that = this;
switch (_that) {
case _LoginFormInitial() when initial != null:
return initial(_that.email,_that.password);case _LoginFormSuccess() when success != null:
return success(_that.email,_that.password);case _LoginFormSubmitted() when submitted != null:
return submitted(_that.email,_that.password);case _LoginFormFailure() when failure != null:
return failure(_that.email,_that.password,_that.emailStatus,_that.passwordStatus);case _:
  return null;

}
}

}

/// @nodoc


class _LoginFormInitial implements LoginFormState {
  const _LoginFormInitial({this.email = '', this.password = ''});
  

@override@JsonKey() final  String email;
@override@JsonKey() final  String password;

/// Create a copy of LoginFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginFormInitialCopyWith<_LoginFormInitial> get copyWith => __$LoginFormInitialCopyWithImpl<_LoginFormInitial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginFormInitial&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'LoginFormState.initial(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class _$LoginFormInitialCopyWith<$Res> implements $LoginFormStateCopyWith<$Res> {
  factory _$LoginFormInitialCopyWith(_LoginFormInitial value, $Res Function(_LoginFormInitial) _then) = __$LoginFormInitialCopyWithImpl;
@override @useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class __$LoginFormInitialCopyWithImpl<$Res>
    implements _$LoginFormInitialCopyWith<$Res> {
  __$LoginFormInitialCopyWithImpl(this._self, this._then);

  final _LoginFormInitial _self;
  final $Res Function(_LoginFormInitial) _then;

/// Create a copy of LoginFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(_LoginFormInitial(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _LoginFormSuccess implements LoginFormState {
  const _LoginFormSuccess({required this.email, required this.password});
  

@override final  String email;
@override final  String password;

/// Create a copy of LoginFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginFormSuccessCopyWith<_LoginFormSuccess> get copyWith => __$LoginFormSuccessCopyWithImpl<_LoginFormSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginFormSuccess&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'LoginFormState.success(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class _$LoginFormSuccessCopyWith<$Res> implements $LoginFormStateCopyWith<$Res> {
  factory _$LoginFormSuccessCopyWith(_LoginFormSuccess value, $Res Function(_LoginFormSuccess) _then) = __$LoginFormSuccessCopyWithImpl;
@override @useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class __$LoginFormSuccessCopyWithImpl<$Res>
    implements _$LoginFormSuccessCopyWith<$Res> {
  __$LoginFormSuccessCopyWithImpl(this._self, this._then);

  final _LoginFormSuccess _self;
  final $Res Function(_LoginFormSuccess) _then;

/// Create a copy of LoginFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(_LoginFormSuccess(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _LoginFormSubmitted implements LoginFormState {
  const _LoginFormSubmitted({required this.email, required this.password});
  

@override final  String email;
@override final  String password;

/// Create a copy of LoginFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginFormSubmittedCopyWith<_LoginFormSubmitted> get copyWith => __$LoginFormSubmittedCopyWithImpl<_LoginFormSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginFormSubmitted&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'LoginFormState.submitted(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class _$LoginFormSubmittedCopyWith<$Res> implements $LoginFormStateCopyWith<$Res> {
  factory _$LoginFormSubmittedCopyWith(_LoginFormSubmitted value, $Res Function(_LoginFormSubmitted) _then) = __$LoginFormSubmittedCopyWithImpl;
@override @useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class __$LoginFormSubmittedCopyWithImpl<$Res>
    implements _$LoginFormSubmittedCopyWith<$Res> {
  __$LoginFormSubmittedCopyWithImpl(this._self, this._then);

  final _LoginFormSubmitted _self;
  final $Res Function(_LoginFormSubmitted) _then;

/// Create a copy of LoginFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(_LoginFormSubmitted(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _LoginFormFailure implements LoginFormState {
  const _LoginFormFailure({required this.email, required this.password, this.emailStatus, this.passwordStatus});
  

@override final  String email;
@override final  String password;
 final  EmailInvalidStatus? emailStatus;
 final  PasswordInvalidStatus? passwordStatus;

/// Create a copy of LoginFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginFormFailureCopyWith<_LoginFormFailure> get copyWith => __$LoginFormFailureCopyWithImpl<_LoginFormFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginFormFailure&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.emailStatus, emailStatus) || other.emailStatus == emailStatus)&&(identical(other.passwordStatus, passwordStatus) || other.passwordStatus == passwordStatus));
}


@override
int get hashCode => Object.hash(runtimeType,email,password,emailStatus,passwordStatus);

@override
String toString() {
  return 'LoginFormState.failure(email: $email, password: $password, emailStatus: $emailStatus, passwordStatus: $passwordStatus)';
}


}

/// @nodoc
abstract mixin class _$LoginFormFailureCopyWith<$Res> implements $LoginFormStateCopyWith<$Res> {
  factory _$LoginFormFailureCopyWith(_LoginFormFailure value, $Res Function(_LoginFormFailure) _then) = __$LoginFormFailureCopyWithImpl;
@override @useResult
$Res call({
 String email, String password, EmailInvalidStatus? emailStatus, PasswordInvalidStatus? passwordStatus
});




}
/// @nodoc
class __$LoginFormFailureCopyWithImpl<$Res>
    implements _$LoginFormFailureCopyWith<$Res> {
  __$LoginFormFailureCopyWithImpl(this._self, this._then);

  final _LoginFormFailure _self;
  final $Res Function(_LoginFormFailure) _then;

/// Create a copy of LoginFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,Object? emailStatus = freezed,Object? passwordStatus = freezed,}) {
  return _then(_LoginFormFailure(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,emailStatus: freezed == emailStatus ? _self.emailStatus : emailStatus // ignore: cast_nullable_to_non_nullable
as EmailInvalidStatus?,passwordStatus: freezed == passwordStatus ? _self.passwordStatus : passwordStatus // ignore: cast_nullable_to_non_nullable
as PasswordInvalidStatus?,
  ));
}


}

// dart format on
