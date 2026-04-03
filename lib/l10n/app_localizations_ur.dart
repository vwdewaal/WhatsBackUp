// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get appTitle => 'واٹس بیک اپ';

  @override
  String get importZip => 'درآمد کریں ZIP';

  @override
  String get importAction => 'درآمد کریں۔';

  @override
  String get importingLabel => 'درآمد کرنا';

  @override
  String get importDoneLabel => 'ہو گیا!';

  @override
  String get importLargeStarted => 'درآمد شروع';

  @override
  String get importTriggeredMessage =>
      'پس منظر میں درآمد کو متحرک کیا گیا، چیٹ مکمل ہونے پر کھل جائے گی۔ براہ کرم ایپ کو کھلا رکھیں۔';

  @override
  String get mediaImportingTitle => 'میڈیا درآمد کر رہا ہے۔';

  @override
  String get mediaImportingSubtitle => 'میڈیا ختم ہونے پر آپ چیٹ پڑھ سکتے ہیں۔';

  @override
  String get mediaImportPausedTitle => 'میڈیا کی درآمد روک دی گئی۔';

  @override
  String get mediaImportPausedSubtitle =>
      'دوبارہ شروع کرنے کے لیے اصل ZIP کو دوبارہ منتخب کریں۔';

  @override
  String get mediaImportFailedTitle => 'میڈیا کی درآمد ناکام ہو گئی۔';

  @override
  String get mediaImportFailedSubtitle => 'دوبارہ کوشش کرنے کے لیے تھپتھپائیں۔';

  @override
  String get mediaImportResumeAction => 'دوبارہ شروع کریں۔';

  @override
  String get mediaImportingLabel => 'میڈیا کی درآمد';

  @override
  String get contactLoadingLabel => 'رابطہ لوڈ ہو رہا ہے…';

  @override
  String get contactUnknownName => 'رابطہ کریں۔';

  @override
  String get contactPhoneLabel => 'فون';

  @override
  String get contactEmailLabel => 'ای میل';

  @override
  String get openContactAction => 'رابطہ کھولیں۔';

  @override
  String contactOpenFailed(Object error) {
    return 'رابطہ نہیں کھولا جا سکا: $error';
  }

  @override
  String get howToImport => 'درآمد کرنے کا طریقہ';

  @override
  String get settings => 'ترتیبات';

  @override
  String get searchTitle => 'تلاش کریں۔';

  @override
  String get textToInclude => 'شامل کرنے کے لیے متن:';

  @override
  String get enterSearchText => 'تلاش کا متن درج کریں...';

  @override
  String get dateRange => 'تاریخ کی حد:';

  @override
  String get fromLabel => 'منجانب:';

  @override
  String get toLabel => 'کو:';

  @override
  String get selectLabel => 'منتخب کریں۔';

  @override
  String get showOnlyMediaFiles => 'صرف میڈیا فائلیں دکھائیں۔';

  @override
  String get clearAction => 'صاف';

  @override
  String get searchAction => 'تلاش کریں۔';

  @override
  String get renameChatTitle => 'چیٹ کا نام تبدیل کریں۔';

  @override
  String get chatNameHint => 'چیٹ کا نام';

  @override
  String get cancelAction => 'منسوخ کریں۔';

  @override
  String get saveAction => 'محفوظ کریں۔';

  @override
  String get hideChatsTooltip => 'چیٹس چھپائیں۔';

  @override
  String get hideAction => 'چھپائیں';

  @override
  String get lockAction => 'تالا';

  @override
  String get noChatsYetHint =>
      'ابھی تک کوئی چیٹس نہیں ہیں۔\nWhatsApp برآمد لوڈ کرنے کے لیے \"درآمد ZIP\" استعمال کریں،\nیا چیٹ کے ایکسپورٹ چیٹ آپشن کا استعمال کرتے ہوئے WhatsApp سے براہ راست برآمد کریں۔';

  @override
  String get noArchivedChats => 'کوئی آرکائیو شدہ چیٹس نہیں۔';

  @override
  String get tabChats => 'چیٹس';

  @override
  String get tabArchived => 'محفوظ شدہ';

  @override
  String get searchChatsHint => 'چیٹس تلاش کریں۔';

  @override
  String get enterCodeTitle => 'کوڈ درج کریں۔';

  @override
  String get upTo8DigitsHint => '8 ہندسوں تک';

  @override
  String get continueAction => 'جاری رکھیں';

  @override
  String get updatingHiddenChats => 'پوشیدہ چیٹس کو اپ ڈیٹ کیا جا رہا ہے...';

  @override
  String get chatsUnhidden => 'چیٹس غیر پوشیدہ ہیں۔';

  @override
  String get selectAtLeastOneChat => 'کم از کم ایک چیٹ منتخب کریں۔';

  @override
  String get hidingChats => 'چیٹس چھپا رہے ہیں...';

  @override
  String get lockingChats => 'چیٹس کو لاک کیا جا رہا ہے...';

  @override
  String get chatsHidden => 'چیٹس پوشیدہ ہیں۔';

  @override
  String get chatsUnlocked => 'چیٹس کو غیر مقفل کر دیا گیا۔';

  @override
  String get chatsLocked => 'چیٹس مقفل ہیں۔';

  @override
  String get unlockChatTitle => 'چیٹ کو غیر مقفل کریں۔';

  @override
  String get enterPasscodeHint => 'پاس کوڈ درج کریں۔';

  @override
  String get unlockAction => 'غیر مقفل کریں۔';

  @override
  String get incorrectCode => 'غلط کوڈ۔';

  @override
  String importedOn(Object date) {
    return 'درآمد شدہ $date';
  }

  @override
  String get unarchiveAction => 'ان آرکائیو';

  @override
  String get archiveAction => 'محفوظ شدہ دستاویزات';

  @override
  String get deleteAction => 'حذف کریں۔';

  @override
  String get deleteChatTitle => 'چیٹ حذف کریں؟';

  @override
  String get deleteChatConfirm =>
      'یہ محفوظ شدہ دستاویزات اور میڈیا فائلوں کو مستقل طور پر حذف کر دیتا ہے۔';

  @override
  String get archiveFolderMissing => 'آرکائیو فولڈر غائب تھا۔';

  @override
  String updateFailedWithDetail(Object error) {
    return 'اپ ڈیٹ ناکام ہو گیا: $error';
  }

  @override
  String get renameAction => 'نام تبدیل کریں۔';

  @override
  String get working => 'کام کر رہا ہے...';

  @override
  String get importPreparing => 'درآمد کی تیاری کر رہا ہے...';

  @override
  String get importAnalyzing => 'فائل کا تجزیہ کیا جا رہا ہے...';

  @override
  String get bookmarksLabel => 'بک مارکس';

  @override
  String get previousBookmark => 'پچھلا بک مارک';

  @override
  String get nextBookmark => 'اگلا بک مارک';

  @override
  String get importLargeFileNotice =>
      'بڑی فائل کا پتہ چلا۔ اس میں چند منٹ لگ سکتے ہیں۔';

  @override
  String get importExtracting => 'فائلیں نکالی جا رہی ہیں...';

  @override
  String get importFinalizing => 'حتمی شکل دی جا رہی ہے...';

  @override
  String importFailedWithDetail(Object error) {
    return 'درآمد ناکام: $error';
  }

  @override
  String get sharedFileNotZip => 'مشترکہ فائل ZIP نہیں ہے۔';

  @override
  String get unlockProToImportMoreChats =>
      'مزید چیٹس درآمد کرنے کے لیے BackupChat Pro کو غیر مقفل کریں۔';

  @override
  String get purchaseFailedTryAgain =>
      'خریداری ناکام ہو گئی۔ براہ کرم دوبارہ کوشش کریں۔';

  @override
  String get importErrorOnlyZip => 'صرف .zip فائلیں تعاون یافتہ ہیں۔';

  @override
  String get importErrorNoChatText =>
      'کوئی WhatsApp چیٹ ٹیکسٹ فائل ZIP میں نہیں ملی۔';

  @override
  String get importErrorAlreadyImported => 'یہ چیٹ پہلے ہی درآمد شدہ ہے۔';

  @override
  String get howToImportTitle => 'درآمد کرنے کا طریقہ';

  @override
  String get chooseImportMethodTitle => 'اپنا درآمدی طریقہ منتخب کریں۔';

  @override
  String get iosExportTitle => 'WhatsApp (iOS) سے برآمد کریں';

  @override
  String get androidExportTitle => 'WhatsApp (Android) سے برآمد کریں';

  @override
  String get iosStepOpenChat => 'واٹس ایپ کے اندر، چیٹ میں کلک کریں۔';

  @override
  String get androidStepOpenChat => 'واٹس ایپ کے اندر، چیٹ میں کلک کریں۔';

  @override
  String get iosStepOpenInfo => 'اوپر والے شخص یا گروپ کے نام پر کلک کریں۔';

  @override
  String get androidStepOpenMenu => 'مینو پر کلک کریں۔';

  @override
  String get iosStepExportChat =>
      'نیچے تک سکرول کریں اور ایکسپورٹ چیٹ کو منتخب کریں۔';

  @override
  String get androidStepMoreExport => '\"مزید\" کو منتخب کریں۔';

  @override
  String get iosStepChooseMedia =>
      'ایپ سلیکشن مینو (شیئر شیٹ) سے WhatsBackUp منتخب کریں (پرانے فونز پر، فائلوں میں محفوظ کریں)۔';

  @override
  String get androidStepChooseMedia => 'منتخب کریں چیٹ برآمد کریں۔';

  @override
  String get iosStepShareToApp => 'چیٹ WhatsBackUp میں درآمد ہو جائے گی۔';

  @override
  String get androidStepShareToApp =>
      'ایپ سلیکشن مینو (شیئر شیٹ) سے WhatsBackUp منتخب کریں (پرانے فونز پر، فائلوں میں محفوظ کریں)۔';

  @override
  String get iosStepSaveToFiles => 'چیٹ WhatsBackUp میں درآمد ہو جائے گی۔';

  @override
  String get androidStepSaveToDevice => 'چیٹ WhatsBackUp میں درآمد ہو جائے گی۔';

  @override
  String get androidLargeImportNote =>
      'براہ کرم نوٹ کریں کہ پرانے Android فونز پر بہت بڑی چیٹس کی درآمد شروع ہونے میں ایک منٹ تک کا وقت لگے گا۔';

  @override
  String get importZipTitle => 'محفوظ کردہ زپ درآمد کریں۔';

  @override
  String get iosStepImportZip =>
      'WhatsBackUp میں، \"Zip سے درآمد کریں\" پر ٹیپ کریں اور Files سے فائل کا انتخاب کریں۔';

  @override
  String get androidStepImportZip =>
      'WhatsBackUp میں، \"زپ سے درآمد کریں\" پر ٹیپ کریں اور اپنے آلے سے فائل منتخب کریں۔';

  @override
  String get managingChatsTitle => 'چیٹس کا انتظام کرنا';

  @override
  String get hideChatsWithCodeTitle => 'کوڈ کے ساتھ چیٹس چھپائیں۔';

  @override
  String get stepTapGhostIcon => 'اوپری بار میں گھوسٹ آئیکن کو تھپتھپائیں۔';

  @override
  String get stepEnterCodeUpTo8Digits => 'ایک کوڈ درج کریں (8 ہندسوں تک)۔';

  @override
  String get stepSelectChatsSubmitHide =>
      'چیٹس کو منتخب کریں، پھر انہیں چھپانے کے لیے جمع کرائیں پر ٹیپ کریں۔';

  @override
  String get stepEnterSameCodeUnhide =>
      'ان چیٹس کو چھپانے کے لیے دوبارہ وہی کوڈ درج کریں۔';

  @override
  String get stepDifferentCodesHideSets =>
      'مختلف کوڈز چیٹس کے مختلف سیٹوں کو چھپا سکتے ہیں۔';

  @override
  String get lockChatsWithCodeTitle => 'کوڈ کے ساتھ چیٹس کو لاک کریں۔';

  @override
  String get stepSwitchHideToLockMode =>
      'ترتیبات میں، Hide سے لاک موڈ پر سوئچ کریں۔';

  @override
  String get stepTapGhostIconEnterCode =>
      'گھوسٹ آئیکن کو تھپتھپائیں اور کوڈ درج کریں۔';

  @override
  String get stepSelectChatsSubmitLock =>
      'چیٹس کو منتخب کریں، پھر انہیں مقفل کرنے کے لیے جمع کرائیں پر ٹیپ کریں۔';

  @override
  String get stepLockedChatsRequireCode =>
      'مقفل چیٹس ایک لاک آئیکن دکھاتی ہیں اور کوڈ کو کھولنے کی ضرورت ہوتی ہے۔';

  @override
  String get archiveOrDeleteTitle => 'محفوظ کریں یا حذف کریں۔';

  @override
  String get stepSwipeRightArchive =>
      'آرکائیو یا غیر محفوظ کرنے کے لیے دائیں سوائپ کریں۔';

  @override
  String get stepSwipeLeftDelete =>
      'حذف کرنے کے لیے بائیں سوائپ کریں (تصدیق درکار ہے)۔';

  @override
  String get bullet => '• ';

  @override
  String get welcomeTitle => 'خوش آمدید';

  @override
  String get gotItAction => 'سمجھ گیا';

  @override
  String get settingsTitle => 'ترتیبات';

  @override
  String get sectionFont => 'فونٹ';

  @override
  String get sectionColor => 'رنگ';

  @override
  String get sectionAccessibility => 'رسائی';

  @override
  String get sectionPrivacy => 'رازداری';

  @override
  String get sectionPro => 'بیک اپ چیٹ پرو';

  @override
  String get sectionStorage => 'ذخیرہ';

  @override
  String get storageTitle => 'ذخیرہ';

  @override
  String get storageSubtitle => 'ڈیوائس کی جگہ اور چیٹ اسٹوریج دیکھیں';

  @override
  String get storageAvailable => 'دستیاب اسٹوریج';

  @override
  String get storageAppSize => 'WhatsBackUp سائز (بشمول چیٹس)';

  @override
  String get storageLocation => 'ذخیرہ کرنے کا مقام';

  @override
  String get storageLocationUnknown => 'نامعلوم';

  @override
  String get storageCalculate => 'حساب لگانا';

  @override
  String get storageCalculating => 'حساب کر رہا ہے…';

  @override
  String get storageNotCalculated => 'حساب نہیں لگایا';

  @override
  String storageLastCalculated(Object date) {
    return 'آخری حساب کیا گیا: $date';
  }

  @override
  String get storageLastCalculatedNone => 'آخری حساب کیا گیا: -';

  @override
  String get storageChatSizesToggle => 'فہرست میں چیٹ کے سائز دکھائیں۔';

  @override
  String get storageChatSizesSubtitle =>
      'مرکزی اسکرین پر ہر چیٹ کا کل سائز دکھاتا ہے۔';

  @override
  String get storageCleanupTitle => 'ناکام درآمدات کو صاف کریں۔';

  @override
  String get storageCleanupSubtitle =>
      'خالی جگہ پر نامکمل یا ناکام درآمدات کو ہٹاتا ہے۔';

  @override
  String get storageCleanupEstimate => 'خالی کرنے کے لیے تخمینی جگہ';

  @override
  String get storageCleanupAction => 'اب صاف کریں۔';

  @override
  String get storageCleanupNone => 'کوئی ناکام درآمدات نہیں ملی۔';

  @override
  String storageCleanupDone(Object size) {
    return 'ناکام درآمدات میں سے $size کو صاف کیا گیا۔';
  }

  @override
  String storageCleanupLast(Object time) {
    return 'آخری صفائی: $time';
  }

  @override
  String get proActiveTitle => 'پرو فعال ہے۔';

  @override
  String get proUpgradeTitle => 'BackupChat Pro میں اپ گریڈ کریں';

  @override
  String get proThankYouSubtitle => 'ایپ کو سپورٹ کرنے کے لیے آپ کا شکریہ۔';

  @override
  String get proUnlockSubtitle => 'لامحدود درآمدات کو غیر مقفل کریں۔';

  @override
  String get debugProOverrideTitle => 'ڈیبگ: فورس پرو';

  @override
  String get debugProOverrideSubtitle =>
      'جانچ کے لیے مقامی اوور رائیڈ (کوئی خریداری کی ضرورت نہیں)۔';

  @override
  String paywallResult(Object result) {
    return 'پے وال کا نتیجہ: $result۔';
  }

  @override
  String get purchaseCancelled => 'خریداری منسوخ کر دی گئی۔';

  @override
  String get restorePurchases => 'خریداریوں کو بحال کریں۔';

  @override
  String get purchasesRestored => 'خریداریاں بحال ہو گئیں۔';

  @override
  String get restoreFailedTryAgain => 'بحالی ناکام ہوگئی۔ دوبارہ کوشش کریں۔';

  @override
  String get manageSubscription => 'سبسکرپشن کا نظم کریں۔';

  @override
  String get openCustomerCenter => 'ریونیو کیٹ کسٹمر سینٹر کھولیں۔';

  @override
  String get customerCenterUnavailable => 'کسٹمر سینٹر دستیاب نہیں ہے۔';

  @override
  String get sectionAbout => 'کے بارے میں';

  @override
  String get aboutDescription =>
      'WhatsBackUp ایک نجی، آف لائن ناظر ہے WhatsApp چیٹ کی برآمدات کے لیے۔ ZIP فائلیں درآمد کریں یا WhatsApp سے براہ راست برآمد کریں تاکہ میڈیا کے ساتھ ایک صاف، قابل تلاش آرکائیو رکھیں — کسی نیٹ ورک کی ضرورت نہیں۔';

  @override
  String get sectionAboutDeveloper => 'ڈویلپر کے بارے میں';

  @override
  String get aboutDeveloperDescription =>
      'پرائیویسی، تیز تلاش اور کلین چیٹ آرکائیوز پر توجہ مرکوز کرنے والے ایک آزاد ڈویلپر کے ذریعے بنایا گیا ہے۔';

  @override
  String get sectionHelp => 'مدد';

  @override
  String get showOnboardingAgain => 'دوبارہ آن بورڈنگ دکھائیں۔';

  @override
  String get sdkConfigTitle => 'SDK ترتیب';

  @override
  String get publicKeyLabel => 'عوامی کلید';

  @override
  String get offeringIdLabel => 'پیشکش آئی ڈی';

  @override
  String get entitlementIdLabel => 'استحقاق کی شناخت';

  @override
  String get lifetimeProductIdLabel => 'لائف ٹائم پروڈکٹ آئی ڈی';

  @override
  String errorLabel(Object error) {
    return 'خرابی: $error';
  }

  @override
  String get offeringsTitle => 'پیشکشیں';

  @override
  String get currentOfferingLabel => 'موجودہ پیشکش';

  @override
  String get allOfferingsLabel => 'تمام پیش کش';

  @override
  String get customerInfoTitle => 'گاہک کی معلومات';

  @override
  String get activeEntitlementsLabel => 'فعال استحقاق';

  @override
  String get originalAppUserIdLabel => 'اصل ایپ صارف کی شناخت';

  @override
  String get managementUrlLabel => 'مینجمنٹ URL';

  @override
  String get noneLabel => 'کوئی نہیں';

  @override
  String get refreshAction => 'ریفریش کریں۔';

  @override
  String get noPackagesAvailable => 'کوئی پیکیج دستیاب نہیں ہے۔';

  @override
  String get packagesTitle => 'پیکجز';

  @override
  String get fontSystem => 'سسٹم';

  @override
  String get fontSerif => 'سیرف';

  @override
  String get fontMono => 'مونو';

  @override
  String get accessibilityFontSizeTitle => 'فونٹ کا سائز';

  @override
  String get accessibilityFontSizeSubtitle =>
      'پوری ایپ میں ٹیکسٹ سائز کو ایڈجسٹ کریں۔';

  @override
  String get accessibilityFontPreview =>
      'یہ ایک مثال میسج بلبلہ ہے۔\nیہ دکھاتا ہے کہ آپ کا چیٹ ٹیکسٹ کیسا نظر آئے گا۔\nسائز تبدیل کرنے کے لیے سلائیڈر کو ایڈجسٹ کریں۔';

  @override
  String get accessibilityHighContrastTitle => 'ہائی کنٹراسٹ موڈ';

  @override
  String get accessibilityHighContrastSubtitle =>
      'بہتر پڑھنے کی اہلیت کے لیے کنٹراسٹ میں اضافہ کریں۔';

  @override
  String get colorWhatsAppGreen => 'WhatsApp سبز';

  @override
  String get colorDeepTeal => 'گہرا ٹیل';

  @override
  String get colorNavy => 'بحریہ';

  @override
  String get colorCharcoal => 'چارکول';

  @override
  String get colorBlindPaletteTitle => 'کلر بلائنڈ پیلیٹ';

  @override
  String get colorBlindPaletteSubtitle =>
      'رنگین وژن کی کمیوں کے لیے موزوں ایک پیلیٹ استعمال کریں۔';

  @override
  String get hideChatsInsteadOfLocking => 'لاک کرنے کے بجائے چیٹس چھپائیں۔';

  @override
  String get hideChatsInsteadOfLockingSubtitle =>
      'آف ہونے پر، چیٹس نظر آتے ہیں لیکن پاس کوڈ محفوظ ہوتا ہے۔';

  @override
  String get previousMatch => 'پچھلا میچ';

  @override
  String get nextMatch => 'اگلا میچ';

  @override
  String get selectSenderOnRight =>
      'منتخب کریں کہ کون سا بھیجنے والا دائیں طرف ہے۔';

  @override
  String couldNotOpenArchive(Object error) {
    return 'آرکائیو نہیں کھول سکا:\n$error';
  }

  @override
  String couldNotOpenFile(Object message) {
    return 'فائل نہیں کھل سکی: $message';
  }

  @override
  String attachmentMissing(Object filename) {
    return 'منسلکہ غائب ہے: $filename';
  }

  @override
  String get unknownError => 'نامعلوم خرابی۔';

  @override
  String get openPdf => 'پی ڈی ایف کھولیں۔';

  @override
  String get openFile => 'فائل کھولیں۔';

  @override
  String get openAudio => 'آڈیو کھولیں۔';

  @override
  String senderMeLabel(Object sender) {
    return '$sender (میں)';
  }

  @override
  String get chatFileNotFound => 'چیٹ فائل نہیں ملی۔';

  @override
  String get languageTitle => 'زبان';

  @override
  String get languageTooltip => 'زبان';

  @override
  String get moreOptionsTooltip => 'مزید اختیارات';

  @override
  String get filterTitle => 'فلٹر';

  @override
  String get filterDateRange => 'تاریخ کی حد';

  @override
  String get filterAnyDate => 'کوئی بھی تاریخ';

  @override
  String get filterIncludeMedia => 'میڈیا کو شامل کریں۔';

  @override
  String get filterMediaOnly => 'صرف میڈیا';

  @override
  String get filterSenders => 'بھیجنے والے';

  @override
  String get applyFilters => 'لگائیں';

  @override
  String get clearFilters => 'فلٹرز صاف کریں۔';

  @override
  String get incrementalImportTitle => 'چیٹ پہلے سے موجود ہے۔';

  @override
  String incrementalImportMessage(Object name) {
    return 'اس درآمد کو \"$name\" میں شامل کریں؟';
  }

  @override
  String get incrementalAddAction => 'شامل کریں۔';

  @override
  String get incrementalChooseTitle => 'اپ ڈیٹ کرنے کے لیے چیٹ کا انتخاب کریں۔';

  @override
  String get incrementalUpdated => 'چیٹ اپ ڈیٹ ہو گئی۔';

  @override
  String get languageSystem => 'سسٹم';

  @override
  String get languageEnglish => 'انگریزی';

  @override
  String get languageSpanish => 'ہسپانوی';

  @override
  String get languageGerman => 'جرمن';

  @override
  String get languageFrench => 'فرانسیسی';

  @override
  String get languagePortuguese => 'پرتگالی';

  @override
  String get languageRomanian => 'رومانیہ';

  @override
  String get languageAfrikaans => 'افریقی';

  @override
  String get languageRussian => 'روسی';

  @override
  String get showImportButton => 'امپورٹ بٹن دکھائیں۔';

  @override
  String get showImportButtonSubtitle =>
      'ہوم اسکرین پر امپورٹ ZIP بٹن کو ٹوگل کریں۔';

  @override
  String get importButtonHiddenMessage =>
      'امپورٹ بٹن چھپا ہوا ہے۔ آپ اسے ترتیبات میں دوبارہ فعال کر سکتے ہیں۔';

  @override
  String get upgradeToAccessChat =>
      'اس چیٹ تک رسائی حاصل کرنے کے لیے اپ گریڈ کریں۔';

  @override
  String get aboutLegalTitle => 'کے بارے میں اور قانونی';

  @override
  String get aboutLegalSummary =>
      'WhatsBackUp WhatsApp چیٹ کی برآمدات کے لیے ایک آف لائن ناظر ہے۔ آپ کی چیٹس آپ کے آلے پر رہتی ہیں۔';

  @override
  String get aboutLegalRefundPolicy =>
      'رقم کی واپسی: اگر رقم کی واپسی جاری کی جاتی ہے، تو صرف پہلی 5 درآمد شدہ چیٹس قابل رسائی رہتی ہیں۔ مفت حد سے اوپر کی چیٹس دوبارہ خریداری تک غیر فعال ہیں۔';

  @override
  String get aboutLegalDisclaimers =>
      'دستبرداری: ہم ڈیٹا کے نقصان، چیٹ کے مواد، ترجمہ کی درستگی، یا لاک/ہائیڈ فیچرز کے استعمال کے ذمہ دار نہیں ہیں۔ براہ کرم اپنا بیک اپ رکھیں۔';

  @override
  String get aboutLegalAffiliation =>
      'WhatsApp یا میٹا سے وابستہ نہیں ہے۔ WhatsApp Meta Platforms, Inc کا ٹریڈ مارک ہے۔';

  @override
  String get aboutLegalSupport => 'سپورٹ: vwdewaal@gmail.com';

  @override
  String get aboutLegalDeveloper => 'ڈویلپر: وان وِک ڈی وال';

  @override
  String get aboutLegalJurisdiction => 'دائرہ اختیار: EU/UK';

  @override
  String aboutLegalVersion(Object version) {
    return 'ایپ ورژن: $version';
  }

  @override
  String get versionLoading => 'ایپ ورژن: لوڈ ہو رہا ہے...';

  @override
  String get languageScottishGaelic => 'سکاٹش گیلک';

  @override
  String get languageScots => 'سکاٹس';

  @override
  String get languageChinese => 'چینی (مینڈارن)';

  @override
  String get languageHindi => 'ہندی';

  @override
  String get languageArabic => 'عربی';

  @override
  String get languageBengali => 'بنگالی';

  @override
  String get languageJapanese => 'جاپانی';

  @override
  String get languagePunjabi => 'پنجابی';

  @override
  String get languageKorean => 'کورین';

  @override
  String get languageTurkish => 'ترکی';

  @override
  String get languageItalian => 'اطالوی';

  @override
  String get languageVietnamese => 'ویتنامی';

  @override
  String get languageUrdu => 'اردو';

  @override
  String get languageIndonesian => 'انڈونیشین';

  @override
  String get languageThai => 'تھائی';

  @override
  String get languagePolish => 'پولش';

  @override
  String get languageDutch => 'ڈچ';

  @override
  String get identifyMeTitle => 'اپنی پہچان کرو';

  @override
  String get identifyMeSubtitle =>
      'اپنا نام منتخب کریں تاکہ ہم آپ کے پیغامات کو درست طریقے سے لیبل کر سکیں۔';

  @override
  String get identifyMeNotNow => 'ابھی نہیں۔';
}
