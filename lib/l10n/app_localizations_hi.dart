// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'व्हाट्सबैकअप';

  @override
  String get importZip => 'ज़िप फ़ाइल आयात करें';

  @override
  String get importAction => 'आयात';

  @override
  String get importingLabel => 'आयात कर रहा है';

  @override
  String get importDoneLabel => 'हो गया!';

  @override
  String get importLargeStarted => 'आयात शुरू हो गया';

  @override
  String get importTriggeredMessage =>
      'बैकग्राउंड में इंपोर्ट प्रक्रिया शुरू हो गई है, पूरा होने पर चैट खुल जाएगी। कृपया ऐप को खुला रखें।';

  @override
  String get mediaImportingTitle => 'मीडिया आयात करना';

  @override
  String get mediaImportingSubtitle =>
      'मीडिया प्रसारण समाप्त होने तक आप चैट पढ़ सकते हैं।';

  @override
  String get mediaImportPausedTitle => 'मीडिया आयात रोक दिया गया';

  @override
  String get mediaImportPausedSubtitle =>
      'पुनः शुरू करने के लिए मूल ZIP का पुनः चयन करें।';

  @override
  String get mediaImportFailedTitle => 'मीडिया आयात विफल रहा';

  @override
  String get mediaImportFailedSubtitle => 'पुन: प्रयास करने के लिए ठोकिए।';

  @override
  String get mediaImportResumeAction => 'फिर शुरू करना';

  @override
  String get mediaImportingLabel => 'मीडिया आयात';

  @override
  String get contactLoadingLabel => 'संपर्क लोड हो रहा है…';

  @override
  String get contactUnknownName => 'संपर्क';

  @override
  String get contactPhoneLabel => 'फ़ोन';

  @override
  String get contactEmailLabel => 'ईमेल';

  @override
  String get openContactAction => 'खुला संपर्क';

  @override
  String contactOpenFailed(Object error) {
    return 'संपर्क खोलने में असमर्थ: $error';
  }

  @override
  String get howToImport => 'आयात कैसे करें';

  @override
  String get settings => 'सेटिंग्स';

  @override
  String get searchTitle => 'खोज';

  @override
  String get textToInclude => 'शामिल करने के लिए पाठ:';

  @override
  String get enterSearchText => 'खोज के लिए टेक्स्ट दर्ज करें...';

  @override
  String get dateRange => 'दिनांक सीमा:';

  @override
  String get fromLabel => 'से:';

  @override
  String get toLabel => 'को:';

  @override
  String get selectLabel => 'चुनना';

  @override
  String get showOnlyMediaFiles => 'केवल मीडिया फ़ाइलें दिखाएँ';

  @override
  String get clearAction => 'स्पष्ट';

  @override
  String get searchAction => 'खोज';

  @override
  String get renameChatTitle => 'चैट का नाम बदलें';

  @override
  String get chatNameHint => 'चैट नाम';

  @override
  String get cancelAction => 'रद्द करना';

  @override
  String get saveAction => 'बचाना';

  @override
  String get hideChatsTooltip => 'चैट छुपाएं';

  @override
  String get hideAction => 'छिपाना';

  @override
  String get lockAction => 'ताला';

  @override
  String get noChatsYetHint =>
      'अभी तक कोई चैट नहीं है।\nWhatsApp से निर्यात लोड करने के लिए \"Import ZIP\" का उपयोग करें,\nया चैट के \'Export Chat\' विकल्प का उपयोग करके सीधे WhatsApp से निर्यात करें।';

  @override
  String get noArchivedChats => 'कोई संग्रहित चैट उपलब्ध नहीं हैं।';

  @override
  String get tabChats => 'चैट';

  @override
  String get tabArchived => 'संग्रहीत';

  @override
  String get searchChatsHint => 'चैट खोजें';

  @override
  String get enterCodeTitle => 'कोड दर्ज करें';

  @override
  String get upTo8DigitsHint => 'अधिकतम 8 अंक';

  @override
  String get continueAction => 'जारी रखना';

  @override
  String get updatingHiddenChats => 'छिपी हुई चैट को अपडेट किया जा रहा है...';

  @override
  String get chatsUnhidden => 'चैट्स अनहाइड हो गईं।';

  @override
  String get selectAtLeastOneChat => 'कम से कम एक चैट चुनें।';

  @override
  String get hidingChats => 'चैट्स को छिपाना...';

  @override
  String get lockingChats => 'चैट लॉक हो रही हैं...';

  @override
  String get chatsHidden => 'चैट्स छिपी हुई हैं।';

  @override
  String get chatsUnlocked => 'चैट अनलॉक हो गई हैं।';

  @override
  String get chatsLocked => 'चैट लॉक कर दी गई हैं।';

  @override
  String get unlockChatTitle => 'चैट अनलॉक करें';

  @override
  String get enterPasscodeHint => 'पासकोड दर्ज करें';

  @override
  String get unlockAction => 'अनलॉक';

  @override
  String get incorrectCode => 'गलत कोड़।';

  @override
  String importedOn(Object date) {
    return 'आयातित $date';
  }

  @override
  String get unarchiveAction => 'संग्रह से निकालें';

  @override
  String get archiveAction => 'पुरालेख';

  @override
  String get deleteAction => 'मिटाना';

  @override
  String get deleteChatTitle => 'चैट डिलीट करें?';

  @override
  String get deleteChatConfirm =>
      'इससे आर्काइव और मीडिया फाइलें स्थायी रूप से डिलीट हो जाएंगी।';

  @override
  String get archiveFolderMissing => 'आर्काइव फोल्डर गायब था।';

  @override
  String updateFailedWithDetail(Object error) {
    return 'अपडेट विफल: $error';
  }

  @override
  String get renameAction => 'नाम बदलें';

  @override
  String get working => 'कार्यरत...';

  @override
  String get importPreparing => 'आयात की तैयारी चल रही है...';

  @override
  String get importAnalyzing => 'फ़ाइल का विश्लेषण किया जा रहा है...';

  @override
  String get bookmarksLabel => 'बुकमार्क';

  @override
  String get previousBookmark => 'पिछला बुकमार्क';

  @override
  String get nextBookmark => 'अगला बुकमार्क';

  @override
  String get importLargeFileNotice =>
      'बड़ी फ़ाइल का पता चला है। इसमें कुछ मिनट लग सकते हैं।';

  @override
  String get importExtracting => 'फ़ाइलें निकाली जा रही हैं...';

  @override
  String get importFinalizing => 'अंतिम चरण में...';

  @override
  String importFailedWithDetail(Object error) {
    return 'आयात विफल: $error';
  }

  @override
  String get sharedFileNotZip => 'साझा फ़ाइल ZIP नहीं है।';

  @override
  String get unlockProToImportMoreChats =>
      'अधिक चैट आयात करने के लिए BackupChat Pro को अनलॉक करें।';

  @override
  String get purchaseFailedTryAgain =>
      'खरीदारी असफल रही। कृपया पुनः प्रयास करें।';

  @override
  String get importErrorOnlyZip => 'केवल .zip फ़ाइलें ही समर्थित हैं।';

  @override
  String get importErrorNoChatText =>
      'ZIP में कोई WhatsApp चैट टेक्स्ट फ़ाइल नहीं मिली।';

  @override
  String get importErrorAlreadyImported => 'यह चैट पहले ही आयात हो चुकी है।';

  @override
  String get howToImportTitle => 'आयात कैसे करें';

  @override
  String get chooseImportMethodTitle => 'अपनी आयात विधि चुनें';

  @override
  String get iosExportTitle => 'WhatsApp से निर्यात करें (iOS)';

  @override
  String get androidExportTitle => 'WhatsApp से निर्यात करें (Android)';

  @override
  String get iosStepOpenChat => 'व्हाट्सएप ऐप के अंदर, चैट पर क्लिक करें।';

  @override
  String get androidStepOpenChat =>
      'व्हाट्सएप ऐप के अंदर, किसी चैट पर क्लिक करें।';

  @override
  String get iosStepOpenInfo =>
      'सबसे ऊपर मौजूद व्यक्ति या समूह के नाम पर क्लिक करें।';

  @override
  String get androidStepOpenMenu => 'मेनू पर क्लिक करें।';

  @override
  String get iosStepExportChat =>
      'नीचे तक स्क्रॉल करें और \'एक्सपोर्ट चैट\' चुनें।';

  @override
  String get androidStepMoreExport => '“अधिक” चुनें।';

  @override
  String get iosStepChooseMedia =>
      'ऐप चयन मेनू (शेयर शीट) से व्हाट्सबैकअप चुनें (पुराने फोन पर, फ़ाइलों में सहेजें)।';

  @override
  String get androidStepChooseMedia => 'चैट निर्यात करें चुनें।';

  @override
  String get iosStepShareToApp => 'चैट को व्हाट्सबैकअप में इंपोर्ट किया जाएगा।';

  @override
  String get androidStepShareToApp =>
      'ऐप चयन मेनू (शेयर शीट) से व्हाट्सबैकअप चुनें (पुराने फोन पर, फ़ाइलों में सहेजें)।';

  @override
  String get iosStepSaveToFiles =>
      'चैट को व्हाट्सबैकअप में इंपोर्ट किया जाएगा।';

  @override
  String get androidStepSaveToDevice =>
      'चैट को व्हाट्सबैकअप में इंपोर्ट किया जाएगा।';

  @override
  String get androidLargeImportNote =>
      'कृपया ध्यान दें कि पुराने एंड्रॉइड फोन पर बहुत बड़ी चैट फ़ाइलों को आयात करने में एक मिनट तक का समय लग सकता है।';

  @override
  String get importZipTitle => 'सहेजी गई ज़िप फ़ाइल आयात करें';

  @override
  String get iosStepImportZip =>
      'WhatsBackUp में, \"ज़िप से आयात करें\" पर टैप करें और फ़ाइलों में से फ़ाइल चुनें।';

  @override
  String get androidStepImportZip =>
      'WhatsBackUp में, \"ज़िप से आयात करें\" पर टैप करें और अपने डिवाइस से फ़ाइल चुनें।';

  @override
  String get managingChatsTitle => 'चैट का प्रबंधन';

  @override
  String get hideChatsWithCodeTitle => 'कोड का उपयोग करके चैट छिपाएँ';

  @override
  String get stepTapGhostIcon => 'ऊपरी पट्टी में भूत के आइकन पर टैप करें।';

  @override
  String get stepEnterCodeUpTo8Digits => 'एक कोड दर्ज करें (अधिकतम 8 अंक)।';

  @override
  String get stepSelectChatsSubmitHide =>
      'चैट का चयन करें, फिर उन्हें छिपाने के लिए सबमिट पर टैप करें।';

  @override
  String get stepEnterSameCodeUnhide =>
      'उन चैट्स को अनहाइड करने के लिए वही कोड दोबारा डालें।';

  @override
  String get stepDifferentCodesHideSets =>
      'अलग-अलग कोड अलग-अलग प्रकार की चैट को छिपा सकते हैं।';

  @override
  String get lockChatsWithCodeTitle => 'कोड से चैट लॉक करें';

  @override
  String get stepSwitchHideToLockMode =>
      'सेटिंग्स में जाकर, हाइड मोड से लॉक मोड पर स्विच करें।';

  @override
  String get stepTapGhostIconEnterCode =>
      'भूत के आइकन पर टैप करें और एक कोड दर्ज करें।';

  @override
  String get stepSelectChatsSubmitLock =>
      'चैट का चयन करें, फिर उन्हें लॉक करने के लिए सबमिट पर टैप करें।';

  @override
  String get stepLockedChatsRequireCode =>
      'लॉक की गई चैट में लॉक का आइकन दिखाई देता है और उसे खोलने के लिए कोड की आवश्यकता होती है।';

  @override
  String get archiveOrDeleteTitle => 'संग्रहित करें या हटाएं';

  @override
  String get stepSwipeRightArchive =>
      'आर्काइव करने या अनआर्काइव करने के लिए दाईं ओर स्वाइप करें।';

  @override
  String get stepSwipeLeftDelete =>
      'हटाने के लिए बाईं ओर स्वाइप करें (पुष्टि आवश्यक है)।';

  @override
  String get bullet => '•';

  @override
  String get welcomeTitle => 'स्वागत';

  @override
  String get gotItAction => 'समझ गया';

  @override
  String get settingsTitle => 'सेटिंग्स';

  @override
  String get sectionFont => 'फ़ॉन्ट';

  @override
  String get sectionColor => 'रंग';

  @override
  String get sectionAccessibility => 'सरल उपयोग';

  @override
  String get sectionPrivacy => 'गोपनीयता';

  @override
  String get sectionPro => 'बैकअपचैट प्रो';

  @override
  String get sectionStorage => 'भंडारण';

  @override
  String get storageTitle => 'भंडारण';

  @override
  String get storageSubtitle => 'डिवाइस स्पेस और चैट स्टोरेज देखें';

  @override
  String get storageAvailable => 'उपलब्ध भंडार';

  @override
  String get storageAppSize => 'WhatsBackUp का आकार (चैट सहित)';

  @override
  String get storageLocation => 'रखने की जगह';

  @override
  String get storageLocationUnknown => 'अज्ञात';

  @override
  String get storageCalculate => 'गणना';

  @override
  String get storageCalculating => 'गणना जारी है…';

  @override
  String get storageNotCalculated => 'गणना नहीं की गई';

  @override
  String storageLastCalculated(Object date) {
    return 'अंतिम गणना: $date';
  }

  @override
  String get storageLastCalculatedNone => 'अंतिम गणना: —';

  @override
  String get storageChatSizesToggle => 'चैट के आकार सूची में दिखाएँ';

  @override
  String get storageChatSizesSubtitle =>
      'मुख्य स्क्रीन पर प्रत्येक चैट का कुल आकार दिखाता है';

  @override
  String get storageCleanupTitle => 'असफल आयात साफ़ करें';

  @override
  String get storageCleanupSubtitle =>
      'स्थान खाली करने के लिए अधूरे या असफल आयातों को हटाता है।';

  @override
  String get storageCleanupEstimate => 'खाली करने के लिए अनुमानित स्थान';

  @override
  String get storageCleanupAction => 'अब साफ़ करें';

  @override
  String get storageCleanupNone => 'कोई असफल आयात नहीं मिला।';

  @override
  String storageCleanupDone(Object size) {
    return 'असफल आयातों से $size को साफ़ कर दिया गया।';
  }

  @override
  String storageCleanupLast(Object time) {
    return 'अंतिम सफाई: $time';
  }

  @override
  String get proActiveTitle => 'प्रो सक्रिय है';

  @override
  String get proUpgradeTitle => 'BackupChat Pro में अपग्रेड करें';

  @override
  String get proThankYouSubtitle => 'ऐप को सपोर्ट करने के लिए धन्यवाद।';

  @override
  String get proUnlockSubtitle => 'असीमित आयात को अनलॉक करें।';

  @override
  String get debugProOverrideTitle => 'डीबग: फोर्स प्रो';

  @override
  String get debugProOverrideSubtitle =>
      'परीक्षण के लिए स्थानीय ओवरराइड (खरीद की आवश्यकता नहीं)।';

  @override
  String paywallResult(Object result) {
    return 'पेवॉल परिणाम: $result.';
  }

  @override
  String get purchaseCancelled => 'खरीद रद्द कर दी गई।';

  @override
  String get restorePurchases => 'खरीदारी वापस लौटाएं';

  @override
  String get purchasesRestored => 'खरीदे गए सामान की सुविधा बहाल कर दी गई है।';

  @override
  String get restoreFailedTryAgain =>
      'पुनर्स्थापना विफल रही। पुनः प्रयास करें।';

  @override
  String get manageSubscription => 'सदस्यता प्रबंधित करें';

  @override
  String get openCustomerCenter => 'RevenueCat ग्राहक केंद्र खोलें।';

  @override
  String get customerCenterUnavailable => 'ग्राहक केंद्र अनुपलब्ध है।';

  @override
  String get sectionAbout => 'के बारे में';

  @override
  String get aboutDescription =>
      'WhatsBackUp चैट निर्यात के लिए एक निजी, ऑफ़लाइन व्यूअर है। ZIP फ़ाइलें आयात करें या मीडिया के साथ एक साफ़, खोजने योग्य संग्रह रखने के लिए सीधे WhatsApp से निर्यात करें — इसके लिए नेटवर्क की आवश्यकता नहीं है।';

  @override
  String get sectionAboutDeveloper => 'डेवलपर के बारे में';

  @override
  String get aboutDeveloperDescription =>
      'गोपनीयता, तेज़ खोज और स्वच्छ चैट संग्रह पर ध्यान केंद्रित करने वाले एक स्वतंत्र डेवलपर द्वारा निर्मित।';

  @override
  String get sectionHelp => 'मदद';

  @override
  String get showOnboardingAgain => 'ऑनबोर्डिंग दोबारा दिखाएं';

  @override
  String get sdkConfigTitle => 'एसडीके कॉन्फ़िगरेशन';

  @override
  String get publicKeyLabel => 'सार्वजनिक कुंजी';

  @override
  String get offeringIdLabel => 'आईडी की पेशकश';

  @override
  String get entitlementIdLabel => 'पात्रता आईडी';

  @override
  String get lifetimeProductIdLabel => 'लाइफटाइम उत्पाद आईडी';

  @override
  String errorLabel(Object error) {
    return 'त्रुटि: $error';
  }

  @override
  String get offeringsTitle => 'प्रसाद';

  @override
  String get currentOfferingLabel => 'वर्तमान पेशकश';

  @override
  String get allOfferingsLabel => 'सभी पेशकशें';

  @override
  String get customerInfoTitle => 'ग्राहक की जानकारी';

  @override
  String get activeEntitlementsLabel => 'सक्रिय अधिकार';

  @override
  String get originalAppUserIdLabel => 'मूल ऐप उपयोगकर्ता आईडी';

  @override
  String get managementUrlLabel => 'प्रबंधन यूआरएल';

  @override
  String get noneLabel => 'कोई नहीं';

  @override
  String get refreshAction => 'ताज़ा करना';

  @override
  String get noPackagesAvailable => 'कोई पैकेज उपलब्ध नहीं है।';

  @override
  String get packagesTitle => 'संकुल';

  @override
  String get fontSystem => 'प्रणाली';

  @override
  String get fontSerif => 'सेरिफ़';

  @override
  String get fontMono => 'मोनो';

  @override
  String get accessibilityFontSizeTitle => 'फ़ॉन्ट आकार';

  @override
  String get accessibilityFontSizeSubtitle =>
      'ऐप में टेक्स्ट का आकार अपनी आवश्यकतानुसार समायोजित करें।';

  @override
  String get accessibilityFontPreview =>
      'यह एक उदाहरण मैसेज बबल है।\nयह दिखाता है कि आपका चैट टेक्स्ट कैसा दिखेगा।\nआकार बदलने के लिए स्लाइडर को एडजस्ट करें।';

  @override
  String get accessibilityHighContrastTitle => 'उच्च कंट्रास्ट मोड';

  @override
  String get accessibilityHighContrastSubtitle =>
      'बेहतर पठनीयता के लिए कंट्रास्ट बढ़ाएँ।';

  @override
  String get colorWhatsAppGreen => 'WhatsApp हरा';

  @override
  String get colorDeepTeal => 'गहरा टील';

  @override
  String get colorNavy => 'नौसेना';

  @override
  String get colorCharcoal => 'लकड़ी का कोयला';

  @override
  String get colorBlindPaletteTitle => 'रंग अंधापन पैलेट';

  @override
  String get colorBlindPaletteSubtitle =>
      'रंग दृष्टि दोष वाले लोगों के लिए अनुकूलित रंगों के पैलेट का उपयोग करें।';

  @override
  String get hideChatsInsteadOfLocking => 'चैट को लॉक करने के बजाय छिपाएँ';

  @override
  String get hideChatsInsteadOfLockingSubtitle =>
      'बंद होने पर, चैट दिखाई देती हैं लेकिन पासकोड से सुरक्षित होती हैं।';

  @override
  String get previousMatch => 'पिछला मैच';

  @override
  String get nextMatch => 'अगला मैच';

  @override
  String get selectSenderOnRight => 'दाईं ओर मौजूद प्रेषक का चयन करें';

  @override
  String couldNotOpenArchive(Object error) {
    return 'आर्काइव खोलने में असमर्थ:\n$error';
  }

  @override
  String couldNotOpenFile(Object message) {
    return 'फ़ाइल $message नहीं खुल सकी';
  }

  @override
  String attachmentMissing(Object filename) {
    return 'संलग्न फ़ाइल गायब है: $filename';
  }

  @override
  String get unknownError => 'अज्ञात त्रुटि';

  @override
  String get openPdf => 'पीडीएफ खोलें';

  @override
  String get openFile => 'खुली फाइल';

  @override
  String get openAudio => 'ऑडियो खोलें';

  @override
  String senderMeLabel(Object sender) {
    return '$sender (मैं)';
  }

  @override
  String get chatFileNotFound => 'चैट फाइल नहीं मिली।';

  @override
  String get languageTitle => 'भाषा';

  @override
  String get languageTooltip => 'भाषा';

  @override
  String get moreOptionsTooltip => 'अधिक विकल्प';

  @override
  String get filterTitle => 'फ़िल्टर';

  @override
  String get filterDateRange => 'दिनांक सीमा';

  @override
  String get filterAnyDate => 'कोई दिन';

  @override
  String get filterIncludeMedia => 'मीडिया को शामिल करें';

  @override
  String get filterMediaOnly => 'केवल मीडिया';

  @override
  String get filterSenders => 'प्रेषक';

  @override
  String get applyFilters => 'आवेदन करना';

  @override
  String get clearFilters => 'फ़िल्टर साफ़ करें';

  @override
  String get incrementalImportTitle => 'चैट पहले से मौजूद है';

  @override
  String incrementalImportMessage(Object name) {
    return 'क्या इस आयात को \"$name\" में जोड़ा जाए?';
  }

  @override
  String get incrementalAddAction => 'जोड़ना';

  @override
  String get incrementalChooseTitle => 'अपडेट करने के लिए चैट चुनें';

  @override
  String get incrementalUpdated => 'चैट अपडेट हो गई।';

  @override
  String get languageSystem => 'प्रणाली';

  @override
  String get languageEnglish => 'अंग्रेज़ी';

  @override
  String get languageSpanish => 'स्पैनिश';

  @override
  String get languageGerman => 'जर्मन';

  @override
  String get languageFrench => 'फ्रेंच';

  @override
  String get languagePortuguese => 'पुर्तगाली';

  @override
  String get languageRomanian => 'रोमानियाई';

  @override
  String get languageAfrikaans => 'अफ्रीकी';

  @override
  String get languageRussian => 'रूसी';

  @override
  String get showImportButton => 'इंपोर्ट बटन दिखाएँ';

  @override
  String get showImportButtonSubtitle =>
      'होम स्क्रीन पर Import ZIP बटन को टॉगल करें।';

  @override
  String get importButtonHiddenMessage =>
      'इंपोर्ट बटन छिपा हुआ है। आप इसे सेटिंग्स में जाकर फिर से सक्रिय कर सकते हैं।';

  @override
  String get upgradeToAccessChat => 'इस चैट तक पहुंचने के लिए अपग्रेड करें।';

  @override
  String get aboutLegalTitle => 'हमारे बारे में और कानूनी जानकारी';

  @override
  String get aboutLegalSummary =>
      'WhatsBackUp चैट निर्यात के लिए एक ऑफ़लाइन व्यूअर है। आपकी चैट आपके डिवाइस पर ही रहती हैं।';

  @override
  String get aboutLegalRefundPolicy =>
      'रिफंड: यदि रिफंड जारी किया जाता है, तो केवल पहले 5 आयातित चैट ही एक्सेस करने योग्य रहेंगी। निःशुल्क सीमा से अधिक की चैट पुनः खरीद तक निष्क्रिय रहेंगी।';

  @override
  String get aboutLegalDisclaimers =>
      'अस्वीकरण: डेटा हानि, चैट सामग्री, अनुवाद की सटीकता या लॉक/हाइड सुविधाओं के उपयोग के लिए हम जिम्मेदार नहीं हैं। कृपया अपना बैकअप सुरक्षित रखें।';

  @override
  String get aboutLegalAffiliation =>
      'WhatsApp या मेटा से संबद्ध नहीं है। WhatsApp मेटा प्लेटफॉर्म्स, इंक. का एक ट्रेडमार्क है।';

  @override
  String get aboutLegalSupport => 'सहायता: vwdewaal@gmail.com';

  @override
  String get aboutLegalDeveloper => 'डेवलपर: वैन वाइके डे वाल';

  @override
  String get aboutLegalJurisdiction => 'अधिकार क्षेत्र: यूरोपीय संघ/ब्रिटेन';

  @override
  String aboutLegalVersion(Object version) {
    return 'ऐप संस्करण: $version';
  }

  @override
  String get versionLoading => 'ऐप संस्करण: लोड हो रहा है...';

  @override
  String get languageScottishGaelic => 'स्कॉटिश गेलिक';

  @override
  String get languageScots => 'स्कॉट्स';

  @override
  String get languageChinese => 'चीनी (मंदारिन)';

  @override
  String get languageHindi => 'हिंदी';

  @override
  String get languageArabic => 'अरबी';

  @override
  String get languageBengali => 'बंगाली';

  @override
  String get languageJapanese => 'जापानी';

  @override
  String get languagePunjabi => 'पंजाबी';

  @override
  String get languageKorean => 'कोरियाई';

  @override
  String get languageTurkish => 'तुर्की';

  @override
  String get languageItalian => 'इतालवी';

  @override
  String get languageVietnamese => 'वियतनामी';

  @override
  String get languageUrdu => 'उर्दू';

  @override
  String get languageIndonesian => 'इन्डोनेशियाई';

  @override
  String get languageThai => 'थाई';

  @override
  String get languagePolish => 'पोलिश';

  @override
  String get languageDutch => 'डच';

  @override
  String get identifyMeTitle => 'अपनी पहचान बताइए';

  @override
  String get identifyMeSubtitle =>
      'अपना नाम चुनें ताकि हम आपके संदेशों को सही ढंग से लेबल कर सकें।';

  @override
  String get identifyMeNotNow => 'अभी नहीं';
}
