// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appTitle => 'WhatsBackUp';

  @override
  String get importZip => 'Importeer ZIP';

  @override
  String get importAction => 'Importeren';

  @override
  String get importingLabel => 'Importeren';

  @override
  String get importDoneLabel => 'KLAAR!';

  @override
  String get importLargeStarted => 'Import gestart';

  @override
  String get importTriggeredMessage =>
      'De import wordt op de achtergrond gestart; de chat wordt geopend zodra deze is voltooid. Houd de app open.';

  @override
  String get mediaImportingTitle => 'Media importeren';

  @override
  String get mediaImportingSubtitle =>
      'Je kunt het chatgesprek lezen terwijl de media wordt afgespeeld.';

  @override
  String get mediaImportPausedTitle => 'Media-import gepauzeerd';

  @override
  String get mediaImportPausedSubtitle =>
      'Selecteer opnieuw de oorspronkelijke ZIP om verder te gaan.';

  @override
  String get mediaImportFailedTitle => 'Het importeren van media is mislukt.';

  @override
  String get mediaImportFailedSubtitle => 'Tik om het opnieuw te proberen.';

  @override
  String get mediaImportResumeAction => 'Cv';

  @override
  String get mediaImportingLabel => 'Media importeren';

  @override
  String get contactLoadingLabel => 'Contactgegevens worden geladen…';

  @override
  String get contactUnknownName => 'Contact';

  @override
  String get contactPhoneLabel => 'Telefoon';

  @override
  String get contactEmailLabel => 'E-mail';

  @override
  String get openContactAction => 'Open contact';

  @override
  String contactOpenFailed(Object error) {
    return 'Kon geen contact openen: $error';
  }

  @override
  String get howToImport => 'Hoe te importeren';

  @override
  String get settings => 'Instellingen';

  @override
  String get searchTitle => 'Zoekopdracht';

  @override
  String get textToInclude => 'Tekst die moet worden opgenomen:';

  @override
  String get enterSearchText => 'Voer zoektekst in...';

  @override
  String get dateRange => 'Datumbereik:';

  @override
  String get fromLabel => 'Van:';

  @override
  String get toLabel => 'Naar:';

  @override
  String get selectLabel => 'Select';

  @override
  String get showOnlyMediaFiles => 'Alleen mediabestanden weergeven';

  @override
  String get clearAction => 'Duidelijk';

  @override
  String get searchAction => 'Zoekopdracht';

  @override
  String get renameChatTitle => 'Chat hernoemen';

  @override
  String get chatNameHint => 'Chatnaam';

  @override
  String get cancelAction => 'Annuleren';

  @override
  String get saveAction => 'Redden';

  @override
  String get hideChatsTooltip => 'Chats verbergen';

  @override
  String get hideAction => 'Verbergen';

  @override
  String get lockAction => 'Slot';

  @override
  String get noChatsYetHint =>
      'Nog geen chats.\n\nGebruik \"Import ZIP\" om een WhatsApp-export te laden,\nof exporteer direct vanuit WhatsApp met behulp van de optie \"Chat exporteren\" van de chat.';

  @override
  String get noArchivedChats => 'Geen gearchiveerde chats.';

  @override
  String get tabChats => 'Chats';

  @override
  String get tabArchived => 'Gearchiveerd';

  @override
  String get searchChatsHint => 'Chats doorzoeken';

  @override
  String get enterCodeTitle => 'Voer de code in';

  @override
  String get upTo8DigitsHint => 'Maximaal 8 cijfers';

  @override
  String get continueAction => 'Doorgaan';

  @override
  String get updatingHiddenChats => 'Verborgen chats worden bijgewerkt...';

  @override
  String get chatsUnhidden => 'Chats niet langer verborgen.';

  @override
  String get selectAtLeastOneChat => 'Selecteer ten minste één chat.';

  @override
  String get hidingChats => 'Chats verbergen...';

  @override
  String get lockingChats => 'Chats vergrendelen...';

  @override
  String get chatsHidden => 'Chats verborgen.';

  @override
  String get chatsUnlocked => 'Chats ontgrendeld.';

  @override
  String get chatsLocked => 'Chats vergrendeld.';

  @override
  String get unlockChatTitle => 'Chat ontgrendelen';

  @override
  String get enterPasscodeHint => 'Voer de toegangscode in';

  @override
  String get unlockAction => 'Ontgrendelen';

  @override
  String get incorrectCode => 'Onjuiste code.';

  @override
  String importedOn(Object date) {
    return 'Geïmporteerd $date';
  }

  @override
  String get unarchiveAction => 'Archief opheffen';

  @override
  String get archiveAction => 'Archief';

  @override
  String get deleteAction => 'Verwijderen';

  @override
  String get deleteChatTitle => 'Chat verwijderen?';

  @override
  String get deleteChatConfirm =>
      'Hiermee worden het archief en de mediabestanden permanent verwijderd.';

  @override
  String get archiveFolderMissing => 'De archiefmap ontbrak.';

  @override
  String updateFailedWithDetail(Object error) {
    return 'Update mislukt: $error';
  }

  @override
  String get renameAction => 'Naam wijzigen';

  @override
  String get working => 'Bezig met verwerken...';

  @override
  String get importPreparing => 'Import voorbereiden...';

  @override
  String get importAnalyzing => 'Bestand analyseren...';

  @override
  String get bookmarksLabel => 'Bladwijzers';

  @override
  String get previousBookmark => 'Vorige bladwijzer';

  @override
  String get nextBookmark => 'Volgende bladwijzer';

  @override
  String get importLargeFileNotice =>
      'Groot bestand gedetecteerd. Dit kan een paar minuten duren.';

  @override
  String get importExtracting => 'Bestanden uitpakken...';

  @override
  String get importFinalizing => 'Afronding...';

  @override
  String importFailedWithDetail(Object error) {
    return 'Import mislukt: $error';
  }

  @override
  String get sharedFileNotZip => 'Gedeeld bestand is geen ZIP.';

  @override
  String get unlockProToImportMoreChats =>
      'Ontgrendel BackupChat Pro om meer chats te importeren.';

  @override
  String get purchaseFailedTryAgain => 'Aankoop mislukt. Probeer het opnieuw.';

  @override
  String get importErrorOnlyZip => 'Alleen .zip-bestanden worden ondersteund.';

  @override
  String get importErrorNoChatText =>
      'Er is geen chattekstbestand met de naam WhatsApp gevonden in ZIP.';

  @override
  String get importErrorAlreadyImported => 'Deze chat is al geïmporteerd.';

  @override
  String get howToImportTitle => 'Hoe te importeren';

  @override
  String get chooseImportMethodTitle => 'Kies uw importmethode';

  @override
  String get iosExportTitle => 'Exporteren vanuit WhatsApp (iOS)';

  @override
  String get androidExportTitle => 'Exporteren vanuit WhatsApp (Android)';

  @override
  String get iosStepOpenChat =>
      'Open de WhatsApp-app en klik op het chatgesprek.';

  @override
  String get androidStepOpenChat => 'Open een chatgesprek in de WhatsApp-app.';

  @override
  String get iosStepOpenInfo =>
      'Klik bovenaan op de naam van de persoon of groep.';

  @override
  String get androidStepOpenMenu => 'Klik op het menu.';

  @override
  String get iosStepExportChat =>
      'Scroll naar beneden en selecteer \'Chat exporteren\'.';

  @override
  String get androidStepMoreExport => 'Selecteer “Meer”.';

  @override
  String get iosStepChooseMedia =>
      'Selecteer WhatsBackUp in het app-selectiemenu (deelmenu) (op oudere telefoons kun je de app opslaan in bestanden).';

  @override
  String get androidStepChooseMedia => 'Selecteer \'Chat exporteren\'.';

  @override
  String get iosStepShareToApp => 'De chat wordt geïmporteerd in WhatsBackUp.';

  @override
  String get androidStepShareToApp =>
      'Selecteer WhatsBackUp in het app-selectiemenu (deelmenu) (op oudere telefoons kun je de app opslaan in bestanden).';

  @override
  String get iosStepSaveToFiles => 'De chat wordt geïmporteerd in WhatsBackUp.';

  @override
  String get androidStepSaveToDevice =>
      'De chat wordt geïmporteerd in WhatsBackUp.';

  @override
  String get androidLargeImportNote =>
      'Houd er rekening mee dat het importeren van zeer grote chats op oudere Android-telefoons tot een minuut kan duren.';

  @override
  String get importZipTitle => 'Een opgeslagen ZIP-bestand importeren';

  @override
  String get iosStepImportZip =>
      'Tik in WhatsBackUp op \'Importeren vanuit ZIP\' en kies het bestand uit \'Bestanden\'.';

  @override
  String get androidStepImportZip =>
      'Tik in WhatsBackUp op \'Importeren vanuit ZIP\' en kies het bestand van je apparaat.';

  @override
  String get managingChatsTitle => 'Chats beheren';

  @override
  String get hideChatsWithCodeTitle => 'Chats verbergen met een code';

  @override
  String get stepTapGhostIcon =>
      'Tik op het spookpictogram in de bovenste balk.';

  @override
  String get stepEnterCodeUpTo8Digits =>
      'Voer een code in (maximaal 8 cijfers).';

  @override
  String get stepSelectChatsSubmitHide =>
      'Selecteer de chats en tik vervolgens op Verzenden om ze te verbergen.';

  @override
  String get stepEnterSameCodeUnhide =>
      'Voer dezelfde code nogmaals in om die chats weer zichtbaar te maken.';

  @override
  String get stepDifferentCodesHideSets =>
      'Verschillende codes kunnen verschillende sets chats verbergen.';

  @override
  String get lockChatsWithCodeTitle => 'Beveilig chats met een code';

  @override
  String get stepSwitchHideToLockMode =>
      'Ga in de instellingen naar de modus \'Verbergen\' en schakel over van \'Vergrendelen\'.';

  @override
  String get stepTapGhostIconEnterCode =>
      'Tik op het spookpictogram en voer een code in.';

  @override
  String get stepSelectChatsSubmitLock =>
      'Selecteer de chats en tik vervolgens op Verzenden om ze te vergrendelen.';

  @override
  String get stepLockedChatsRequireCode =>
      'Vergrendelde chats worden weergegeven met een slotpictogram en vereisen de code om te openen.';

  @override
  String get archiveOrDeleteTitle => 'Archiveren of verwijderen';

  @override
  String get stepSwipeRightArchive =>
      'Veeg naar rechts om te archiveren of de archivering te de-archiveren.';

  @override
  String get stepSwipeLeftDelete =>
      'Veeg naar links om te verwijderen (bevestiging vereist).';

  @override
  String get bullet => '•';

  @override
  String get welcomeTitle => 'Welkom';

  @override
  String get gotItAction => 'Begrepen.';

  @override
  String get settingsTitle => 'Instellingen';

  @override
  String get sectionFont => 'Lettertype';

  @override
  String get sectionColor => 'Kleur';

  @override
  String get sectionAccessibility => 'Toegankelijkheid';

  @override
  String get sectionPrivacy => 'Privacy';

  @override
  String get sectionPro => 'BackupChat Pro';

  @override
  String get sectionStorage => 'Opslag';

  @override
  String get storageTitle => 'Opslag';

  @override
  String get storageSubtitle =>
      'Bekijk de beschikbare opslagruimte op je apparaat en de chatopslag.';

  @override
  String get storageAvailable => 'Beschikbare opslagruimte';

  @override
  String get storageAppSize => 'WhatsBackUp grootte (inclusief chats)';

  @override
  String get storageLocation => 'Opslaglocatie';

  @override
  String get storageLocationUnknown => 'Onbekend';

  @override
  String get storageCalculate => 'Berekenen';

  @override
  String get storageCalculating => 'Bezig met berekenen…';

  @override
  String get storageNotCalculated => 'Niet berekend';

  @override
  String storageLastCalculated(Object date) {
    return 'Laatst berekend: $date';
  }

  @override
  String get storageLastCalculatedNone => 'Laatst berekend: —';

  @override
  String get storageChatSizesToggle => 'Toon chatgroottes in de lijst';

  @override
  String get storageChatSizesSubtitle =>
      'Toont de totale grootte van elke chat op het hoofdscherm.';

  @override
  String get storageCleanupTitle => 'Opschonen van mislukte importen';

  @override
  String get storageCleanupSubtitle =>
      'Verwijdert onvolledige of mislukte importen om ruimte vrij te maken.';

  @override
  String get storageCleanupEstimate =>
      'Geschatte ruimte die vrijgemaakt moet worden';

  @override
  String get storageCleanupAction => 'Maak nu schoon';

  @override
  String get storageCleanupNone => 'Geen mislukte importpogingen gevonden.';

  @override
  String storageCleanupDone(Object size) {
    return '$size heeft mislukte importpogingen verwijderd.';
  }

  @override
  String storageCleanupLast(Object time) {
    return 'Laatste opruiming: $time';
  }

  @override
  String get proActiveTitle => 'Pro is actief';

  @override
  String get proUpgradeTitle => 'Upgrade naar BackupChat Pro';

  @override
  String get proThankYouSubtitle => 'Bedankt voor uw steun aan de app.';

  @override
  String get proUnlockSubtitle => 'Ontgrendel onbeperkte import.';

  @override
  String get debugProOverrideTitle => 'Foutopsporing: Forceer Pro';

  @override
  String get debugProOverrideSubtitle =>
      'Lokale overschrijving voor testdoeleinden (geen aankoop vereist).';

  @override
  String paywallResult(Object result) {
    return 'Betaalmuurresultaat: $result.';
  }

  @override
  String get purchaseCancelled => 'Aankoop geannuleerd.';

  @override
  String get restorePurchases => 'Aankopen herstellen';

  @override
  String get purchasesRestored => 'Aankopen hersteld.';

  @override
  String get restoreFailedTryAgain =>
      'Herstellen is mislukt. Probeer het opnieuw.';

  @override
  String get manageSubscription => 'Abonnement beheren';

  @override
  String get openCustomerCenter => 'Open het RevenueCat-klantencentrum.';

  @override
  String get customerCenterUnavailable => 'Klantenservice niet beschikbaar.';

  @override
  String get sectionAbout => 'Over';

  @override
  String get aboutDescription =>
      'WhatsBackUp is een privé, offline viewer voor WhatsApp chat-exports. Importeer ZIP bestanden of exporteer direct vanuit WhatsApp om een overzichtelijk, doorzoekbaar archief met media te bewaren — zonder netwerkverbinding.';

  @override
  String get sectionAboutDeveloper => 'Over de ontwikkelaar';

  @override
  String get aboutDeveloperDescription =>
      'Ontwikkeld door een onafhankelijke ontwikkelaar met de nadruk op privacy, snel zoeken en overzichtelijke chatarchieven.';

  @override
  String get sectionHelp => 'Hulp';

  @override
  String get showOnboardingAgain => 'Toon het onboardingproces opnieuw';

  @override
  String get sdkConfigTitle => 'SDK-configuratie';

  @override
  String get publicKeyLabel => 'Openbare sleutel';

  @override
  String get offeringIdLabel => 'Aanbiedings-ID';

  @override
  String get entitlementIdLabel => 'Rechts-ID';

  @override
  String get lifetimeProductIdLabel => 'Levenslange product-ID';

  @override
  String errorLabel(Object error) {
    return 'Fout: $error';
  }

  @override
  String get offeringsTitle => 'Aanbiedingen';

  @override
  String get currentOfferingLabel => 'Huidig aanbod';

  @override
  String get allOfferingsLabel => 'Alle aanbiedingen';

  @override
  String get customerInfoTitle => 'Klantinformatie';

  @override
  String get activeEntitlementsLabel => 'Actieve rechten';

  @override
  String get originalAppUserIdLabel => 'Oorspronkelijke app-gebruikers-ID';

  @override
  String get managementUrlLabel => 'Beheer-URL';

  @override
  String get noneLabel => 'geen';

  @override
  String get refreshAction => 'Vernieuwen';

  @override
  String get noPackagesAvailable => 'Geen pakketten beschikbaar.';

  @override
  String get packagesTitle => 'Pakketten';

  @override
  String get fontSystem => 'Systeem';

  @override
  String get fontSerif => 'Serif';

  @override
  String get fontMono => 'Mono';

  @override
  String get accessibilityFontSizeTitle => 'Lettergrootte';

  @override
  String get accessibilityFontSizeSubtitle =>
      'Pas de tekstgrootte in de hele app aan.';

  @override
  String get accessibilityFontPreview =>
      'Dit is een voorbeeld van een berichtballon.\n\nHet laat zien hoe je chattekst eruit zal zien.\n\nGebruik de schuifregelaar om het formaat aan te passen.';

  @override
  String get accessibilityHighContrastTitle => 'Hoge contrastmodus';

  @override
  String get accessibilityHighContrastSubtitle =>
      'Verhoog het contrast voor betere leesbaarheid.';

  @override
  String get colorWhatsAppGreen => 'WhatsApp Groen';

  @override
  String get colorDeepTeal => 'Diepblauwgroen';

  @override
  String get colorNavy => 'Marine';

  @override
  String get colorCharcoal => 'Houtskool';

  @override
  String get colorBlindPaletteTitle => 'Kleurenblind kleurenpalet';

  @override
  String get colorBlindPaletteSubtitle =>
      'Gebruik een kleurenpalet dat geoptimaliseerd is voor mensen met een kleurenblindheid.';

  @override
  String get hideChatsInsteadOfLocking =>
      'Verberg chats in plaats van ze te vergrendelen.';

  @override
  String get hideChatsInsteadOfLockingSubtitle =>
      'Wanneer de chat is uitgeschakeld, zijn deze wel zichtbaar, maar beveiligd met een wachtwoord.';

  @override
  String get previousMatch => 'Vorige wedstrijd';

  @override
  String get nextMatch => 'Volgende wedstrijd';

  @override
  String get selectSenderOnRight =>
      'Selecteer welke afzender zich aan de rechterkant bevindt.';

  @override
  String couldNotOpenArchive(Object error) {
    return 'Archief kon niet worden geopend:\n$error';
  }

  @override
  String couldNotOpenFile(Object message) {
    return 'Kon bestand $message niet openen.';
  }

  @override
  String attachmentMissing(Object filename) {
    return 'Bijlage ontbreekt: $filename';
  }

  @override
  String get unknownError => 'Onbekende fout';

  @override
  String get openPdf => 'PDF openen';

  @override
  String get openFile => 'Bestand openen';

  @override
  String get openAudio => 'Audio openen';

  @override
  String senderMeLabel(Object sender) {
    return '$sender (Ik)';
  }

  @override
  String get chatFileNotFound => 'Chatbestand niet gevonden.';

  @override
  String get languageTitle => 'Taal';

  @override
  String get languageTooltip => 'Taal';

  @override
  String get moreOptionsTooltip => 'Meer opties';

  @override
  String get filterTitle => 'Filter';

  @override
  String get filterDateRange => 'Datumbereik';

  @override
  String get filterAnyDate => 'Elke datum';

  @override
  String get filterIncludeMedia => 'Media toevoegen';

  @override
  String get filterMediaOnly => 'Alleen voor media';

  @override
  String get filterSenders => 'Afzenders';

  @override
  String get applyFilters => 'Toepassen';

  @override
  String get clearFilters => 'Filters wissen';

  @override
  String get incrementalImportTitle => 'De chatfunctie bestaat al.';

  @override
  String incrementalImportMessage(Object name) {
    return 'Voeg deze import toe aan \"$name\"?';
  }

  @override
  String get incrementalAddAction => 'Toevoegen';

  @override
  String get incrementalChooseTitle => 'Kies chat om bij te werken';

  @override
  String get incrementalUpdated => 'Chat bijgewerkt.';

  @override
  String get languageSystem => 'Systeem';

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
  String get languageRomanian => 'Roemeense';

  @override
  String get languageAfrikaans => 'Afrikaanse';

  @override
  String get languageRussian => 'Russisch';

  @override
  String get showImportButton => 'Importeerknop weergeven';

  @override
  String get showImportButtonSubtitle =>
      'Schakel de knop \'Import ZIP\' in op het startscherm.';

  @override
  String get importButtonHiddenMessage =>
      'De importknop is verborgen. Je kunt deze opnieuw inschakelen in de instellingen.';

  @override
  String get upgradeToAccessChat =>
      'Upgrade uw upgrade om toegang te krijgen tot deze chat.';

  @override
  String get aboutLegalTitle => 'Over ons & Juridische informatie';

  @override
  String get aboutLegalSummary =>
      'WhatsBackUp is een offline viewer voor WhatsApp chat-exports. Je chats blijven op je apparaat staan.';

  @override
  String get aboutLegalRefundPolicy =>
      'Terugbetalingen: Bij een terugbetaling blijven alleen de eerste 5 geïmporteerde chats toegankelijk. Chats boven de gratis limiet worden uitgeschakeld totdat er opnieuw een abonnement wordt afgesloten.';

  @override
  String get aboutLegalDisclaimers =>
      'Disclaimer: Wij zijn niet verantwoordelijk voor gegevensverlies, chatinhoud, de nauwkeurigheid van vertalingen of het gebruik van vergrendelings-/verbergfuncties. Zorg zelf voor back-ups.';

  @override
  String get aboutLegalAffiliation =>
      'Niet gelieerd aan WhatsApp of Meta. WhatsApp is een handelsmerk van Meta Platforms, Inc.';

  @override
  String get aboutLegalSupport => 'Ondersteuning: vwdewaal@gmail.com';

  @override
  String get aboutLegalDeveloper => 'Ontwikkelaar: Van Wyk De Waal';

  @override
  String get aboutLegalJurisdiction => 'Rechtsgebied: EU/VK';

  @override
  String aboutLegalVersion(Object version) {
    return 'App-versie: $version';
  }

  @override
  String get versionLoading => 'App-versie: laden...';

  @override
  String get languageScottishGaelic => 'Schots-Gaelisch';

  @override
  String get languageScots => 'Schotten';

  @override
  String get languageChinese => 'Chinees (Mandarijn)';

  @override
  String get languageHindi => 'Nee';

  @override
  String get languageArabic => 'Arabisch';

  @override
  String get languageBengali => 'Bengaals';

  @override
  String get languageJapanese => 'Japanse';

  @override
  String get languagePunjabi => 'Punjabi';

  @override
  String get languageKorean => 'Koreaans';

  @override
  String get languageTurkish => 'Turks';

  @override
  String get languageItalian => 'Italiaans';

  @override
  String get languageVietnamese => 'Vietnamees';

  @override
  String get languageUrdu => 'Urdu';

  @override
  String get languageIndonesian => 'Indonesisch';

  @override
  String get languageThai => 'Thais';

  @override
  String get languagePolish => 'Pools';

  @override
  String get languageDutch => 'Nederlands';

  @override
  String get identifyMeTitle => 'Identificeer jezelf';

  @override
  String get identifyMeSubtitle =>
      'Selecteer je naam zodat we je berichten correct kunnen labelen.';

  @override
  String get identifyMeNotNow => 'Nu niet';
}
