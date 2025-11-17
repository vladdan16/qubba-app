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
  String get profileTitle => 'Профиль';

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
  String get profileTooltip => 'Открыть профиль';

  @override
  String get firstNameLabel => 'Имя';

  @override
  String get lastNameLabel => 'Фамилия';

  @override
  String get phoneLabel => 'Телефон';

  @override
  String get phoneHint => 'Например: 79875431234';

  @override
  String get editAction => 'Изменить';

  @override
  String get saveAction => 'Сохранить';

  @override
  String get profileSaved => 'Сохранено';

  @override
  String get profileRetry => 'Повторить';

  @override
  String profileError(String error) {
    return 'Ошибка: $error';
  }

  @override
  String get firstNameEmpty => 'Заполните имя';

  @override
  String get firstNameTooLong => 'Слишком длинное имя';

  @override
  String get firstNameForbiddenChars =>
      'Допустимы только буквы, пробел и дефис';

  @override
  String get lastNameEmpty => 'Заполните фамилию';

  @override
  String get lastNameTooLong => 'Слишком длинная фамилия';

  @override
  String get lastNameForbiddenChars => 'Допустимы только буквы, пробел и дефис';

  @override
  String get phoneEmpty => 'Укажите номер телефона';

  @override
  String get phoneInvalid => 'Только цифры, длина 7–20';

  @override
  String get changePhotoAction => 'Сменить фото';

  @override
  String get removePhotoAction => 'Удалить фото';

  @override
  String get cancelAction => 'Отмена';

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
  String get cabinetFormLegalTypeLabel => 'Тип юр. лица *';

  @override
  String get cabinetFormUnitMaintenanceCostLabel =>
      'Стоимость обслуживания единицы';

  @override
  String get cabinetFormTaxesSection => 'Налоги и сборы';

  @override
  String get cabinetFormTaxTypeLabel => 'Тип налога *';

  @override
  String get cabinetFormTaxRateLabel => 'Ставка налога *';

  @override
  String get cabinetFormNdsRateLabel => 'Ставка НДС *';

  @override
  String get cabinetFormTaxesSection2024 => 'Налоги и сборы (2024)';

  @override
  String get cabinetFormTaxTypeLabel2024 => 'Тип налога (2024) *';

  @override
  String get cabinetFormTaxRateLabel2024 => 'Ставка налога (2024) *';

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
  String get cabinetFormOzonPerformanceClientIdLabel => 'Performance Client ID';

  @override
  String get cabinetFormOzonPerformanceClientSecretLabel =>
      'Performance Client Secret';

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

  @override
  String get cabinetFormNameEmpty => 'Название обязательно';

  @override
  String get cabinetFormLegalTypeEmpty => 'Тип юр. лица обязателен';

  @override
  String get cabinetFormLegalTypeInvalid => 'Тип юр. лица должен быть числом';

  @override
  String get cabinetFormTaxTypeEmpty => 'Тип налога обязателен';

  @override
  String get cabinetFormTaxTypeInvalid => 'Тип налога должен быть числом';

  @override
  String get cabinetFormTaxRateEmpty => 'Ставка налога обязательна';

  @override
  String get cabinetFormTaxRateInvalid => 'Ставка налога должна быть числом';

  @override
  String get cabinetFormNdsRateEmpty => 'Ставка НДС обязательна';

  @override
  String get cabinetFormNdsRateInvalid => 'Ставка НДС должна быть числом';

  @override
  String get cabinetFormTaxType2024Empty => 'Тип налога (2024) обязателен';

  @override
  String get cabinetFormTaxType2024Invalid =>
      'Тип налога (2024) должен быть числом';

  @override
  String get cabinetFormTaxRate2024Empty => 'Ставка налога (2024) обязательна';

  @override
  String get cabinetFormTaxRate2024Invalid =>
      'Ставка налога (2024) должна быть числом';

  @override
  String get cabinetFormUnitMaintenanceCostInvalid =>
      'Стоимость обслуживания должна быть числом';

  @override
  String get cabinetEmployeesTitle => 'Доступ к кабинету';

  @override
  String cabinetEmployeesError(String error) {
    return 'Ошибка: $error';
  }

  @override
  String get cabinetEmployeesRetry => 'Повторить';

  @override
  String get cabinetEmployeesEmpty => 'Не добавлено сотрудников';

  @override
  String get cabinetEmployeesAddButton => 'Добавить сотрудника';

  @override
  String get cabinetEmployeesEmailLabel => 'Email сотрудника';

  @override
  String get cabinetEmployeesEmailHint => 'name@example.com';

  @override
  String get cabinetEmployeesAddTitle => 'Добавить сотрудника';

  @override
  String get cabinetEmployeesAddAction => 'Добавить';

  @override
  String get cabinetEmployeesCancelAction => 'Отмена';

  @override
  String get cabinetEmployeesDeleteConfirmTitle => 'Удалить сотрудника';

  @override
  String cabinetEmployeesDeleteConfirmMessage(String name) {
    return 'Вы уверены, что хотите удалить $name из этого кабинета?';
  }

  @override
  String get cabinetEmployeesDeleteAction => 'Удалить';

  @override
  String get cabinetEmployeesAdded => 'Сотрудник добавлен';

  @override
  String get cabinetEmployeesRemoved => 'Сотрудник удален';

  @override
  String get cabinetEmployeesManageTooltip => 'Управление доступом';

  @override
  String get cabinetEmployeesEmailEmpty => 'Введите email';

  @override
  String get cabinetEmployeesEmailInvalid => 'Некорректный email';
}
