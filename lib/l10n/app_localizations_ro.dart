// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get appTitle => 'WhatsBackUp';

  @override
  String get importZip => 'Importă ZIP';

  @override
  String get importAction => 'Import';

  @override
  String get importingLabel => 'Importarea';

  @override
  String get importDoneLabel => 'FĂCUT!';

  @override
  String get importLargeStarted => 'Importul a început';

  @override
  String get importTriggeredMessage =>
      'Importul a fost declanșat în fundal, chatul se va deschide când este finalizat. Vă rugăm să păstrați aplicația deschisă.';

  @override
  String get mediaImportingTitle => 'Importarea conținutului media';

  @override
  String get mediaImportingSubtitle =>
      'Poți citi chatul după ce se termină redarea media.';

  @override
  String get mediaImportPausedTitle => 'Importul media a fost întrerupt';

  @override
  String get mediaImportPausedSubtitle =>
      'Selectați din nou codul poștal original pentru a relua procesul.';

  @override
  String get mediaImportFailedTitle => 'Importul fișierelor media a eșuat';

  @override
  String get mediaImportFailedSubtitle => 'Atingeți pentru a reîncerca.';

  @override
  String get mediaImportResumeAction => 'Relua';

  @override
  String get mediaImportingLabel => 'Importarea de conținut media';

  @override
  String get contactLoadingLabel => 'Se încarcă contactul…';

  @override
  String get contactUnknownName => 'Contact';

  @override
  String get contactPhoneLabel => 'Telefon';

  @override
  String get contactEmailLabel => 'E-mail';

  @override
  String get openContactAction => 'Contact deschis';

  @override
  String contactOpenFailed(Object error) {
    return 'Nu s-a putut deschide contactul: $error';
  }

  @override
  String get howToImport => 'Cum se importă';

  @override
  String get settings => 'Setări';

  @override
  String get searchTitle => 'Căutare';

  @override
  String get textToInclude => 'Text de inclus:';

  @override
  String get enterSearchText => 'Introdu textul de căutare...';

  @override
  String get dateRange => 'Interval de date:';

  @override
  String get fromLabel => 'De la:';

  @override
  String get toLabel => 'Până la:';

  @override
  String get selectLabel => 'Selectează';

  @override
  String get showOnlyMediaFiles => 'Afișează doar fișiere media';

  @override
  String get clearAction => 'Șterge';

  @override
  String get searchAction => 'Caută';

  @override
  String get renameChatTitle => 'Redenumește chatul';

  @override
  String get chatNameHint => 'Numele chatului';

  @override
  String get cancelAction => 'Anulează';

  @override
  String get saveAction => 'Salvează';

  @override
  String get hideChatsTooltip => 'Ascunde chat-urile';

  @override
  String get hideAction => 'Ascunde';

  @override
  String get lockAction => 'Blochează';

  @override
  String get noChatsYetHint =>
      'Nu există încă chat-uri.\nFolosește \"Importă ZIP\" pentru a încărca un export WhatsApp\nsau exportă direct din WhatsApp folosind opțiunea Export Chat.';

  @override
  String get noArchivedChats => 'Nu există chat-uri arhivate.';

  @override
  String get tabChats => 'Chat-uri';

  @override
  String get tabArchived => 'Arhivate';

  @override
  String get searchChatsHint => 'Caută chat-uri';

  @override
  String get enterCodeTitle => 'Introdu codul';

  @override
  String get upTo8DigitsHint => 'Până la 8 cifre';

  @override
  String get continueAction => 'Continuă';

  @override
  String get updatingHiddenChats => 'Se actualizează chat-urile ascunse...';

  @override
  String get chatsUnhidden => 'Chat-urile sunt afișate.';

  @override
  String get selectAtLeastOneChat => 'Selectează cel puțin un chat.';

  @override
  String get hidingChats => 'Se ascund chat-urile...';

  @override
  String get lockingChats => 'Se blochează chat-urile...';

  @override
  String get chatsHidden => 'Chat-uri ascunse.';

  @override
  String get chatsUnlocked => 'Chat-uri deblocate.';

  @override
  String get chatsLocked => 'Chat-uri blocate.';

  @override
  String get unlockChatTitle => 'Deblochează chatul';

  @override
  String get enterPasscodeHint => 'Introdu codul';

  @override
  String get unlockAction => 'Deblochează';

  @override
  String get incorrectCode => 'Cod incorect.';

  @override
  String importedOn(Object date) {
    return 'Importat $date';
  }

  @override
  String get unarchiveAction => 'Dezarhivează';

  @override
  String get archiveAction => 'Arhivează';

  @override
  String get deleteAction => 'Șterge';

  @override
  String get deleteChatTitle => 'Ștergi chatul?';

  @override
  String get deleteChatConfirm =>
      'Aceasta șterge definitiv arhiva și fișierele media.';

  @override
  String get archiveFolderMissing => 'Lipsește folderul de arhivă.';

  @override
  String updateFailedWithDetail(Object error) {
    return 'Actualizare eșuată: $error';
  }

  @override
  String get renameAction => 'Redenumește';

  @override
  String get working => 'Se lucrează...';

  @override
  String get importPreparing => 'Se pregătește importul...';

  @override
  String get importAnalyzing => 'Se analizează fișierul...';

  @override
  String get bookmarksLabel => 'Semne de carte';

  @override
  String get previousBookmark => 'Marcaj anterior';

  @override
  String get nextBookmark => 'Următorul marcaj';

  @override
  String get importLargeFileNotice =>
      'Fișier mare detectat. Acest proces poate dura câteva minute.';

  @override
  String get importExtracting => 'Se extrag fișierele...';

  @override
  String get importFinalizing => 'Se finalizează...';

  @override
  String importFailedWithDetail(Object error) {
    return 'Import eșuat: $error';
  }

  @override
  String get sharedFileNotZip => 'Fișierul partajat nu este un ZIP.';

  @override
  String get unlockProToImportMoreChats =>
      'Deblochează BackupChat Pro pentru a importa mai multe chat-uri.';

  @override
  String get purchaseFailedTryAgain => 'Achiziția a eșuat. Încearcă din nou.';

  @override
  String get importErrorOnlyZip => 'Sunt acceptate doar fișiere .zip.';

  @override
  String get importErrorNoChatText =>
      'Nu a fost găsit niciun fișier text de chat WhatsApp în ZIP.';

  @override
  String get importErrorAlreadyImported => 'Acest chat a fost deja importat.';

  @override
  String get howToImportTitle => 'Cum se importă';

  @override
  String get chooseImportMethodTitle => 'Alege metoda de import';

  @override
  String get iosExportTitle => 'Export din WhatsApp (iOS)';

  @override
  String get androidExportTitle => 'Export din WhatsApp (Android)';

  @override
  String get iosStepOpenChat => 'În aplicația WhatsApp, dă clic pe chat.';

  @override
  String get androidStepOpenChat =>
      'În aplicația WhatsApp, dă clic pe o conversație.';

  @override
  String get iosStepOpenInfo =>
      'Faceți clic pe numele persoanei sau al grupului din partea de sus.';

  @override
  String get androidStepOpenMenu => 'Faceți clic pe meniu.';

  @override
  String get iosStepExportChat => 'Derulați în jos și selectați Exportă chat.';

  @override
  String get androidStepMoreExport => 'Selectați „Mai multe”.';

  @override
  String get iosStepChooseMedia =>
      'Din meniul de selectare a aplicației (foaia de partajare), selectați WhatsBackUp (pe telefoanele mai vechi, salvați în fișiere).';

  @override
  String get androidStepChooseMedia => 'Selectați Exportă chat.';

  @override
  String get iosStepShareToApp => 'Chatul va fi importat în WhatsBackUp.';

  @override
  String get androidStepShareToApp =>
      'Din meniul de selectare a aplicației (foaia de partajare), selectați WhatsBackUp (pe telefoanele mai vechi, salvați în fișiere).';

  @override
  String get iosStepSaveToFiles => 'Chatul va fi importat în WhatsBackUp.';

  @override
  String get androidStepSaveToDevice => 'Chatul va fi importat în WhatsBackUp.';

  @override
  String get androidLargeImportNote =>
      'Rețineți că pe telefoanele Android mai vechi, importul chat-urilor foarte mari va dura până la un minut.';

  @override
  String get importZipTitle => 'Importați un cod ZIP salvat';

  @override
  String get iosStepImportZip =>
      'În WhatsBackUp, atingeți „Importați din ZIP” și alegeți fișierul din Fișiere.';

  @override
  String get androidStepImportZip =>
      'În WhatsBackUp, atinge „Import din ZIP” și alege fișierul de pe dispozitiv.';

  @override
  String get managingChatsTitle => 'Gestionarea chat-urilor';

  @override
  String get hideChatsWithCodeTitle => 'Ascunde chat-uri cu un cod';

  @override
  String get stepTapGhostIcon => 'Atinge pictograma fantomă din bara de sus.';

  @override
  String get stepEnterCodeUpTo8Digits => 'Introdu un cod (până la 8 cifre).';

  @override
  String get stepSelectChatsSubmitHide =>
      'Selectează chat-uri și apasă Submit pentru a le ascunde.';

  @override
  String get stepEnterSameCodeUnhide =>
      'Introdu din nou același cod pentru a le afișa.';

  @override
  String get stepDifferentCodesHideSets =>
      'Coduri diferite pot ascunde seturi diferite de chat-uri.';

  @override
  String get lockChatsWithCodeTitle => 'Blochează chat-uri cu un cod';

  @override
  String get stepSwitchHideToLockMode =>
      'În Setări, comută de la Ascunde la Blochează.';

  @override
  String get stepTapGhostIconEnterCode =>
      'Atinge pictograma fantomă și introdu un cod.';

  @override
  String get stepSelectChatsSubmitLock =>
      'Selectează chat-uri și apasă Submit pentru a le bloca.';

  @override
  String get stepLockedChatsRequireCode =>
      'Chat-urile blocate afișează un lacăt și necesită codul pentru deschidere.';

  @override
  String get archiveOrDeleteTitle => 'Arhivează sau șterge';

  @override
  String get stepSwipeRightArchive =>
      'Glisează spre dreapta pentru a arhiva sau dezarhiva.';

  @override
  String get stepSwipeLeftDelete =>
      'Glisează spre stânga pentru a șterge (este necesară confirmarea).';

  @override
  String get bullet => '•';

  @override
  String get welcomeTitle => 'Bun venit';

  @override
  String get gotItAction => 'Am înțeles';

  @override
  String get settingsTitle => 'Setări';

  @override
  String get sectionFont => 'Font';

  @override
  String get sectionColor => 'Culoare';

  @override
  String get sectionAccessibility => '';

  @override
  String get sectionPrivacy => 'Confidențialitate';

  @override
  String get sectionPro => 'BackupChat Pro';

  @override
  String get sectionStorage => 'Depozitare';

  @override
  String get storageTitle => 'Depozitare';

  @override
  String get storageSubtitle =>
      'Vizualizați spațiul de stocare al dispozitivului și al chatului';

  @override
  String get storageAvailable => 'Stocare disponibilă';

  @override
  String get storageAppSize => 'Dimensiunea WhatsBackUp (inclusiv chat-urile)';

  @override
  String get storageLocation => 'Locația de depozitare';

  @override
  String get storageLocationUnknown => 'Necunoscut';

  @override
  String get storageCalculate => 'Calcula';

  @override
  String get storageCalculating => 'De calculat…';

  @override
  String get storageNotCalculated => 'Necalculat';

  @override
  String storageLastCalculated(Object date) {
    return 'Ultima calculare: $date';
  }

  @override
  String get storageLastCalculatedNone => 'Ultima calculare: —';

  @override
  String get storageChatSizesToggle =>
      'Afișează dimensiunile chatului în listă';

  @override
  String get storageChatSizesSubtitle =>
      'Afișează dimensiunea totală a fiecărui chat pe ecranul principal';

  @override
  String get storageCleanupTitle => 'Curățați importurile eșuate';

  @override
  String get storageCleanupSubtitle =>
      'Elimină importurile incomplete sau eșuate în spațiul liber.';

  @override
  String get storageCleanupEstimate => 'Spațiu estimat de eliberat';

  @override
  String get storageCleanupAction => 'Curățați acum';

  @override
  String get storageCleanupNone => 'Nu s-au găsit importuri eșuate.';

  @override
  String storageCleanupDone(Object size) {
    return 'Am curățat $size de importurile eșuate.';
  }

  @override
  String storageCleanupLast(Object time) {
    return 'Ultima curățare: $time';
  }

  @override
  String get proActiveTitle => 'Pro este activ';

  @override
  String get proUpgradeTitle => 'Upgrade la BackupChat Pro';

  @override
  String get proThankYouSubtitle => 'Mulțumim că susții aplicația.';

  @override
  String get proUnlockSubtitle => 'Deblochează importuri nelimitate.';

  @override
  String get debugProOverrideTitle => 'Depanare: Force Pro';

  @override
  String get debugProOverrideSubtitle =>
      'Suprascriere locală pentru testare (nu este necesară nicio achiziție).';

  @override
  String paywallResult(Object result) {
    return 'Rezultat paywall: $result.';
  }

  @override
  String get purchaseCancelled => 'Achiziție anulată.';

  @override
  String get restorePurchases => 'Restaurează achizițiile';

  @override
  String get purchasesRestored => 'Achiziții restaurate.';

  @override
  String get restoreFailedTryAgain => 'Restaurare eșuată. Încearcă din nou.';

  @override
  String get manageSubscription => 'Gestionează abonamentul';

  @override
  String get openCustomerCenter => 'Deschide RevenueCat Customer Center.';

  @override
  String get customerCenterUnavailable => 'Customer Center indisponibil.';

  @override
  String get sectionAbout => 'Despre';

  @override
  String get aboutDescription =>
      'WhatsBackUp este un vizualizator privat, offline, pentru exporturile de chat WhatsApp. Importă fișiere ZIP sau exportă direct din WhatsApp pentru a păstra o arhivă curată, ușor de căutat, cu media — fără rețea.';

  @override
  String get sectionAboutDeveloper => 'Despre dezvoltator';

  @override
  String get aboutDeveloperDescription =>
      'Creat de un dezvoltator independent concentrat pe confidențialitate, căutare rapidă și arhive curate.';

  @override
  String get sectionHelp => 'Ajutor';

  @override
  String get showOnboardingAgain => 'Afișează din nou introducerea';

  @override
  String get sdkConfigTitle => 'Configurație SDK';

  @override
  String get publicKeyLabel => 'Cheie publică';

  @override
  String get offeringIdLabel => 'ID ofertă';

  @override
  String get entitlementIdLabel => 'ID drept';

  @override
  String get lifetimeProductIdLabel => 'ID produs pe viață';

  @override
  String errorLabel(Object error) {
    return 'Eroare: $error';
  }

  @override
  String get offeringsTitle => 'Oferte';

  @override
  String get currentOfferingLabel => 'Oferta curentă';

  @override
  String get allOfferingsLabel => 'Toate ofertele';

  @override
  String get customerInfoTitle => 'Informații client';

  @override
  String get activeEntitlementsLabel => 'Drepturi active';

  @override
  String get originalAppUserIdLabel => 'ID utilizator original';

  @override
  String get managementUrlLabel => 'URL de gestionare';

  @override
  String get noneLabel => 'niciunul';

  @override
  String get refreshAction => 'Reîmprospătează';

  @override
  String get noPackagesAvailable => 'Nu există pachete disponibile.';

  @override
  String get packagesTitle => 'Pachete';

  @override
  String get fontSystem => 'Sistem';

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
  String get colorWhatsAppGreen => 'Verde WhatsApp';

  @override
  String get colorDeepTeal => 'Teal închis';

  @override
  String get colorNavy => 'Bleumarin';

  @override
  String get colorCharcoal => 'Cărbune';

  @override
  String get colorBlindPaletteTitle => '';

  @override
  String get colorBlindPaletteSubtitle => '';

  @override
  String get hideChatsInsteadOfLocking =>
      'Ascunde chat-urile în loc să le blochezi';

  @override
  String get hideChatsInsteadOfLockingSubtitle =>
      'Când e dezactivat, chat-urile sunt vizibile dar protejate cu cod.';

  @override
  String get previousMatch => 'Potrivirea anterioară';

  @override
  String get nextMatch => 'Următoarea potrivire';

  @override
  String get selectSenderOnRight => 'Selectează cine este în dreapta';

  @override
  String couldNotOpenArchive(Object error) {
    return 'Nu s-a putut deschide arhiva:\n$error';
  }

  @override
  String couldNotOpenFile(Object message) {
    return 'Nu s-a putut deschide fișierul: $message';
  }

  @override
  String attachmentMissing(Object filename) {
    return 'Atașament lipsă: $filename';
  }

  @override
  String get unknownError => 'Eroare necunoscută';

  @override
  String get openPdf => 'Deschide PDF';

  @override
  String get openFile => 'Deschide fișier';

  @override
  String get openAudio => 'Deschide audio';

  @override
  String senderMeLabel(Object sender) {
    return '$sender (Eu)';
  }

  @override
  String get chatFileNotFound => 'Fișierul chatului nu a fost găsit.';

  @override
  String get languageTitle => 'Limbă';

  @override
  String get languageTooltip => 'Limbă';

  @override
  String get moreOptionsTooltip => 'Mai multe opțiuni';

  @override
  String get filterTitle => 'Filtru';

  @override
  String get filterDateRange => 'Interval de date';

  @override
  String get filterAnyDate => 'Orice dată';

  @override
  String get filterIncludeMedia => 'Includeți media';

  @override
  String get filterMediaOnly => 'Doar media';

  @override
  String get filterSenders => 'Expeditori';

  @override
  String get applyFilters => 'Aplică';

  @override
  String get clearFilters => 'Șterge filtrele';

  @override
  String get incrementalImportTitle => 'Chatul există deja';

  @override
  String incrementalImportMessage(Object name) {
    return 'Adăugați acest import la \"$name\"?';
  }

  @override
  String get incrementalAddAction => 'Adaugă';

  @override
  String get incrementalChooseTitle => 'Alegeți chatul de actualizat';

  @override
  String get incrementalUpdated => 'Chat actualizat.';

  @override
  String get languageSystem => 'Sistem';

  @override
  String get languageEnglish => 'Engleză';

  @override
  String get languageSpanish => 'Spaniolă';

  @override
  String get languageGerman => 'Germană';

  @override
  String get languageFrench => 'Franceză';

  @override
  String get languagePortuguese => 'Portugheză';

  @override
  String get languageRomanian => 'Română';

  @override
  String get languageAfrikaans => 'african';

  @override
  String get languageRussian => 'Rusă';

  @override
  String get showImportButton => 'Afișează butonul Import';

  @override
  String get showImportButtonSubtitle =>
      'Activează/dezactivează butonul Import ZIP pe ecranul principal.';

  @override
  String get importButtonHiddenMessage =>
      'Butonul de import este ascuns. Îl poți reactiva din Setări.';

  @override
  String get upgradeToAccessChat => 'Fă upgrade pentru a accesa acest chat.';

  @override
  String get aboutLegalTitle => 'Despre și legal';

  @override
  String get aboutLegalSummary =>
      'WhatsBackUp este un vizualizator offline pentru exporturile de chat WhatsApp. Chat-urile rămân pe dispozitivul tău.';

  @override
  String get aboutLegalRefundPolicy =>
      'Rambursări: dacă se acordă o rambursare, doar primele 5 chat-uri importate rămân accesibile. Chat-urile peste limita gratuită sunt dezactivate până la re-cumpărare.';

  @override
  String get aboutLegalDisclaimers =>
      'Declinări de responsabilitate: nu răspundem pentru pierderi de date, conținutul chat-urilor, acuratețea traducerilor sau utilizarea funcțiilor de blocare/ascundere. Păstrează propriile backup-uri.';

  @override
  String get aboutLegalAffiliation =>
      'Nu suntem afiliați cu WhatsApp sau Meta. WhatsApp este o marcă Meta Platforms, Inc.';

  @override
  String get aboutLegalSupport => 'Suport: vwdewaal@gmail.com';

  @override
  String get aboutLegalDeveloper => 'Dezvoltator: Van Wyk De Waal';

  @override
  String get aboutLegalJurisdiction => 'Jurisdicție: UE/Marea Britanie';

  @override
  String aboutLegalVersion(Object version) {
    return 'Versiunea aplicației: $version';
  }

  @override
  String get versionLoading => 'Versiunea aplicației: se încarcă...';

  @override
  String get languageScottishGaelic => 'Gaelică scoțiană';

  @override
  String get languageScots => 'Scoțieni';

  @override
  String get languageChinese => 'Chineză (mandarină)';

  @override
  String get languageHindi => 'Nu';

  @override
  String get languageArabic => 'arabic';

  @override
  String get languageBengali => 'Bengaleză';

  @override
  String get languageJapanese => 'japonez';

  @override
  String get languagePunjabi => 'Punjabi';

  @override
  String get languageKorean => 'coreean';

  @override
  String get languageTurkish => 'turc';

  @override
  String get languageItalian => 'italian';

  @override
  String get languageVietnamese => 'Vietnameză';

  @override
  String get languageUrdu => 'Urdu';

  @override
  String get languageIndonesian => 'Indoneziană';

  @override
  String get languageThai => 'Thailandeză';

  @override
  String get languagePolish => 'Lustrui';

  @override
  String get languageDutch => 'Olandeză';

  @override
  String get identifyMeTitle => 'Identifică-te';

  @override
  String get identifyMeSubtitle =>
      'Selectați-vă numele pentru a vă putea eticheta corect mesajele.';

  @override
  String get identifyMeNotNow => 'Nu acum';
}
