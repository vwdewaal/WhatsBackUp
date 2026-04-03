import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_af.dart';
import 'app_localizations_ar.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_gd.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pa.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ro.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_th.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_ur.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
    Locale('af'),
    Locale('ar'),
    Locale('bn'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('gd'),
    Locale('hi'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('nl'),
    Locale('pa'),
    Locale('pl'),
    Locale('pt'),
    Locale('ro'),
    Locale('ru'),
    Locale('th'),
    Locale('tr'),
    Locale('ur'),
    Locale('vi'),
    Locale('zh'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'WhatsBackUp'**
  String get appTitle;

  /// No description provided for @importZip.
  ///
  /// In en, this message translates to:
  /// **'Import ZIP'**
  String get importZip;

  /// No description provided for @importAction.
  ///
  /// In en, this message translates to:
  /// **'Import'**
  String get importAction;

  /// No description provided for @importingLabel.
  ///
  /// In en, this message translates to:
  /// **'Importing'**
  String get importingLabel;

  /// No description provided for @importDoneLabel.
  ///
  /// In en, this message translates to:
  /// **'DONE!'**
  String get importDoneLabel;

  /// No description provided for @importLargeStarted.
  ///
  /// In en, this message translates to:
  /// **'Import Started'**
  String get importLargeStarted;

  /// No description provided for @importTriggeredMessage.
  ///
  /// In en, this message translates to:
  /// **'Import triggered in the background, the chat will open when it\'s complete. Please keep the app open.'**
  String get importTriggeredMessage;

  /// No description provided for @mediaImportingTitle.
  ///
  /// In en, this message translates to:
  /// **'Importing media'**
  String get mediaImportingTitle;

  /// No description provided for @mediaImportingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'You can read the chat while media finishes.'**
  String get mediaImportingSubtitle;

  /// No description provided for @mediaImportPausedTitle.
  ///
  /// In en, this message translates to:
  /// **'Media import paused'**
  String get mediaImportPausedTitle;

  /// No description provided for @mediaImportPausedSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Re-select the original ZIP to resume.'**
  String get mediaImportPausedSubtitle;

  /// No description provided for @mediaImportFailedTitle.
  ///
  /// In en, this message translates to:
  /// **'Media import failed'**
  String get mediaImportFailedTitle;

  /// No description provided for @mediaImportFailedSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tap to retry.'**
  String get mediaImportFailedSubtitle;

  /// No description provided for @mediaImportResumeAction.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get mediaImportResumeAction;

  /// No description provided for @mediaImportingLabel.
  ///
  /// In en, this message translates to:
  /// **'Media importing'**
  String get mediaImportingLabel;

  /// No description provided for @contactLoadingLabel.
  ///
  /// In en, this message translates to:
  /// **'Loading contact…'**
  String get contactLoadingLabel;

  /// No description provided for @contactUnknownName.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contactUnknownName;

  /// No description provided for @contactPhoneLabel.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get contactPhoneLabel;

  /// No description provided for @contactEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get contactEmailLabel;

  /// No description provided for @openContactAction.
  ///
  /// In en, this message translates to:
  /// **'Open contact'**
  String get openContactAction;

  /// No description provided for @contactOpenFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not open contact: {error}'**
  String contactOpenFailed(Object error);

  /// No description provided for @howToImport.
  ///
  /// In en, this message translates to:
  /// **'How to import'**
  String get howToImport;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @searchTitle.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get searchTitle;

  /// No description provided for @textToInclude.
  ///
  /// In en, this message translates to:
  /// **'Text to include:'**
  String get textToInclude;

  /// No description provided for @enterSearchText.
  ///
  /// In en, this message translates to:
  /// **'Enter search text...'**
  String get enterSearchText;

  /// No description provided for @dateRange.
  ///
  /// In en, this message translates to:
  /// **'Date range:'**
  String get dateRange;

  /// No description provided for @fromLabel.
  ///
  /// In en, this message translates to:
  /// **'From:'**
  String get fromLabel;

  /// No description provided for @toLabel.
  ///
  /// In en, this message translates to:
  /// **'To:'**
  String get toLabel;

  /// No description provided for @selectLabel.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get selectLabel;

  /// No description provided for @showOnlyMediaFiles.
  ///
  /// In en, this message translates to:
  /// **'Show only media files'**
  String get showOnlyMediaFiles;

  /// No description provided for @clearAction.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clearAction;

  /// No description provided for @searchAction.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get searchAction;

  /// No description provided for @renameChatTitle.
  ///
  /// In en, this message translates to:
  /// **'Rename chat'**
  String get renameChatTitle;

  /// No description provided for @chatNameHint.
  ///
  /// In en, this message translates to:
  /// **'Chat name'**
  String get chatNameHint;

  /// No description provided for @cancelAction.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelAction;

  /// No description provided for @saveAction.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get saveAction;

  /// No description provided for @hideChatsTooltip.
  ///
  /// In en, this message translates to:
  /// **'Hide chats'**
  String get hideChatsTooltip;

  /// No description provided for @hideAction.
  ///
  /// In en, this message translates to:
  /// **'Hide'**
  String get hideAction;

  /// No description provided for @lockAction.
  ///
  /// In en, this message translates to:
  /// **'Lock'**
  String get lockAction;

  /// No description provided for @noChatsYetHint.
  ///
  /// In en, this message translates to:
  /// **'No chats yet.\nUse \"Import ZIP\" to load a WhatsApp export,\nor export directly from WhatsApp using the chat’s Export Chat option.'**
  String get noChatsYetHint;

  /// No description provided for @noArchivedChats.
  ///
  /// In en, this message translates to:
  /// **'No archived chats.'**
  String get noArchivedChats;

  /// No description provided for @tabChats.
  ///
  /// In en, this message translates to:
  /// **'Chats'**
  String get tabChats;

  /// No description provided for @tabArchived.
  ///
  /// In en, this message translates to:
  /// **'Archived'**
  String get tabArchived;

  /// No description provided for @searchChatsHint.
  ///
  /// In en, this message translates to:
  /// **'Search chats'**
  String get searchChatsHint;

  /// No description provided for @enterCodeTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter code'**
  String get enterCodeTitle;

  /// No description provided for @upTo8DigitsHint.
  ///
  /// In en, this message translates to:
  /// **'Up to 8 digits'**
  String get upTo8DigitsHint;

  /// No description provided for @continueAction.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueAction;

  /// No description provided for @updatingHiddenChats.
  ///
  /// In en, this message translates to:
  /// **'Updating hidden chats...'**
  String get updatingHiddenChats;

  /// No description provided for @chatsUnhidden.
  ///
  /// In en, this message translates to:
  /// **'Chats unhidden.'**
  String get chatsUnhidden;

  /// No description provided for @selectAtLeastOneChat.
  ///
  /// In en, this message translates to:
  /// **'Select at least one chat.'**
  String get selectAtLeastOneChat;

  /// No description provided for @hidingChats.
  ///
  /// In en, this message translates to:
  /// **'Hiding chats...'**
  String get hidingChats;

  /// No description provided for @lockingChats.
  ///
  /// In en, this message translates to:
  /// **'Locking chats...'**
  String get lockingChats;

  /// No description provided for @chatsHidden.
  ///
  /// In en, this message translates to:
  /// **'Chats hidden.'**
  String get chatsHidden;

  /// No description provided for @chatsUnlocked.
  ///
  /// In en, this message translates to:
  /// **'Chats unlocked.'**
  String get chatsUnlocked;

  /// No description provided for @chatsLocked.
  ///
  /// In en, this message translates to:
  /// **'Chats locked.'**
  String get chatsLocked;

  /// No description provided for @unlockChatTitle.
  ///
  /// In en, this message translates to:
  /// **'Unlock chat'**
  String get unlockChatTitle;

  /// No description provided for @enterPasscodeHint.
  ///
  /// In en, this message translates to:
  /// **'Enter passcode'**
  String get enterPasscodeHint;

  /// No description provided for @unlockAction.
  ///
  /// In en, this message translates to:
  /// **'Unlock'**
  String get unlockAction;

  /// No description provided for @incorrectCode.
  ///
  /// In en, this message translates to:
  /// **'Incorrect code.'**
  String get incorrectCode;

  /// No description provided for @importedOn.
  ///
  /// In en, this message translates to:
  /// **'Imported {date}'**
  String importedOn(Object date);

  /// No description provided for @unarchiveAction.
  ///
  /// In en, this message translates to:
  /// **'Unarchive'**
  String get unarchiveAction;

  /// No description provided for @archiveAction.
  ///
  /// In en, this message translates to:
  /// **'Archive'**
  String get archiveAction;

  /// No description provided for @deleteAction.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get deleteAction;

  /// No description provided for @deleteChatTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete chat?'**
  String get deleteChatTitle;

  /// No description provided for @deleteChatConfirm.
  ///
  /// In en, this message translates to:
  /// **'This permanently deletes the archive and media files.'**
  String get deleteChatConfirm;

  /// No description provided for @archiveFolderMissing.
  ///
  /// In en, this message translates to:
  /// **'Archive folder was missing.'**
  String get archiveFolderMissing;

  /// No description provided for @updateFailedWithDetail.
  ///
  /// In en, this message translates to:
  /// **'Update failed: {error}'**
  String updateFailedWithDetail(Object error);

  /// No description provided for @renameAction.
  ///
  /// In en, this message translates to:
  /// **'Rename'**
  String get renameAction;

  /// No description provided for @working.
  ///
  /// In en, this message translates to:
  /// **'Working...'**
  String get working;

  /// No description provided for @importPreparing.
  ///
  /// In en, this message translates to:
  /// **'Preparing import...'**
  String get importPreparing;

  /// No description provided for @importAnalyzing.
  ///
  /// In en, this message translates to:
  /// **'Analyzing file...'**
  String get importAnalyzing;

  /// No description provided for @bookmarksLabel.
  ///
  /// In en, this message translates to:
  /// **'Bookmarks'**
  String get bookmarksLabel;

  /// No description provided for @previousBookmark.
  ///
  /// In en, this message translates to:
  /// **'Previous bookmark'**
  String get previousBookmark;

  /// No description provided for @nextBookmark.
  ///
  /// In en, this message translates to:
  /// **'Next bookmark'**
  String get nextBookmark;

  /// No description provided for @importLargeFileNotice.
  ///
  /// In en, this message translates to:
  /// **'Large file detected. This can take a few minutes.'**
  String get importLargeFileNotice;

  /// No description provided for @importExtracting.
  ///
  /// In en, this message translates to:
  /// **'Extracting files...'**
  String get importExtracting;

  /// No description provided for @importFinalizing.
  ///
  /// In en, this message translates to:
  /// **'Finalizing...'**
  String get importFinalizing;

  /// No description provided for @importFailedWithDetail.
  ///
  /// In en, this message translates to:
  /// **'Import failed: {error}'**
  String importFailedWithDetail(Object error);

  /// No description provided for @sharedFileNotZip.
  ///
  /// In en, this message translates to:
  /// **'Shared file is not a ZIP.'**
  String get sharedFileNotZip;

  /// No description provided for @unlockProToImportMoreChats.
  ///
  /// In en, this message translates to:
  /// **'Unlock BackupChat Pro to import more chats.'**
  String get unlockProToImportMoreChats;

  /// No description provided for @purchaseFailedTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Purchase failed. Please try again.'**
  String get purchaseFailedTryAgain;

  /// No description provided for @importErrorOnlyZip.
  ///
  /// In en, this message translates to:
  /// **'Only .zip files are supported.'**
  String get importErrorOnlyZip;

  /// No description provided for @importErrorNoChatText.
  ///
  /// In en, this message translates to:
  /// **'No WhatsApp chat text file was found in the ZIP.'**
  String get importErrorNoChatText;

  /// No description provided for @importErrorAlreadyImported.
  ///
  /// In en, this message translates to:
  /// **'This chat is already imported.'**
  String get importErrorAlreadyImported;

  /// No description provided for @howToImportTitle.
  ///
  /// In en, this message translates to:
  /// **'How to Import'**
  String get howToImportTitle;

  /// No description provided for @chooseImportMethodTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose your import method'**
  String get chooseImportMethodTitle;

  /// No description provided for @iosExportTitle.
  ///
  /// In en, this message translates to:
  /// **'Export from WhatsApp (iOS)'**
  String get iosExportTitle;

  /// No description provided for @androidExportTitle.
  ///
  /// In en, this message translates to:
  /// **'Export from WhatsApp (Android)'**
  String get androidExportTitle;

  /// No description provided for @iosStepOpenChat.
  ///
  /// In en, this message translates to:
  /// **'Inside the WhatsApp app, click into the chat.'**
  String get iosStepOpenChat;

  /// No description provided for @androidStepOpenChat.
  ///
  /// In en, this message translates to:
  /// **'Inside the WhatsApp app, click into a chat.'**
  String get androidStepOpenChat;

  /// No description provided for @iosStepOpenInfo.
  ///
  /// In en, this message translates to:
  /// **'Click on the person or group’s name at the top.'**
  String get iosStepOpenInfo;

  /// No description provided for @androidStepOpenMenu.
  ///
  /// In en, this message translates to:
  /// **'Click the menu.'**
  String get androidStepOpenMenu;

  /// No description provided for @iosStepExportChat.
  ///
  /// In en, this message translates to:
  /// **'Scroll down to the bottom and select Export chat.'**
  String get iosStepExportChat;

  /// No description provided for @androidStepMoreExport.
  ///
  /// In en, this message translates to:
  /// **'Select “More”.'**
  String get androidStepMoreExport;

  /// No description provided for @iosStepChooseMedia.
  ///
  /// In en, this message translates to:
  /// **'From the app selection menu (share sheet) select WhatsBackUp (on older phones, save to files).'**
  String get iosStepChooseMedia;

  /// No description provided for @androidStepChooseMedia.
  ///
  /// In en, this message translates to:
  /// **'Select Export chat.'**
  String get androidStepChooseMedia;

  /// No description provided for @iosStepShareToApp.
  ///
  /// In en, this message translates to:
  /// **'The chat will import into WhatsBackUp.'**
  String get iosStepShareToApp;

  /// No description provided for @androidStepShareToApp.
  ///
  /// In en, this message translates to:
  /// **'From the app selection menu (share sheet) select WhatsBackUp (on older phones, save to files).'**
  String get androidStepShareToApp;

  /// No description provided for @iosStepSaveToFiles.
  ///
  /// In en, this message translates to:
  /// **'The chat will import into WhatsBackUp.'**
  String get iosStepSaveToFiles;

  /// No description provided for @androidStepSaveToDevice.
  ///
  /// In en, this message translates to:
  /// **'The chat will import into WhatsBackUp.'**
  String get androidStepSaveToDevice;

  /// No description provided for @androidLargeImportNote.
  ///
  /// In en, this message translates to:
  /// **'Please note on older Android phones the import of very large chats will take up to a minute to start.'**
  String get androidLargeImportNote;

  /// No description provided for @importZipTitle.
  ///
  /// In en, this message translates to:
  /// **'Import a saved ZIP'**
  String get importZipTitle;

  /// No description provided for @iosStepImportZip.
  ///
  /// In en, this message translates to:
  /// **'In WhatsBackUp, tap “Import from ZIP” and choose the file from Files.'**
  String get iosStepImportZip;

  /// No description provided for @androidStepImportZip.
  ///
  /// In en, this message translates to:
  /// **'In WhatsBackUp, tap “Import from ZIP” and choose the file from your device.'**
  String get androidStepImportZip;

  /// No description provided for @managingChatsTitle.
  ///
  /// In en, this message translates to:
  /// **'Managing chats'**
  String get managingChatsTitle;

  /// No description provided for @hideChatsWithCodeTitle.
  ///
  /// In en, this message translates to:
  /// **'Hide chats with a code'**
  String get hideChatsWithCodeTitle;

  /// No description provided for @stepTapGhostIcon.
  ///
  /// In en, this message translates to:
  /// **'Tap the ghost icon in the top bar.'**
  String get stepTapGhostIcon;

  /// No description provided for @stepEnterCodeUpTo8Digits.
  ///
  /// In en, this message translates to:
  /// **'Enter a code (up to 8 digits).'**
  String get stepEnterCodeUpTo8Digits;

  /// No description provided for @stepSelectChatsSubmitHide.
  ///
  /// In en, this message translates to:
  /// **'Select chats, then tap Submit to hide them.'**
  String get stepSelectChatsSubmitHide;

  /// No description provided for @stepEnterSameCodeUnhide.
  ///
  /// In en, this message translates to:
  /// **'Enter the same code again to unhide those chats.'**
  String get stepEnterSameCodeUnhide;

  /// No description provided for @stepDifferentCodesHideSets.
  ///
  /// In en, this message translates to:
  /// **'Different codes can hide different sets of chats.'**
  String get stepDifferentCodesHideSets;

  /// No description provided for @lockChatsWithCodeTitle.
  ///
  /// In en, this message translates to:
  /// **'Lock chats with a code'**
  String get lockChatsWithCodeTitle;

  /// No description provided for @stepSwitchHideToLockMode.
  ///
  /// In en, this message translates to:
  /// **'In Settings, switch from Hide to Lock mode.'**
  String get stepSwitchHideToLockMode;

  /// No description provided for @stepTapGhostIconEnterCode.
  ///
  /// In en, this message translates to:
  /// **'Tap the ghost icon and enter a code.'**
  String get stepTapGhostIconEnterCode;

  /// No description provided for @stepSelectChatsSubmitLock.
  ///
  /// In en, this message translates to:
  /// **'Select chats, then tap Submit to lock them.'**
  String get stepSelectChatsSubmitLock;

  /// No description provided for @stepLockedChatsRequireCode.
  ///
  /// In en, this message translates to:
  /// **'Locked chats show a lock icon and require the code to open.'**
  String get stepLockedChatsRequireCode;

  /// No description provided for @archiveOrDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Archive or delete'**
  String get archiveOrDeleteTitle;

  /// No description provided for @stepSwipeRightArchive.
  ///
  /// In en, this message translates to:
  /// **'Swipe right to archive or unarchive.'**
  String get stepSwipeRightArchive;

  /// No description provided for @stepSwipeLeftDelete.
  ///
  /// In en, this message translates to:
  /// **'Swipe left to delete (confirmation required).'**
  String get stepSwipeLeftDelete;

  /// No description provided for @bullet.
  ///
  /// In en, this message translates to:
  /// **'• '**
  String get bullet;

  /// No description provided for @welcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcomeTitle;

  /// No description provided for @gotItAction.
  ///
  /// In en, this message translates to:
  /// **'Got it'**
  String get gotItAction;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @sectionFont.
  ///
  /// In en, this message translates to:
  /// **'Font'**
  String get sectionFont;

  /// No description provided for @sectionColor.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get sectionColor;

  /// No description provided for @sectionAccessibility.
  ///
  /// In en, this message translates to:
  /// **'Accessibility'**
  String get sectionAccessibility;

  /// No description provided for @sectionPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get sectionPrivacy;

  /// No description provided for @sectionPro.
  ///
  /// In en, this message translates to:
  /// **'BackupChat Pro'**
  String get sectionPro;

  /// No description provided for @sectionStorage.
  ///
  /// In en, this message translates to:
  /// **'Storage'**
  String get sectionStorage;

  /// No description provided for @storageTitle.
  ///
  /// In en, this message translates to:
  /// **'Storage'**
  String get storageTitle;

  /// No description provided for @storageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'View device space and chat storage'**
  String get storageSubtitle;

  /// No description provided for @storageAvailable.
  ///
  /// In en, this message translates to:
  /// **'Available storage'**
  String get storageAvailable;

  /// No description provided for @storageAppSize.
  ///
  /// In en, this message translates to:
  /// **'WhatsBackUp size (including chats)'**
  String get storageAppSize;

  /// No description provided for @storageLocation.
  ///
  /// In en, this message translates to:
  /// **'Storage location'**
  String get storageLocation;

  /// No description provided for @storageLocationUnknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get storageLocationUnknown;

  /// No description provided for @storageCalculate.
  ///
  /// In en, this message translates to:
  /// **'Calculate'**
  String get storageCalculate;

  /// No description provided for @storageCalculating.
  ///
  /// In en, this message translates to:
  /// **'Calculating…'**
  String get storageCalculating;

  /// No description provided for @storageNotCalculated.
  ///
  /// In en, this message translates to:
  /// **'Not calculated'**
  String get storageNotCalculated;

  /// No description provided for @storageLastCalculated.
  ///
  /// In en, this message translates to:
  /// **'Last calculated: {date}'**
  String storageLastCalculated(Object date);

  /// No description provided for @storageLastCalculatedNone.
  ///
  /// In en, this message translates to:
  /// **'Last calculated: —'**
  String get storageLastCalculatedNone;

  /// No description provided for @storageChatSizesToggle.
  ///
  /// In en, this message translates to:
  /// **'Show chat sizes in list'**
  String get storageChatSizesToggle;

  /// No description provided for @storageChatSizesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Shows each chat’s total size on the main screen'**
  String get storageChatSizesSubtitle;

  /// No description provided for @storageCleanupTitle.
  ///
  /// In en, this message translates to:
  /// **'Clean failed imports'**
  String get storageCleanupTitle;

  /// No description provided for @storageCleanupSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Removes incomplete or failed imports to free space.'**
  String get storageCleanupSubtitle;

  /// No description provided for @storageCleanupEstimate.
  ///
  /// In en, this message translates to:
  /// **'Estimated space to free'**
  String get storageCleanupEstimate;

  /// No description provided for @storageCleanupAction.
  ///
  /// In en, this message translates to:
  /// **'Clean now'**
  String get storageCleanupAction;

  /// No description provided for @storageCleanupNone.
  ///
  /// In en, this message translates to:
  /// **'No failed imports found.'**
  String get storageCleanupNone;

  /// No description provided for @storageCleanupDone.
  ///
  /// In en, this message translates to:
  /// **'Cleaned {size} of failed imports.'**
  String storageCleanupDone(Object size);

  /// No description provided for @storageCleanupLast.
  ///
  /// In en, this message translates to:
  /// **'Last cleanup: {time}'**
  String storageCleanupLast(Object time);

  /// No description provided for @proActiveTitle.
  ///
  /// In en, this message translates to:
  /// **'Pro is active'**
  String get proActiveTitle;

  /// No description provided for @proUpgradeTitle.
  ///
  /// In en, this message translates to:
  /// **'Upgrade to BackupChat Pro'**
  String get proUpgradeTitle;

  /// No description provided for @proThankYouSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Thank you for supporting the app.'**
  String get proThankYouSubtitle;

  /// No description provided for @proUnlockSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Unlock unlimited imports.'**
  String get proUnlockSubtitle;

  /// No description provided for @debugProOverrideTitle.
  ///
  /// In en, this message translates to:
  /// **'Debug: Force Pro'**
  String get debugProOverrideTitle;

  /// No description provided for @debugProOverrideSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Local override for testing (no purchase required).'**
  String get debugProOverrideSubtitle;

  /// No description provided for @paywallResult.
  ///
  /// In en, this message translates to:
  /// **'Paywall result: {result}.'**
  String paywallResult(Object result);

  /// No description provided for @purchaseCancelled.
  ///
  /// In en, this message translates to:
  /// **'Purchase cancelled.'**
  String get purchaseCancelled;

  /// No description provided for @restorePurchases.
  ///
  /// In en, this message translates to:
  /// **'Restore purchases'**
  String get restorePurchases;

  /// No description provided for @purchasesRestored.
  ///
  /// In en, this message translates to:
  /// **'Purchases restored.'**
  String get purchasesRestored;

  /// No description provided for @restoreFailedTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Restore failed. Try again.'**
  String get restoreFailedTryAgain;

  /// No description provided for @manageSubscription.
  ///
  /// In en, this message translates to:
  /// **'Manage subscription'**
  String get manageSubscription;

  /// No description provided for @openCustomerCenter.
  ///
  /// In en, this message translates to:
  /// **'Open RevenueCat Customer Center.'**
  String get openCustomerCenter;

  /// No description provided for @customerCenterUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Customer Center unavailable.'**
  String get customerCenterUnavailable;

  /// No description provided for @sectionAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get sectionAbout;

  /// No description provided for @aboutDescription.
  ///
  /// In en, this message translates to:
  /// **'WhatsBackUp is a private, offline viewer for WhatsApp chat exports. Import ZIP files or export directly from WhatsApp to keep a clean, searchable archive with media — no network required.'**
  String get aboutDescription;

  /// No description provided for @sectionAboutDeveloper.
  ///
  /// In en, this message translates to:
  /// **'About the developer'**
  String get sectionAboutDeveloper;

  /// No description provided for @aboutDeveloperDescription.
  ///
  /// In en, this message translates to:
  /// **'Built by an independent developer focused on privacy, fast search, and clean chat archives.'**
  String get aboutDeveloperDescription;

  /// No description provided for @sectionHelp.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get sectionHelp;

  /// No description provided for @showOnboardingAgain.
  ///
  /// In en, this message translates to:
  /// **'Show onboarding again'**
  String get showOnboardingAgain;

  /// No description provided for @sdkConfigTitle.
  ///
  /// In en, this message translates to:
  /// **'SDK config'**
  String get sdkConfigTitle;

  /// No description provided for @publicKeyLabel.
  ///
  /// In en, this message translates to:
  /// **'Public key'**
  String get publicKeyLabel;

  /// No description provided for @offeringIdLabel.
  ///
  /// In en, this message translates to:
  /// **'Offering id'**
  String get offeringIdLabel;

  /// No description provided for @entitlementIdLabel.
  ///
  /// In en, this message translates to:
  /// **'Entitlement id'**
  String get entitlementIdLabel;

  /// No description provided for @lifetimeProductIdLabel.
  ///
  /// In en, this message translates to:
  /// **'Lifetime product id'**
  String get lifetimeProductIdLabel;

  /// No description provided for @errorLabel.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String errorLabel(Object error);

  /// No description provided for @offeringsTitle.
  ///
  /// In en, this message translates to:
  /// **'Offerings'**
  String get offeringsTitle;

  /// No description provided for @currentOfferingLabel.
  ///
  /// In en, this message translates to:
  /// **'Current offering'**
  String get currentOfferingLabel;

  /// No description provided for @allOfferingsLabel.
  ///
  /// In en, this message translates to:
  /// **'All offerings'**
  String get allOfferingsLabel;

  /// No description provided for @customerInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'Customer info'**
  String get customerInfoTitle;

  /// No description provided for @activeEntitlementsLabel.
  ///
  /// In en, this message translates to:
  /// **'Active entitlements'**
  String get activeEntitlementsLabel;

  /// No description provided for @originalAppUserIdLabel.
  ///
  /// In en, this message translates to:
  /// **'Original app user id'**
  String get originalAppUserIdLabel;

  /// No description provided for @managementUrlLabel.
  ///
  /// In en, this message translates to:
  /// **'Management URL'**
  String get managementUrlLabel;

  /// No description provided for @noneLabel.
  ///
  /// In en, this message translates to:
  /// **'none'**
  String get noneLabel;

  /// No description provided for @refreshAction.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refreshAction;

  /// No description provided for @noPackagesAvailable.
  ///
  /// In en, this message translates to:
  /// **'No packages available.'**
  String get noPackagesAvailable;

  /// No description provided for @packagesTitle.
  ///
  /// In en, this message translates to:
  /// **'Packages'**
  String get packagesTitle;

  /// No description provided for @fontSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get fontSystem;

  /// No description provided for @fontSerif.
  ///
  /// In en, this message translates to:
  /// **'Serif'**
  String get fontSerif;

  /// No description provided for @fontMono.
  ///
  /// In en, this message translates to:
  /// **'Mono'**
  String get fontMono;

  /// No description provided for @accessibilityFontSizeTitle.
  ///
  /// In en, this message translates to:
  /// **'Font size'**
  String get accessibilityFontSizeTitle;

  /// No description provided for @accessibilityFontSizeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Adjust text size throughout the app.'**
  String get accessibilityFontSizeSubtitle;

  /// No description provided for @accessibilityFontPreview.
  ///
  /// In en, this message translates to:
  /// **'This is an example message bubble.\nIt shows how your chat text will look.\nAdjust the slider to resize.'**
  String get accessibilityFontPreview;

  /// No description provided for @accessibilityHighContrastTitle.
  ///
  /// In en, this message translates to:
  /// **'High contrast mode'**
  String get accessibilityHighContrastTitle;

  /// No description provided for @accessibilityHighContrastSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Increase contrast for better readability.'**
  String get accessibilityHighContrastSubtitle;

  /// No description provided for @colorWhatsAppGreen.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp Green'**
  String get colorWhatsAppGreen;

  /// No description provided for @colorDeepTeal.
  ///
  /// In en, this message translates to:
  /// **'Deep Teal'**
  String get colorDeepTeal;

  /// No description provided for @colorNavy.
  ///
  /// In en, this message translates to:
  /// **'Navy'**
  String get colorNavy;

  /// No description provided for @colorCharcoal.
  ///
  /// In en, this message translates to:
  /// **'Charcoal'**
  String get colorCharcoal;

  /// No description provided for @colorBlindPaletteTitle.
  ///
  /// In en, this message translates to:
  /// **'Color blind palette'**
  String get colorBlindPaletteTitle;

  /// No description provided for @colorBlindPaletteSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Use a palette optimized for color vision deficiencies.'**
  String get colorBlindPaletteSubtitle;

  /// No description provided for @hideChatsInsteadOfLocking.
  ///
  /// In en, this message translates to:
  /// **'Hide chats instead of locking'**
  String get hideChatsInsteadOfLocking;

  /// No description provided for @hideChatsInsteadOfLockingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'When off, chats are visible but passcode protected.'**
  String get hideChatsInsteadOfLockingSubtitle;

  /// No description provided for @previousMatch.
  ///
  /// In en, this message translates to:
  /// **'Previous match'**
  String get previousMatch;

  /// No description provided for @nextMatch.
  ///
  /// In en, this message translates to:
  /// **'Next match'**
  String get nextMatch;

  /// No description provided for @selectSenderOnRight.
  ///
  /// In en, this message translates to:
  /// **'Select which sender is on the right'**
  String get selectSenderOnRight;

  /// No description provided for @couldNotOpenArchive.
  ///
  /// In en, this message translates to:
  /// **'Could not open archive:\n{error}'**
  String couldNotOpenArchive(Object error);

  /// No description provided for @couldNotOpenFile.
  ///
  /// In en, this message translates to:
  /// **'Could not open file: {message}'**
  String couldNotOpenFile(Object message);

  /// No description provided for @attachmentMissing.
  ///
  /// In en, this message translates to:
  /// **'Attachment missing: {filename}'**
  String attachmentMissing(Object filename);

  /// No description provided for @unknownError.
  ///
  /// In en, this message translates to:
  /// **'Unknown error'**
  String get unknownError;

  /// No description provided for @openPdf.
  ///
  /// In en, this message translates to:
  /// **'Open PDF'**
  String get openPdf;

  /// No description provided for @openFile.
  ///
  /// In en, this message translates to:
  /// **'Open file'**
  String get openFile;

  /// No description provided for @openAudio.
  ///
  /// In en, this message translates to:
  /// **'Open audio'**
  String get openAudio;

  /// No description provided for @senderMeLabel.
  ///
  /// In en, this message translates to:
  /// **'{sender} (Me)'**
  String senderMeLabel(Object sender);

  /// No description provided for @chatFileNotFound.
  ///
  /// In en, this message translates to:
  /// **'Chat file not found.'**
  String get chatFileNotFound;

  /// No description provided for @languageTitle.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageTitle;

  /// No description provided for @languageTooltip.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageTooltip;

  /// No description provided for @moreOptionsTooltip.
  ///
  /// In en, this message translates to:
  /// **'More options'**
  String get moreOptionsTooltip;

  /// No description provided for @filterTitle.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filterTitle;

  /// No description provided for @filterDateRange.
  ///
  /// In en, this message translates to:
  /// **'Date range'**
  String get filterDateRange;

  /// No description provided for @filterAnyDate.
  ///
  /// In en, this message translates to:
  /// **'Any date'**
  String get filterAnyDate;

  /// No description provided for @filterIncludeMedia.
  ///
  /// In en, this message translates to:
  /// **'Include media'**
  String get filterIncludeMedia;

  /// No description provided for @filterMediaOnly.
  ///
  /// In en, this message translates to:
  /// **'Media only'**
  String get filterMediaOnly;

  /// No description provided for @filterSenders.
  ///
  /// In en, this message translates to:
  /// **'Senders'**
  String get filterSenders;

  /// No description provided for @applyFilters.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get applyFilters;

  /// No description provided for @clearFilters.
  ///
  /// In en, this message translates to:
  /// **'Clear filters'**
  String get clearFilters;

  /// No description provided for @incrementalImportTitle.
  ///
  /// In en, this message translates to:
  /// **'Chat already exists'**
  String get incrementalImportTitle;

  /// No description provided for @incrementalImportMessage.
  ///
  /// In en, this message translates to:
  /// **'Add this import to \"{name}\"?'**
  String incrementalImportMessage(Object name);

  /// No description provided for @incrementalAddAction.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get incrementalAddAction;

  /// No description provided for @incrementalChooseTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose chat to update'**
  String get incrementalChooseTitle;

  /// No description provided for @incrementalUpdated.
  ///
  /// In en, this message translates to:
  /// **'Chat updated.'**
  String get incrementalUpdated;

  /// No description provided for @languageSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get languageSystem;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @languageSpanish.
  ///
  /// In en, this message translates to:
  /// **'Spanish'**
  String get languageSpanish;

  /// No description provided for @languageGerman.
  ///
  /// In en, this message translates to:
  /// **'German'**
  String get languageGerman;

  /// No description provided for @languageFrench.
  ///
  /// In en, this message translates to:
  /// **'French'**
  String get languageFrench;

  /// No description provided for @languagePortuguese.
  ///
  /// In en, this message translates to:
  /// **'Portuguese'**
  String get languagePortuguese;

  /// No description provided for @languageRomanian.
  ///
  /// In en, this message translates to:
  /// **'Romanian'**
  String get languageRomanian;

  /// No description provided for @languageAfrikaans.
  ///
  /// In en, this message translates to:
  /// **'Afrikaans'**
  String get languageAfrikaans;

  /// No description provided for @languageRussian.
  ///
  /// In en, this message translates to:
  /// **'Russian'**
  String get languageRussian;

  /// No description provided for @showImportButton.
  ///
  /// In en, this message translates to:
  /// **'Show Import button'**
  String get showImportButton;

  /// No description provided for @showImportButtonSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Toggle the Import ZIP button on the home screen.'**
  String get showImportButtonSubtitle;

  /// No description provided for @importButtonHiddenMessage.
  ///
  /// In en, this message translates to:
  /// **'Import button hidden. You can re-enable it in Settings.'**
  String get importButtonHiddenMessage;

  /// No description provided for @upgradeToAccessChat.
  ///
  /// In en, this message translates to:
  /// **'Upgrade to access this chat.'**
  String get upgradeToAccessChat;

  /// No description provided for @aboutLegalTitle.
  ///
  /// In en, this message translates to:
  /// **'About & Legal'**
  String get aboutLegalTitle;

  /// No description provided for @aboutLegalSummary.
  ///
  /// In en, this message translates to:
  /// **'WhatsBackUp is an offline viewer for WhatsApp chat exports. Your chats stay on your device.'**
  String get aboutLegalSummary;

  /// No description provided for @aboutLegalRefundPolicy.
  ///
  /// In en, this message translates to:
  /// **'Refunds: If a refund is issued, only the first 5 imported chats remain accessible. Chats above the free limit are disabled until repurchase.'**
  String get aboutLegalRefundPolicy;

  /// No description provided for @aboutLegalDisclaimers.
  ///
  /// In en, this message translates to:
  /// **'Disclaimers: We are not responsible for data loss, chat content, translation accuracy, or the use of lock/hide features. Please keep your own backups.'**
  String get aboutLegalDisclaimers;

  /// No description provided for @aboutLegalAffiliation.
  ///
  /// In en, this message translates to:
  /// **'Not affiliated with WhatsApp or Meta. WhatsApp is a trademark of Meta Platforms, Inc.'**
  String get aboutLegalAffiliation;

  /// No description provided for @aboutLegalSupport.
  ///
  /// In en, this message translates to:
  /// **'Support: support@dewaallabs.co.uk'**
  String get aboutLegalSupport;

  /// No description provided for @aboutLegalDeveloper.
  ///
  /// In en, this message translates to:
  /// **'Developer: De Waal Labs LTD'**
  String get aboutLegalDeveloper;

  /// No description provided for @aboutLegalJurisdiction.
  ///
  /// In en, this message translates to:
  /// **'Jurisdiction: EU/UK'**
  String get aboutLegalJurisdiction;

  /// No description provided for @aboutLegalVersion.
  ///
  /// In en, this message translates to:
  /// **'App version: {version}'**
  String aboutLegalVersion(Object version);

  /// No description provided for @versionLoading.
  ///
  /// In en, this message translates to:
  /// **'App version: loading...'**
  String get versionLoading;

  /// No description provided for @languageScottishGaelic.
  ///
  /// In en, this message translates to:
  /// **'Scottish Gaelic'**
  String get languageScottishGaelic;

  /// No description provided for @languageScots.
  ///
  /// In en, this message translates to:
  /// **'Scots'**
  String get languageScots;

  /// No description provided for @languageChinese.
  ///
  /// In en, this message translates to:
  /// **'Chinese (Mandarin)'**
  String get languageChinese;

  /// No description provided for @languageHindi.
  ///
  /// In en, this message translates to:
  /// **'Hindi'**
  String get languageHindi;

  /// No description provided for @languageArabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get languageArabic;

  /// No description provided for @languageBengali.
  ///
  /// In en, this message translates to:
  /// **'Bengali'**
  String get languageBengali;

  /// No description provided for @languageJapanese.
  ///
  /// In en, this message translates to:
  /// **'Japanese'**
  String get languageJapanese;

  /// No description provided for @languagePunjabi.
  ///
  /// In en, this message translates to:
  /// **'Punjabi'**
  String get languagePunjabi;

  /// No description provided for @languageKorean.
  ///
  /// In en, this message translates to:
  /// **'Korean'**
  String get languageKorean;

  /// No description provided for @languageTurkish.
  ///
  /// In en, this message translates to:
  /// **'Turkish'**
  String get languageTurkish;

  /// No description provided for @languageItalian.
  ///
  /// In en, this message translates to:
  /// **'Italian'**
  String get languageItalian;

  /// No description provided for @languageVietnamese.
  ///
  /// In en, this message translates to:
  /// **'Vietnamese'**
  String get languageVietnamese;

  /// No description provided for @languageUrdu.
  ///
  /// In en, this message translates to:
  /// **'Urdu'**
  String get languageUrdu;

  /// No description provided for @languageIndonesian.
  ///
  /// In en, this message translates to:
  /// **'Indonesian'**
  String get languageIndonesian;

  /// No description provided for @languageThai.
  ///
  /// In en, this message translates to:
  /// **'Thai'**
  String get languageThai;

  /// No description provided for @languagePolish.
  ///
  /// In en, this message translates to:
  /// **'Polish'**
  String get languagePolish;

  /// No description provided for @languageDutch.
  ///
  /// In en, this message translates to:
  /// **'Dutch'**
  String get languageDutch;

  /// No description provided for @identifyMeTitle.
  ///
  /// In en, this message translates to:
  /// **'Identify yourself'**
  String get identifyMeTitle;

  /// No description provided for @identifyMeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Select your name so we can label your messages correctly.'**
  String get identifyMeSubtitle;

  /// No description provided for @identifyMeNotNow.
  ///
  /// In en, this message translates to:
  /// **'Not now'**
  String get identifyMeNotNow;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'af',
    'ar',
    'bn',
    'de',
    'en',
    'es',
    'fr',
    'gd',
    'hi',
    'id',
    'it',
    'ja',
    'ko',
    'nl',
    'pa',
    'pl',
    'pt',
    'ro',
    'ru',
    'th',
    'tr',
    'ur',
    'vi',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'af':
      return AppLocalizationsAf();
    case 'ar':
      return AppLocalizationsAr();
    case 'bn':
      return AppLocalizationsBn();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'gd':
      return AppLocalizationsGd();
    case 'hi':
      return AppLocalizationsHi();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'nl':
      return AppLocalizationsNl();
    case 'pa':
      return AppLocalizationsPa();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ro':
      return AppLocalizationsRo();
    case 'ru':
      return AppLocalizationsRu();
    case 'th':
      return AppLocalizationsTh();
    case 'tr':
      return AppLocalizationsTr();
    case 'ur':
      return AppLocalizationsUr();
    case 'vi':
      return AppLocalizationsVi();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
