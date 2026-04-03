// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'WhatsBackUp';

  @override
  String get importZip => 'استيراد ZIP';

  @override
  String get importAction => 'يستورد';

  @override
  String get importingLabel => 'الاستيراد';

  @override
  String get importDoneLabel => 'منتهي!';

  @override
  String get importLargeStarted => 'بدء الاستيراد';

  @override
  String get importTriggeredMessage =>
      'تم تشغيل عملية الاستيراد في الخلفية، وسيتم فتح المحادثة عند اكتمالها. يرجى إبقاء التطبيق مفتوحًا.';

  @override
  String get mediaImportingTitle => 'استيراد الوسائط';

  @override
  String get mediaImportingSubtitle =>
      'يمكنك قراءة المحادثة أثناء انتهاء عرض الوسائط.';

  @override
  String get mediaImportPausedTitle => 'تم إيقاف استيراد الوسائط مؤقتًا';

  @override
  String get mediaImportPausedSubtitle =>
      'أعد تحديد ZIP الأصلي لاستئناف العملية.';

  @override
  String get mediaImportFailedTitle => 'فشل استيراد الوسائط';

  @override
  String get mediaImportFailedSubtitle => 'انقر لإعادة المحاولة.';

  @override
  String get mediaImportResumeAction => 'سيرة ذاتية';

  @override
  String get mediaImportingLabel => 'استيراد الوسائط';

  @override
  String get contactLoadingLabel => 'جارٍ تحميل جهة الاتصال...';

  @override
  String get contactUnknownName => 'اتصال';

  @override
  String get contactPhoneLabel => 'هاتف';

  @override
  String get contactEmailLabel => 'بريد إلكتروني';

  @override
  String get openContactAction => 'تواصل مفتوح';

  @override
  String contactOpenFailed(Object error) {
    return 'تعذر فتح جهة الاتصال: $error';
  }

  @override
  String get howToImport => 'كيفية الاستيراد';

  @override
  String get settings => 'إعدادات';

  @override
  String get searchTitle => 'يبحث';

  @override
  String get textToInclude => 'النص المطلوب تضمينه:';

  @override
  String get enterSearchText => 'أدخل نص البحث...';

  @override
  String get dateRange => 'نطاق التاريخ:';

  @override
  String get fromLabel => 'من:';

  @override
  String get toLabel => 'ل:';

  @override
  String get selectLabel => 'يختار';

  @override
  String get showOnlyMediaFiles => 'عرض ملفات الوسائط فقط';

  @override
  String get clearAction => 'واضح';

  @override
  String get searchAction => 'يبحث';

  @override
  String get renameChatTitle => 'إعادة تسمية المحادثة';

  @override
  String get chatNameHint => 'اسم الدردشة';

  @override
  String get cancelAction => 'يلغي';

  @override
  String get saveAction => 'يحفظ';

  @override
  String get hideChatsTooltip => 'إخفاء المحادثات';

  @override
  String get hideAction => 'يخفي';

  @override
  String get lockAction => 'قفل';

  @override
  String get noChatsYetHint =>
      'لا توجد محادثات حتى الآن.\n\nاستخدم \"استيراد ZIP\" لتحميل ملف مُصدَّر من WhatsApp،\nأو صدِّر مباشرةً من WhatsApp باستخدام خيار \"تصدير المحادثة\" في المحادثة.';

  @override
  String get noArchivedChats => 'لا توجد محادثات مؤرشفة.';

  @override
  String get tabChats => 'المحادثات';

  @override
  String get tabArchived => 'مؤرشف';

  @override
  String get searchChatsHint => 'ابحث عن المحادثات';

  @override
  String get enterCodeTitle => 'أدخل الرمز';

  @override
  String get upTo8DigitsHint => 'حتى 8 أرقام';

  @override
  String get continueAction => 'يكمل';

  @override
  String get updatingHiddenChats => 'جارٍ تحديث المحادثات المخفية...';

  @override
  String get chatsUnhidden => 'المحادثات غير المخفية.';

  @override
  String get selectAtLeastOneChat => 'اختر محادثة واحدة على الأقل.';

  @override
  String get hidingChats => 'إخفاء المحادثات...';

  @override
  String get lockingChats => 'إغلاق المحادثات...';

  @override
  String get chatsHidden => 'المحادثات مخفية.';

  @override
  String get chatsUnlocked => 'تم فتح المحادثات.';

  @override
  String get chatsLocked => 'المحادثات مغلقة.';

  @override
  String get unlockChatTitle => 'فتح الدردشة';

  @override
  String get enterPasscodeHint => 'أدخل رمز المرور';

  @override
  String get unlockAction => 'فتح';

  @override
  String get incorrectCode => 'رمز غير صحيح.';

  @override
  String importedOn(Object date) {
    return 'مستورد $date';
  }

  @override
  String get unarchiveAction => 'Unarchive';

  @override
  String get archiveAction => 'أرشيف';

  @override
  String get deleteAction => 'يمسح';

  @override
  String get deleteChatTitle => 'حذف المحادثة؟';

  @override
  String get deleteChatConfirm =>
      'يؤدي هذا إلى حذف ملفات الأرشيف والوسائط بشكل دائم.';

  @override
  String get archiveFolderMissing => 'كان مجلد الأرشيف مفقودًا.';

  @override
  String updateFailedWithDetail(Object error) {
    return 'فشل التحديث: $error';
  }

  @override
  String get renameAction => 'إعادة تسمية';

  @override
  String get working => 'عمل...';

  @override
  String get importPreparing => 'جارٍ تجهيز الاستيراد...';

  @override
  String get importAnalyzing => 'جارٍ تحليل الملف...';

  @override
  String get bookmarksLabel => 'الإشارات المرجعية';

  @override
  String get previousBookmark => 'الإشارة المرجعية السابقة';

  @override
  String get nextBookmark => 'الإشارة المرجعية التالية';

  @override
  String get importLargeFileNotice =>
      'تم اكتشاف ملف كبير. قد يستغرق هذا بضع دقائق.';

  @override
  String get importExtracting => 'جارٍ استخراج الملفات...';

  @override
  String get importFinalizing => 'جارٍ الانتهاء...';

  @override
  String importFailedWithDetail(Object error) {
    return 'فشلت عملية الاستيراد: $error';
  }

  @override
  String get sharedFileNotZip => 'الملف المشترك ليس ZIP.';

  @override
  String get unlockProToImportMoreChats =>
      'قم بإلغاء قفل BackupChat Pro لاستيراد المزيد من المحادثات.';

  @override
  String get purchaseFailedTryAgain =>
      'فشلت عملية الشراء. يرجى المحاولة مرة أخرى.';

  @override
  String get importErrorOnlyZip => 'لا يتم دعم سوى ملفات .zip.';

  @override
  String get importErrorNoChatText =>
      'لم يتم العثور على ملف نص الدردشة WhatsApp في ZIP.';

  @override
  String get importErrorAlreadyImported => 'تم استيراد هذه المحادثة بالفعل.';

  @override
  String get howToImportTitle => 'كيفية الاستيراد';

  @override
  String get chooseImportMethodTitle => 'اختر طريقة الاستيراد الخاصة بك';

  @override
  String get iosExportTitle => 'تصدير من واتساب (iOS)';

  @override
  String get androidExportTitle => 'تصدير من واتساب (أندرويد)';

  @override
  String get iosStepOpenChat => 'داخل تطبيق واتساب، انقر على المحادثة.';

  @override
  String get androidStepOpenChat =>
      'داخل تطبيق واتساب، انقر للدخول إلى محادثة.';

  @override
  String get iosStepOpenInfo => 'انقر على اسم الشخص أو المجموعة في الأعلى.';

  @override
  String get androidStepOpenMenu => 'انقر على القائمة.';

  @override
  String get iosStepExportChat =>
      'قم بالتمرير لأسفل إلى الأسفل وحدد خيار \"تصدير المحادثة\".';

  @override
  String get androidStepMoreExport => 'اختر \"المزيد\".';

  @override
  String get iosStepChooseMedia =>
      'من قائمة اختيار التطبيق (ورقة المشاركة) حدد WhatsBackUp (في الهواتف القديمة، احفظ في ملفات).';

  @override
  String get androidStepChooseMedia => 'اختر \"تصدير المحادثة\".';

  @override
  String get iosStepShareToApp =>
      'سيتم استيراد المحادثة إلى برنامج WhatsBackUp.';

  @override
  String get androidStepShareToApp =>
      'من قائمة اختيار التطبيق (ورقة المشاركة) حدد WhatsBackUp (في الهواتف القديمة، احفظ في ملفات).';

  @override
  String get iosStepSaveToFiles =>
      'سيتم استيراد المحادثة إلى برنامج WhatsBackUp.';

  @override
  String get androidStepSaveToDevice =>
      'سيتم استيراد المحادثة إلى برنامج WhatsBackUp.';

  @override
  String get androidLargeImportNote =>
      'يرجى ملاحظة أنه في هواتف أندرويد القديمة، قد يستغرق استيراد المحادثات الكبيرة جدًا ما يصل إلى دقيقة للبدء.';

  @override
  String get importZipTitle => 'استورد ملف ZIP محفوظًا';

  @override
  String get iosStepImportZip =>
      'في برنامج WhatsBackUp، انقر على \"استيراد من ملف ZIP\" واختر الملف من قائمة الملفات.';

  @override
  String get androidStepImportZip =>
      'في تطبيق WhatsBackUp، انقر على \"استيراد من ملف ZIP\" واختر الملف من جهازك.';

  @override
  String get managingChatsTitle => 'إدارة المحادثات';

  @override
  String get hideChatsWithCodeTitle => 'إخفاء المحادثات باستخدام رمز';

  @override
  String get stepTapGhostIcon => 'انقر على أيقونة الشبح في الشريط العلوي.';

  @override
  String get stepEnterCodeUpTo8Digits => 'أدخل رمزًا (حتى 8 أرقام).';

  @override
  String get stepSelectChatsSubmitHide =>
      'حدد المحادثات، ثم انقر فوق \"إرسال\" لإخفائها.';

  @override
  String get stepEnterSameCodeUnhide =>
      'أدخل نفس الرمز مرة أخرى لإظهار تلك المحادثات.';

  @override
  String get stepDifferentCodesHideSets =>
      'يمكن للرموز المختلفة إخفاء مجموعات مختلفة من المحادثات.';

  @override
  String get lockChatsWithCodeTitle => 'قفل المحادثات برمز';

  @override
  String get stepSwitchHideToLockMode =>
      'في الإعدادات، قم بالتبديل من وضع الإخفاء إلى وضع القفل.';

  @override
  String get stepTapGhostIconEnterCode => 'انقر على أيقونة الشبح وأدخل رمزًا.';

  @override
  String get stepSelectChatsSubmitLock =>
      'حدد المحادثات، ثم انقر فوق \"إرسال\" لقفلها.';

  @override
  String get stepLockedChatsRequireCode =>
      'تظهر أيقونة القفل على المحادثات المقفلة وتتطلب رمزًا لفتحها.';

  @override
  String get archiveOrDeleteTitle => 'أرشفة أو حذف';

  @override
  String get stepSwipeRightArchive =>
      'اسحب لليمين لأرشفة أو إلغاء أرشفة الملف.';

  @override
  String get stepSwipeLeftDelete => 'اسحب لليسار للحذف (يلزم التأكيد).';

  @override
  String get bullet => '•';

  @override
  String get welcomeTitle => 'مرحباً';

  @override
  String get gotItAction => 'فهمتها';

  @override
  String get settingsTitle => 'إعدادات';

  @override
  String get sectionFont => 'نوع الخط';

  @override
  String get sectionColor => 'لون';

  @override
  String get sectionAccessibility => 'إمكانية الوصول';

  @override
  String get sectionPrivacy => 'خصوصية';

  @override
  String get sectionPro => 'BackupChat Pro';

  @override
  String get sectionStorage => 'تخزين';

  @override
  String get storageTitle => 'تخزين';

  @override
  String get storageSubtitle => 'عرض مساحة الجهاز وتخزين المحادثات';

  @override
  String get storageAvailable => 'مساحة تخزين متاحة';

  @override
  String get storageAppSize => 'حجم WhatsBackUp (بما في ذلك المحادثات)';

  @override
  String get storageLocation => 'موقع التخزين';

  @override
  String get storageLocationUnknown => 'مجهول';

  @override
  String get storageCalculate => 'احسب';

  @override
  String get storageCalculating => 'جارٍ الحساب...';

  @override
  String get storageNotCalculated => 'غير محسوب';

  @override
  String storageLastCalculated(Object date) {
    return 'آخر قيمة محسوبة: $date';
  }

  @override
  String get storageLastCalculatedNone => 'آخر حساب: —';

  @override
  String get storageChatSizesToggle => 'عرض أحجام الدردشة في القائمة';

  @override
  String get storageChatSizesSubtitle =>
      'يعرض الحجم الإجمالي لكل محادثة على الشاشة الرئيسية';

  @override
  String get storageCleanupTitle => 'تنظيف عمليات الاستيراد الفاشلة';

  @override
  String get storageCleanupSubtitle =>
      'يزيل عمليات الاستيراد غير المكتملة أو الفاشلة لتوفير مساحة.';

  @override
  String get storageCleanupEstimate => 'المساحة المقدرة للتفريغ';

  @override
  String get storageCleanupAction => 'نظف الآن';

  @override
  String get storageCleanupNone => 'لم يتم العثور على أي عمليات استيراد فاشلة.';

  @override
  String storageCleanupDone(Object size) {
    return 'تم تنظيف $size من عمليات الاستيراد الفاشلة.';
  }

  @override
  String storageCleanupLast(Object time) {
    return 'آخر عملية تنظيف: $time';
  }

  @override
  String get proActiveTitle => 'الاحترافية نشطة';

  @override
  String get proUpgradeTitle => 'قم بالترقية إلى BackupChat Pro';

  @override
  String get proThankYouSubtitle => 'شكراً لدعمكم التطبيق.';

  @override
  String get proUnlockSubtitle => 'افتح عمليات استيراد غير محدودة.';

  @override
  String get debugProOverrideTitle => 'تصحيح الأخطاء: Force Pro';

  @override
  String get debugProOverrideSubtitle =>
      'تجاوز محلي للاختبار (لا يلزم الشراء).';

  @override
  String paywallResult(Object result) {
    return 'نتيجة جدار الدفع: $result.';
  }

  @override
  String get purchaseCancelled => 'تم إلغاء عملية الشراء.';

  @override
  String get restorePurchases => 'استعادة المشتريات';

  @override
  String get purchasesRestored => 'تمت استعادة المشتريات.';

  @override
  String get restoreFailedTryAgain => 'فشلت عملية الاستعادة. حاول مرة أخرى.';

  @override
  String get manageSubscription => 'إدارة الاشتراك';

  @override
  String get openCustomerCenter => 'افتح مركز عملاء RevenueCat.';

  @override
  String get customerCenterUnavailable => 'مركز خدمة العملاء غير متاح.';

  @override
  String get sectionAbout => 'عن';

  @override
  String get aboutDescription =>
      'WhatsBackUp هو عارض خاص يعمل دون اتصال بالإنترنت لتصدير محادثات WhatsApp. استورد ملفات ZIP أو صدّرها مباشرةً من WhatsApp للحفاظ على أرشيف نظيف وقابل للبحث مع الوسائط - دون الحاجة إلى شبكة.';

  @override
  String get sectionAboutDeveloper => 'نبذة عن المطور';

  @override
  String get aboutDeveloperDescription =>
      'تم تطويره بواسطة مطور مستقل يركز على الخصوصية، والبحث السريع، وأرشيفات المحادثات النظيفة.';

  @override
  String get sectionHelp => 'يساعد';

  @override
  String get showOnboardingAgain => 'عرض عملية الإعداد مرة أخرى';

  @override
  String get sdkConfigTitle => 'تكوين SDK';

  @override
  String get publicKeyLabel => 'المفتاح العام';

  @override
  String get offeringIdLabel => 'رقم العرض';

  @override
  String get entitlementIdLabel => 'معرّف الاستحقاق';

  @override
  String get lifetimeProductIdLabel => 'معرف المنتج مدى الحياة';

  @override
  String errorLabel(Object error) {
    return 'خطأ: $error';
  }

  @override
  String get offeringsTitle => 'العروض';

  @override
  String get currentOfferingLabel => 'العرض الحالي';

  @override
  String get allOfferingsLabel => 'جميع العروض';

  @override
  String get customerInfoTitle => 'معلومات العميل';

  @override
  String get activeEntitlementsLabel => 'الاستحقاقات النشطة';

  @override
  String get originalAppUserIdLabel => 'معرّف مستخدم التطبيق الأصلي';

  @override
  String get managementUrlLabel => 'رابط الإدارة';

  @override
  String get noneLabel => 'لا أحد';

  @override
  String get refreshAction => 'ينعش';

  @override
  String get noPackagesAvailable => 'لا توجد باقات متاحة.';

  @override
  String get packagesTitle => 'الطرود';

  @override
  String get fontSystem => 'نظام';

  @override
  String get fontSerif => 'Serif';

  @override
  String get fontMono => 'كثرة الوحيدات';

  @override
  String get accessibilityFontSizeTitle => 'حجم الخط';

  @override
  String get accessibilityFontSizeSubtitle =>
      'اضبط حجم النص في جميع أنحاء التطبيق.';

  @override
  String get accessibilityFontPreview =>
      'هذه فقاعة رسالة نموذجية.\n\nتُظهر كيف سيبدو نص المحادثة.\nاضبط شريط التمرير لتغيير الحجم.';

  @override
  String get accessibilityHighContrastTitle => 'وضع التباين العالي';

  @override
  String get accessibilityHighContrastSubtitle =>
      'قم بزيادة التباين لتحسين سهولة القراءة.';

  @override
  String get colorWhatsAppGreen => 'WhatsApp أخضر';

  @override
  String get colorDeepTeal => 'أزرق مخضر داكن';

  @override
  String get colorNavy => 'البحرية';

  @override
  String get colorCharcoal => 'فحم';

  @override
  String get colorBlindPaletteTitle => 'لوحة ألوان لعمى الألوان';

  @override
  String get colorBlindPaletteSubtitle =>
      'استخدم لوحة ألوان مُحسّنة خصيصًا لحالات قصور رؤية الألوان.';

  @override
  String get hideChatsInsteadOfLocking => 'إخفاء المحادثات بدلاً من قفلها';

  @override
  String get hideChatsInsteadOfLockingSubtitle =>
      'عند إيقاف تشغيلها، تكون المحادثات مرئية ولكنها محمية برمز مرور.';

  @override
  String get previousMatch => 'المباراة السابقة';

  @override
  String get nextMatch => 'المباراة التالية';

  @override
  String get selectSenderOnRight => 'حدد المرسل الموجود على اليمين';

  @override
  String couldNotOpenArchive(Object error) {
    return 'تعذر فتح الأرشيف:\n$error';
  }

  @override
  String couldNotOpenFile(Object message) {
    return 'تعذر فتح الملف: $message';
  }

  @override
  String attachmentMissing(Object filename) {
    return 'المرفق مفقود: $filename';
  }

  @override
  String get unknownError => 'خطأ غير معروف';

  @override
  String get openPdf => 'افتح ملف PDF';

  @override
  String get openFile => 'فتح الملف';

  @override
  String get openAudio => 'الصوت المفتوح';

  @override
  String senderMeLabel(Object sender) {
    return '$sender (أنا)';
  }

  @override
  String get chatFileNotFound => 'لم يتم العثور على ملف المحادثة.';

  @override
  String get languageTitle => 'لغة';

  @override
  String get languageTooltip => 'لغة';

  @override
  String get moreOptionsTooltip => 'خيارات إضافية';

  @override
  String get filterTitle => 'فلتر';

  @override
  String get filterDateRange => 'نطاق التاريخ';

  @override
  String get filterAnyDate => 'أي تاريخ';

  @override
  String get filterIncludeMedia => 'تضمين الوسائط';

  @override
  String get filterMediaOnly => 'للإعلام فقط';

  @override
  String get filterSenders => 'المرسلون';

  @override
  String get applyFilters => 'يتقدم';

  @override
  String get clearFilters => 'مساحة فارغة';

  @override
  String get incrementalImportTitle => 'الدردشة موجودة بالفعل';

  @override
  String incrementalImportMessage(Object name) {
    return 'أضف هذا الاستيراد إلى \"$name\"؟';
  }

  @override
  String get incrementalAddAction => 'يضيف';

  @override
  String get incrementalChooseTitle => 'اختر الدردشة للتحديث';

  @override
  String get incrementalUpdated => 'تم تحديث المحادثة.';

  @override
  String get languageSystem => 'نظام';

  @override
  String get languageEnglish => 'إنجليزي';

  @override
  String get languageSpanish => 'الأسبانية';

  @override
  String get languageGerman => 'الألمانية';

  @override
  String get languageFrench => 'فرنسي';

  @override
  String get languagePortuguese => 'البرتغالية';

  @override
  String get languageRomanian => 'روماني';

  @override
  String get languageAfrikaans => 'الأفريكانية';

  @override
  String get languageRussian => 'الروسية';

  @override
  String get showImportButton => 'إظهار زر الاستيراد';

  @override
  String get showImportButtonSubtitle =>
      'قم بتفعيل زر الاستيراد ZIP على الشاشة الرئيسية.';

  @override
  String get importButtonHiddenMessage =>
      'زر الاستيراد مخفي. يمكنك إعادة تفعيله من الإعدادات.';

  @override
  String get upgradeToAccessChat => 'قم بالترقية للوصول إلى هذه المحادثة.';

  @override
  String get aboutLegalTitle => 'نبذة عنا والشؤون القانونية';

  @override
  String get aboutLegalSummary =>
      'WhatsBackUp هو عارض غير متصل بالإنترنت لملفات الدردشة المصدرة من WhatsApp. تبقى محادثاتك على جهازك.';

  @override
  String get aboutLegalRefundPolicy =>
      'الاسترداد: في حال استرداد المبلغ، ستبقى أول 5 محادثات مستوردة فقط متاحة. أما المحادثات التي تتجاوز الحد المجاني فسيتم تعطيلها حتى إعادة الشراء.';

  @override
  String get aboutLegalDisclaimers =>
      'إخلاء المسؤولية: نحن غير مسؤولين عن فقدان البيانات، أو محتوى المحادثات، أو دقة الترجمة، أو استخدام ميزات القفل/الإخفاء. يرجى الاحتفاظ بنسخ احتياطية خاصة بك.';

  @override
  String get aboutLegalAffiliation =>
      'لا تربطنا أي صلة بـ WhatsApp أو Meta. WhatsApp هي علامة تجارية مسجلة لشركة Meta Platforms, Inc.';

  @override
  String get aboutLegalSupport => 'الدعم: vwdewaal@gmail.com';

  @override
  String get aboutLegalDeveloper => 'المطور: فان ويك دي وال';

  @override
  String get aboutLegalJurisdiction =>
      'الاختصاص القضائي: الاتحاد الأوروبي/المملكة المتحدة';

  @override
  String aboutLegalVersion(Object version) {
    return 'إصدار التطبيق: $version';
  }

  @override
  String get versionLoading => 'إصدار التطبيق: جارٍ التحميل...';

  @override
  String get languageScottishGaelic => 'اللغة الغيلية الاسكتلندية';

  @override
  String get languageScots => 'الاسكتلنديين';

  @override
  String get languageChinese => 'الصينية (الماندرين)';

  @override
  String get languageHindi => 'الهندية';

  @override
  String get languageArabic => 'عربي';

  @override
  String get languageBengali => 'البنغالية';

  @override
  String get languageJapanese => 'اليابانية';

  @override
  String get languagePunjabi => 'البنجابية';

  @override
  String get languageKorean => 'كوري';

  @override
  String get languageTurkish => 'تركي';

  @override
  String get languageItalian => 'إيطالي';

  @override
  String get languageVietnamese => 'الفيتناميين';

  @override
  String get languageUrdu => 'الأردية';

  @override
  String get languageIndonesian => 'إندونيسيا';

  @override
  String get languageThai => 'تايلاندي';

  @override
  String get languagePolish => 'بولندي';

  @override
  String get languageDutch => 'هولندي';

  @override
  String get identifyMeTitle => 'عرّف بنفسك';

  @override
  String get identifyMeSubtitle =>
      'اختر اسمك حتى نتمكن من تصنيف رسائلك بشكل صحيح.';

  @override
  String get identifyMeNotNow => 'ليس الآن';
}
