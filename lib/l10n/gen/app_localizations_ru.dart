// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class StringsRu extends Strings {
  StringsRu([String locale = 'ru']) : super(locale);

  @override
  String get emailEmpty => 'Введите email';

  @override
  String get emailInvalid => 'Некорректный email';

  @override
  String get passwordEmpty => 'Введите пароль';

  @override
  String passwordTooShort(int min) {
    return 'Минимум $min символов';
  }

  @override
  String get passwordNeedLetter => 'Добавьте хотя бы одну букву';

  @override
  String get passwordNeedDigit => 'Добавьте хотя бы одну цифру';

  @override
  String get loginTitle => 'Вход';

  @override
  String get welcomeTitle => 'Добро пожаловать!';

  @override
  String get emailLabel => 'Email';

  @override
  String get emailHint => 'name@example.com';

  @override
  String get passwordLabel => 'Пароль';

  @override
  String get showPasswordTooltip => 'Показать пароль';

  @override
  String get hidePasswordTooltip => 'Скрыть пароль';

  @override
  String get loginAction => 'Войти';

  @override
  String get forgotPasswordAction => 'Забыли пароль?';

  @override
  String get formValidSnack => 'Форма валидна!';
}
