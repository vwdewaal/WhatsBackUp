// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Afrikaans (`af`).
class AppLocalizationsAf extends AppLocalizations {
  AppLocalizationsAf([String locale = 'af']) : super(locale);

  @override
  String get appTitle => 'Wat\'sRugsteun';

  @override
  String get importZip => 'Voer ZIP in';

  @override
  String get importAction => 'Invoer';

  @override
  String get importingLabel => 'Invoer';

  @override
  String get importDoneLabel => 'GEDAAN!';

  @override
  String get importLargeStarted => 'Invoer het begin';

  @override
  String get importTriggeredMessage =>
      'Invoer is in die agtergrond geaktiveer, die klets sal oopmaak wanneer dit voltooi is. Hou asseblief die toepassing oop.';

  @override
  String get mediaImportingTitle => 'Media invoer';

  @override
  String get mediaImportingSubtitle =>
      'Jy kan die klets lees terwyl die media klaar is.';

  @override
  String get mediaImportPausedTitle => 'Media-invoer onderbreek';

  @override
  String get mediaImportPausedSubtitle =>
      'Kies die oorspronklike poskode weer om te hervat.';

  @override
  String get mediaImportFailedTitle => 'Media-invoer het misluk';

  @override
  String get mediaImportFailedSubtitle => 'Tik om weer te probeer.';

  @override
  String get mediaImportResumeAction => 'CV';

  @override
  String get mediaImportingLabel => 'Media-invoer';

  @override
  String get contactLoadingLabel => 'Laai kontak…';

  @override
  String get contactUnknownName => 'Kontak';

  @override
  String get contactPhoneLabel => 'Foon';

  @override
  String get contactEmailLabel => 'E-pos';

  @override
  String get openContactAction => 'Maak kontak oop';

  @override
  String contactOpenFailed(Object error) {
    return 'Kon nie kontak oopmaak nie: $error';
  }

  @override
  String get howToImport => 'Hoe om in te voer';

  @override
  String get settings => 'Instellings';

  @override
  String get searchTitle => 'Soek';

  @override
  String get textToInclude => 'Teks om in te sluit:';

  @override
  String get enterSearchText => 'Voer soekteks in...';

  @override
  String get dateRange => 'Datumreeks:';

  @override
  String get fromLabel => 'Vanaf:';

  @override
  String get toLabel => 'Tot:';

  @override
  String get selectLabel => 'Kies';

  @override
  String get showOnlyMediaFiles => 'Wys slegs media-lêers';

  @override
  String get clearAction => 'Maak skoon';

  @override
  String get searchAction => 'Soek';

  @override
  String get renameChatTitle => 'Hernoem klets';

  @override
  String get chatNameHint => 'Kletsnaam';

  @override
  String get cancelAction => 'Kanselleer';

  @override
  String get saveAction => 'Stoor';

  @override
  String get hideChatsTooltip => 'Versteek kletse';

  @override
  String get hideAction => 'Versteek';

  @override
  String get lockAction => 'Sluit';

  @override
  String get noChatsYetHint =>
      'Nog geen kletse nie.\nGebruik \"Voer ZIP in\" om \'n WhatsApp-uitvoer te laai,\nof voer direk uit WhatsApp met die Export Chat-opsie uit.';

  @override
  String get noArchivedChats => 'Geen geargiveerde kletse nie.';

  @override
  String get tabChats => 'Kletse';

  @override
  String get tabArchived => 'Gearchiveer';

  @override
  String get searchChatsHint => 'Soek kletse';

  @override
  String get enterCodeTitle => 'Voer kode in';

  @override
  String get upTo8DigitsHint => 'Tot 8 syfers';

  @override
  String get continueAction => 'Gaan voort';

  @override
  String get updatingHiddenChats => 'Werk versteekte kletse by...';

  @override
  String get chatsUnhidden => 'Kletse gewys.';

  @override
  String get selectAtLeastOneChat => 'Kies ten minste een klets.';

  @override
  String get hidingChats => 'Versteek kletse...';

  @override
  String get lockingChats => 'Sluit kletse...';

  @override
  String get chatsHidden => 'Kletse versteek.';

  @override
  String get chatsUnlocked => 'Kletse ontsluit.';

  @override
  String get chatsLocked => 'Kletse gesluit.';

  @override
  String get unlockChatTitle => 'Ontsluit klets';

  @override
  String get enterPasscodeHint => 'Voer kode in';

  @override
  String get unlockAction => 'Ontsluit';

  @override
  String get incorrectCode => 'Verkeerde kode.';

  @override
  String importedOn(Object date) {
    return 'Ingevoer $date';
  }

  @override
  String get unarchiveAction => 'Onargiveer';

  @override
  String get archiveAction => 'Argiveer';

  @override
  String get deleteAction => 'Verwyder';

  @override
  String get deleteChatTitle => 'Verwyder klets?';

  @override
  String get deleteChatConfirm => 'Dit verwyder die argief en media permanent.';

  @override
  String get archiveFolderMissing => 'Argiefvouer ontbreek.';

  @override
  String updateFailedWithDetail(Object error) {
    return 'Opdatering misluk: $error';
  }

  @override
  String get renameAction => 'Hernoem';

  @override
  String get working => 'Werk...';

  @override
  String get importPreparing => 'Berei invoer voor...';

  @override
  String get importAnalyzing => 'Lêer word ontleed...';

  @override
  String get bookmarksLabel => 'Boekmerke';

  @override
  String get previousBookmark => 'Vorige boekmerk';

  @override
  String get nextBookmark => 'Volgende boekmerk';

  @override
  String get importLargeFileNotice =>
      'Groot lêer bespeur. Dit kan \'n paar minute neem.';

  @override
  String get importExtracting => 'Pak lêers uit...';

  @override
  String get importFinalizing => 'Finaliseer...';

  @override
  String importFailedWithDetail(Object error) {
    return 'Invoer het misluk: $error';
  }

  @override
  String get sharedFileNotZip => 'Gedeelde lêer is nie \'n ZIP nie.';

  @override
  String get unlockProToImportMoreChats =>
      'Ontsluit BackupChat Pro om meer kletse in te voer.';

  @override
  String get purchaseFailedTryAgain => 'Aankoop het misluk. Probeer weer.';

  @override
  String get importErrorOnlyZip => 'Slegs .zip-lêers word ondersteun.';

  @override
  String get importErrorNoChatText =>
      'Geen WhatsApp-klets-tekslêer in die ZIP gevind nie.';

  @override
  String get importErrorAlreadyImported => 'Hierdie klets is reeds ingevoer.';

  @override
  String get howToImportTitle => 'Hoe om in te voer';

  @override
  String get chooseImportMethodTitle => 'Kies jou invoermetode';

  @override
  String get iosExportTitle => 'Uitvoer vanaf WhatsApp (iOS)';

  @override
  String get androidExportTitle => 'Uitvoer vanaf WhatsApp (Android)';

  @override
  String get iosStepOpenChat => 'Klik binne die WhatsApp-app op die klets.';

  @override
  String get androidStepOpenChat => 'Klik binne die WhatsApp-app op \'n klets.';

  @override
  String get iosStepOpenInfo => 'Klik bo-aan op die persoon of groep se naam.';

  @override
  String get androidStepOpenMenu => 'Klik op die kieslys.';

  @override
  String get iosStepExportChat => 'Blaai af na onder en kies Uitvoer klets.';

  @override
  String get androidStepMoreExport => 'Kies “Meer”.';

  @override
  String get iosStepChooseMedia =>
      'Kies WhatsBackUp (op ouer fone, stoor na lêers) vanaf die toepassingskeuse-kieslys (deelblad).';

  @override
  String get androidStepChooseMedia => 'Kies Voer klets uit.';

  @override
  String get iosStepShareToApp => 'Die klets sal in WhatsBackUp ingevoer word.';

  @override
  String get androidStepShareToApp =>
      'Kies WhatsBackUp (op ouer fone, stoor na lêers) vanaf die toepassingskeuse-kieslys (deelblad).';

  @override
  String get iosStepSaveToFiles =>
      'Die klets sal in WhatsBackUp ingevoer word.';

  @override
  String get androidStepSaveToDevice =>
      'Die klets sal in WhatsBackUp ingevoer word.';

  @override
  String get androidLargeImportNote =>
      'Let asseblief daarop dat die invoer van baie groot geselsies op ouer Android-fone tot \'n minuut sal neem om te begin.';

  @override
  String get importZipTitle => 'Voer \'n gestoorde ZIP in';

  @override
  String get iosStepImportZip =>
      'In WhatsBackUp, tik op \"Voer uit ZIP in\" en kies die lêer uit Lêers.';

  @override
  String get androidStepImportZip =>
      'Tik in WhatsBackUp op \"Voer uit ZIP in\" en kies die lêer vanaf jou toestel.';

  @override
  String get managingChatsTitle => 'Bestuur kletse';

  @override
  String get hideChatsWithCodeTitle => 'Versteek kletse met \'n kode';

  @override
  String get stepTapGhostIcon => 'Tik die spook-ikoon bo.';

  @override
  String get stepEnterCodeUpTo8Digits => 'Voer \'n kode in (tot 8 syfers).';

  @override
  String get stepSelectChatsSubmitHide =>
      'Kies kletse en tik Submit om te versteek.';

  @override
  String get stepEnterSameCodeUnhide =>
      'Voer dieselfde kode weer in om te wys.';

  @override
  String get stepDifferentCodesHideSets =>
      'Verskillende kodes kan verskillende groepe versteek.';

  @override
  String get lockChatsWithCodeTitle => 'Sluit kletse met \'n kode';

  @override
  String get stepSwitchHideToLockMode =>
      'In Instellings, skakel van Versteek na Sluit.';

  @override
  String get stepTapGhostIconEnterCode =>
      'Tik die spook-ikoon en voer \'n kode in.';

  @override
  String get stepSelectChatsSubmitLock =>
      'Kies kletse en tik Submit om te sluit.';

  @override
  String get stepLockedChatsRequireCode =>
      'Geslote kletse wys \'n slot en vereis die kode.';

  @override
  String get archiveOrDeleteTitle => 'Argiveer of verwyder';

  @override
  String get stepSwipeRightArchive =>
      'Swiep regs om te argiveer of te onargiveer.';

  @override
  String get stepSwipeLeftDelete =>
      'Swiep links om te verwyder (bevestiging benodig).';

  @override
  String get bullet => '•';

  @override
  String get welcomeTitle => 'Welkom';

  @override
  String get gotItAction => 'Reg so';

  @override
  String get settingsTitle => 'Instellings';

  @override
  String get sectionFont => 'Lettertipe';

  @override
  String get sectionColor => 'Kleur';

  @override
  String get sectionAccessibility => '';

  @override
  String get sectionPrivacy => 'Privaatheid';

  @override
  String get sectionPro => 'RugsteunChat Pro';

  @override
  String get sectionStorage => 'Berging';

  @override
  String get storageTitle => 'Berging';

  @override
  String get storageSubtitle => 'Bekyk toestelspasie en kletsberging';

  @override
  String get storageAvailable => 'Beskikbare berging';

  @override
  String get storageAppSize => 'WhatsApp-grootte (insluitend geselsies)';

  @override
  String get storageLocation => 'Bergplek';

  @override
  String get storageLocationUnknown => 'Onbekend';

  @override
  String get storageCalculate => 'Bereken';

  @override
  String get storageCalculating => 'Bereken tans…';

  @override
  String get storageNotCalculated => 'Nie bereken nie';

  @override
  String storageLastCalculated(Object date) {
    return 'Laas bereken: $date';
  }

  @override
  String get storageLastCalculatedNone => 'Laas bereken: —';

  @override
  String get storageChatSizesToggle => 'Wys kletsgroottes in lys';

  @override
  String get storageChatSizesSubtitle =>
      'Wys elke klets se totale grootte op die hoofskerm';

  @override
  String get storageCleanupTitle => 'Maak mislukte invoere skoon';

  @override
  String get storageCleanupSubtitle =>
      'Verwyder onvolledige of mislukte invoere om spasie vry te maak.';

  @override
  String get storageCleanupEstimate => 'Geraamde spasie om vry te maak';

  @override
  String get storageCleanupAction => 'Maak nou skoon';

  @override
  String get storageCleanupNone => 'Geen mislukte invoere gevind nie.';

  @override
  String storageCleanupDone(Object size) {
    return 'Het $size van mislukte invoere skoongemaak.';
  }

  @override
  String storageCleanupLast(Object time) {
    return 'Laaste skoonmaak: $time';
  }

  @override
  String get proActiveTitle => 'Pro is aktief';

  @override
  String get proUpgradeTitle => 'Gradeer op na BackupChat Pro';

  @override
  String get proThankYouSubtitle => 'Dankie dat jy die app ondersteun.';

  @override
  String get proUnlockSubtitle => 'Ontsluit onbeperkte invoere.';

  @override
  String get debugProOverrideTitle => 'Ontfouting: Force Pro';

  @override
  String get debugProOverrideSubtitle =>
      'Plaaslike oorheersing vir toetsing (geen aankoop nodig nie).';

  @override
  String paywallResult(Object result) {
    return 'Paywall-resultaat: $result.';
  }

  @override
  String get purchaseCancelled => 'Aankoop gekanselleer.';

  @override
  String get restorePurchases => 'Herstel aankope';

  @override
  String get purchasesRestored => 'Aankope herstel.';

  @override
  String get restoreFailedTryAgain => 'Herstel misluk. Probeer weer.';

  @override
  String get manageSubscription => 'Bestuur intekening';

  @override
  String get openCustomerCenter => 'Maak RevenueCat Customer Center oop.';

  @override
  String get customerCenterUnavailable => 'Customer Center nie beskikbaar nie.';

  @override
  String get sectionAbout => 'Oor';

  @override
  String get aboutDescription =>
      'WhatsBackUp is \'n private, vanlyn kykprogram vir WhatsApp-kletsuitvoere. Voer ZIP-lêers in of voer direk uit WhatsApp uit om \'n skoon, deursoekbare argief met media te hou — geen netwerk nodig nie.';

  @override
  String get sectionAboutDeveloper => 'Oor die ontwikkelaar';

  @override
  String get aboutDeveloperDescription =>
      'Gebou deur \'n onafhanklike ontwikkelaar gefokus op privaatheid, vinnige soek en skoon kletsargiewe.';

  @override
  String get sectionHelp => 'Hulp';

  @override
  String get showOnboardingAgain => 'Wys inleiding weer';

  @override
  String get sdkConfigTitle => 'SDK-konfigurasie';

  @override
  String get publicKeyLabel => 'Publieke sleutel';

  @override
  String get offeringIdLabel => 'Aanbieding-ID';

  @override
  String get entitlementIdLabel => 'Reg-ID';

  @override
  String get lifetimeProductIdLabel => 'Lewenslange produk-ID';

  @override
  String errorLabel(Object error) {
    return 'Fout: $error';
  }

  @override
  String get offeringsTitle => 'Aanbiedinge';

  @override
  String get currentOfferingLabel => 'Huidige aanbieding';

  @override
  String get allOfferingsLabel => 'Alle aanbiedinge';

  @override
  String get customerInfoTitle => 'Kliëntinligting';

  @override
  String get activeEntitlementsLabel => 'Aktiewe regte';

  @override
  String get originalAppUserIdLabel => 'Oorspronklike app-gebruiker-ID';

  @override
  String get managementUrlLabel => 'Bestuurs-URL';

  @override
  String get noneLabel => 'geen';

  @override
  String get refreshAction => 'Verfris';

  @override
  String get noPackagesAvailable => 'Geen pakkette beskikbaar nie.';

  @override
  String get packagesTitle => 'Pakkette';

  @override
  String get fontSystem => 'Stelsel';

  @override
  String get fontSerif => 'Serif';

  @override
  String get fontMono => 'Mono';

  @override
  String get accessibilityFontSizeTitle => '';

  @override
  String get accessibilityFontSizeSubtitle => '';

  @override
  String get accessibilityFontPreview => '';

  @override
  String get accessibilityHighContrastTitle => '';

  @override
  String get accessibilityHighContrastSubtitle => '';

  @override
  String get colorWhatsAppGreen => 'WhatsApp-groen';

  @override
  String get colorDeepTeal => 'Diep teal';

  @override
  String get colorNavy => 'Marineblou';

  @override
  String get colorCharcoal => 'Antrasiet';

  @override
  String get colorBlindPaletteTitle => '';

  @override
  String get colorBlindPaletteSubtitle => '';

  @override
  String get hideChatsInsteadOfLocking =>
      'Versteek kletse eerder as om te sluit';

  @override
  String get hideChatsInsteadOfLockingSubtitle =>
      'Wanneer af, is kletse sigbaar maar deur kode beskerm.';

  @override
  String get previousMatch => 'Vorige tref';

  @override
  String get nextMatch => 'Volgende tref';

  @override
  String get selectSenderOnRight => 'Kies wie regs is';

  @override
  String couldNotOpenArchive(Object error) {
    return 'Kon nie argief oopmaak nie:\n$error';
  }

  @override
  String couldNotOpenFile(Object message) {
    return 'Kon nie lêer oopmaak nie: $message';
  }

  @override
  String attachmentMissing(Object filename) {
    return 'Aanhegsel ontbreek: $filename';
  }

  @override
  String get unknownError => 'Onbekende fout';

  @override
  String get openPdf => 'Maak PDF oop';

  @override
  String get openFile => 'Maak lêer oop';

  @override
  String get openAudio => 'Maak klank oop';

  @override
  String senderMeLabel(Object sender) {
    return '$sender (Ek)';
  }

  @override
  String get chatFileNotFound => 'Kletslêer nie gevind nie.';

  @override
  String get languageTitle => 'Taal';

  @override
  String get languageTooltip => 'Taal';

  @override
  String get moreOptionsTooltip => 'Meer opsies';

  @override
  String get filterTitle => 'Filter';

  @override
  String get filterDateRange => 'Datumreeks';

  @override
  String get filterAnyDate => 'Enige datum';

  @override
  String get filterIncludeMedia => 'Sluit media in';

  @override
  String get filterMediaOnly => 'Slegs media';

  @override
  String get filterSenders => 'Afsenders';

  @override
  String get applyFilters => 'Pas toe';

  @override
  String get clearFilters => 'Vee filters uit';

  @override
  String get incrementalImportTitle => 'Klets bestaan reeds';

  @override
  String incrementalImportMessage(Object name) {
    return 'Voeg hierdie invoer by \"$name\"?';
  }

  @override
  String get incrementalAddAction => 'Voeg by';

  @override
  String get incrementalChooseTitle => 'Kies klets om op te dateer';

  @override
  String get incrementalUpdated => 'Klets opgedateer.';

  @override
  String get languageSystem => 'Stelsel';

  @override
  String get languageEnglish => 'Engels';

  @override
  String get languageSpanish => 'Spaans';

  @override
  String get languageGerman => 'Duits';

  @override
  String get languageFrench => 'Frans';

  @override
  String get languagePortuguese => 'Portugees';

  @override
  String get languageRomanian => 'Roemeens';

  @override
  String get languageAfrikaans => 'Afrikaans';

  @override
  String get languageRussian => 'Russies';

  @override
  String get showImportButton => 'Wys Import-knoppie';

  @override
  String get showImportButtonSubtitle =>
      'Skakel die Import ZIP-knoppie op die tuisskerm aan of af.';

  @override
  String get importButtonHiddenMessage =>
      'Import-knoppie versteek. Jy kan dit in Instellings weer aktiveer.';

  @override
  String get upgradeToAccessChat =>
      'Gradeer op om toegang tot hierdie klets te kry.';

  @override
  String get aboutLegalTitle => 'Oor en Regs';

  @override
  String get aboutLegalSummary =>
      'WhatsBackUp is \'n vanlyn kykprogram vir WhatsApp-kletsuitvoere. Jou kletse bly op jou toestel.';

  @override
  String get aboutLegalRefundPolicy =>
      'Terugbetalings: As \'n terugbetaling toegestaan word, bly slegs die eerste 5 ingevoerde kletse toeganklik. Kletse bo die gratis limiet word gedeaktiveer totdat jy weer koop.';

  @override
  String get aboutLegalDisclaimers =>
      'Vrywaring: Ons is nie verantwoordelik vir dataverlies, kletsinhoud, vertaalakkuraatheid of die gebruik van sluit/versteek-funksies nie. Hou jou eie rugsteun.';

  @override
  String get aboutLegalAffiliation =>
      'Nie geaffilieer met WhatsApp of Meta nie. WhatsApp is \'n handelsmerk van Meta Platforms, Inc.';

  @override
  String get aboutLegalSupport => 'Ondersteuning: vwdewaal@gmail.com';

  @override
  String get aboutLegalDeveloper => 'Ontwikkelaar: Van Wyk De Waal';

  @override
  String get aboutLegalJurisdiction => 'Jurisdiksie: EU/UK';

  @override
  String aboutLegalVersion(Object version) {
    return 'App-weergawe: $version';
  }

  @override
  String get versionLoading => 'App-weergawe: besig om te laai...';

  @override
  String get languageScottishGaelic => 'Skotse Gaelies';

  @override
  String get languageScots => 'Skotte';

  @override
  String get languageChinese => 'Chinees (Mandaryns)';

  @override
  String get languageHindi => 'Nee';

  @override
  String get languageArabic => 'Arabies';

  @override
  String get languageBengali => 'Bengaals';

  @override
  String get languageJapanese => 'Japannees';

  @override
  String get languagePunjabi => 'Punjabi';

  @override
  String get languageKorean => 'Koreaans';

  @override
  String get languageTurkish => 'Turks';

  @override
  String get languageItalian => 'Italiaans';

  @override
  String get languageVietnamese => 'Viëtnamees';

  @override
  String get languageUrdu => 'Oerdoe';

  @override
  String get languageIndonesian => 'Indonesies';

  @override
  String get languageThai => 'Thai';

  @override
  String get languagePolish => 'Pools';

  @override
  String get languageDutch => 'Nederlands';

  @override
  String get identifyMeTitle => 'Identifiseer jouself';

  @override
  String get identifyMeSubtitle =>
      'Kies jou naam sodat ons jou boodskappe korrek kan etiketteer.';

  @override
  String get identifyMeNotNow => 'Nie nou nie';
}
