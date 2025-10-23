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

  @override
  String get loginFailure => 'Something went wrong. Try again later.';

  @override
  String get logOut => 'Log out';

  @override
  String get cabinetsTitle => 'Cabinets';

  @override
  String get cabinetsNew => 'New';

  @override
  String cabinetsError(String error) {
    return 'Error: $error';
  }

  @override
  String get cabinetsRetry => 'Retry';

  @override
  String get cabinetsEmpty => 'No cabinets';

  @override
  String get cabinetsAddCabinet => 'Add cabinet';

  @override
  String get cabinetsActive => 'Active';

  @override
  String get cabinetsInactive => 'Inactive';

  @override
  String get cabinetFormEditTitle => 'Edit cabinet';

  @override
  String get cabinetFormNewTitle => 'New cabinet';

  @override
  String get cabinetFormSaved => 'Cabinet saved';

  @override
  String cabinetFormError(String error) {
    return 'Error: $error';
  }

  @override
  String get cabinetFormBasicInfo => 'Basic information';

  @override
  String get cabinetFormNameLabel => 'Name *';

  @override
  String get cabinetFormOrganizationNameLabel => 'Organization name';

  @override
  String get cabinetFormOrganizationInnLabel => 'Organization INN';

  @override
  String get cabinetFormTaxesSection => 'Taxes and fees';

  @override
  String get cabinetFormTaxTypeLabel => 'Tax type *';

  @override
  String get cabinetFormTaxRateLabel => 'Tax rate *';

  @override
  String get cabinetFormNdsRateLabel => 'VAT rate *';

  @override
  String get cabinetFormWbApiSection => 'Wildberries API';

  @override
  String get cabinetFormActivateApi => 'Activate API';

  @override
  String get cabinetFormApiKeyLabel => 'API key';

  @override
  String get cabinetFormOzonApiSection => 'Ozon API';

  @override
  String get cabinetFormOzonClientIdLabel => 'Client ID';

  @override
  String get cabinetFormIsActiveLabel => 'Active';

  @override
  String get cabinetFormIsActiveSubtitle => 'Cabinet available for work';

  @override
  String get cabinetFormSaveButton => 'Save';

  @override
  String get cabinetFormCreateButton => 'Create';

  @override
  String get cabinetFormDelete => 'Delete';
}
