// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'WhatsBackUp';

  @override
  String get importZip => 'Import ZIP';

  @override
  String get importAction => 'Import';

  @override
  String get importingLabel => 'Importing';

  @override
  String get importDoneLabel => 'DONE!';

  @override
  String get importLargeStarted => 'Import Started';

  @override
  String get importTriggeredMessage =>
      'Import triggered in the background, the chat will open when it\'s complete. Please keep the app open.';

  @override
  String get mediaImportingTitle => 'Importing media';

  @override
  String get mediaImportingSubtitle =>
      'You can read the chat while media finishes.';

  @override
  String get mediaImportPausedTitle => 'Media import paused';

  @override
  String get mediaImportPausedSubtitle =>
      'Re-select the original ZIP to resume.';

  @override
  String get mediaImportFailedTitle => 'Media import failed';

  @override
  String get mediaImportFailedSubtitle => 'Tap to retry.';

  @override
  String get mediaImportResumeAction => 'Resume';

  @override
  String get mediaImportingLabel => 'Media importing';

  @override
  String get contactLoadingLabel => 'Loading contact…';

  @override
  String get contactUnknownName => 'Contact';

  @override
  String get contactPhoneLabel => 'Phone';

  @override
  String get contactEmailLabel => 'Email';

  @override
  String get openContactAction => 'Open contact';

  @override
  String contactOpenFailed(Object error) {
    return 'Could not open contact: $error';
  }

  @override
  String get howToImport => 'How to import';

  @override
  String get settings => 'Settings';

  @override
  String get searchTitle => 'Search';

  @override
  String get textToInclude => 'Text to include:';

  @override
  String get enterSearchText => 'Enter search text...';

  @override
  String get dateRange => 'Date range:';

  @override
  String get fromLabel => 'From:';

  @override
  String get toLabel => 'To:';

  @override
  String get selectLabel => 'Select';

  @override
  String get showOnlyMediaFiles => 'Show only media files';

  @override
  String get clearAction => 'Clear';

  @override
  String get searchAction => 'Search';

  @override
  String get renameChatTitle => 'Rename chat';

  @override
  String get chatNameHint => 'Chat name';

  @override
  String get cancelAction => 'Cancel';

  @override
  String get saveAction => 'Save';

  @override
  String get hideChatsTooltip => 'Hide chats';

  @override
  String get hideAction => 'Hide';

  @override
  String get lockAction => 'Lock';

  @override
  String get noChatsYetHint =>
      'No chats yet.\nUse \"Import ZIP\" to load a WhatsApp export,\nor export directly from WhatsApp using the chat’s Export Chat option.';

  @override
  String get noArchivedChats => 'No archived chats.';

  @override
  String get tabChats => 'Chats';

  @override
  String get tabArchived => 'Archived';

  @override
  String get searchChatsHint => 'Search chats';

  @override
  String get enterCodeTitle => 'Enter code';

  @override
  String get upTo8DigitsHint => 'Up to 8 digits';

  @override
  String get continueAction => 'Continue';

  @override
  String get updatingHiddenChats => 'Updating hidden chats...';

  @override
  String get chatsUnhidden => 'Chats unhidden.';

  @override
  String get selectAtLeastOneChat => 'Select at least one chat.';

  @override
  String get hidingChats => 'Hiding chats...';

  @override
  String get lockingChats => 'Locking chats...';

  @override
  String get chatsHidden => 'Chats hidden.';

  @override
  String get chatsUnlocked => 'Chats unlocked.';

  @override
  String get chatsLocked => 'Chats locked.';

  @override
  String get unlockChatTitle => 'Unlock chat';

  @override
  String get enterPasscodeHint => 'Enter passcode';

  @override
  String get unlockAction => 'Unlock';

  @override
  String get incorrectCode => 'Incorrect code.';

  @override
  String importedOn(Object date) {
    return 'Imported $date';
  }

  @override
  String get unarchiveAction => 'Unarchive';

  @override
  String get archiveAction => 'Archive';

  @override
  String get deleteAction => 'Delete';

  @override
  String get deleteChatTitle => 'Delete chat?';

  @override
  String get deleteChatConfirm =>
      'This permanently deletes the archive and media files.';

  @override
  String get archiveFolderMissing => 'Archive folder was missing.';

  @override
  String updateFailedWithDetail(Object error) {
    return 'Update failed: $error';
  }

  @override
  String get renameAction => 'Rename';

  @override
  String get working => 'Working...';

  @override
  String get importPreparing => 'Preparing import...';

  @override
  String get importAnalyzing => 'Analyzing file...';

  @override
  String get bookmarksLabel => 'Bookmarks';

  @override
  String get previousBookmark => 'Previous bookmark';

  @override
  String get nextBookmark => 'Next bookmark';

  @override
  String get importLargeFileNotice =>
      'Large file detected. This can take a few minutes.';

  @override
  String get importExtracting => 'Extracting files...';

  @override
  String get importFinalizing => 'Finalizing...';

  @override
  String importFailedWithDetail(Object error) {
    return 'Import failed: $error';
  }

  @override
  String get sharedFileNotZip => 'Shared file is not a ZIP.';

  @override
  String get unlockProToImportMoreChats =>
      'Unlock BackupChat Pro to import more chats.';

  @override
  String get purchaseFailedTryAgain => 'Purchase failed. Please try again.';

  @override
  String get importErrorOnlyZip => 'Only .zip files are supported.';

  @override
  String get importErrorNoChatText =>
      'No WhatsApp chat text file was found in the ZIP.';

  @override
  String get importErrorAlreadyImported => 'This chat is already imported.';

  @override
  String get howToImportTitle => 'How to Import';

  @override
  String get chooseImportMethodTitle => 'Choose your import method';

  @override
  String get iosExportTitle => 'Export from WhatsApp (iOS)';

  @override
  String get androidExportTitle => 'Export from WhatsApp (Android)';

  @override
  String get iosStepOpenChat => 'Inside the WhatsApp app, click into the chat.';

  @override
  String get androidStepOpenChat =>
      'Inside the WhatsApp app, click into a chat.';

  @override
  String get iosStepOpenInfo =>
      'Click on the person or group’s name at the top.';

  @override
  String get androidStepOpenMenu => 'Click the menu.';

  @override
  String get iosStepExportChat =>
      'Scroll down to the bottom and select Export chat.';

  @override
  String get androidStepMoreExport => 'Select “More”.';

  @override
  String get iosStepChooseMedia =>
      'From the app selection menu (share sheet) select WhatsBackUp (on older phones, save to files).';

  @override
  String get androidStepChooseMedia => 'Select Export chat.';

  @override
  String get iosStepShareToApp => 'The chat will import into WhatsBackUp.';

  @override
  String get androidStepShareToApp =>
      'From the app selection menu (share sheet) select WhatsBackUp (on older phones, save to files).';

  @override
  String get iosStepSaveToFiles => 'The chat will import into WhatsBackUp.';

  @override
  String get androidStepSaveToDevice =>
      'The chat will import into WhatsBackUp.';

  @override
  String get androidLargeImportNote =>
      'Please note on older Android phones the import of very large chats will take up to a minute to start.';

  @override
  String get importZipTitle => 'Import a saved ZIP';

  @override
  String get iosStepImportZip =>
      'In WhatsBackUp, tap “Import from ZIP” and choose the file from Files.';

  @override
  String get androidStepImportZip =>
      'In WhatsBackUp, tap “Import from ZIP” and choose the file from your device.';

  @override
  String get managingChatsTitle => 'Managing chats';

  @override
  String get hideChatsWithCodeTitle => 'Hide chats with a code';

  @override
  String get stepTapGhostIcon => 'Tap the ghost icon in the top bar.';

  @override
  String get stepEnterCodeUpTo8Digits => 'Enter a code (up to 8 digits).';

  @override
  String get stepSelectChatsSubmitHide =>
      'Select chats, then tap Submit to hide them.';

  @override
  String get stepEnterSameCodeUnhide =>
      'Enter the same code again to unhide those chats.';

  @override
  String get stepDifferentCodesHideSets =>
      'Different codes can hide different sets of chats.';

  @override
  String get lockChatsWithCodeTitle => 'Lock chats with a code';

  @override
  String get stepSwitchHideToLockMode =>
      'In Settings, switch from Hide to Lock mode.';

  @override
  String get stepTapGhostIconEnterCode =>
      'Tap the ghost icon and enter a code.';

  @override
  String get stepSelectChatsSubmitLock =>
      'Select chats, then tap Submit to lock them.';

  @override
  String get stepLockedChatsRequireCode =>
      'Locked chats show a lock icon and require the code to open.';

  @override
  String get archiveOrDeleteTitle => 'Archive or delete';

  @override
  String get stepSwipeRightArchive => 'Swipe right to archive or unarchive.';

  @override
  String get stepSwipeLeftDelete =>
      'Swipe left to delete (confirmation required).';

  @override
  String get bullet => '• ';

  @override
  String get welcomeTitle => 'Welcome';

  @override
  String get gotItAction => 'Got it';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get sectionFont => 'Font';

  @override
  String get sectionColor => 'Color';

  @override
  String get sectionAccessibility => 'Accessibility';

  @override
  String get sectionPrivacy => 'Privacy';

  @override
  String get sectionPro => 'BackupChat Pro';

  @override
  String get sectionStorage => 'Storage';

  @override
  String get storageTitle => 'Storage';

  @override
  String get storageSubtitle => 'View device space and chat storage';

  @override
  String get storageAvailable => 'Available storage';

  @override
  String get storageAppSize => 'WhatsBackUp size (including chats)';

  @override
  String get storageLocation => 'Storage location';

  @override
  String get storageLocationUnknown => 'Unknown';

  @override
  String get storageCalculate => 'Calculate';

  @override
  String get storageCalculating => 'Calculating…';

  @override
  String get storageNotCalculated => 'Not calculated';

  @override
  String storageLastCalculated(Object date) {
    return 'Last calculated: $date';
  }

  @override
  String get storageLastCalculatedNone => 'Last calculated: —';

  @override
  String get storageChatSizesToggle => 'Show chat sizes in list';

  @override
  String get storageChatSizesSubtitle =>
      'Shows each chat’s total size on the main screen';

  @override
  String get storageCleanupTitle => 'Clean failed imports';

  @override
  String get storageCleanupSubtitle =>
      'Removes incomplete or failed imports to free space.';

  @override
  String get storageCleanupEstimate => 'Estimated space to free';

  @override
  String get storageCleanupAction => 'Clean now';

  @override
  String get storageCleanupNone => 'No failed imports found.';

  @override
  String storageCleanupDone(Object size) {
    return 'Cleaned $size of failed imports.';
  }

  @override
  String storageCleanupLast(Object time) {
    return 'Last cleanup: $time';
  }

  @override
  String get proActiveTitle => 'Pro is active';

  @override
  String get proUpgradeTitle => 'Upgrade to BackupChat Pro';

  @override
  String get proThankYouSubtitle => 'Thank you for supporting the app.';

  @override
  String get proUnlockSubtitle => 'Unlock unlimited imports.';

  @override
  String get debugProOverrideTitle => 'Debug: Force Pro';

  @override
  String get debugProOverrideSubtitle =>
      'Local override for testing (no purchase required).';

  @override
  String paywallResult(Object result) {
    return 'Paywall result: $result.';
  }

  @override
  String get purchaseCancelled => 'Purchase cancelled.';

  @override
  String get restorePurchases => 'Restore purchases';

  @override
  String get purchasesRestored => 'Purchases restored.';

  @override
  String get restoreFailedTryAgain => 'Restore failed. Try again.';

  @override
  String get manageSubscription => 'Manage subscription';

  @override
  String get openCustomerCenter => 'Open RevenueCat Customer Center.';

  @override
  String get customerCenterUnavailable => 'Customer Center unavailable.';

  @override
  String get sectionAbout => 'About';

  @override
  String get aboutDescription =>
      'WhatsBackUp is a private, offline viewer for WhatsApp chat exports. Import ZIP files or export directly from WhatsApp to keep a clean, searchable archive with media — no network required.';

  @override
  String get sectionAboutDeveloper => 'About the developer';

  @override
  String get aboutDeveloperDescription =>
      'Built by an independent developer focused on privacy, fast search, and clean chat archives.';

  @override
  String get sectionHelp => 'Help';

  @override
  String get showOnboardingAgain => 'Show onboarding again';

  @override
  String get sdkConfigTitle => 'SDK config';

  @override
  String get publicKeyLabel => 'Public key';

  @override
  String get offeringIdLabel => 'Offering id';

  @override
  String get entitlementIdLabel => 'Entitlement id';

  @override
  String get lifetimeProductIdLabel => 'Lifetime product id';

  @override
  String errorLabel(Object error) {
    return 'Error: $error';
  }

  @override
  String get offeringsTitle => 'Offerings';

  @override
  String get currentOfferingLabel => 'Current offering';

  @override
  String get allOfferingsLabel => 'All offerings';

  @override
  String get customerInfoTitle => 'Customer info';

  @override
  String get activeEntitlementsLabel => 'Active entitlements';

  @override
  String get originalAppUserIdLabel => 'Original app user id';

  @override
  String get managementUrlLabel => 'Management URL';

  @override
  String get noneLabel => 'none';

  @override
  String get refreshAction => 'Refresh';

  @override
  String get noPackagesAvailable => 'No packages available.';

  @override
  String get packagesTitle => 'Packages';

  @override
  String get fontSystem => 'System';

  @override
  String get fontSerif => 'Serif';

  @override
  String get fontMono => 'Mono';

  @override
  String get accessibilityFontSizeTitle => 'Font size';

  @override
  String get accessibilityFontSizeSubtitle =>
      'Adjust text size throughout the app.';

  @override
  String get accessibilityFontPreview =>
      'This is an example message bubble.\nIt shows how your chat text will look.\nAdjust the slider to resize.';

  @override
  String get accessibilityHighContrastTitle => 'High contrast mode';

  @override
  String get accessibilityHighContrastSubtitle =>
      'Increase contrast for better readability.';

  @override
  String get colorWhatsAppGreen => 'WhatsApp Green';

  @override
  String get colorDeepTeal => 'Deep Teal';

  @override
  String get colorNavy => 'Navy';

  @override
  String get colorCharcoal => 'Charcoal';

  @override
  String get colorBlindPaletteTitle => 'Color blind palette';

  @override
  String get colorBlindPaletteSubtitle =>
      'Use a palette optimized for color vision deficiencies.';

  @override
  String get hideChatsInsteadOfLocking => 'Hide chats instead of locking';

  @override
  String get hideChatsInsteadOfLockingSubtitle =>
      'When off, chats are visible but passcode protected.';

  @override
  String get previousMatch => 'Previous match';

  @override
  String get nextMatch => 'Next match';

  @override
  String get selectSenderOnRight => 'Select which sender is on the right';

  @override
  String couldNotOpenArchive(Object error) {
    return 'Could not open archive:\n$error';
  }

  @override
  String couldNotOpenFile(Object message) {
    return 'Could not open file: $message';
  }

  @override
  String attachmentMissing(Object filename) {
    return 'Attachment missing: $filename';
  }

  @override
  String get unknownError => 'Unknown error';

  @override
  String get openPdf => 'Open PDF';

  @override
  String get openFile => 'Open file';

  @override
  String get openAudio => 'Open audio';

  @override
  String senderMeLabel(Object sender) {
    return '$sender (Me)';
  }

  @override
  String get chatFileNotFound => 'Chat file not found.';

  @override
  String get languageTitle => 'Language';

  @override
  String get languageTooltip => 'Language';

  @override
  String get moreOptionsTooltip => 'More options';

  @override
  String get filterTitle => 'Filter';

  @override
  String get filterDateRange => 'Date range';

  @override
  String get filterAnyDate => 'Any date';

  @override
  String get filterIncludeMedia => 'Include media';

  @override
  String get filterMediaOnly => 'Media only';

  @override
  String get filterSenders => 'Senders';

  @override
  String get applyFilters => 'Apply';

  @override
  String get clearFilters => 'Clear filters';

  @override
  String get incrementalImportTitle => 'Chat already exists';

  @override
  String incrementalImportMessage(Object name) {
    return 'Add this import to \"$name\"?';
  }

  @override
  String get incrementalAddAction => 'Add';

  @override
  String get incrementalChooseTitle => 'Choose chat to update';

  @override
  String get incrementalUpdated => 'Chat updated.';

  @override
  String get languageSystem => 'System';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageSpanish => 'Spanish';

  @override
  String get languageGerman => 'German';

  @override
  String get languageFrench => 'French';

  @override
  String get languagePortuguese => 'Portuguese';

  @override
  String get languageRomanian => 'Romanian';

  @override
  String get languageAfrikaans => 'Afrikaans';

  @override
  String get languageRussian => 'Russian';

  @override
  String get showImportButton => 'Show Import button';

  @override
  String get showImportButtonSubtitle =>
      'Toggle the Import ZIP button on the home screen.';

  @override
  String get importButtonHiddenMessage =>
      'Import button hidden. You can re-enable it in Settings.';

  @override
  String get upgradeToAccessChat => 'Upgrade to access this chat.';

  @override
  String get aboutLegalTitle => 'About & Legal';

  @override
  String get aboutLegalSummary =>
      'WhatsBackUp is an offline viewer for WhatsApp chat exports. Your chats stay on your device.';

  @override
  String get aboutLegalRefundPolicy =>
      'Refunds: If a refund is issued, only the first 5 imported chats remain accessible. Chats above the free limit are disabled until repurchase.';

  @override
  String get aboutLegalDisclaimers =>
      'Disclaimers: We are not responsible for data loss, chat content, translation accuracy, or the use of lock/hide features. Please keep your own backups.';

  @override
  String get aboutLegalAffiliation =>
      'Not affiliated with WhatsApp or Meta. WhatsApp is a trademark of Meta Platforms, Inc.';

  @override
  String get aboutLegalSupport => 'Support: support@dewaallabs.co.uk';

  @override
  String get aboutLegalDeveloper => 'Developer: De Waal Labs LTD';

  @override
  String get aboutLegalJurisdiction => 'Jurisdiction: EU/UK';

  @override
  String aboutLegalVersion(Object version) {
    return 'App version: $version';
  }

  @override
  String get versionLoading => 'App version: loading...';

  @override
  String get languageScottishGaelic => 'Scottish Gaelic';

  @override
  String get languageScots => 'Scots';

  @override
  String get languageChinese => 'Chinese (Mandarin)';

  @override
  String get languageHindi => 'Hindi';

  @override
  String get languageArabic => 'Arabic';

  @override
  String get languageBengali => 'Bengali';

  @override
  String get languageJapanese => 'Japanese';

  @override
  String get languagePunjabi => 'Punjabi';

  @override
  String get languageKorean => 'Korean';

  @override
  String get languageTurkish => 'Turkish';

  @override
  String get languageItalian => 'Italian';

  @override
  String get languageVietnamese => 'Vietnamese';

  @override
  String get languageUrdu => 'Urdu';

  @override
  String get languageIndonesian => 'Indonesian';

  @override
  String get languageThai => 'Thai';

  @override
  String get languagePolish => 'Polish';

  @override
  String get languageDutch => 'Dutch';

  @override
  String get identifyMeTitle => 'Identify yourself';

  @override
  String get identifyMeSubtitle =>
      'Select your name so we can label your messages correctly.';

  @override
  String get identifyMeNotNow => 'Not now';
}
