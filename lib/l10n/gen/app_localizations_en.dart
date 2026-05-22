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
  String get profileTitle => 'Profile';

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
  String get profileTooltip => 'Open profile';

  @override
  String get firstNameLabel => 'First name';

  @override
  String get lastNameLabel => 'Last name';

  @override
  String get phoneLabel => 'Phone';

  @override
  String get phoneHint => 'Example: 79875431234';

  @override
  String get editAction => 'Edit';

  @override
  String get saveAction => 'Save';

  @override
  String get profileSaved => 'Saved';

  @override
  String get profileRetry => 'Retry';

  @override
  String profileError(String error) {
    return 'Error: $error';
  }

  @override
  String get firstNameEmpty => 'Enter first name';

  @override
  String get firstNameTooLong => 'First name is too long';

  @override
  String get firstNameForbiddenChars => 'Letters, space and hyphen only';

  @override
  String get lastNameEmpty => 'Enter last name';

  @override
  String get lastNameTooLong => 'Last name is too long';

  @override
  String get lastNameForbiddenChars => 'Letters, space and hyphen only';

  @override
  String get phoneEmpty => 'Enter phone number';

  @override
  String get phoneInvalid => 'Digits only, length 7–20';

  @override
  String get changePhotoAction => 'Change photo';

  @override
  String get removePhotoAction => 'Remove photo';

  @override
  String get cancelAction => 'Cancel';

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
  String get cabinetFormLegalTypeLabel => 'Legal type *';

  @override
  String get cabinetFormUnitMaintenanceCostLabel => 'Unit maintenance cost';

  @override
  String get cabinetFormTaxesSection => 'Taxes and fees';

  @override
  String get cabinetFormTaxTypeLabel => 'Tax type *';

  @override
  String get cabinetFormTaxRateLabel => 'Tax rate *';

  @override
  String get cabinetFormNdsRateLabel => 'VAT rate *';

  @override
  String get cabinetFormTaxesSection2024 => 'Taxes and fees (2024)';

  @override
  String get cabinetFormTaxTypeLabel2024 => 'Tax type (2024) *';

  @override
  String get cabinetFormTaxRateLabel2024 => 'Tax rate (2024) *';

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
  String get cabinetFormOzonPerformanceClientIdLabel => 'Performance Client ID';

  @override
  String get cabinetFormOzonPerformanceClientSecretLabel =>
      'Performance Client Secret';

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

  @override
  String get cabinetFormNameEmpty => 'Name is required';

  @override
  String get cabinetFormLegalTypeEmpty => 'Legal type is required';

  @override
  String get cabinetFormLegalTypeInvalid => 'Legal type must be a number';

  @override
  String get cabinetFormTaxTypeEmpty => 'Tax type is required';

  @override
  String get cabinetFormTaxTypeInvalid => 'Tax type must be a number';

  @override
  String get cabinetFormTaxRateEmpty => 'Tax rate is required';

  @override
  String get cabinetFormTaxRateInvalid => 'Tax rate must be a number';

  @override
  String get cabinetFormNdsRateEmpty => 'VAT rate is required';

  @override
  String get cabinetFormNdsRateInvalid => 'VAT rate must be a number';

  @override
  String get cabinetFormTaxType2024Empty => 'Tax type (2024) is required';

  @override
  String get cabinetFormTaxType2024Invalid =>
      'Tax type (2024) must be a number';

  @override
  String get cabinetFormTaxRate2024Empty => 'Tax rate (2024) is required';

  @override
  String get cabinetFormTaxRate2024Invalid =>
      'Tax rate (2024) must be a number';

  @override
  String get cabinetFormUnitMaintenanceCostInvalid =>
      'Unit maintenance cost must be a number';

  @override
  String get cabinetEmployeesTitle => 'Cabinet Access';

  @override
  String cabinetEmployeesError(String error) {
    return 'Error: $error';
  }

  @override
  String get cabinetEmployeesRetry => 'Retry';

  @override
  String get cabinetEmployeesEmpty => 'No employees added';

  @override
  String get cabinetEmployeesAddButton => 'Add employee';

  @override
  String get cabinetEmployeesEmailLabel => 'Employee email';

  @override
  String get cabinetEmployeesEmailHint => 'name@example.com';

  @override
  String get cabinetEmployeesAddTitle => 'Add employee';

  @override
  String get cabinetEmployeesAddAction => 'Add';

  @override
  String get cabinetEmployeesCancelAction => 'Cancel';

  @override
  String get cabinetEmployeesDeleteConfirmTitle => 'Remove employee';

  @override
  String cabinetEmployeesDeleteConfirmMessage(String name) {
    return 'Are you sure you want to remove $name from this cabinet?';
  }

  @override
  String get cabinetEmployeesDeleteAction => 'Remove';

  @override
  String get cabinetEmployeesAdded => 'Employee added';

  @override
  String get cabinetEmployeesRemoved => 'Employee removed';

  @override
  String get cabinetEmployeesManageTooltip => 'Manage access';

  @override
  String get cabinetEmployeesEmailEmpty => 'Enter email';

  @override
  String get cabinetEmployeesEmailInvalid => 'Invalid email';

  @override
  String get salesTitle => 'Sales';

  @override
  String get salesRetry => 'Retry';

  @override
  String get salesMarketplaceWildberries => 'Wildberries';

  @override
  String get salesMarketplaceOzon => 'Ozon';

  @override
  String salesPointsLabel(int count) {
    return 'Points: $count';
  }

  @override
  String get salesEmptyMessage =>
      'No data for selected period. Pull to refresh.';

  @override
  String salesPreviewMessage(int count) {
    return 'Data loaded. Next step: chart.\nPoints count: $count';
  }

  @override
  String salesLastLoadedPoints(int count) {
    return 'Last loaded points: $count';
  }

  @override
  String get salesSelectPeriod => 'Select period';

  @override
  String get salesRevenueChart => 'Revenue';

  @override
  String get salesQuantityChart => 'Sales quantity';

  @override
  String get salesProfitChart => 'Profit';

  @override
  String get salesTotalRevenue => 'Total revenue';

  @override
  String get salesTotalProfit => 'Total profit';

  @override
  String get salesTotalSales => 'Total sales';

  @override
  String get salesTotalReturns => 'Returns';

  @override
  String get salesAdsExpenses => 'Ads expenses';

  @override
  String get salesCurrencySymbol => '₽';

  @override
  String get reviewsTitle => 'Reviews';

  @override
  String get reviewsTabLabel => 'Reviews';

  @override
  String get cabinetsTabLabel => 'Cabinets';

  @override
  String get reviewsEmpty => 'No reviews for selected filters';

  @override
  String reviewsError(String error) {
    return 'Error: $error';
  }

  @override
  String get reviewsRetry => 'Retry';

  @override
  String get reviewsFilterCabinetAll => 'All cabinets';

  @override
  String reviewsFilterCabinetSelect(String name) {
    return 'Cabinet: $name';
  }

  @override
  String get reviewsFilterAnsweredAll => 'All';

  @override
  String get reviewsFilterAnsweredYes => 'Answered';

  @override
  String get reviewsFilterAnsweredNo => 'Unanswered';

  @override
  String get reviewCardSellerAnswerLabel => 'Your reply';

  @override
  String get reviewCardNoText => 'No text';

  @override
  String get reviewCardNoAnswer => 'No reply';

  @override
  String get reviewCardAiAnswerLabel => 'AI reply';

  @override
  String get reviewCardAnonymousBuyer => 'Buyer';

  @override
  String get reviewDetailTitle => 'Review';

  @override
  String get reviewDetailNoAnswer => 'No reply to this review';

  @override
  String get reviewDetailGenerateAnswer => 'Generate reply';

  @override
  String get reviewDetailGenerating => 'Generating…';

  @override
  String get reviewDetailAnswerGenerated => 'Reply generated';

  @override
  String get reviewDetailRegenerateAnswer => 'Regenerate reply';

  @override
  String get reviewDetailAnswerHint => 'Write a reply to the buyer…';

  @override
  String get reviewDetailSaveDraftButton => 'Save draft';

  @override
  String get reviewDetailDraftSaved => 'Draft saved';

  @override
  String get reviewDetailSendButton => 'Publish to marketplace';

  @override
  String get reviewDetailAnswerSent => 'Reply published to marketplace';

  @override
  String get reviewsAiSettingsTitle => 'Generation settings';

  @override
  String get reviewsAiSettingsTooltip => 'Generation settings';

  @override
  String get reviewsAiSettingsPromptLabel => 'Prompt';

  @override
  String get reviewsAiSettingsPromptHint =>
      'Describe the tone, length and rules for replies…';

  @override
  String get reviewsAiSettingsModelLabel => 'Model';

  @override
  String get reviewsAiSettingsModelNotSelected => 'Not selected';

  @override
  String get reviewsAiSettingsSaveButton => 'Save';

  @override
  String get reviewsAiSettingsSaved => 'Settings saved';

  @override
  String reviewsAiSettingsLoadError(String message) {
    return 'Failed to load settings: $message';
  }

  @override
  String reviewsAiSettingsSaveError(String message) {
    return 'Failed to save: $message';
  }

  @override
  String get reviewsAiSettingsRetry => 'Retry';
}
