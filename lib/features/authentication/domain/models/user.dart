import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

/// User model
///
/// [User.empty] represents an unauthenticated user.
@freezed
abstract class User with _$User {
  const factory User({
    required String id,
    String? email,
    String? name,
    String? photo,
  }) = _User;

  /// Empty user that represents unauthenticated user.
  static const empty = User(id: '');
}

extension UserX on User {
  /// Getter to determine if user is empty.
  bool get isEmpty => this == User.empty;

  /// Getter to determine if user is not empty.
  bool get isNotEmpty => this != User.empty;
}
