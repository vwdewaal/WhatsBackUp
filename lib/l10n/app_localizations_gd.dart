// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Scottish Gaelic Gaelic (`gd`).
class AppLocalizationsGd extends AppLocalizations {
  AppLocalizationsGd([String locale = 'gd']) : super(locale);

  @override
  String get appTitle => 'Cùl-taic Dè';

  @override
  String get importZip => 'Ion-phortaich ZIP';

  @override
  String get importAction => 'Ion-phortaich';

  @override
  String get importingLabel => 'A’ toirt a-steach';

  @override
  String get importDoneLabel => 'DÈANTA!';

  @override
  String get importLargeStarted => 'Thòisich an t-in-mhalairt';

  @override
  String get importTriggeredMessage =>
      'Thèid an t-in-mhalairt a chur an gnìomh sa chùlaibh, fosglaidh an còmhradh nuair a bhios e deiseil. Cùm an aplacaid fosgailte.';

  @override
  String get mediaImportingTitle => 'A’ toirt a-steach meadhanan';

  @override
  String get mediaImportingSubtitle =>
      'Faodaidh tu an còmhradh a leughadh fhad ’s a bhios na meadhanan a’ crìochnachadh.';

  @override
  String get mediaImportPausedTitle =>
      'Chaidh stad a chur air in-mhalairt nam meadhanan';

  @override
  String get mediaImportPausedSubtitle =>
      'Ath-thagh an ZIP tùsail gus ath-thòiseachadh.';

  @override
  String get mediaImportFailedTitle => 'Dh’fhàillig in-mhalairt nam meadhanan';

  @override
  String get mediaImportFailedSubtitle => 'Tap gus feuchainn a-rithist.';

  @override
  String get mediaImportResumeAction => 'Ath-thòiseachadh';

  @override
  String get mediaImportingLabel => 'Ion-phortadh nam meadhanan';

  @override
  String get contactLoadingLabel => 'A’ luchdadh conaltraidh…';

  @override
  String get contactUnknownName => 'Cuir fios';

  @override
  String get contactPhoneLabel => 'Fòn';

  @override
  String get contactEmailLabel => 'Post-d';

  @override
  String get openContactAction => 'Fosgail conaltradh';

  @override
  String contactOpenFailed(Object error) {
    return 'Cha b’ urrainnear an conaltradh fhosgladh: $error';
  }

  @override
  String get howToImport => 'Mar a nì thu in-mhalairt';

  @override
  String get settings => 'Roghainnean';

  @override
  String get searchTitle => 'Lorg';

  @override
  String get textToInclude => 'Teacsa ri ghabhail a-steach:';

  @override
  String get enterSearchText => 'Cuir a-steach teacsa rannsachaidh...';

  @override
  String get dateRange => 'Raon ceann-latha:';

  @override
  String get fromLabel => 'Bho:';

  @override
  String get toLabel => 'Gu:';

  @override
  String get selectLabel => 'Tagh';

  @override
  String get showOnlyMediaFiles => 'Seall faidhlichean meadhanan a-mhàin';

  @override
  String get clearAction => 'Glan';

  @override
  String get searchAction => 'Lorg';

  @override
  String get renameChatTitle => 'Ath-ainmich an còmhradh';

  @override
  String get chatNameHint => 'Ainm cabadaich';

  @override
  String get cancelAction => 'Sguir dheth';

  @override
  String get saveAction => 'Sàbhail';

  @override
  String get hideChatsTooltip => 'Falaich còmhraidhean';

  @override
  String get hideAction => 'Falaich';

  @override
  String get lockAction => 'Glas';

  @override
  String get noChatsYetHint =>
      'Gun chòmhraidhean fhathast.\nCleachd \"Import ZIP\" gus às-mhalairt WhatsApp a luchdachadh,\nno às-mhalairt gu dìreach bho WhatsApp a’ cleachdadh roghainn Às-mhalairt Còmhraidh a’ chòmhraidh.';

  @override
  String get noArchivedChats => 'Gun chòmhraidhean clàraichte.';

  @override
  String get tabChats => 'Còmhraidhean';

  @override
  String get tabArchived => 'Air a chur ann an tasglann';

  @override
  String get searchChatsHint => 'Lorg cabadaich';

  @override
  String get enterCodeTitle => 'Cuir a-steach còd';

  @override
  String get upTo8DigitsHint => 'Suas ri 8 figearan';

  @override
  String get continueAction => 'Lean air adhart';

  @override
  String get updatingHiddenChats => 'Ag ùrachadh còmhraidhean falaichte...';

  @override
  String get chatsUnhidden => 'Còmhraidhean air an nochdadh.';

  @override
  String get selectAtLeastOneChat => 'Tagh co-dhiù aon còmhradh.';

  @override
  String get hidingChats => 'A’ falach còmhraidhean...';

  @override
  String get lockingChats => 'A’ glasadh còmhraidhean…';

  @override
  String get chatsHidden => 'Còmhraidhean falaichte.';

  @override
  String get chatsUnlocked => 'Còmhraidhean air an fosgladh.';

  @override
  String get chatsLocked => 'Còmhraidhean glaiste.';

  @override
  String get unlockChatTitle => 'Fosgail cabadaich';

  @override
  String get enterPasscodeHint => 'Cuir a-steach facal-faire';

  @override
  String get unlockAction => 'Fuasgail';

  @override
  String get incorrectCode => 'Còd ceàrr.';

  @override
  String importedOn(Object date) {
    return 'Air a thoirt a-steach $date';
  }

  @override
  String get unarchiveAction => 'Dì-thasglannaich';

  @override
  String get archiveAction => 'Tasglann';

  @override
  String get deleteAction => 'Sguab às';

  @override
  String get deleteChatTitle => 'A bheil thu airson còmhradh a sguabadh às?';

  @override
  String get deleteChatConfirm =>
      'Sguabaidh seo às na faidhlichean tasglainn agus nam meadhanan gu buan.';

  @override
  String get archiveFolderMissing => 'Bha am pasgan tasglainn a dhìth.';

  @override
  String updateFailedWithDetail(Object error) {
    return 'Dh’fhàillig an ùrachadh: $error';
  }

  @override
  String get renameAction => 'Ath-ainmich';

  @override
  String get working => 'Ag obair...';

  @override
  String get importPreparing => 'A’ cur air dòigh in-mhalairt...';

  @override
  String get importAnalyzing => 'A’ dèanamh anailis air faidhle…';

  @override
  String get bookmarksLabel => 'Comharran-leabhair';

  @override
  String get previousBookmark => 'Comharra-leabhair roimhe';

  @override
  String get nextBookmark => 'An ath chomharra-leabhair';

  @override
  String get importLargeFileNotice =>
      'Chaidh faidhle mòr a lorg. Dh’ fhaodadh seo beagan mhionaidean a thoirt.';

  @override
  String get importExtracting => 'A’ tarraing a-mach faidhlichean…';

  @override
  String get importFinalizing => 'A’ crìochnachadh…';

  @override
  String importFailedWithDetail(Object error) {
    return 'Dh’fhàillig an in-mhalairt: $error';
  }

  @override
  String get sharedFileNotZip => 'Chan e ZIP a th\' ann am faidhle co-roinnte.';

  @override
  String get unlockProToImportMoreChats =>
      'Fosgail BackupChat Pro gus barrachd chòmhraidhean a thoirt a-steach.';

  @override
  String get purchaseFailedTryAgain =>
      'Dh’fhàillig an ceannach. Feuch ris a-rithist.';

  @override
  String get importErrorOnlyZip =>
      'Chan eil taic ri fhaighinn ach do fhaidhlichean .zip.';

  @override
  String get importErrorNoChatText =>
      'Cha deach faidhle teacsa cabadaich WhatsApp a lorg anns an ZIP.';

  @override
  String get importErrorAlreadyImported =>
      'Tha an còmhradh seo air a thoirt a-steach mu thràth.';

  @override
  String get howToImportTitle => 'Mar a nì thu a-steach';

  @override
  String get chooseImportMethodTitle => 'Tagh an dòigh in-mhalairt agad';

  @override
  String get iosExportTitle => 'Às-phortaich bho WhatsApp (iOS)';

  @override
  String get androidExportTitle => 'Às-phortaich bho WhatsApp (Android)';

  @override
  String get iosStepOpenChat =>
      'Taobh a-staigh an aplacaid WhatsApp, cliog a-steach don chòmhradh.';

  @override
  String get androidStepOpenChat =>
      'Taobh a-staigh an aplacaid WhatsApp, cliog a-steach do chòmhradh.';

  @override
  String get iosStepOpenInfo =>
      'Briog air ainm an neach no na buidhne aig a’ mhullach.';

  @override
  String get androidStepOpenMenu => 'Briog air a’ chlàr-taice.';

  @override
  String get iosStepExportChat =>
      'Scrollaich sìos chun bhonn agus tagh Às-phortaich cabadaich.';

  @override
  String get androidStepMoreExport => 'Tagh “Tuilleadh”.';

  @override
  String get iosStepChooseMedia =>
      'Bho chlàr-taice taghaidh an aplacaid (duilleag roinneadh) tagh WhatsBackUp (air fònaichean nas sine, sàbhail gu faidhlichean).';

  @override
  String get androidStepChooseMedia => 'Tagh às-phortaich cabadaich.';

  @override
  String get iosStepShareToApp =>
      'Thèid an còmhradh a thoirt a-steach do WhatsBackUp.';

  @override
  String get androidStepShareToApp =>
      'Bho chlàr-taice taghaidh an aplacaid (duilleag roinneadh) tagh WhatsBackUp (air fònaichean nas sine, sàbhail gu faidhlichean).';

  @override
  String get iosStepSaveToFiles =>
      'Thèid an còmhradh a thoirt a-steach do WhatsBackUp.';

  @override
  String get androidStepSaveToDevice =>
      'Thèid an còmhradh a thoirt a-steach do WhatsBackUp.';

  @override
  String get androidLargeImportNote =>
      'Thoir an aire gun toir e suas ri mionaid airson tòiseachadh air còmhraidhean mòra a thoirt a-steach air fònaichean Android nas sine.';

  @override
  String get importZipTitle =>
      'Cuir a-steach faidhle ZIP a chaidh a shàbhaladh';

  @override
  String get iosStepImportZip =>
      'Ann an WhatsBackUp, tap air “Import from ZIP” agus tagh am faidhle bho Files.';

  @override
  String get androidStepImportZip =>
      'Ann an WhatsBackUp, tap air “Import from ZIP” agus tagh am faidhle bhon inneal agad.';

  @override
  String get managingChatsTitle => 'A’ riaghladh cabadaich';

  @override
  String get hideChatsWithCodeTitle => 'Falaich còmhraidhean le còd';

  @override
  String get stepTapGhostIcon =>
      'Tap air ìomhaigh an taibhse anns a’ bhàr as àirde.';

  @override
  String get stepEnterCodeUpTo8Digits =>
      'Cuir a-steach còd (suas ri 8 àireamhan).';

  @override
  String get stepSelectChatsSubmitHide =>
      'Tagh còmhraidhean, agus an uairsin tap air Cuir a-steach gus an cur am falach.';

  @override
  String get stepEnterSameCodeUnhide =>
      'Cuir a-steach an aon chòd a-rithist gus na còmhraidhean sin fhoillseachadh.';

  @override
  String get stepDifferentCodesHideSets =>
      'Faodaidh diofar chòdan diofar sheataichean de chòmhraidhean fhalach.';

  @override
  String get lockChatsWithCodeTitle => 'Glasaich còmhraidhean le còd';

  @override
  String get stepSwitchHideToLockMode =>
      'Anns na Roghainnean, gluais bho mhodh Falaich gu modh Glasaidh.';

  @override
  String get stepTapGhostIconEnterCode =>
      'Tap air ìomhaigh an taibhse agus cuir a-steach còd.';

  @override
  String get stepSelectChatsSubmitLock =>
      'Tagh còmhraidhean, agus an uairsin tap air Cuir a-steach gus an glasadh.';

  @override
  String get stepLockedChatsRequireCode =>
      'Chithear ìomhaigh glasaidh air còmhraidhean glaiste agus feumaidh iad a’ chòd gus an fosgladh.';

  @override
  String get archiveOrDeleteTitle => 'Tasglann no cuir às';

  @override
  String get stepSwipeRightArchive =>
      'Sguab deas gus tasglann a chur no dì-thasglannachadh.';

  @override
  String get stepSwipeLeftDelete =>
      'Sguab gu clì gus a sguabadh às (feumar dearbhadh).';

  @override
  String get bullet => '•';

  @override
  String get welcomeTitle => 'Fàilte';

  @override
  String get gotItAction => 'Fhuair mi e';

  @override
  String get settingsTitle => 'Roghainnean';

  @override
  String get sectionFont => 'Cruth-clò';

  @override
  String get sectionColor => 'Dath';

  @override
  String get sectionAccessibility => 'Ruigsinneachd';

  @override
  String get sectionPrivacy => 'Prìobhaideachd';

  @override
  String get sectionPro => 'Cùl-taicChat Pro';

  @override
  String get sectionStorage => 'Stòradh';

  @override
  String get storageTitle => 'Stòradh';

  @override
  String get storageSubtitle =>
      'Seall àite air an inneal agus stòradh cabadaich';

  @override
  String get storageAvailable => 'Stòradh ri fhaighinn';

  @override
  String get storageAppSize =>
      'Meud WhatsBackUp (a’ gabhail a-steach cabadaich)';

  @override
  String get storageLocation => 'Àite stòraidh';

  @override
  String get storageLocationUnknown => 'Neo-aithnichte';

  @override
  String get storageCalculate => 'Obraich a-mach';

  @override
  String get storageCalculating => 'A’ tomhas…';

  @override
  String get storageNotCalculated => 'Cha deach a thomhas';

  @override
  String storageLastCalculated(Object date) {
    return 'An àireamhachadh mu dheireadh: $date';
  }

  @override
  String get storageLastCalculatedNone => 'An àireamhachadh mu dheireadh: —';

  @override
  String get storageChatSizesToggle => 'Seall meudan cabadaich san liosta';

  @override
  String get storageChatSizesSubtitle =>
      'A’ sealltainn meud iomlan gach còmhraidh air a’ phrìomh sgrion';

  @override
  String get storageCleanupTitle => 'Glan in-mhalairt a dh’fhàillig';

  @override
  String get storageCleanupSubtitle =>
      'A’ toirt air falbh in-mhalairt neo-choileanta no fàilligichte gu àite saor.';

  @override
  String get storageCleanupEstimate => 'Àite measta ri shaoradh';

  @override
  String get storageCleanupAction => 'Glan a-nis';

  @override
  String get storageCleanupNone =>
      'Cha deach in-mhalairt a dh’fhàillig a lorg.';

  @override
  String storageCleanupDone(Object size) {
    return 'Glanadh $size de dh’in-mhalairt a dh’fhàillig.';
  }

  @override
  String storageCleanupLast(Object time) {
    return 'Glanadh mu dheireadh: $time';
  }

  @override
  String get proActiveTitle => 'Tha Pro gnìomhach';

  @override
  String get proUpgradeTitle => 'Ùraich gu BackupChat Pro';

  @override
  String get proThankYouSubtitle =>
      'Tapadh leibh airson taic a thoirt don aplacaid.';

  @override
  String get proUnlockSubtitle => 'Fuasgail in-mhalairt gun chrìoch.';

  @override
  String get debugProOverrideTitle => 'Dì-bhugachadh: Force Pro';

  @override
  String get debugProOverrideSubtitle =>
      'Sgaradh ionadail airson deuchainnean (chan eil feum air ceannach).';

  @override
  String paywallResult(Object result) {
    return 'Toradh balla-pàighidh: $result.';
  }

  @override
  String get purchaseCancelled => 'Ceannach air a chur dheth.';

  @override
  String get restorePurchases => 'Ath-nuadhachadh ceannachdan';

  @override
  String get purchasesRestored => 'Ceannachdan air an ath-nuadhachadh.';

  @override
  String get restoreFailedTryAgain =>
      'Dh’fhàillig an ath-nuadhachadh. Feuch ris a-rithist.';

  @override
  String get manageSubscription => 'Stiùirich ballrachd';

  @override
  String get openCustomerCenter => 'Fosgail Ionad Luchd-ceannach RevenueCat.';

  @override
  String get customerCenterUnavailable =>
      'Chan eil Ionad Luchd-ceannach ri fhaighinn.';

  @override
  String get sectionAbout => 'Mu dheidhinn';

  @override
  String get aboutDescription =>
      '’S e sealladair prìobhaideach, far-loidhne a th’ ann an WhatsBackUp airson às-mhalairt cabadaich WhatsApp. Thoir a-steach faidhlichean ZIP no às-mhalairt gu dìreach bho WhatsApp gus tasglann glan, rannsachail a chumail le meadhanan — chan eil feum air lìonra.';

  @override
  String get sectionAboutDeveloper => 'Mu dheidhinn an leasaiche';

  @override
  String get aboutDeveloperDescription =>
      'Air a thogail le leasaiche neo-eisimeileach le fòcas air prìobhaideachd, rannsachadh luath, agus tasglannan cabadaich glan.';

  @override
  String get sectionHelp => 'Cobhair';

  @override
  String get showOnboardingAgain => 'Seall clàradh a-rithist';

  @override
  String get sdkConfigTitle => 'Rèiteachadh SDK';

  @override
  String get publicKeyLabel => 'Iuchair phoblach';

  @override
  String get offeringIdLabel => 'ID tairgse';

  @override
  String get entitlementIdLabel => 'ID teididh';

  @override
  String get lifetimeProductIdLabel => 'ID toraidh fad-beatha';

  @override
  String errorLabel(Object error) {
    return 'Mearachd: $error';
  }

  @override
  String get offeringsTitle => 'Tairgsean';

  @override
  String get currentOfferingLabel => 'Tairgse làithreach';

  @override
  String get allOfferingsLabel => 'A h-uile tairgse';

  @override
  String get customerInfoTitle => 'Fiosrachadh luchd-ceannach';

  @override
  String get activeEntitlementsLabel => 'Teisteanasan gnìomhach';

  @override
  String get originalAppUserIdLabel => 'ID cleachdaiche tùsail an aplacaid';

  @override
  String get managementUrlLabel => 'URL Riaghlaidh';

  @override
  String get noneLabel => 'chan eil gin ann';

  @override
  String get refreshAction => 'Ùraich';

  @override
  String get noPackagesAvailable => 'Chan eil pacaidean rim faighinn.';

  @override
  String get packagesTitle => 'Pacaidean';

  @override
  String get fontSystem => 'Siostam';

  @override
  String get fontSerif => 'Serif';

  @override
  String get fontMono => 'Mono';

  @override
  String get accessibilityFontSizeTitle => 'Meud cruth-clò';

  @override
  String get accessibilityFontSizeSubtitle =>
      'Atharraich meud an teacsa air feadh an aplacaid.';

  @override
  String get accessibilityFontPreview =>
      'Seo eisimpleir de builgean teachdaireachd. Tha e a’ sealltainn mar a bhios teacsa do chòmhraidh a’ coimhead. Atharraich an sleamhnachan gus an meud atharrachadh.';

  @override
  String get accessibilityHighContrastTitle => 'Modh àrd-eadar-dhealachaidh';

  @override
  String get accessibilityHighContrastSubtitle =>
      'Meudaich an coimeas airson so-leughaidh nas fheàrr.';

  @override
  String get colorWhatsAppGreen => 'WhatsApp Uaine';

  @override
  String get colorDeepTeal => 'Gorm-uaine domhainn';

  @override
  String get colorNavy => 'Cabhlach';

  @override
  String get colorCharcoal => 'Gual-fhiodha';

  @override
  String get colorBlindPaletteTitle => 'Paileid dall-dhath';

  @override
  String get colorBlindPaletteSubtitle =>
      'Cleachd paileid a tha air a bharrrachadh airson easbhaidhean lèirsinn dath.';

  @override
  String get hideChatsInsteadOfLocking =>
      'Falaich còmhraidhean an àite an glasadh';

  @override
  String get hideChatsInsteadOfLockingSubtitle =>
      'Nuair a bhios iad dheth, bidh cabadaich rim faicinn ach fo dhìon facal-faire.';

  @override
  String get previousMatch => 'Geama roimhe';

  @override
  String get nextMatch => 'An ath gheama';

  @override
  String get selectSenderOnRight =>
      'Tagh dè an neach-cuiridh a tha air an làimh dheis';

  @override
  String couldNotOpenArchive(Object error) {
    return 'Cha b’ urrainnear an tasglann fhosgladh:\n$error';
  }

  @override
  String couldNotOpenFile(Object message) {
    return 'Cha b’ urrainn dhomh am faidhle fhosgladh: $message';
  }

  @override
  String attachmentMissing(Object filename) {
    return 'Ceanglachan a dhìth: $filename';
  }

  @override
  String get unknownError => 'Mearachd neo-aithnichte';

  @override
  String get openPdf => 'Fosgail PDF';

  @override
  String get openFile => 'Fosgail faidhle';

  @override
  String get openAudio => 'Fosgail claisneachd';

  @override
  String senderMeLabel(Object sender) {
    return '$sender (Mise)';
  }

  @override
  String get chatFileNotFound => 'Cha deach faidhle cabadaich a lorg.';

  @override
  String get languageTitle => 'Cànan';

  @override
  String get languageTooltip => 'Cànan';

  @override
  String get moreOptionsTooltip => 'Barrachd roghainnean';

  @override
  String get filterTitle => 'Criathrag';

  @override
  String get filterDateRange => 'Raon ceann-latha';

  @override
  String get filterAnyDate => 'Ceann-latha sam bith';

  @override
  String get filterIncludeMedia => 'Cuir a-steach meadhanan';

  @override
  String get filterMediaOnly => 'Meadhanan a-mhàin';

  @override
  String get filterSenders => 'Luchd-cuiridh';

  @override
  String get applyFilters => 'Cuir a-steach';

  @override
  String get clearFilters => 'Glan na criathragan';

  @override
  String get incrementalImportTitle => 'Tha còmhradh ann mu thràth';

  @override
  String incrementalImportMessage(Object name) {
    return 'A bheil thu airson an in-mhalairt seo a chur ri \"$name\"?';
  }

  @override
  String get incrementalAddAction => 'Cuir ris';

  @override
  String get incrementalChooseTitle => 'Tagh cabadaich airson ùrachadh';

  @override
  String get incrementalUpdated => 'Chaidh an còmhradh ùrachadh.';

  @override
  String get languageSystem => 'Siostam';

  @override
  String get languageEnglish => 'Sasannach';

  @override
  String get languageSpanish => 'Spàinneach';

  @override
  String get languageGerman => 'Gearmailteach';

  @override
  String get languageFrench => 'Frangach';

  @override
  String get languagePortuguese => 'Portugalach';

  @override
  String get languageRomanian => 'Romànianach';

  @override
  String get languageAfrikaans => 'Afrikaanach';

  @override
  String get languageRussian => 'Ruiseanach';

  @override
  String get showImportButton => 'Seall am putan Import';

  @override
  String get showImportButtonSubtitle =>
      'Tionndaidh am putan Import ZIP air an sgrìn dachaigh.';

  @override
  String get importButtonHiddenMessage =>
      'Putan in-mhalairt falaichte. Faodaidh tu ath-chomasachadh anns na Roghainnean.';

  @override
  String get upgradeToAccessChat =>
      'Ùraich gus faighinn chun a’ chòmhraidh seo.';

  @override
  String get aboutLegalTitle => 'Mu dheidhinn & Laghail';

  @override
  String get aboutLegalSummary =>
      '’S e sealladair far-loidhne a th’ ann an WhatsBackUp airson às-mhalairt cabadaich WhatsApp. Bidh na cabadaich agad a’ fuireach air an inneal agad.';

  @override
  String get aboutLegalRefundPolicy =>
      'Ais-dhìoladh: Ma thèid ais-dhìoladh a thoirt seachad, chan fhaighear ach cothrom air a’ chiad 5 cabadaich a chaidh a thoirt a-steach. Tha cabadaich os cionn na crìche an-asgaidh air an ciorramachadh gus an tèid an ath-cheannach.';

  @override
  String get aboutLegalDisclaimers =>
      'Àicheadhan: Chan eil sinn cunntachail airson call dàta, susbaint cabadaich, cruinneas eadar-theangachaidh, no cleachdadh fheartan glasaidh/falaich. Feuch an gleidh sibh na lethbhric-glèidhidh agaibh fhèin.';

  @override
  String get aboutLegalAffiliation =>
      'Gun cheangal ri WhatsApp no Meta. \'S e comharra-malairt aig Meta Platforms, Inc. a th\' ann an WhatsApp.';

  @override
  String get aboutLegalSupport => 'Taic: vwdewaal@gmail.com';

  @override
  String get aboutLegalDeveloper => 'Leasaiche: Van Wyk De Waal';

  @override
  String get aboutLegalJurisdiction => 'Uachdranas: AE/RA';

  @override
  String aboutLegalVersion(Object version) {
    return 'Tionndadh an aplacaid: $version';
  }

  @override
  String get versionLoading => 'Tionndadh an aplacaid: a’ luchdadh...';

  @override
  String get languageScottishGaelic => 'Gàidhlig na h-Alba';

  @override
  String get languageScots => 'Albannaich';

  @override
  String get languageChinese => 'Sìonais (Mandairinis)';

  @override
  String get languageHindi => 'Indeach';

  @override
  String get languageArabic => 'Arabach';

  @override
  String get languageBengali => 'Bengàlach';

  @override
  String get languageJapanese => 'Iapanach';

  @override
  String get languagePunjabi => 'Punjabi';

  @override
  String get languageKorean => 'Corèanach';

  @override
  String get languageTurkish => 'Turcach';

  @override
  String get languageItalian => 'Eadailteach';

  @override
  String get languageVietnamese => 'Bhiet-Namach';

  @override
  String get languageUrdu => 'Urdu';

  @override
  String get languageIndonesian => 'And-Innseach';

  @override
  String get languageThai => 'Thaidheach';

  @override
  String get languagePolish => 'Pòlainneach';

  @override
  String get languageDutch => 'Duitseach';

  @override
  String get identifyMeTitle => 'Comharraich thu fhèin';

  @override
  String get identifyMeSubtitle =>
      'Tagh d’ ainm gus an urrainn dhuinn na teachdaireachdan agad a chomharrachadh gu ceart.';

  @override
  String get identifyMeNotNow => 'Chan ann an-dràsta';
}
