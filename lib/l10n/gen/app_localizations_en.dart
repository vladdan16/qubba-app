// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class StringsEn extends Strings {
  StringsEn([String locale = 'en']) : super(locale);

  @override
  String get emailEmpty => 'Enter email';

  @override
  String get emailInvalid => 'Invalid email';

  @override
  String get passwordEmpty => 'Enter password';

  @override
  String passwordTooShort(int min) {
    return 'At least $min characters';
  }

  @override
  String get passwordNeedLetter => 'Add at least one letter';

  @override
  String get passwordNeedDigit => 'Add at least one digit';

  @override
  String get loginTitle => 'Sign in';

  @override
  String get welcomeTitle => 'Welcome!';

  @override
  String get emailLabel => 'Email';

  @override
  String get emailHint => 'name@example.com';

  @override
  String get passwordLabel => 'Password';

  @override
  String get showPasswordTooltip => 'Show password';

  @override
  String get hidePasswordTooltip => 'Hide password';

  @override
  String get loginAction => 'Sign in';

  @override
  String get forgotPasswordAction => 'Forgot password?';

  @override
  String get formValidSnack => 'Form is valid!';
}
