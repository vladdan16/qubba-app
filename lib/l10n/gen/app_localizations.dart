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

  /// No description provided for @cabinetEmployeesTitle.
  ///
  /// In en, this message translates to:
  /// **'Cabinet Access'**
  String get cabinetEmployeesTitle;

  /// No description provided for @cabinetEmployeesError.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String cabinetEmployeesError(String error);

  /// No description provided for @cabinetEmployeesRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get cabinetEmployeesRetry;

  /// No description provided for @cabinetEmployeesEmpty.
  ///
  /// In en, this message translates to:
  /// **'No employees added'**
  String get cabinetEmployeesEmpty;

  /// No description provided for @cabinetEmployeesAddButton.
  ///
  /// In en, this message translates to:
  /// **'Add employee'**
  String get cabinetEmployeesAddButton;

  /// No description provided for @cabinetEmployeesEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Employee email'**
  String get cabinetEmployeesEmailLabel;

  /// No description provided for @cabinetEmployeesEmailHint.
  ///
  /// In en, this message translates to:
  /// **'name@example.com'**
  String get cabinetEmployeesEmailHint;

  /// No description provided for @cabinetEmployeesAddTitle.
  ///
  /// In en, this message translates to:
  /// **'Add employee'**
  String get cabinetEmployeesAddTitle;

  /// No description provided for @cabinetEmployeesAddAction.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get cabinetEmployeesAddAction;

  /// No description provided for @cabinetEmployeesCancelAction.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cabinetEmployeesCancelAction;

  /// No description provided for @cabinetEmployeesDeleteConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Remove employee'**
  String get cabinetEmployeesDeleteConfirmTitle;

  /// No description provided for @cabinetEmployeesDeleteConfirmMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove {name} from this cabinet?'**
  String cabinetEmployeesDeleteConfirmMessage(String name);

  /// No description provided for @cabinetEmployeesDeleteAction.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get cabinetEmployeesDeleteAction;

  /// No description provided for @cabinetEmployeesAdded.
  ///
  /// In en, this message translates to:
  /// **'Employee added'**
  String get cabinetEmployeesAdded;

  /// No description provided for @cabinetEmployeesRemoved.
  ///
  /// In en, this message translates to:
  /// **'Employee removed'**
  String get cabinetEmployeesRemoved;

  /// No description provided for @cabinetEmployeesManageTooltip.
  ///
  /// In en, this message translates to:
  /// **'Manage access'**
  String get cabinetEmployeesManageTooltip;

  /// No description provided for @cabinetEmployeesEmailEmpty.
  ///
  /// In en, this message translates to:
  /// **'Enter email'**
  String get cabinetEmployeesEmailEmpty;

  /// No description provided for @cabinetEmployeesEmailInvalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid email'**
  String get cabinetEmployeesEmailInvalid;

  /// No description provided for @salesTitle.
  ///
  /// In en, this message translates to:
  /// **'Sales'**
  String get salesTitle;

  /// No description provided for @salesRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get salesRetry;

  /// No description provided for @salesMarketplaceWildberries.
  ///
  /// In en, this message translates to:
  /// **'Wildberries'**
  String get salesMarketplaceWildberries;

  /// No description provided for @salesMarketplaceOzon.
  ///
  /// In en, this message translates to:
  /// **'Ozon'**
  String get salesMarketplaceOzon;

  /// No description provided for @salesPointsLabel.
  ///
  /// In en, this message translates to:
  /// **'Points: {count}'**
  String salesPointsLabel(int count);

  /// No description provided for @salesEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'No data for selected period. Pull to refresh.'**
  String get salesEmptyMessage;

  /// No description provided for @salesPreviewMessage.
  ///
  /// In en, this message translates to:
  /// **'Data loaded. Next step: chart.\nPoints count: {count}'**
  String salesPreviewMessage(int count);

  /// No description provided for @salesLastLoadedPoints.
  ///
  /// In en, this message translates to:
  /// **'Last loaded points: {count}'**
  String salesLastLoadedPoints(int count);

  /// Label for date range picker button
  ///
  /// In en, this message translates to:
  /// **'Select period'**
  String get salesSelectPeriod;

  /// Title for revenue chart
  ///
  /// In en, this message translates to:
  /// **'Revenue'**
  String get salesRevenueChart;

  /// Title for sales quantity chart
  ///
  /// In en, this message translates to:
  /// **'Sales quantity'**
  String get salesQuantityChart;

  /// Title for profit chart
  ///
  /// In en, this message translates to:
  /// **'Profit'**
  String get salesProfitChart;

  /// Label for total revenue statistic
  ///
  /// In en, this message translates to:
  /// **'Total revenue'**
  String get salesTotalRevenue;

  /// Label for total profit statistic
  ///
  /// In en, this message translates to:
  /// **'Total profit'**
  String get salesTotalProfit;

  /// Label for total sales count
  ///
  /// In en, this message translates to:
  /// **'Total sales'**
  String get salesTotalSales;

  /// Label for total returns count
  ///
  /// In en, this message translates to:
  /// **'Returns'**
  String get salesTotalReturns;

  /// Label for advertising expenses
  ///
  /// In en, this message translates to:
  /// **'Ads expenses'**
  String get salesAdsExpenses;

  /// Currency symbol for monetary values (application targets Russian markets only, all amounts are in Russian rubles '₽').
  ///
  /// In en, this message translates to:
  /// **'₽'**
  String get salesCurrencySymbol;

  /// No description provided for @reviewsTitle.
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get reviewsTitle;

  /// No description provided for @reviewsTabLabel.
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get reviewsTabLabel;

  /// No description provided for @cabinetsTabLabel.
  ///
  /// In en, this message translates to:
  /// **'Cabinets'**
  String get cabinetsTabLabel;

  /// No description provided for @reviewsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No reviews for selected filters'**
  String get reviewsEmpty;

  /// No description provided for @reviewsError.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String reviewsError(String error);

  /// No description provided for @reviewsRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get reviewsRetry;

  /// No description provided for @reviewsFilterCabinetAll.
  ///
  /// In en, this message translates to:
  /// **'All cabinets'**
  String get reviewsFilterCabinetAll;

  /// No description provided for @reviewsFilterCabinetSelect.
  ///
  /// In en, this message translates to:
  /// **'Cabinet: {name}'**
  String reviewsFilterCabinetSelect(String name);

  /// No description provided for @reviewsFilterAnsweredAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get reviewsFilterAnsweredAll;

  /// No description provided for @reviewsFilterAnsweredYes.
  ///
  /// In en, this message translates to:
  /// **'Answered'**
  String get reviewsFilterAnsweredYes;

  /// No description provided for @reviewsFilterAnsweredNo.
  ///
  /// In en, this message translates to:
  /// **'Unanswered'**
  String get reviewsFilterAnsweredNo;

  /// No description provided for @reviewCardSellerAnswerLabel.
  ///
  /// In en, this message translates to:
  /// **'Your reply'**
  String get reviewCardSellerAnswerLabel;

  /// No description provided for @reviewCardDraftLabel.
  ///
  /// In en, this message translates to:
  /// **'Draft'**
  String get reviewCardDraftLabel;

  /// No description provided for @reviewCardNoText.
  ///
  /// In en, this message translates to:
  /// **'No text'**
  String get reviewCardNoText;

  /// No description provided for @reviewCardNoAnswer.
  ///
  /// In en, this message translates to:
  /// **'No reply'**
  String get reviewCardNoAnswer;

  /// No description provided for @reviewCardAiAnswerLabel.
  ///
  /// In en, this message translates to:
  /// **'AI reply'**
  String get reviewCardAiAnswerLabel;

  /// No description provided for @reviewCardAnonymousBuyer.
  ///
  /// In en, this message translates to:
  /// **'Buyer'**
  String get reviewCardAnonymousBuyer;

  /// No description provided for @reviewDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get reviewDetailTitle;

  /// No description provided for @reviewDetailNoAnswer.
  ///
  /// In en, this message translates to:
  /// **'No reply to this review'**
  String get reviewDetailNoAnswer;

  /// No description provided for @reviewDetailGenerateAnswer.
  ///
  /// In en, this message translates to:
  /// **'Generate reply'**
  String get reviewDetailGenerateAnswer;

  /// No description provided for @reviewDetailGenerating.
  ///
  /// In en, this message translates to:
  /// **'Generating…'**
  String get reviewDetailGenerating;

  /// No description provided for @reviewDetailAnswerGenerated.
  ///
  /// In en, this message translates to:
  /// **'Reply generated'**
  String get reviewDetailAnswerGenerated;

  /// No description provided for @reviewDetailRegenerateAnswer.
  ///
  /// In en, this message translates to:
  /// **'Regenerate reply'**
  String get reviewDetailRegenerateAnswer;

  /// No description provided for @reviewDetailAnswerHint.
  ///
  /// In en, this message translates to:
  /// **'Write a reply to the buyer…'**
  String get reviewDetailAnswerHint;

  /// No description provided for @reviewDetailSaveDraftButton.
  ///
  /// In en, this message translates to:
  /// **'Save draft'**
  String get reviewDetailSaveDraftButton;

  /// No description provided for @reviewDetailDraftSaved.
  ///
  /// In en, this message translates to:
  /// **'Draft saved'**
  String get reviewDetailDraftSaved;

  /// No description provided for @reviewDetailSendButton.
  ///
  /// In en, this message translates to:
  /// **'Publish to marketplace'**
  String get reviewDetailSendButton;

  /// No description provided for @reviewDetailAnswerSent.
  ///
  /// In en, this message translates to:
  /// **'Reply published to marketplace'**
  String get reviewDetailAnswerSent;

  /// No description provided for @reviewsAiSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Generation settings'**
  String get reviewsAiSettingsTitle;

  /// No description provided for @reviewsAiSettingsTooltip.
  ///
  /// In en, this message translates to:
  /// **'Generation settings'**
  String get reviewsAiSettingsTooltip;

  /// No description provided for @reviewsAiSettingsPromptLabel.
  ///
  /// In en, this message translates to:
  /// **'Prompt'**
  String get reviewsAiSettingsPromptLabel;

  /// No description provided for @reviewsAiSettingsPromptHint.
  ///
  /// In en, this message translates to:
  /// **'Describe the tone, length and rules for replies…'**
  String get reviewsAiSettingsPromptHint;

  /// No description provided for @reviewsAiSettingsModelLabel.
  ///
  /// In en, this message translates to:
  /// **'Model'**
  String get reviewsAiSettingsModelLabel;

  /// No description provided for @reviewsAiSettingsModelNotSelected.
  ///
  /// In en, this message translates to:
  /// **'Not selected'**
  String get reviewsAiSettingsModelNotSelected;

  /// No description provided for @reviewsAiSettingsSaveButton.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get reviewsAiSettingsSaveButton;

  /// No description provided for @reviewsAiSettingsSaved.
  ///
  /// In en, this message translates to:
  /// **'Settings saved'**
  String get reviewsAiSettingsSaved;

  /// No description provided for @reviewsAiSettingsLoadError.
  ///
  /// In en, this message translates to:
  /// **'Failed to load settings: {message}'**
  String reviewsAiSettingsLoadError(String message);

  /// No description provided for @reviewsAiSettingsSaveError.
  ///
  /// In en, this message translates to:
  /// **'Failed to save: {message}'**
  String reviewsAiSettingsSaveError(String message);

  /// No description provided for @reviewsAiSettingsRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get reviewsAiSettingsRetry;
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
