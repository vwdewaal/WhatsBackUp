// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appTitle => '__টার্ম_০__';

  @override
  String get importZip => 'ZIP আমদানি করুন';

  @override
  String get importAction => 'আমদানি করুন';

  @override
  String get importingLabel => 'আমদানি করা হচ্ছে';

  @override
  String get importDoneLabel => 'সম্পন্ন!';

  @override
  String get importLargeStarted => 'আমদানি শুরু হয়েছে';

  @override
  String get importTriggeredMessage =>
      'ব্যাকগ্রাউন্ডে ইম্পোর্ট চালু হয়েছে, চ্যাটটি সম্পূর্ণ হলেই খুলবে। অনুগ্রহ করে অ্যাপটি খোলা রাখুন।';

  @override
  String get mediaImportingTitle => 'মিডিয়া আমদানি করা হচ্ছে';

  @override
  String get mediaImportingSubtitle =>
      'মিডিয়া শেষ হওয়ার আগেই আপনি চ্যাটটি পড়তে পারবেন।';

  @override
  String get mediaImportPausedTitle => 'মিডিয়া ইম্পোর্ট থামানো হয়েছে';

  @override
  String get mediaImportPausedSubtitle =>
      'পুনরায় শুরু করতে মূল ZIP পুনরায় নির্বাচন করুন।';

  @override
  String get mediaImportFailedTitle => 'মিডিয়া ইম্পোর্ট করা যায়নি';

  @override
  String get mediaImportFailedSubtitle => 'পুনরায় চেষ্টা করতে আলতো চাপুন।';

  @override
  String get mediaImportResumeAction => 'জীবনবৃত্তান্ত';

  @override
  String get mediaImportingLabel => 'মিডিয়া আমদানি করা হচ্ছে';

  @override
  String get contactLoadingLabel => 'পরিচিতি লোড হচ্ছে...';

  @override
  String get contactUnknownName => 'যোগাযোগ';

  @override
  String get contactPhoneLabel => 'ফোন';

  @override
  String get contactEmailLabel => 'ইমেইল';

  @override
  String get openContactAction => 'পরিচিতি খুলুন';

  @override
  String contactOpenFailed(Object error) {
    return 'পরিচিতিটি খোলা যায়নি: $error';
  }

  @override
  String get howToImport => 'কিভাবে আমদানি করবেন';

  @override
  String get settings => 'সেটিংস';

  @override
  String get searchTitle => 'অনুসন্ধান করুন';

  @override
  String get textToInclude => 'অন্তর্ভুক্ত করার জন্য পাঠ্য:';

  @override
  String get enterSearchText => 'অনুসন্ধানের টেক্সট লিখুন...';

  @override
  String get dateRange => 'তারিখের পরিসীমা:';

  @override
  String get fromLabel => 'থেকে:';

  @override
  String get toLabel => 'প্রতি:';

  @override
  String get selectLabel => 'নির্বাচন করুন';

  @override
  String get showOnlyMediaFiles => 'শুধুমাত্র মিডিয়া ফাইল দেখান';

  @override
  String get clearAction => 'পরিষ্কার';

  @override
  String get searchAction => 'অনুসন্ধান করুন';

  @override
  String get renameChatTitle => 'চ্যাটের নাম পরিবর্তন করুন';

  @override
  String get chatNameHint => 'চ্যাটের নাম';

  @override
  String get cancelAction => 'বাতিল করুন';

  @override
  String get saveAction => 'সংরক্ষণ করুন';

  @override
  String get hideChatsTooltip => 'চ্যাট লুকান';

  @override
  String get hideAction => 'লুকান';

  @override
  String get lockAction => 'তালা';

  @override
  String get noChatsYetHint =>
      'এখনও কোনও চ্যাট নেই।\nWhatsApp এক্সপোর্ট লোড করতে \"ZIP আমদানি করুন\" ব্যবহার করুন,\nঅথবা চ্যাটের এক্সপোর্ট চ্যাট বিকল্প ব্যবহার করে সরাসরি WhatsApp থেকে রপ্তানি করুন।';

  @override
  String get noArchivedChats => 'কোনও আর্কাইভ করা চ্যাট নেই।';

  @override
  String get tabChats => 'চ্যাট';

  @override
  String get tabArchived => 'সংরক্ষণাগারভুক্ত';

  @override
  String get searchChatsHint => 'চ্যাট খুঁজুন';

  @override
  String get enterCodeTitle => 'কোড লিখুন';

  @override
  String get upTo8DigitsHint => '৮ সংখ্যা পর্যন্ত';

  @override
  String get continueAction => 'চালিয়ে যান';

  @override
  String get updatingHiddenChats => 'লুকানো চ্যাট আপডেট করা হচ্ছে...';

  @override
  String get chatsUnhidden => 'চ্যাটগুলি লুকানো নেই।';

  @override
  String get selectAtLeastOneChat => 'অন্তত একটি চ্যাট নির্বাচন করুন।';

  @override
  String get hidingChats => 'চ্যাট লুকানো হচ্ছে...';

  @override
  String get lockingChats => 'চ্যাট লক করা হচ্ছে...';

  @override
  String get chatsHidden => 'চ্যাট লুকানো আছে।';

  @override
  String get chatsUnlocked => 'চ্যাটগুলি আনলক করা হয়েছে।';

  @override
  String get chatsLocked => 'চ্যাট লক করা আছে।';

  @override
  String get unlockChatTitle => 'চ্যাট আনলক করুন';

  @override
  String get enterPasscodeHint => 'পাসকোড লিখুন';

  @override
  String get unlockAction => 'আনলক করুন';

  @override
  String get incorrectCode => 'ভুল কোড।';

  @override
  String importedOn(Object date) {
    return 'আমদানি করা হয়েছে $date';
  }

  @override
  String get unarchiveAction => 'আর্কাইভ থেকে মুক্ত করুন';

  @override
  String get archiveAction => 'সংরক্ষণাগার';

  @override
  String get deleteAction => 'মুছে ফেলুন';

  @override
  String get deleteChatTitle => 'চ্যাট মুছে ফেলবেন?';

  @override
  String get deleteChatConfirm =>
      'এটি সংরক্ষণাগার এবং মিডিয়া ফাইলগুলি স্থায়ীভাবে মুছে ফেলে।';

  @override
  String get archiveFolderMissing => 'আর্কাইভ ফোল্ডারটি অনুপস্থিত ছিল।';

  @override
  String updateFailedWithDetail(Object error) {
    return 'আপডেট ব্যর্থ হয়েছে: $error';
  }

  @override
  String get renameAction => 'পুনঃনামকরণ করুন';

  @override
  String get working => 'কাজ করছে...';

  @override
  String get importPreparing => 'আমদানির প্রস্তুতি চলছে...';

  @override
  String get importAnalyzing => 'ফাইল বিশ্লেষণ করা হচ্ছে...';

  @override
  String get bookmarksLabel => 'বুকমার্ক';

  @override
  String get previousBookmark => 'পূর্ববর্তী বুকমার্ক';

  @override
  String get nextBookmark => 'পরবর্তী বুকমার্ক';

  @override
  String get importLargeFileNotice =>
      'বড় ফাইল শনাক্ত হয়েছে। এতে কয়েক মিনিট সময় লাগতে পারে।';

  @override
  String get importExtracting => 'ফাইলগুলি বের করা হচ্ছে...';

  @override
  String get importFinalizing => 'চূড়ান্ত করা হচ্ছে...';

  @override
  String importFailedWithDetail(Object error) {
    return 'আমদানি ব্যর্থ হয়েছে: $error';
  }

  @override
  String get sharedFileNotZip => 'শেয়ার করা ফাইলটি ZIP নয়।';

  @override
  String get unlockProToImportMoreChats =>
      'আরও চ্যাট আমদানি করতে BackupChat Pro আনলক করুন।';

  @override
  String get purchaseFailedTryAgain =>
      'ক্রয় ব্যর্থ হয়েছে। অনুগ্রহ করে আবার চেষ্টা করুন।';

  @override
  String get importErrorOnlyZip => 'শুধুমাত্র .zip ফাইলগুলি সমর্থিত।';

  @override
  String get importErrorNoChatText =>
      'ZIP তে কোনও WhatsApp চ্যাট টেক্সট ফাইল পাওয়া যায়নি।';

  @override
  String get importErrorAlreadyImported =>
      'এই চ্যাটটি ইতিমধ্যেই আমদানি করা হয়েছে।';

  @override
  String get howToImportTitle => 'কিভাবে আমদানি করবেন';

  @override
  String get chooseImportMethodTitle => 'আপনার আমদানি পদ্ধতি নির্বাচন করুন';

  @override
  String get iosExportTitle => 'WhatsApp (iOS) থেকে রপ্তানি করুন';

  @override
  String get androidExportTitle => 'WhatsApp (Android) থেকে রপ্তানি করুন';

  @override
  String get iosStepOpenChat => 'WhatsApp অ্যাপের ভেতরে, চ্যাটে ক্লিক করুন।';

  @override
  String get androidStepOpenChat =>
      'WhatsApp অ্যাপের ভেতরে, একটি চ্যাটে ক্লিক করুন।';

  @override
  String get iosStepOpenInfo =>
      'উপরে থাকা ব্যক্তি বা গোষ্ঠীর নামের উপর ক্লিক করুন।';

  @override
  String get androidStepOpenMenu => 'মেনুতে ক্লিক করুন।';

  @override
  String get iosStepExportChat =>
      'নীচে স্ক্রোল করুন এবং চ্যাট রপ্তানি করুন নির্বাচন করুন।';

  @override
  String get androidStepMoreExport => '\"আরও\" নির্বাচন করুন।';

  @override
  String get iosStepChooseMedia =>
      'অ্যাপ নির্বাচন মেনু (শেয়ার শিট) থেকে WhatsBackUp নির্বাচন করুন (পুরানো ফোনে, ফাইলগুলিতে সংরক্ষণ করুন)।';

  @override
  String get androidStepChooseMedia => 'চ্যাট এক্সপোর্ট করুন নির্বাচন করুন।';

  @override
  String get iosStepShareToApp => 'চ্যাটটি WhatsBackUp-এ আমদানি করা হবে।';

  @override
  String get androidStepShareToApp =>
      'অ্যাপ নির্বাচন মেনু (শেয়ার শিট) থেকে WhatsBackUp নির্বাচন করুন (পুরানো ফোনে, ফাইলগুলিতে সংরক্ষণ করুন)।';

  @override
  String get iosStepSaveToFiles => 'চ্যাটটি WhatsBackUp-এ আমদানি করা হবে।';

  @override
  String get androidStepSaveToDevice => 'চ্যাটটি WhatsBackUp-এ আমদানি করা হবে।';

  @override
  String get androidLargeImportNote =>
      'দয়া করে মনে রাখবেন, পুরোনো অ্যান্ড্রয়েড ফোনগুলিতে খুব বড় চ্যাট আমদানি শুরু হতে এক মিনিট পর্যন্ত সময় লাগবে।';

  @override
  String get importZipTitle => 'একটি সংরক্ষিত জিপ আমদানি করুন';

  @override
  String get iosStepImportZip =>
      'WhatsBackUp-এ, \"Import from ZIP\"-এ ট্যাপ করুন এবং Files থেকে ফাইলটি বেছে নিন।';

  @override
  String get androidStepImportZip =>
      'WhatsBackUp-এ, \"ZIP থেকে আমদানি করুন\" এ আলতো চাপুন এবং আপনার ডিভাইস থেকে ফাইলটি নির্বাচন করুন।';

  @override
  String get managingChatsTitle => 'চ্যাট পরিচালনা করা';

  @override
  String get hideChatsWithCodeTitle => 'কোড ব্যবহার করে চ্যাট লুকান';

  @override
  String get stepTapGhostIcon => 'উপরের বারে ভূত আইকনে আলতো চাপুন।';

  @override
  String get stepEnterCodeUpTo8Digits => 'একটি কোড লিখুন (সর্বোচ্চ ৮ সংখ্যা)।';

  @override
  String get stepSelectChatsSubmitHide =>
      'চ্যাট নির্বাচন করুন, তারপর সেগুলি লুকাতে জমা দিন-এ ট্যাপ করুন।';

  @override
  String get stepEnterSameCodeUnhide =>
      'সেই চ্যাটগুলি দেখাতে আবার একই কোডটি লিখুন।';

  @override
  String get stepDifferentCodesHideSets =>
      'বিভিন্ন কোড বিভিন্ন সেট চ্যাট লুকাতে পারে।';

  @override
  String get lockChatsWithCodeTitle => 'কোড দিয়ে চ্যাট লক করুন';

  @override
  String get stepSwitchHideToLockMode =>
      'সেটিংসে, লুকান থেকে লক মোডে স্যুইচ করুন।';

  @override
  String get stepTapGhostIconEnterCode =>
      'ভূত আইকনে আলতো চাপুন এবং একটি কোড লিখুন।';

  @override
  String get stepSelectChatsSubmitLock =>
      'চ্যাট নির্বাচন করুন, তারপর লক করতে জমা দিন-এ ট্যাপ করুন।';

  @override
  String get stepLockedChatsRequireCode =>
      'লক করা চ্যাটগুলিতে একটি লক আইকন দেখায় এবং খোলার জন্য কোডটি প্রয়োজন।';

  @override
  String get archiveOrDeleteTitle => 'আর্কাইভ করুন অথবা মুছুন';

  @override
  String get stepSwipeRightArchive =>
      'আর্কাইভ বা আনআর্কাইভ করতে ডানদিকে সোয়াইপ করুন।';

  @override
  String get stepSwipeLeftDelete =>
      'মুছে ফেলতে বাম দিকে সোয়াইপ করুন (নিশ্চিতকরণ প্রয়োজন)।';

  @override
  String get bullet => '•';

  @override
  String get welcomeTitle => 'স্বাগতম';

  @override
  String get gotItAction => 'বুঝেছি';

  @override
  String get settingsTitle => 'সেটিংস';

  @override
  String get sectionFont => 'ফন্ট';

  @override
  String get sectionColor => 'রঙ';

  @override
  String get sectionAccessibility => 'অ্যাক্সেসযোগ্যতা';

  @override
  String get sectionPrivacy => 'গোপনীয়তা';

  @override
  String get sectionPro => '__টার্ম_০__';

  @override
  String get sectionStorage => 'স্টোরেজ';

  @override
  String get storageTitle => 'স্টোরেজ';

  @override
  String get storageSubtitle => 'ডিভাইসের স্থান এবং চ্যাট স্টোরেজ দেখুন';

  @override
  String get storageAvailable => 'উপলব্ধ সঞ্চয়স্থান';

  @override
  String get storageAppSize => 'WhatsBackUp আকার (চ্যাট সহ)';

  @override
  String get storageLocation => 'স্টোরেজ লোকেশন';

  @override
  String get storageLocationUnknown => 'অজানা';

  @override
  String get storageCalculate => 'গণনা করুন';

  @override
  String get storageCalculating => 'গণনা করা হচ্ছে...';

  @override
  String get storageNotCalculated => 'গণনা করা হয়নি';

  @override
  String storageLastCalculated(Object date) {
    return 'শেষ গণনা: $date';
  }

  @override
  String get storageLastCalculatedNone => 'শেষ গণনা: —';

  @override
  String get storageChatSizesToggle => 'তালিকায় চ্যাটের আকার দেখান';

  @override
  String get storageChatSizesSubtitle =>
      'মূল স্ক্রিনে প্রতিটি চ্যাটের মোট আকার দেখায়';

  @override
  String get storageCleanupTitle => 'পরিষ্কার ব্যর্থ আমদানি';

  @override
  String get storageCleanupSubtitle =>
      'স্থান খালি করার জন্য অসম্পূর্ণ বা ব্যর্থ আমদানিগুলি সরিয়ে দেয়।';

  @override
  String get storageCleanupEstimate => 'খালি করার জন্য আনুমানিক স্থান';

  @override
  String get storageCleanupAction => 'এখনই পরিষ্কার করুন';

  @override
  String get storageCleanupNone => 'কোনও ব্যর্থ আমদানি পাওয়া যায়নি।';

  @override
  String storageCleanupDone(Object size) {
    return 'ব্যর্থ আমদানি থেকে $size পরিষ্কার করা হয়েছে।';
  }

  @override
  String storageCleanupLast(Object time) {
    return 'শেষ পরিষ্কার: $time';
  }

  @override
  String get proActiveTitle => 'প্রো সক্রিয় আছে';

  @override
  String get proUpgradeTitle => 'BackupChat Pro এ আপগ্রেড করুন';

  @override
  String get proThankYouSubtitle => 'অ্যাপটি সমর্থন করার জন্য আপনাকে ধন্যবাদ।';

  @override
  String get proUnlockSubtitle => 'সীমাহীন আমদানি আনলক করুন।';

  @override
  String get debugProOverrideTitle => 'ডিবাগ: ফোর্স প্রো';

  @override
  String get debugProOverrideSubtitle =>
      'পরীক্ষার জন্য স্থানীয় ওভাররাইড (কোনও ক্রয়ের প্রয়োজন নেই)।';

  @override
  String paywallResult(Object result) {
    return 'পেওয়াল ফলাফল: $result।';
  }

  @override
  String get purchaseCancelled => 'ক্রয় বাতিল করা হয়েছে।';

  @override
  String get restorePurchases => 'কেনাকাটা পুনরুদ্ধার করুন';

  @override
  String get purchasesRestored => 'কেনাকাটা পুনরুদ্ধার করা হয়েছে।';

  @override
  String get restoreFailedTryAgain =>
      'পুনরুদ্ধার ব্যর্থ হয়েছে। আবার চেষ্টা করুন।';

  @override
  String get manageSubscription => 'সাবস্ক্রিপশন পরিচালনা করুন';

  @override
  String get openCustomerCenter => 'রেভিনিউক্যাট গ্রাহক কেন্দ্র খুলুন।';

  @override
  String get customerCenterUnavailable => 'গ্রাহক কেন্দ্র অনুপলব্ধ।';

  @override
  String get sectionAbout => 'সম্পর্কে';

  @override
  String get aboutDescription =>
      'WhatsBackUp হল WhatsApp চ্যাট এক্সপোর্টের জন্য একটি ব্যক্তিগত, অফলাইন ভিউয়ার। মিডিয়া সহ একটি পরিষ্কার, অনুসন্ধানযোগ্য আর্কাইভ রাখতে ZIP ফাইল আমদানি করুন অথবা সরাসরি WhatsApp থেকে রপ্তানি করুন — কোনও নেটওয়ার্কের প্রয়োজন নেই।';

  @override
  String get sectionAboutDeveloper => 'ডেভেলপার সম্পর্কে';

  @override
  String get aboutDeveloperDescription =>
      'গোপনীয়তা, দ্রুত অনুসন্ধান এবং পরিষ্কার চ্যাট আর্কাইভের উপর দৃষ্টি নিবদ্ধ করে একজন স্বাধীন বিকাশকারী দ্বারা নির্মিত।';

  @override
  String get sectionHelp => 'সাহায্য';

  @override
  String get showOnboardingAgain => 'আবার অনবোর্ডিং দেখান';

  @override
  String get sdkConfigTitle => 'SDK কনফিগারেশন';

  @override
  String get publicKeyLabel => 'পাবলিক কী';

  @override
  String get offeringIdLabel => 'অফারিং আইডি';

  @override
  String get entitlementIdLabel => 'এনটাইটেলমেন্ট আইডি';

  @override
  String get lifetimeProductIdLabel => 'লাইফটাইম পণ্য আইডি';

  @override
  String errorLabel(Object error) {
    return 'ত্রুটি: $error';
  }

  @override
  String get offeringsTitle => 'অফার';

  @override
  String get currentOfferingLabel => 'বর্তমান অফার';

  @override
  String get allOfferingsLabel => 'সমস্ত অফার';

  @override
  String get customerInfoTitle => 'গ্রাহকের তথ্য';

  @override
  String get activeEntitlementsLabel => 'সক্রিয় এনটাইটেলমেন্ট';

  @override
  String get originalAppUserIdLabel => 'আসল অ্যাপ ব্যবহারকারী আইডি';

  @override
  String get managementUrlLabel => 'পরিচালনার URL';

  @override
  String get noneLabel => 'কেউ না';

  @override
  String get refreshAction => 'রিফ্রেশ করুন';

  @override
  String get noPackagesAvailable => 'কোন প্যাকেজ উপলব্ধ নেই।';

  @override
  String get packagesTitle => 'প্যাকেজ';

  @override
  String get fontSystem => 'সিস্টেম';

  @override
  String get fontSerif => 'সেরিফ';

  @override
  String get fontMono => 'মনো';

  @override
  String get accessibilityFontSizeTitle => 'ফন্ট সাইজ';

  @override
  String get accessibilityFontSizeSubtitle =>
      'অ্যাপ জুড়ে লেখার আকার সামঞ্জস্য করুন।';

  @override
  String get accessibilityFontPreview =>
      'এটি একটি উদাহরণ বার্তা বুদবুদ।\nএটি দেখায় যে আপনার চ্যাট টেক্সট কেমন দেখাবে।\nআকার পরিবর্তন করতে স্লাইডারটি সামঞ্জস্য করুন।';

  @override
  String get accessibilityHighContrastTitle => 'উচ্চ বৈসাদৃশ্য মোড';

  @override
  String get accessibilityHighContrastSubtitle =>
      'আরও ভালো পঠনযোগ্যতার জন্য কন্ট্রাস্ট বাড়ান।';

  @override
  String get colorWhatsAppGreen => 'WhatsApp সবুজ';

  @override
  String get colorDeepTeal => 'গাঢ় নীল';

  @override
  String get colorNavy => 'নৌবাহিনী';

  @override
  String get colorCharcoal => 'কাঠকয়লা';

  @override
  String get colorBlindPaletteTitle => 'রঙিন অন্ধত্বের প্যালেট';

  @override
  String get colorBlindPaletteSubtitle =>
      'রঙের দৃষ্টির ঘাটতির জন্য অপ্টিমাইজ করা একটি প্যালেট ব্যবহার করুন।';

  @override
  String get hideChatsInsteadOfLocking => 'লক করার পরিবর্তে চ্যাট লুকান';

  @override
  String get hideChatsInsteadOfLockingSubtitle =>
      'বন্ধ থাকলে, চ্যাটগুলি দৃশ্যমান হয় কিন্তু পাসকোড সুরক্ষিত থাকে।';

  @override
  String get previousMatch => 'পূর্ববর্তী ম্যাচ';

  @override
  String get nextMatch => 'পরবর্তী ম্যাচ';

  @override
  String get selectSenderOnRight => 'ডানদিকে কোন প্রেরক আছেন তা নির্বাচন করুন';

  @override
  String couldNotOpenArchive(Object error) {
    return 'সংরক্ষণাগার খোলা যায়নি:\n$error';
  }

  @override
  String couldNotOpenFile(Object message) {
    return 'ফাইলটি খোলা যায়নি: $message';
  }

  @override
  String attachmentMissing(Object filename) {
    return 'সংযুক্তিটি অনুপস্থিত: $filename';
  }

  @override
  String get unknownError => 'অজানা ত্রুটি';

  @override
  String get openPdf => 'পিডিএফ খুলুন';

  @override
  String get openFile => 'ফাইল খুলুন';

  @override
  String get openAudio => 'অডিও খুলুন';

  @override
  String senderMeLabel(Object sender) {
    return '$sender (আমি)';
  }

  @override
  String get chatFileNotFound => 'চ্যাট ফাইলটি পাওয়া যায়নি।';

  @override
  String get languageTitle => 'ভাষা';

  @override
  String get languageTooltip => 'ভাষা';

  @override
  String get moreOptionsTooltip => 'আরও বিকল্প';

  @override
  String get filterTitle => 'ফিল্টার';

  @override
  String get filterDateRange => 'তারিখের পরিসর';

  @override
  String get filterAnyDate => 'যেকোনো তারিখ';

  @override
  String get filterIncludeMedia => 'মিডিয়া অন্তর্ভুক্ত করুন';

  @override
  String get filterMediaOnly => 'শুধুমাত্র মিডিয়া';

  @override
  String get filterSenders => 'প্রেরক';

  @override
  String get applyFilters => 'প্রয়োগ করুন';

  @override
  String get clearFilters => 'ফিল্টার সাফ করুন';

  @override
  String get incrementalImportTitle => 'চ্যাট ইতিমধ্যেই বিদ্যমান';

  @override
  String incrementalImportMessage(Object name) {
    return 'এই আমদানিটি \"$name\" তে যোগ করবেন?';
  }

  @override
  String get incrementalAddAction => 'যোগ করুন';

  @override
  String get incrementalChooseTitle => 'আপডেট করার জন্য চ্যাট বেছে নিন';

  @override
  String get incrementalUpdated => 'চ্যাট আপডেট করা হয়েছে।';

  @override
  String get languageSystem => 'সিস্টেম';

  @override
  String get languageEnglish => 'ইংরেজী';

  @override
  String get languageSpanish => 'স্পেনীয়';

  @override
  String get languageGerman => 'জার্মান';

  @override
  String get languageFrench => 'ফরাসি';

  @override
  String get languagePortuguese => 'পর্তুগীজ';

  @override
  String get languageRomanian => 'রোমানীয়';

  @override
  String get languageAfrikaans => 'আফ্রিকান্স';

  @override
  String get languageRussian => 'রুশ';

  @override
  String get showImportButton => 'আমদানি বোতাম দেখান';

  @override
  String get showImportButtonSubtitle =>
      'হোম স্ক্রিনে ZIP আমদানি বোতামটি টগল করুন।';

  @override
  String get importButtonHiddenMessage =>
      'আমদানি বোতামটি লুকানো আছে। আপনি সেটিংসে এটি পুনরায় সক্ষম করতে পারেন।';

  @override
  String get upgradeToAccessChat => 'এই চ্যাট অ্যাক্সেস করতে আপগ্রেড করুন।';

  @override
  String get aboutLegalTitle => 'সম্পর্কে এবং আইনি';

  @override
  String get aboutLegalSummary =>
      'WhatsBackUp হল WhatsApp চ্যাট এক্সপোর্টের জন্য একটি অফলাইন ভিউয়ার। আপনার চ্যাটগুলি আপনার ডিভাইসেই থাকে।';

  @override
  String get aboutLegalRefundPolicy =>
      'ফেরত: যদি ফেরত দেওয়া হয়, তাহলে শুধুমাত্র প্রথম ৫টি আমদানি করা চ্যাটই অ্যাক্সেসযোগ্য থাকবে। বিনামূল্যের সীমার বেশি চ্যাট পুনঃক্রয় না করা পর্যন্ত বন্ধ থাকবে।';

  @override
  String get aboutLegalDisclaimers =>
      'দাবিত্যাগ: ডেটা ক্ষতি, চ্যাট কন্টেন্ট, অনুবাদের নির্ভুলতা, অথবা লক/হাইড বৈশিষ্ট্য ব্যবহারের জন্য আমরা দায়ী নই। অনুগ্রহ করে আপনার নিজস্ব ব্যাকআপ রাখুন।';

  @override
  String get aboutLegalAffiliation =>
      'WhatsApp বা Meta এর সাথে সম্পর্কিত নয়। WhatsApp হল Meta Platforms, Inc এর একটি ট্রেডমার্ক।';

  @override
  String get aboutLegalSupport => 'সহায়তা: vwdewaal@gmail.com';

  @override
  String get aboutLegalDeveloper => 'বিকাশকারী: ভ্যান উইক ডি ওয়াল';

  @override
  String get aboutLegalJurisdiction => 'এখতিয়ার: ইইউ/যুক্তরাজ্য';

  @override
  String aboutLegalVersion(Object version) {
    return 'অ্যাপ সংস্করণ: $version';
  }

  @override
  String get versionLoading => 'অ্যাপ ভার্সন: লোড হচ্ছে...';

  @override
  String get languageScottishGaelic => 'স্কটিশ গেলিক';

  @override
  String get languageScots => 'স্কটস';

  @override
  String get languageChinese => 'চীনা (ম্যান্ডারিন)';

  @override
  String get languageHindi => 'হিন্দি';

  @override
  String get languageArabic => 'আরবি';

  @override
  String get languageBengali => 'বাংলা';

  @override
  String get languageJapanese => 'জাপানি';

  @override
  String get languagePunjabi => 'পাঞ্জাবি';

  @override
  String get languageKorean => 'কোরিয়ান';

  @override
  String get languageTurkish => 'তুর্কী';

  @override
  String get languageItalian => 'ইতালীয়';

  @override
  String get languageVietnamese => 'ভিয়েতনামী';

  @override
  String get languageUrdu => 'উর্দু';

  @override
  String get languageIndonesian => 'ইন্দোনেশীয়';

  @override
  String get languageThai => 'থাই';

  @override
  String get languagePolish => 'পোলীশ';

  @override
  String get languageDutch => 'ডাচ';

  @override
  String get identifyMeTitle => 'নিজেকে চিনুন';

  @override
  String get identifyMeSubtitle =>
      'আপনার নাম নির্বাচন করুন যাতে আমরা আপনার বার্তাগুলিকে সঠিকভাবে লেবেল করতে পারি।';

  @override
  String get identifyMeNotNow => 'এখন না';
}
