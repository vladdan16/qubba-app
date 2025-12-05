import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of Strings
/// returned by `Strings.of(context)`.
///
/// Applications need to include `Strings.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: Strings.localizationsDelegates,
///   supportedLocales: Strings.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the Strings.supportedLocales
/// property.
abstract class Strings {
  Strings(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static Strings of(BuildContext context) {
    return Localizations.of<Strings>(context, Strings)!;
  }

  static const LocalizationsDelegate<Strings> delegate = _StringsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru'),
  ];

  /// No description provided for @emailEmpty.
  ///
  /// In en, this message translates to:
  /// **'Enter email'**
  String get emailEmpty;

  /// No description provided for @emailInvalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid email'**
  String get emailInvalid;

  /// No description provided for @passwordEmpty.
  ///
  /// In en, this message translates to:
  /// **'Enter password'**
  String get passwordEmpty;

  /// No description provided for @passwordTooShort.
  ///
  /// In en, this message translates to:
  /// **'At least {min} characters'**
  String passwordTooShort(int min);

  /// No description provided for @passwordNeedLetter.
  ///
  /// In en, this message translates to:
  /// **'Add at least one letter'**
  String get passwordNeedLetter;

  /// No description provided for @passwordNeedDigit.
  ///
  /// In en, this message translates to:
  /// **'Add at least one digit'**
  String get passwordNeedDigit;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get loginTitle;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTitle;

  /// No description provided for @welcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome!'**
  String get welcomeTitle;

  /// No description provided for @emailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// No description provided for @emailHint.
  ///
  /// In en, this message translates to:
  /// **'name@example.com'**
  String get emailHint;

  /// No description provided for @passwordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordLabel;

  /// No description provided for @showPasswordTooltip.
  ///
  /// In en, this message translates to:
  /// **'Show password'**
  String get showPasswordTooltip;

  /// No description provided for @hidePasswordTooltip.
  ///
  /// In en, this message translates to:
  /// **'Hide password'**
  String get hidePasswordTooltip;

  /// No description provided for @loginAction.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get loginAction;

  /// No description provided for @forgotPasswordAction.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgotPasswordAction;

  /// No description provided for @formValidSnack.
  ///
  /// In en, this message translates to:
  /// **'Form is valid!'**
  String get formValidSnack;

  /// No description provided for @loginFailure.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Try again later.'**
  String get loginFailure;

  /// No description provided for @logOut.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logOut;

  /// No description provided for @profileTooltip.
  ///
  /// In en, this message translates to:
  /// **'Open profile'**
  String get profileTooltip;

  /// No description provided for @firstNameLabel.
  ///
  /// In en, this message translates to:
  /// **'First name'**
  String get firstNameLabel;

  /// No description provided for @lastNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Last name'**
  String get lastNameLabel;

  /// No description provided for @phoneLabel.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phoneLabel;

  /// No description provided for @phoneHint.
  ///
  /// In en, this message translates to:
  /// **'Example: 79875431234'**
  String get phoneHint;

  /// No description provided for @editAction.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get editAction;

  /// No description provided for @saveAction.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get saveAction;

  /// No description provided for @profileSaved.
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get profileSaved;

  /// No description provided for @profileRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get profileRetry;

  /// No description provided for @profileError.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String profileError(String error);

  /// No description provided for @firstNameEmpty.
  ///
  /// In en, this message translates to:
  /// **'Enter first name'**
  String get firstNameEmpty;

  /// No description provided for @firstNameTooLong.
  ///
  /// In en, this message translates to:
  /// **'First name is too long'**
  String get firstNameTooLong;

  /// No description provided for @firstNameForbiddenChars.
  ///
  /// In en, this message translates to:
  /// **'Letters, space and hyphen only'**
  String get firstNameForbiddenChars;

  /// No description provided for @lastNameEmpty.
  ///
  /// In en, this message translates to:
  /// **'Enter last name'**
  String get lastNameEmpty;

  /// No description provided for @lastNameTooLong.
  ///
  /// In en, this message translates to:
  /// **'Last name is too long'**
  String get lastNameTooLong;

  /// No description provided for @lastNameForbiddenChars.
  ///
  /// In en, this message translates to:
  /// **'Letters, space and hyphen only'**
  String get lastNameForbiddenChars;

  /// No description provided for @phoneEmpty.
  ///
  /// In en, this message translates to:
  /// **'Enter phone number'**
  String get phoneEmpty;

  /// No description provided for @phoneInvalid.
  ///
  /// In en, this message translates to:
  /// **'Digits only, length 7–20'**
  String get phoneInvalid;

  /// No description provided for @changePhotoAction.
  ///
  /// In en, this message translates to:
  /// **'Change photo'**
  String get changePhotoAction;

  /// No description provided for @removePhotoAction.
  ///
  /// In en, this message translates to:
  /// **'Remove photo'**
  String get removePhotoAction;

  /// No description provided for @cancelAction.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelAction;

  /// No description provided for @cabinetsTitle.
  ///
  /// In en, this message translates to:
  /// **'Cabinets'**
  String get cabinetsTitle;

  /// No description provided for @cabinetsNew.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get cabinetsNew;

  /// No description provided for @cabinetsError.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String cabinetsError(String error);

  /// No description provided for @cabinetsRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get cabinetsRetry;

  /// No description provided for @cabinetsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No cabinets'**
  String get cabinetsEmpty;

  /// No description provided for @cabinetsAddCabinet.
  ///
  /// In en, this message translates to:
  /// **'Add cabinet'**
  String get cabinetsAddCabinet;

  /// No description provided for @cabinetsActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get cabinetsActive;

  /// No description provided for @cabinetsInactive.
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get cabinetsInactive;

  /// No description provided for @cabinetFormEditTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit cabinet'**
  String get cabinetFormEditTitle;

  /// No description provided for @cabinetFormNewTitle.
  ///
  /// In en, this message translates to:
  /// **'New cabinet'**
  String get cabinetFormNewTitle;

  /// No description provided for @cabinetFormSaved.
  ///
  /// In en, this message translates to:
  /// **'Cabinet saved'**
  String get cabinetFormSaved;

  /// No description provided for @cabinetFormError.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String cabinetFormError(String error);

  /// No description provided for @cabinetFormBasicInfo.
  ///
  /// In en, this message translates to:
  /// **'Basic information'**
  String get cabinetFormBasicInfo;

  /// No description provided for @cabinetFormNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name *'**
  String get cabinetFormNameLabel;

  /// No description provided for @cabinetFormOrganizationNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Organization name'**
  String get cabinetFormOrganizationNameLabel;

  /// No description provided for @cabinetFormOrganizationInnLabel.
  ///
  /// In en, this message translates to:
  /// **'Organization INN'**
  String get cabinetFormOrganizationInnLabel;

  /// No description provided for @cabinetFormLegalTypeLabel.
  ///
  /// In en, this message translates to:
  /// **'Legal type *'**
  String get cabinetFormLegalTypeLabel;

  /// No description provided for @cabinetFormUnitMaintenanceCostLabel.
  ///
  /// In en, this message translates to:
  /// **'Unit maintenance cost'**
  String get cabinetFormUnitMaintenanceCostLabel;

  /// No description provided for @cabinetFormTaxesSection.
  ///
  /// In en, this message translates to:
  /// **'Taxes and fees'**
  String get cabinetFormTaxesSection;

  /// No description provided for @cabinetFormTaxTypeLabel.
  ///
  /// In en, this message translates to:
  /// **'Tax type *'**
  String get cabinetFormTaxTypeLabel;

  /// No description provided for @cabinetFormTaxRateLabel.
  ///
  /// In en, this message translates to:
  /// **'Tax rate *'**
  String get cabinetFormTaxRateLabel;

  /// No description provided for @cabinetFormNdsRateLabel.
  ///
  /// In en, this message translates to:
  /// **'VAT rate *'**
  String get cabinetFormNdsRateLabel;

  /// No description provided for @cabinetFormTaxesSection2024.
  ///
  /// In en, this message translates to:
  /// **'Taxes and fees (2024)'**
  String get cabinetFormTaxesSection2024;

  /// No description provided for @cabinetFormTaxTypeLabel2024.
  ///
  /// In en, this message translates to:
  /// **'Tax type (2024) *'**
  String get cabinetFormTaxTypeLabel2024;

  /// No description provided for @cabinetFormTaxRateLabel2024.
  ///
  /// In en, this message translates to:
  /// **'Tax rate (2024) *'**
  String get cabinetFormTaxRateLabel2024;

  /// No description provided for @cabinetFormWbApiSection.
  ///
  /// In en, this message translates to:
  /// **'Wildberries API'**
  String get cabinetFormWbApiSection;

  /// No description provided for @cabinetFormActivateApi.
  ///
  /// In en, this message translates to:
  /// **'Activate API'**
  String get cabinetFormActivateApi;

  /// No description provided for @cabinetFormApiKeyLabel.
  ///
  /// In en, this message translates to:
  /// **'API key'**
  String get cabinetFormApiKeyLabel;

  /// No description provided for @cabinetFormOzonApiSection.
  ///
  /// In en, this message translates to:
  /// **'Ozon API'**
  String get cabinetFormOzonApiSection;

  /// No description provided for @cabinetFormOzonClientIdLabel.
  ///
  /// In en, this message translates to:
  /// **'Client ID'**
  String get cabinetFormOzonClientIdLabel;

  /// No description provided for @cabinetFormOzonPerformanceClientIdLabel.
  ///
  /// In en, this message translates to:
  /// **'Performance Client ID'**
  String get cabinetFormOzonPerformanceClientIdLabel;

  /// No description provided for @cabinetFormOzonPerformanceClientSecretLabel.
  ///
  /// In en, this message translates to:
  /// **'Performance Client Secret'**
  String get cabinetFormOzonPerformanceClientSecretLabel;

  /// No description provided for @cabinetFormIsActiveLabel.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get cabinetFormIsActiveLabel;

  /// No description provided for @cabinetFormIsActiveSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Cabinet available for work'**
  String get cabinetFormIsActiveSubtitle;

  /// No description provided for @cabinetFormSaveButton.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get cabinetFormSaveButton;

  /// No description provided for @cabinetFormCreateButton.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get cabinetFormCreateButton;

  /// No description provided for @cabinetFormDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get cabinetFormDelete;

  /// No description provided for @cabinetFormNameEmpty.
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get cabinetFormNameEmpty;

  /// No description provided for @cabinetFormLegalTypeEmpty.
  ///
  /// In en, this message translates to:
  /// **'Legal type is required'**
  String get cabinetFormLegalTypeEmpty;

  /// No description provided for @cabinetFormLegalTypeInvalid.
  ///
  /// In en, this message translates to:
  /// **'Legal type must be a number'**
  String get cabinetFormLegalTypeInvalid;

  /// No description provided for @cabinetFormTaxTypeEmpty.
  ///
  /// In en, this message translates to:
  /// **'Tax type is required'**
  String get cabinetFormTaxTypeEmpty;

  /// No description provided for @cabinetFormTaxTypeInvalid.
  ///
  /// In en, this message translates to:
  /// **'Tax type must be a number'**
  String get cabinetFormTaxTypeInvalid;

  /// No description provided for @cabinetFormTaxRateEmpty.
  ///
  /// In en, this message translates to:
  /// **'Tax rate is required'**
  String get cabinetFormTaxRateEmpty;

  /// No description provided for @cabinetFormTaxRateInvalid.
  ///
  /// In en, this message translates to:
  /// **'Tax rate must be a number'**
  String get cabinetFormTaxRateInvalid;

  /// No description provided for @cabinetFormNdsRateEmpty.
  ///
  /// In en, this message translates to:
  /// **'VAT rate is required'**
  String get cabinetFormNdsRateEmpty;

  /// No description provided for @cabinetFormNdsRateInvalid.
  ///
  /// In en, this message translates to:
  /// **'VAT rate must be a number'**
  String get cabinetFormNdsRateInvalid;

  /// No description provided for @cabinetFormTaxType2024Empty.
  ///
  /// In en, this message translates to:
  /// **'Tax type (2024) is required'**
  String get cabinetFormTaxType2024Empty;

  /// No description provided for @cabinetFormTaxType2024Invalid.
  ///
  /// In en, this message translates to:
  /// **'Tax type (2024) must be a number'**
  String get cabinetFormTaxType2024Invalid;

  /// No description provided for @cabinetFormTaxRate2024Empty.
  ///
  /// In en, this message translates to:
  /// **'Tax rate (2024) is required'**
  String get cabinetFormTaxRate2024Empty;

  /// No description provided for @cabinetFormTaxRate2024Invalid.
  ///
  /// In en, this message translates to:
  /// **'Tax rate (2024) must be a number'**
  String get cabinetFormTaxRate2024Invalid;

  /// No description provided for @cabinetFormUnitMaintenanceCostInvalid.
  ///
  /// In en, this message translates to:
  /// **'Unit maintenance cost must be a number'**
  String get cabinetFormUnitMaintenanceCostInvalid;
}

class _StringsDelegate extends LocalizationsDelegate<Strings> {
  const _StringsDelegate();

  @override
  Future<Strings> load(Locale locale) {
    return SynchronousFuture<Strings>(lookupStrings(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_StringsDelegate old) => false;
}

Strings lookupStrings(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return StringsEn();
    case 'ru':
      return StringsRu();
  }

  throw FlutterError(
    'Strings.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
