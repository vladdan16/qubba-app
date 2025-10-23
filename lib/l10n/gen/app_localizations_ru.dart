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

  @override
  String get loginFailure => 'Что-то пошло не так. Попробуйте позже.';

  @override
  String get logOut => 'Выйти из аккаунта';

  @override
  String get cabinetsTitle => 'Кабинеты';

  @override
  String get cabinetsNew => 'Новый';

  @override
  String cabinetsError(String error) {
    return 'Ошибка: $error';
  }

  @override
  String get cabinetsRetry => 'Повторить';

  @override
  String get cabinetsEmpty => 'Нет кабинетов';

  @override
  String get cabinetsAddCabinet => 'Добавить кабинет';

  @override
  String get cabinetsActive => 'Активен';

  @override
  String get cabinetsInactive => 'Неактивен';

  @override
  String get cabinetFormEditTitle => 'Редактировать кабинет';

  @override
  String get cabinetFormNewTitle => 'Новый кабинет';

  @override
  String get cabinetFormSaved => 'Кабинет сохранен';

  @override
  String cabinetFormError(String error) {
    return 'Ошибка: $error';
  }

  @override
  String get cabinetFormBasicInfo => 'Основная информация';

  @override
  String get cabinetFormNameLabel => 'Название *';

  @override
  String get cabinetFormOrganizationNameLabel => 'Название организации';

  @override
  String get cabinetFormOrganizationInnLabel => 'ИНН организации';

  @override
  String get cabinetFormTaxesSection => 'Налоги и сборы';

  @override
  String get cabinetFormTaxTypeLabel => 'Тип налога *';

  @override
  String get cabinetFormTaxRateLabel => 'Ставка налога *';

  @override
  String get cabinetFormNdsRateLabel => 'Ставка НДС *';

  @override
  String get cabinetFormWbApiSection => 'Wildberries API';

  @override
  String get cabinetFormActivateApi => 'Активировать API';

  @override
  String get cabinetFormApiKeyLabel => 'API ключ';

  @override
  String get cabinetFormOzonApiSection => 'Ozon API';

  @override
  String get cabinetFormOzonClientIdLabel => 'Client ID';

  @override
  String get cabinetFormIsActiveLabel => 'Активен';

  @override
  String get cabinetFormIsActiveSubtitle => 'Кабинет доступен для работы';

  @override
  String get cabinetFormSaveButton => 'Сохранить';

  @override
  String get cabinetFormCreateButton => 'Создать';

  @override
  String get cabinetFormDelete => 'Удалить';
}
