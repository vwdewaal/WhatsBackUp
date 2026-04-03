// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Panjabi Punjabi (`pa`).
class AppLocalizationsPa extends AppLocalizations {
  AppLocalizationsPa([String locale = 'pa']) : super(locale);

  @override
  String get appTitle => '__ਟਰਮ_0__';

  @override
  String get importZip => 'ਆਯਾਤ ਕਰੋ ZIP';

  @override
  String get importAction => 'ਆਯਾਤ ਕਰੋ';

  @override
  String get importingLabel => 'ਆਯਾਤ ਕੀਤਾ ਜਾ ਰਿਹਾ ਹੈ';

  @override
  String get importDoneLabel => 'ਹੋ ਗਿਆ!';

  @override
  String get importLargeStarted => 'ਆਯਾਤ ਸ਼ੁਰੂ ਹੋਇਆ';

  @override
  String get importTriggeredMessage =>
      'ਬੈਕਗ੍ਰਾਊਂਡ ਵਿੱਚ ਆਯਾਤ ਚਾਲੂ ਹੋਇਆ, ਚੈਟ ਪੂਰੀ ਹੋਣ \'ਤੇ ਖੁੱਲ੍ਹ ਜਾਵੇਗੀ। ਕਿਰਪਾ ਕਰਕੇ ਐਪ ਨੂੰ ਖੁੱਲ੍ਹਾ ਰੱਖੋ।';

  @override
  String get mediaImportingTitle => 'ਮੀਡੀਆ ਆਯਾਤ ਕੀਤਾ ਜਾ ਰਿਹਾ ਹੈ';

  @override
  String get mediaImportingSubtitle =>
      'ਜਦੋਂ ਤੱਕ ਮੀਡੀਆ ਖਤਮ ਨਹੀਂ ਹੁੰਦਾ, ਤੁਸੀਂ ਚੈਟ ਪੜ੍ਹ ਸਕਦੇ ਹੋ।';

  @override
  String get mediaImportPausedTitle => 'ਮੀਡੀਆ ਆਯਾਤ ਰੋਕਿਆ ਗਿਆ';

  @override
  String get mediaImportPausedSubtitle =>
      'ਮੁੜ-ਚਾਲੂ ਕਰਨ ਲਈ ਅਸਲੀ ZIP ਨੂੰ ਮੁੜ-ਚੁਣੋ।';

  @override
  String get mediaImportFailedTitle => 'ਮੀਡੀਆ ਆਯਾਤ ਅਸਫਲ ਰਿਹਾ';

  @override
  String get mediaImportFailedSubtitle => 'ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰਨ ਲਈ ਟੈਪ ਕਰੋ।';

  @override
  String get mediaImportResumeAction => 'ਰੈਜ਼ਿਊਮੇ';

  @override
  String get mediaImportingLabel => 'ਮੀਡੀਆ ਆਯਾਤ ਕਰਨਾ';

  @override
  String get contactLoadingLabel => 'ਸੰਪਰਕ ਲੋਡ ਕੀਤਾ ਜਾ ਰਿਹਾ ਹੈ…';

  @override
  String get contactUnknownName => 'ਸੰਪਰਕ';

  @override
  String get contactPhoneLabel => 'ਫ਼ੋਨ';

  @override
  String get contactEmailLabel => 'ਈਮੇਲ';

  @override
  String get openContactAction => 'ਸੰਪਰਕ ਖੋਲ੍ਹੋ';

  @override
  String contactOpenFailed(Object error) {
    return 'ਸੰਪਰਕ ਖੋਲ੍ਹਿਆ ਨਹੀਂ ਜਾ ਸਕਿਆ: $error';
  }

  @override
  String get howToImport => 'ਕਿਵੇਂ ਆਯਾਤ ਕਰਨਾ ਹੈ';

  @override
  String get settings => 'ਸੈਟਿੰਗਾਂ';

  @override
  String get searchTitle => 'ਖੋਜ';

  @override
  String get textToInclude => 'ਸ਼ਾਮਲ ਕਰਨ ਲਈ ਟੈਕਸਟ:';

  @override
  String get enterSearchText => 'ਖੋਜ ਟੈਕਸਟ ਦਰਜ ਕਰੋ...';

  @override
  String get dateRange => 'ਤਾਰੀਖ਼ ਸੀਮਾ:';

  @override
  String get fromLabel => 'ਵੱਲੋਂ:';

  @override
  String get toLabel => 'ਨੂੰ:';

  @override
  String get selectLabel => 'ਚੁਣੋ';

  @override
  String get showOnlyMediaFiles => 'ਸਿਰਫ਼ ਮੀਡੀਆ ਫਾਈਲਾਂ ਦਿਖਾਓ';

  @override
  String get clearAction => 'ਸਾਫ਼';

  @override
  String get searchAction => 'ਖੋਜ';

  @override
  String get renameChatTitle => 'ਚੈਟ ਦਾ ਨਾਮ ਬਦਲੋ';

  @override
  String get chatNameHint => 'ਚੈਟ ਨਾਮ';

  @override
  String get cancelAction => 'ਰੱਦ ਕਰੋ';

  @override
  String get saveAction => 'ਸੇਵ ਕਰੋ';

  @override
  String get hideChatsTooltip => 'ਚੈਟਾਂ ਲੁਕਾਓ';

  @override
  String get hideAction => 'ਲੁਕਾਓ';

  @override
  String get lockAction => 'ਲਾਕ';

  @override
  String get noChatsYetHint =>
      'ਹਾਲੇ ਕੋਈ ਚੈਟ ਨਹੀਂ ਹੈ।\nWhatsApp ਨਿਰਯਾਤ ਲੋਡ ਕਰਨ ਲਈ \"ਆਯਾਤ ZIP\" ਦੀ ਵਰਤੋਂ ਕਰੋ,\nਜਾਂ ਚੈਟ ਦੇ ਐਕਸਪੋਰਟ ਚੈਟ ਵਿਕਲਪ ਦੀ ਵਰਤੋਂ ਕਰਕੇ WhatsApp ਤੋਂ ਸਿੱਧਾ ਐਕਸਪੋਰਟ ਕਰੋ।';

  @override
  String get noArchivedChats => 'ਕੋਈ ਪੁਰਾਲੇਖਬੱਧ ਚੈਟ ਨਹੀਂ।';

  @override
  String get tabChats => 'ਗੱਲਬਾਤ';

  @override
  String get tabArchived => 'ਪੁਰਾਲੇਖਬੱਧ';

  @override
  String get searchChatsHint => 'ਚੈਟਾਂ ਖੋਜੋ';

  @override
  String get enterCodeTitle => 'ਕੋਡ ਦਰਜ ਕਰੋ';

  @override
  String get upTo8DigitsHint => '8 ਅੰਕਾਂ ਤੱਕ';

  @override
  String get continueAction => 'ਜਾਰੀ ਰੱਖੋ';

  @override
  String get updatingHiddenChats =>
      'ਲੁਕੀਆਂ ਹੋਈਆਂ ਚੈਟਾਂ ਨੂੰ ਅੱਪਡੇਟ ਕੀਤਾ ਜਾ ਰਿਹਾ ਹੈ...';

  @override
  String get chatsUnhidden => 'ਚੈਟਾਂ ਅਣਲੁਕੀਆਂ।';

  @override
  String get selectAtLeastOneChat => 'ਘੱਟੋ-ਘੱਟ ਇੱਕ ਚੈਟ ਚੁਣੋ।';

  @override
  String get hidingChats => 'ਚੈਟਾਂ ਨੂੰ ਲੁਕਾਇਆ ਜਾ ਰਿਹਾ ਹੈ...';

  @override
  String get lockingChats => 'ਚੈਟਾਂ ਨੂੰ ਲਾਕ ਕੀਤਾ ਜਾ ਰਿਹਾ ਹੈ...';

  @override
  String get chatsHidden => 'ਚੈਟਾਂ ਲੁਕਾਈਆਂ ਗਈਆਂ।';

  @override
  String get chatsUnlocked => 'ਚੈਟਾਂ ਅਣਲਾਕ ਕੀਤੀਆਂ ਗਈਆਂ।';

  @override
  String get chatsLocked => 'ਚੈਟਾਂ ਲਾਕ ਕੀਤੀਆਂ ਗਈਆਂ।';

  @override
  String get unlockChatTitle => 'ਚੈਟ ਨੂੰ ਅਣਲਾਕ ਕਰੋ';

  @override
  String get enterPasscodeHint => 'ਪਾਸਕੋਡ ਦਰਜ ਕਰੋ';

  @override
  String get unlockAction => 'ਅਨਲੌਕ ਕਰੋ';

  @override
  String get incorrectCode => 'ਗਲਤ ਕੋਡ।';

  @override
  String importedOn(Object date) {
    return 'ਆਯਾਤ ਕੀਤਾ $date';
  }

  @override
  String get unarchiveAction => 'ਅਣਪੁਰਾਲੇਖਬੱਧ ਕਰੋ';

  @override
  String get archiveAction => 'ਪੁਰਾਲੇਖ';

  @override
  String get deleteAction => 'ਮਿਟਾਓ';

  @override
  String get deleteChatTitle => 'ਕੀ ਚੈਟ ਮਿਟਾਉਣੀ ਹੈ?';

  @override
  String get deleteChatConfirm =>
      'ਇਹ ਪੁਰਾਲੇਖ ਅਤੇ ਮੀਡੀਆ ਫਾਈਲਾਂ ਨੂੰ ਸਥਾਈ ਤੌਰ \'ਤੇ ਮਿਟਾ ਦਿੰਦਾ ਹੈ।';

  @override
  String get archiveFolderMissing => 'ਪੁਰਾਲੇਖ ਫੋਲਡਰ ਗੁੰਮ ਸੀ।';

  @override
  String updateFailedWithDetail(Object error) {
    return 'ਅੱਪਡੇਟ ਅਸਫਲ ਰਿਹਾ: $error';
  }

  @override
  String get renameAction => 'ਨਾਮ ਬਦਲੋ';

  @override
  String get working => 'ਕੰਮ ਕਰ ਰਿਹਾ ਹੈ...';

  @override
  String get importPreparing => 'ਆਯਾਤ ਦੀ ਤਿਆਰੀ ਕੀਤੀ ਜਾ ਰਹੀ ਹੈ...';

  @override
  String get importAnalyzing => 'ਫਾਈਲ ਦਾ ਵਿਸ਼ਲੇਸ਼ਣ ਕੀਤਾ ਜਾ ਰਿਹਾ ਹੈ...';

  @override
  String get bookmarksLabel => 'ਬੁੱਕਮਾਰਕ';

  @override
  String get previousBookmark => 'ਪਿਛਲਾ ਬੁੱਕਮਾਰਕ';

  @override
  String get nextBookmark => 'ਅਗਲਾ ਬੁੱਕਮਾਰਕ';

  @override
  String get importLargeFileNotice =>
      'ਵੱਡੀ ਫਾਈਲ ਮਿਲੀ। ਇਸ ਵਿੱਚ ਕੁਝ ਮਿੰਟ ਲੱਗ ਸਕਦੇ ਹਨ।';

  @override
  String get importExtracting => 'ਫਾਈਲਾਂ ਐਕਸਟਰੈਕਟ ਕੀਤੀਆਂ ਜਾ ਰਹੀਆਂ ਹਨ...';

  @override
  String get importFinalizing => 'ਅੰਤਿਮ ਰੂਪ ਦਿੱਤਾ ਜਾ ਰਿਹਾ ਹੈ...';

  @override
  String importFailedWithDetail(Object error) {
    return 'ਆਯਾਤ ਅਸਫਲ ਰਿਹਾ: $error';
  }

  @override
  String get sharedFileNotZip => 'ਸਾਂਝੀ ਕੀਤੀ ਫਾਈਲ ZIP ਨਹੀਂ ਹੈ।';

  @override
  String get unlockProToImportMoreChats =>
      'ਹੋਰ ਚੈਟਾਂ ਆਯਾਤ ਕਰਨ ਲਈ BackupChat Pro ਨੂੰ ਅਨਲੌਕ ਕਰੋ।';

  @override
  String get purchaseFailedTryAgain =>
      'ਖਰੀਦ ਅਸਫਲ ਰਹੀ। ਕਿਰਪਾ ਕਰਕੇ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get importErrorOnlyZip => 'ਸਿਰਫ਼ .zip ਫਾਈਲਾਂ ਹੀ ਸਮਰਥਿਤ ਹਨ।';

  @override
  String get importErrorNoChatText =>
      'ZIP ਵਿੱਚ ਕੋਈ WhatsApp ਚੈਟ ਟੈਕਸਟ ਫਾਈਲ ਨਹੀਂ ਮਿਲੀ।';

  @override
  String get importErrorAlreadyImported => 'ਇਹ ਚੈਟ ਪਹਿਲਾਂ ਹੀ ਆਯਾਤ ਕੀਤੀ ਗਈ ਹੈ।';

  @override
  String get howToImportTitle => 'ਕਿਵੇਂ ਆਯਾਤ ਕਰਨਾ ਹੈ';

  @override
  String get chooseImportMethodTitle => 'ਆਪਣਾ ਆਯਾਤ ਵਿਧੀ ਚੁਣੋ';

  @override
  String get iosExportTitle => 'WhatsApp (iOS) ਤੋਂ ਐਕਸਪੋਰਟ ਕਰੋ';

  @override
  String get androidExportTitle => 'WhatsApp (Android) ਤੋਂ ਐਕਸਪੋਰਟ ਕਰੋ';

  @override
  String get iosStepOpenChat => 'WhatsApp ਐਪ ਦੇ ਅੰਦਰ, ਚੈਟ ਵਿੱਚ ਕਲਿੱਕ ਕਰੋ।';

  @override
  String get androidStepOpenChat =>
      'WhatsApp ਐਪ ਦੇ ਅੰਦਰ, ਇੱਕ ਚੈਟ ਵਿੱਚ ਕਲਿੱਕ ਕਰੋ।';

  @override
  String get iosStepOpenInfo => 'ਉੱਪਰ ਵਿਅਕਤੀ ਜਾਂ ਸਮੂਹ ਦੇ ਨਾਮ \'ਤੇ ਕਲਿੱਕ ਕਰੋ।';

  @override
  String get androidStepOpenMenu => 'ਮੀਨੂ \'ਤੇ ਕਲਿੱਕ ਕਰੋ।';

  @override
  String get iosStepExportChat => 'ਹੇਠਾਂ ਸਕ੍ਰੌਲ ਕਰੋ ਅਤੇ ਚੈਟ ਐਕਸਪੋਰਟ ਕਰੋ ਚੁਣੋ।';

  @override
  String get androidStepMoreExport => '\"ਹੋਰ\" ਚੁਣੋ।';

  @override
  String get iosStepChooseMedia =>
      'ਐਪ ਚੋਣ ਮੀਨੂ (ਸ਼ੇਅਰ ਸ਼ੀਟ) ਤੋਂ WhatsBackUp ਚੁਣੋ (ਪੁਰਾਣੇ ਫੋਨਾਂ \'ਤੇ, ਫਾਈਲਾਂ ਵਿੱਚ ਸੇਵ ਕਰੋ)।';

  @override
  String get androidStepChooseMedia => 'ਚੈਟ ਐਕਸਪੋਰਟ ਕਰੋ ਚੁਣੋ।';

  @override
  String get iosStepShareToApp => 'ਚੈਟ WhatsBackUp ਵਿੱਚ ਆਯਾਤ ਕੀਤੀ ਜਾਵੇਗੀ।';

  @override
  String get androidStepShareToApp =>
      'ਐਪ ਚੋਣ ਮੀਨੂ (ਸ਼ੇਅਰ ਸ਼ੀਟ) ਤੋਂ WhatsBackUp ਚੁਣੋ (ਪੁਰਾਣੇ ਫੋਨਾਂ \'ਤੇ, ਫਾਈਲਾਂ ਵਿੱਚ ਸੇਵ ਕਰੋ)।';

  @override
  String get iosStepSaveToFiles => 'ਚੈਟ WhatsBackUp ਵਿੱਚ ਆਯਾਤ ਕੀਤੀ ਜਾਵੇਗੀ।';

  @override
  String get androidStepSaveToDevice =>
      'ਚੈਟ WhatsBackUp ਵਿੱਚ ਆਯਾਤ ਕੀਤੀ ਜਾਵੇਗੀ।';

  @override
  String get androidLargeImportNote =>
      'ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਦਿਓ ਕਿ ਪੁਰਾਣੇ ਐਂਡਰਾਇਡ ਫੋਨਾਂ \'ਤੇ ਬਹੁਤ ਵੱਡੀਆਂ ਚੈਟਾਂ ਦੇ ਆਯਾਤ ਨੂੰ ਸ਼ੁਰੂ ਹੋਣ ਵਿੱਚ ਇੱਕ ਮਿੰਟ ਤੱਕ ਦਾ ਸਮਾਂ ਲੱਗੇਗਾ।';

  @override
  String get importZipTitle => 'ਇੱਕ ਸੁਰੱਖਿਅਤ ਕੀਤੀ ਜ਼ਿਪ ਆਯਾਤ ਕਰੋ';

  @override
  String get iosStepImportZip =>
      'WhatsBackUp ਵਿੱਚ, \"Import from ZIP\" \'ਤੇ ਟੈਪ ਕਰੋ ਅਤੇ Files ਵਿੱਚੋਂ ਫਾਈਲ ਚੁਣੋ।';

  @override
  String get androidStepImportZip =>
      'WhatsBackUp ਵਿੱਚ, \"Import from ZIP\" \'ਤੇ ਟੈਪ ਕਰੋ ਅਤੇ ਆਪਣੀ ਡਿਵਾਈਸ ਤੋਂ ਫਾਈਲ ਚੁਣੋ।';

  @override
  String get managingChatsTitle => 'ਚੈਟਾਂ ਦਾ ਪ੍ਰਬੰਧਨ ਕਰਨਾ';

  @override
  String get hideChatsWithCodeTitle => 'ਕੋਡ ਨਾਲ ਚੈਟਾਂ ਲੁਕਾਓ';

  @override
  String get stepTapGhostIcon => 'ਉੱਪਰਲੇ ਬਾਰ ਵਿੱਚ ਭੂਤ ਆਈਕਨ \'ਤੇ ਟੈਪ ਕਰੋ।';

  @override
  String get stepEnterCodeUpTo8Digits => 'ਇੱਕ ਕੋਡ ਦਰਜ ਕਰੋ (8 ਅੰਕਾਂ ਤੱਕ)।';

  @override
  String get stepSelectChatsSubmitHide =>
      'ਚੈਟਾਂ ਚੁਣੋ, ਫਿਰ ਉਹਨਾਂ ਨੂੰ ਲੁਕਾਉਣ ਲਈ ਸਬਮਿਟ ਕਰੋ \'ਤੇ ਟੈਪ ਕਰੋ।';

  @override
  String get stepEnterSameCodeUnhide =>
      'ਉਹਨਾਂ ਚੈਟਾਂ ਨੂੰ ਅਣਹਾਈਡ ਕਰਨ ਲਈ ਉਹੀ ਕੋਡ ਦੁਬਾਰਾ ਦਰਜ ਕਰੋ।';

  @override
  String get stepDifferentCodesHideSets =>
      'ਵੱਖ-ਵੱਖ ਕੋਡ ਚੈਟਾਂ ਦੇ ਵੱਖ-ਵੱਖ ਸੈੱਟਾਂ ਨੂੰ ਲੁਕਾ ਸਕਦੇ ਹਨ।';

  @override
  String get lockChatsWithCodeTitle => 'ਕੋਡ ਨਾਲ ਚੈਟਾਂ ਨੂੰ ਲਾਕ ਕਰੋ';

  @override
  String get stepSwitchHideToLockMode =>
      'ਸੈਟਿੰਗਾਂ ਵਿੱਚ, ਲੁਕਾਓ ਤੋਂ ਲਾਕ ਮੋਡ ਵਿੱਚ ਬਦਲੋ।';

  @override
  String get stepTapGhostIconEnterCode =>
      'ਭੂਤ ਆਈਕਨ \'ਤੇ ਟੈਪ ਕਰੋ ਅਤੇ ਇੱਕ ਕੋਡ ਦਰਜ ਕਰੋ।';

  @override
  String get stepSelectChatsSubmitLock =>
      'ਚੈਟਾਂ ਚੁਣੋ, ਫਿਰ ਉਹਨਾਂ ਨੂੰ ਲਾਕ ਕਰਨ ਲਈ ਸਬਮਿਟ \'ਤੇ ਟੈਪ ਕਰੋ।';

  @override
  String get stepLockedChatsRequireCode =>
      'ਲੌਕ ਕੀਤੀਆਂ ਚੈਟਾਂ ਵਿੱਚ ਇੱਕ ਲਾਕ ਆਈਕਨ ਦਿਖਾਈ ਦਿੰਦਾ ਹੈ ਅਤੇ ਉਹਨਾਂ ਨੂੰ ਖੋਲ੍ਹਣ ਲਈ ਕੋਡ ਦੀ ਲੋੜ ਹੁੰਦੀ ਹੈ।';

  @override
  String get archiveOrDeleteTitle => 'ਪੁਰਾਲੇਖਬੱਧ ਕਰੋ ਜਾਂ ਮਿਟਾਓ';

  @override
  String get stepSwipeRightArchive =>
      'ਪੁਰਾਲੇਖਬੱਧ ਜਾਂ ਅਣ-ਪੁਰਾਲੇਖਬੱਧ ਕਰਨ ਲਈ ਸੱਜੇ ਪਾਸੇ ਸਵਾਈਪ ਕਰੋ।';

  @override
  String get stepSwipeLeftDelete =>
      'ਮਿਟਾਉਣ ਲਈ ਖੱਬੇ ਪਾਸੇ ਸਵਾਈਪ ਕਰੋ (ਪੁਸ਼ਟੀ ਦੀ ਲੋੜ ਹੈ)।';

  @override
  String get bullet => '•';

  @override
  String get welcomeTitle => 'ਸਵਾਗਤ ਹੈ';

  @override
  String get gotItAction => 'ਮਿਲ ਗਿਆ';

  @override
  String get settingsTitle => 'ਸੈਟਿੰਗਾਂ';

  @override
  String get sectionFont => 'ਫੌਂਟ';

  @override
  String get sectionColor => 'ਰੰਗ';

  @override
  String get sectionAccessibility => 'ਪਹੁੰਚਯੋਗਤਾ';

  @override
  String get sectionPrivacy => 'ਗੋਪਨੀਯਤਾ';

  @override
  String get sectionPro => '__ਟਰਮ_0__';

  @override
  String get sectionStorage => 'ਸਟੋਰੇਜ';

  @override
  String get storageTitle => 'ਸਟੋਰੇਜ';

  @override
  String get storageSubtitle => 'ਡਿਵਾਈਸ ਸਪੇਸ ਅਤੇ ਚੈਟ ਸਟੋਰੇਜ ਵੇਖੋ';

  @override
  String get storageAvailable => 'ਉਪਲਬਧ ਸਟੋਰੇਜ';

  @override
  String get storageAppSize => 'WhatsBackUp ਆਕਾਰ (ਚੈਟਾਂ ਸਮੇਤ)';

  @override
  String get storageLocation => 'ਸਟੋਰੇਜ ਟਿਕਾਣਾ';

  @override
  String get storageLocationUnknown => 'ਅਣਜਾਣ';

  @override
  String get storageCalculate => 'ਗਣਨਾ ਕਰੋ';

  @override
  String get storageCalculating => 'ਗਣਨਾ ਕੀਤੀ ਜਾ ਰਹੀ ਹੈ...';

  @override
  String get storageNotCalculated => 'ਗਣਨਾ ਨਹੀਂ ਕੀਤੀ ਗਈ';

  @override
  String storageLastCalculated(Object date) {
    return 'ਆਖਰੀ ਗਣਨਾ: $date';
  }

  @override
  String get storageLastCalculatedNone => 'ਆਖਰੀ ਗਣਨਾ: —';

  @override
  String get storageChatSizesToggle => 'ਸੂਚੀ ਵਿੱਚ ਚੈਟ ਦੇ ਆਕਾਰ ਦਿਖਾਓ';

  @override
  String get storageChatSizesSubtitle =>
      'ਮੁੱਖ ਸਕ੍ਰੀਨ \'ਤੇ ਹਰੇਕ ਚੈਟ ਦਾ ਕੁੱਲ ਆਕਾਰ ਦਿਖਾਉਂਦਾ ਹੈ';

  @override
  String get storageCleanupTitle => 'ਅਸਫਲ ਆਯਾਤਾਂ ਨੂੰ ਸਾਫ਼ ਕਰੋ';

  @override
  String get storageCleanupSubtitle =>
      'ਜਗ੍ਹਾ ਖਾਲੀ ਕਰਨ ਲਈ ਅਧੂਰੇ ਜਾਂ ਅਸਫਲ ਆਯਾਤਾਂ ਨੂੰ ਹਟਾਉਂਦਾ ਹੈ।';

  @override
  String get storageCleanupEstimate => 'ਖਾਲੀ ਕਰਨ ਲਈ ਅਨੁਮਾਨਿਤ ਜਗ੍ਹਾ';

  @override
  String get storageCleanupAction => 'ਹੁਣੇ ਸਾਫ਼ ਕਰੋ';

  @override
  String get storageCleanupNone => 'ਕੋਈ ਅਸਫਲ ਆਯਾਤ ਨਹੀਂ ਮਿਲਿਆ।';

  @override
  String storageCleanupDone(Object size) {
    return 'ਅਸਫਲ ਆਯਾਤਾਂ ਤੋਂ $size ਸਾਫ਼ ਕੀਤਾ ਗਿਆ।';
  }

  @override
  String storageCleanupLast(Object time) {
    return 'ਆਖਰੀ ਸਫਾਈ: $time';
  }

  @override
  String get proActiveTitle => 'ਪ੍ਰੋ ਕਿਰਿਆਸ਼ੀਲ ਹੈ';

  @override
  String get proUpgradeTitle => 'BackupChat Pro \'ਤੇ ਅੱਪਗ੍ਰੇਡ ਕਰੋ';

  @override
  String get proThankYouSubtitle => 'ਐਪ ਦਾ ਸਮਰਥਨ ਕਰਨ ਲਈ ਤੁਹਾਡਾ ਧੰਨਵਾਦ।';

  @override
  String get proUnlockSubtitle => 'ਅਸੀਮਤ ਆਯਾਤ ਨੂੰ ਅਨਲੌਕ ਕਰੋ।';

  @override
  String get debugProOverrideTitle => 'ਡੀਬੱਗ: ਫੋਰਸ ਪ੍ਰੋ';

  @override
  String get debugProOverrideSubtitle =>
      'ਜਾਂਚ ਲਈ ਸਥਾਨਕ ਓਵਰਰਾਈਡ (ਕੋਈ ਖਰੀਦਦਾਰੀ ਦੀ ਲੋੜ ਨਹੀਂ)।';

  @override
  String paywallResult(Object result) {
    return 'ਪੇਵਾਲ ਨਤੀਜਾ: $result।';
  }

  @override
  String get purchaseCancelled => 'ਖਰੀਦ ਰੱਦ ਕੀਤੀ ਗਈ।';

  @override
  String get restorePurchases => 'ਖਰੀਦਾਂ ਨੂੰ ਮੁੜ-ਬਹਾਲ ਕਰੋ';

  @override
  String get purchasesRestored => 'ਖਰੀਦਾਂ ਮੁੜ-ਬਹਾਲ ਕੀਤੀਆਂ ਗਈਆਂ।';

  @override
  String get restoreFailedTryAgain => 'ਰੀਸਟੋਰ ਅਸਫਲ ਰਿਹਾ। ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get manageSubscription => 'ਗਾਹਕੀ ਦਾ ਪ੍ਰਬੰਧਨ ਕਰੋ';

  @override
  String get openCustomerCenter => 'ਰੈਵੇਨਿਊਕੈਟ ਗਾਹਕ ਕੇਂਦਰ ਖੋਲ੍ਹੋ।';

  @override
  String get customerCenterUnavailable => 'ਗਾਹਕ ਕੇਂਦਰ ਉਪਲਬਧ ਨਹੀਂ ਹੈ।';

  @override
  String get sectionAbout => 'ਬਾਰੇ';

  @override
  String get aboutDescription =>
      'WhatsBackUp WhatsApp ਚੈਟ ਨਿਰਯਾਤ ਲਈ ਇੱਕ ਨਿੱਜੀ, ਔਫਲਾਈਨ ਦਰਸ਼ਕ ਹੈ। ਮੀਡੀਆ ਦੇ ਨਾਲ ਇੱਕ ਸਾਫ਼, ਖੋਜਣਯੋਗ ਪੁਰਾਲੇਖ ਰੱਖਣ ਲਈ ZIP ਫਾਈਲਾਂ ਨੂੰ ਆਯਾਤ ਕਰੋ ਜਾਂ WhatsApp ਤੋਂ ਸਿੱਧਾ ਨਿਰਯਾਤ ਕਰੋ — ਕਿਸੇ ਨੈੱਟਵਰਕ ਦੀ ਲੋੜ ਨਹੀਂ ਹੈ।';

  @override
  String get sectionAboutDeveloper => 'ਡਿਵੈਲਪਰ ਬਾਰੇ';

  @override
  String get aboutDeveloperDescription =>
      'ਇੱਕ ਸੁਤੰਤਰ ਡਿਵੈਲਪਰ ਦੁਆਰਾ ਬਣਾਇਆ ਗਿਆ ਹੈ ਜੋ ਗੋਪਨੀਯਤਾ, ਤੇਜ਼ ਖੋਜ, ਅਤੇ ਸਾਫ਼ ਚੈਟ ਪੁਰਾਲੇਖਾਂ \'ਤੇ ਕੇਂਦ੍ਰਿਤ ਹੈ।';

  @override
  String get sectionHelp => 'ਮਦਦ ਕਰੋ';

  @override
  String get showOnboardingAgain => 'ਦੁਬਾਰਾ ਆਨਬੋਰਡਿੰਗ ਦਿਖਾਓ';

  @override
  String get sdkConfigTitle => 'SDK ਸੰਰਚਨਾ';

  @override
  String get publicKeyLabel => 'ਪਬਲਿਕ ਕੁੰਜੀ';

  @override
  String get offeringIdLabel => 'ਪੇਸ਼ਕਸ਼ ਆਈਡੀ';

  @override
  String get entitlementIdLabel => 'ਹੱਕਦਾਰੀ ਆਈਡੀ';

  @override
  String get lifetimeProductIdLabel => 'ਲਾਈਫਟਾਈਮ ਉਤਪਾਦ ਆਈਡੀ';

  @override
  String errorLabel(Object error) {
    return 'ਗਲਤੀ: $error';
  }

  @override
  String get offeringsTitle => 'ਭੇਟਾਂ';

  @override
  String get currentOfferingLabel => 'ਮੌਜੂਦਾ ਪੇਸ਼ਕਸ਼';

  @override
  String get allOfferingsLabel => 'ਸਾਰੀਆਂ ਪੇਸ਼ਕਸ਼ਾਂ';

  @override
  String get customerInfoTitle => 'ਗਾਹਕ ਜਾਣਕਾਰੀ';

  @override
  String get activeEntitlementsLabel => 'ਸਰਗਰਮ ਹੱਕਦਾਰੀਆਂ';

  @override
  String get originalAppUserIdLabel => 'ਮੂਲ ਐਪ ਯੂਜ਼ਰ ਆਈਡੀ';

  @override
  String get managementUrlLabel => 'ਪ੍ਰਬੰਧਨ URL';

  @override
  String get noneLabel => 'ਕੋਈ ਨਹੀਂ';

  @override
  String get refreshAction => 'ਤਾਜ਼ਾ ਕਰੋ';

  @override
  String get noPackagesAvailable => 'ਕੋਈ ਪੈਕੇਜ ਉਪਲਬਧ ਨਹੀਂ ਹਨ।';

  @override
  String get packagesTitle => 'ਪੈਕੇਜ';

  @override
  String get fontSystem => 'ਸਿਸਟਮ';

  @override
  String get fontSerif => 'ਸੇਰਿਫ';

  @override
  String get fontMono => 'ਮੋਨੋ';

  @override
  String get accessibilityFontSizeTitle => 'ਫੌਂਟ ਆਕਾਰ';

  @override
  String get accessibilityFontSizeSubtitle =>
      'ਪੂਰੇ ਐਪ ਵਿੱਚ ਟੈਕਸਟ ਦਾ ਆਕਾਰ ਵਿਵਸਥਿਤ ਕਰੋ।';

  @override
  String get accessibilityFontPreview =>
      'ਇਹ ਇੱਕ ਉਦਾਹਰਨ ਸੁਨੇਹਾ ਬੁਲਬੁਲਾ ਹੈ।\nਇਹ ਦਿਖਾਉਂਦਾ ਹੈ ਕਿ ਤੁਹਾਡਾ ਚੈਟ ਟੈਕਸਟ ਕਿਵੇਂ ਦਿਖਾਈ ਦੇਵੇਗਾ।\nਆਕਾਰ ਬਦਲਣ ਲਈ ਸਲਾਈਡਰ ਨੂੰ ਐਡਜਸਟ ਕਰੋ।';

  @override
  String get accessibilityHighContrastTitle => 'ਉੱਚ ਕੰਟ੍ਰਾਸਟ ਮੋਡ';

  @override
  String get accessibilityHighContrastSubtitle =>
      'ਬਿਹਤਰ ਪੜ੍ਹਨਯੋਗਤਾ ਲਈ ਕੰਟ੍ਰਾਸਟ ਵਧਾਓ।';

  @override
  String get colorWhatsAppGreen => 'WhatsApp ਹਰਾ';

  @override
  String get colorDeepTeal => 'ਗੂੜ੍ਹਾ ਨੀਲਾ';

  @override
  String get colorNavy => 'ਜਲ ਸੈਨਾ';

  @override
  String get colorCharcoal => 'ਚਾਰਕੋਲ';

  @override
  String get colorBlindPaletteTitle => 'ਰੰਗ ਅੰਨ੍ਹਾ ਪੈਲੇਟ';

  @override
  String get colorBlindPaletteSubtitle =>
      'ਰੰਗ ਦ੍ਰਿਸ਼ਟੀ ਦੀ ਕਮੀ ਲਈ ਅਨੁਕੂਲਿਤ ਪੈਲੇਟ ਦੀ ਵਰਤੋਂ ਕਰੋ।';

  @override
  String get hideChatsInsteadOfLocking => 'ਲਾਕ ਕਰਨ ਦੀ ਬਜਾਏ ਚੈਟਾਂ ਨੂੰ ਲੁਕਾਓ';

  @override
  String get hideChatsInsteadOfLockingSubtitle =>
      'ਬੰਦ ਹੋਣ \'ਤੇ, ਚੈਟਾਂ ਦਿਖਾਈ ਦਿੰਦੀਆਂ ਹਨ ਪਰ ਪਾਸਕੋਡ ਸੁਰੱਖਿਅਤ ਹੁੰਦੀਆਂ ਹਨ।';

  @override
  String get previousMatch => 'ਪਿਛਲਾ ਮੈਚ';

  @override
  String get nextMatch => 'ਅਗਲਾ ਮੈਚ';

  @override
  String get selectSenderOnRight => 'ਚੁਣੋ ਕਿ ਕਿਹੜਾ ਭੇਜਣ ਵਾਲਾ ਸੱਜੇ ਪਾਸੇ ਹੈ';

  @override
  String couldNotOpenArchive(Object error) {
    return 'ਪੁਰਾਲੇਖ ਖੋਲ੍ਹਿਆ ਨਹੀਂ ਜਾ ਸਕਿਆ:\n$error';
  }

  @override
  String couldNotOpenFile(Object message) {
    return 'ਫਾਈਲ ਨਹੀਂ ਖੋਲ੍ਹੀ ਜਾ ਸਕੀ: $message';
  }

  @override
  String attachmentMissing(Object filename) {
    return 'ਅਟੈਚਮੈਂਟ ਗੁੰਮ ਹੈ: $filename';
  }

  @override
  String get unknownError => 'ਅਗਿਆਤ ਗਲਤੀ';

  @override
  String get openPdf => 'PDF ਖੋਲ੍ਹੋ';

  @override
  String get openFile => 'ਫਾਈਲ ਖੋਲ੍ਹੋ';

  @override
  String get openAudio => 'ਆਡੀਓ ਖੋਲ੍ਹੋ';

  @override
  String senderMeLabel(Object sender) {
    return '$sender (ਮੈਂ)';
  }

  @override
  String get chatFileNotFound => 'ਚੈਟ ਫਾਈਲ ਨਹੀਂ ਮਿਲੀ।';

  @override
  String get languageTitle => 'ਭਾਸ਼ਾ';

  @override
  String get languageTooltip => 'ਭਾਸ਼ਾ';

  @override
  String get moreOptionsTooltip => 'ਹੋਰ ਵਿਕਲਪ';

  @override
  String get filterTitle => 'ਫਿਲਟਰ';

  @override
  String get filterDateRange => 'ਤਾਰੀਖ਼ ਸੀਮਾ';

  @override
  String get filterAnyDate => 'ਕੋਈ ਵੀ ਤਾਰੀਖ਼';

  @override
  String get filterIncludeMedia => 'ਮੀਡੀਆ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get filterMediaOnly => 'ਸਿਰਫ਼ ਮੀਡੀਆ';

  @override
  String get filterSenders => 'ਭੇਜਣ ਵਾਲੇ';

  @override
  String get applyFilters => 'ਲਾਗੂ ਕਰੋ';

  @override
  String get clearFilters => 'ਫਿਲਟਰ ਸਾਫ਼ ਕਰੋ';

  @override
  String get incrementalImportTitle => 'ਚੈਟ ਪਹਿਲਾਂ ਹੀ ਮੌਜੂਦ ਹੈ';

  @override
  String incrementalImportMessage(Object name) {
    return 'ਕੀ ਇਸ ਆਯਾਤ ਨੂੰ \"$name\" ਵਿੱਚ ਜੋੜਨਾ ਹੈ?';
  }

  @override
  String get incrementalAddAction => 'ਜੋੜੋ';

  @override
  String get incrementalChooseTitle => 'ਅੱਪਡੇਟ ਕਰਨ ਲਈ ਚੈਟ ਚੁਣੋ';

  @override
  String get incrementalUpdated => 'ਚੈਟ ਅੱਪਡੇਟ ਕੀਤੀ ਗਈ।';

  @override
  String get languageSystem => 'ਸਿਸਟਮ';

  @override
  String get languageEnglish => 'ਅੰਗਰੇਜ਼ੀ';

  @override
  String get languageSpanish => 'ਸਪੈਨਿਸ਼';

  @override
  String get languageGerman => 'ਜਰਮਨ';

  @override
  String get languageFrench => 'ਫ੍ਰੈਂਚ';

  @override
  String get languagePortuguese => 'ਪੁਰਤਗਾਲੀ';

  @override
  String get languageRomanian => 'ਰੋਮਾਨੀਆਈ';

  @override
  String get languageAfrikaans => 'ਅਫ਼ਰੀਕੀ';

  @override
  String get languageRussian => 'ਰੂਸੀ';

  @override
  String get showImportButton => 'ਆਯਾਤ ਬਟਨ ਦਿਖਾਓ';

  @override
  String get showImportButtonSubtitle =>
      'ਹੋਮ ਸਕ੍ਰੀਨ \'ਤੇ ਇੰਪੋਰਟ ZIP ਬਟਨ ਨੂੰ ਟੌਗਲ ਕਰੋ।';

  @override
  String get importButtonHiddenMessage =>
      'ਆਯਾਤ ਬਟਨ ਲੁਕਿਆ ਹੋਇਆ ਹੈ। ਤੁਸੀਂ ਇਸਨੂੰ ਸੈਟਿੰਗਾਂ ਵਿੱਚ ਦੁਬਾਰਾ ਚਾਲੂ ਕਰ ਸਕਦੇ ਹੋ।';

  @override
  String get upgradeToAccessChat => 'ਇਸ ਚੈਟ ਤੱਕ ਪਹੁੰਚ ਕਰਨ ਲਈ ਅੱਪਗ੍ਰੇਡ ਕਰੋ।';

  @override
  String get aboutLegalTitle => 'ਬਾਰੇ ਅਤੇ ਕਾਨੂੰਨੀ';

  @override
  String get aboutLegalSummary =>
      'WhatsBackUp WhatsApp ਚੈਟ ਨਿਰਯਾਤਾਂ ਲਈ ਇੱਕ ਔਫਲਾਈਨ ਵਿਊਅਰ ਹੈ। ਤੁਹਾਡੀਆਂ ਚੈਟਾਂ ਤੁਹਾਡੀ ਡਿਵਾਈਸ \'ਤੇ ਰਹਿੰਦੀਆਂ ਹਨ।';

  @override
  String get aboutLegalRefundPolicy =>
      'ਰਿਫੰਡ: ਜੇਕਰ ਰਿਫੰਡ ਜਾਰੀ ਕੀਤਾ ਜਾਂਦਾ ਹੈ, ਤਾਂ ਸਿਰਫ਼ ਪਹਿਲੀਆਂ 5 ਆਯਾਤ ਕੀਤੀਆਂ ਚੈਟਾਂ ਹੀ ਪਹੁੰਚਯੋਗ ਰਹਿਣਗੀਆਂ। ਮੁਫ਼ਤ ਸੀਮਾ ਤੋਂ ਵੱਧ ਦੀਆਂ ਚੈਟਾਂ ਮੁੜ-ਖਰੀਦਣ ਤੱਕ ਅਯੋਗ ਹਨ।';

  @override
  String get aboutLegalDisclaimers =>
      'ਬੇਦਾਅਵਾ: ਅਸੀਂ ਡੇਟਾ ਦੇ ਨੁਕਸਾਨ, ਚੈਟ ਸਮੱਗਰੀ, ਅਨੁਵਾਦ ਸ਼ੁੱਧਤਾ, ਜਾਂ ਲਾਕ/ਲੁਕਾਉਣ ਦੀਆਂ ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ ਦੀ ਵਰਤੋਂ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ। ਕਿਰਪਾ ਕਰਕੇ ਆਪਣੇ ਖੁਦ ਦੇ ਬੈਕਅੱਪ ਰੱਖੋ।';

  @override
  String get aboutLegalAffiliation =>
      'WhatsApp ਜਾਂ Meta ਨਾਲ ਸੰਬੰਧਿਤ ਨਹੀਂ ਹੈ। WhatsApp Meta Platforms, Inc. ਦਾ ਟ੍ਰੇਡਮਾਰਕ ਹੈ।';

  @override
  String get aboutLegalSupport => 'ਸਹਾਇਤਾ: vwdewaal@gmail.com';

  @override
  String get aboutLegalDeveloper => 'ਡਿਵੈਲਪਰ: ਵੈਨ ਵਿਕ ਡੀ ਵਾਲ';

  @override
  String get aboutLegalJurisdiction => 'ਅਧਿਕਾਰ ਖੇਤਰ: ਈਯੂ/ਯੂਕੇ';

  @override
  String aboutLegalVersion(Object version) {
    return 'ਐਪ ਵਰਜਨ: $version';
  }

  @override
  String get versionLoading => 'ਐਪ ਵਰਜਨ: ਲੋਡ ਹੋ ਰਿਹਾ ਹੈ...';

  @override
  String get languageScottishGaelic => 'ਸਕਾਟਿਸ਼ ਗੈਲਿਕ';

  @override
  String get languageScots => 'ਸਕਾਟਸ';

  @override
  String get languageChinese => 'ਚੀਨੀ (ਮੈਂਡਰਿਨ)';

  @override
  String get languageHindi => 'ਹਿੰਦੀ';

  @override
  String get languageArabic => 'ਅਰਬੀ';

  @override
  String get languageBengali => 'ਬੰਗਾਲੀ';

  @override
  String get languageJapanese => 'ਜਪਾਨੀ';

  @override
  String get languagePunjabi => 'ਪੰਜਾਬੀ';

  @override
  String get languageKorean => 'ਕੋਰੀਆਈ';

  @override
  String get languageTurkish => 'ਤੁਰਕੀ';

  @override
  String get languageItalian => 'ਇਤਾਲਵੀ';

  @override
  String get languageVietnamese => 'ਵੀਅਤਨਾਮੀ';

  @override
  String get languageUrdu => 'ਉਰਦੂ';

  @override
  String get languageIndonesian => 'ਇੰਡੋਨੇਸ਼ੀਆਈ';

  @override
  String get languageThai => 'ਥਾਈ';

  @override
  String get languagePolish => 'ਪੋਲਿਸ਼';

  @override
  String get languageDutch => 'ਡੱਚ';

  @override
  String get identifyMeTitle => 'ਆਪਣੇ ਆਪ ਨੂੰ ਪਛਾਣੋ';

  @override
  String get identifyMeSubtitle =>
      'ਆਪਣਾ ਨਾਮ ਚੁਣੋ ਤਾਂ ਜੋ ਅਸੀਂ ਤੁਹਾਡੇ ਸੁਨੇਹਿਆਂ ਨੂੰ ਸਹੀ ਢੰਗ ਨਾਲ ਲੇਬਲ ਕਰ ਸਕੀਏ।';

  @override
  String get identifyMeNotNow => 'ਹਾਲੇ ਨਹੀਂ';
}
