// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'WhatsBackUp';

  @override
  String get importZip => 'Importuj ZIP';

  @override
  String get importAction => 'Import';

  @override
  String get importingLabel => 'Importowanie';

  @override
  String get importDoneLabel => 'ZROBIONE!';

  @override
  String get importLargeStarted => 'Rozpoczęto importowanie';

  @override
  String get importTriggeredMessage =>
      'Importowanie zostało uruchomione w tle. Czat zostanie otwarty po zakończeniu. Proszę nie zamykać aplikacji.';

  @override
  String get mediaImportingTitle => 'Importowanie multimediów';

  @override
  String get mediaImportingSubtitle =>
      'Możesz przeczytać rozmowę, dopóki media się nie zakończą.';

  @override
  String get mediaImportPausedTitle => 'Wstrzymano import multimediów';

  @override
  String get mediaImportPausedSubtitle =>
      'Aby wznowić, ponownie wybierz oryginalny ZIP.';

  @override
  String get mediaImportFailedTitle => 'Nieudany import multimediów';

  @override
  String get mediaImportFailedSubtitle => 'Kliknij, aby spróbować ponownie.';

  @override
  String get mediaImportResumeAction => 'Wznawiać';

  @override
  String get mediaImportingLabel => 'Importowanie multimediów';

  @override
  String get contactLoadingLabel => 'Ładowanie kontaktu…';

  @override
  String get contactUnknownName => 'Kontakt';

  @override
  String get contactPhoneLabel => 'Telefon';

  @override
  String get contactEmailLabel => 'E-mail';

  @override
  String get openContactAction => 'Otwórz kontakt';

  @override
  String contactOpenFailed(Object error) {
    return 'Nie można otworzyć kontaktu: $error';
  }

  @override
  String get howToImport => 'Jak importować';

  @override
  String get settings => 'Ustawienia';

  @override
  String get searchTitle => 'Szukaj';

  @override
  String get textToInclude => 'Tekst do uwzględnienia:';

  @override
  String get enterSearchText => 'Wprowadź tekst do wyszukania...';

  @override
  String get dateRange => 'Zakres dat:';

  @override
  String get fromLabel => 'Z:';

  @override
  String get toLabel => 'Do:';

  @override
  String get selectLabel => 'Wybierać';

  @override
  String get showOnlyMediaFiles => 'Pokaż tylko pliki multimedialne';

  @override
  String get clearAction => 'Jasne';

  @override
  String get searchAction => 'Szukaj';

  @override
  String get renameChatTitle => 'Zmień nazwę czatu';

  @override
  String get chatNameHint => 'Nazwa czatu';

  @override
  String get cancelAction => 'Anulować';

  @override
  String get saveAction => 'Ratować';

  @override
  String get hideChatsTooltip => 'Ukryj czaty';

  @override
  String get hideAction => 'Ukrywać';

  @override
  String get lockAction => 'Zamek';

  @override
  String get noChatsYetHint =>
      'Brak czatów.\nUżyj opcji „Importuj ZIP”, aby załadować eksport WhatsApp,\nlub wyeksportuj bezpośrednio z WhatsApp, korzystając z opcji „Eksportuj czat” w czacie.';

  @override
  String get noArchivedChats => 'Brak zarchiwizowanych czatów.';

  @override
  String get tabChats => 'Czat';

  @override
  String get tabArchived => 'Zarchiwizowane';

  @override
  String get searchChatsHint => 'Szukaj czatów';

  @override
  String get enterCodeTitle => 'Wprowadź kod';

  @override
  String get upTo8DigitsHint => 'Do 8 cyfr';

  @override
  String get continueAction => 'Kontynuować';

  @override
  String get updatingHiddenChats => 'Aktualizowanie ukrytych czatów...';

  @override
  String get chatsUnhidden => 'Czaty nie są ukryte.';

  @override
  String get selectAtLeastOneChat => 'Wybierz co najmniej jeden czat.';

  @override
  String get hidingChats => 'Ukrywanie czatów...';

  @override
  String get lockingChats => 'Blokowanie czatów...';

  @override
  String get chatsHidden => 'Czaty są ukryte.';

  @override
  String get chatsUnlocked => 'Czaty odblokowane.';

  @override
  String get chatsLocked => 'Czat zablokowany.';

  @override
  String get unlockChatTitle => 'Odblokuj czat';

  @override
  String get enterPasscodeHint => 'Wprowadź kod dostępu';

  @override
  String get unlockAction => 'Odblokować';

  @override
  String get incorrectCode => 'Nieprawidłowy kod.';

  @override
  String importedOn(Object date) {
    return 'Zaimportowano $date';
  }

  @override
  String get unarchiveAction => 'Wycofaj z archiwum';

  @override
  String get archiveAction => 'Archiwum';

  @override
  String get deleteAction => 'Usuwać';

  @override
  String get deleteChatTitle => 'Usunąć czat?';

  @override
  String get deleteChatConfirm =>
      'Spowoduje to trwałe usunięcie archiwum i plików multimedialnych.';

  @override
  String get archiveFolderMissing => 'Brakuje folderu archiwum.';

  @override
  String updateFailedWithDetail(Object error) {
    return 'Aktualizacja nie powiodła się: $error';
  }

  @override
  String get renameAction => 'Przemianować';

  @override
  String get working => 'Pracujący...';

  @override
  String get importPreparing => 'Przygotowywanie importu...';

  @override
  String get importAnalyzing => 'Analizowanie pliku...';

  @override
  String get bookmarksLabel => 'Zakładki';

  @override
  String get previousBookmark => 'Poprzednia zakładka';

  @override
  String get nextBookmark => 'Następna zakładka';

  @override
  String get importLargeFileNotice =>
      'Wykryto duży plik. Może to potrwać kilka minut.';

  @override
  String get importExtracting => 'Wypakowywanie plików...';

  @override
  String get importFinalizing => 'Finalizowanie...';

  @override
  String importFailedWithDetail(Object error) {
    return 'Import nie powiódł się: $error';
  }

  @override
  String get sharedFileNotZip => 'Udostępniony plik nie jest ZIP.';

  @override
  String get unlockProToImportMoreChats =>
      'Odblokuj BackupChat Pro, aby zaimportować więcej czatów.';

  @override
  String get purchaseFailedTryAgain =>
      'Zakup nie powiódł się. Spróbuj ponownie.';

  @override
  String get importErrorOnlyZip => 'Obsługiwane są tylko pliki .zip.';

  @override
  String get importErrorNoChatText =>
      'Nie znaleziono pliku tekstowego czatu WhatsApp w ZIP.';

  @override
  String get importErrorAlreadyImported => 'Ten czat został już zaimportowany.';

  @override
  String get howToImportTitle => 'Jak importować';

  @override
  String get chooseImportMethodTitle => 'Wybierz metodę importu';

  @override
  String get iosExportTitle => 'Eksport z WhatsApp (iOS)';

  @override
  String get androidExportTitle => 'Eksport z WhatsApp (Android)';

  @override
  String get iosStepOpenChat => 'W aplikacji WhatsApp kliknij czat.';

  @override
  String get androidStepOpenChat =>
      'W aplikacji WhatsApp kliknij, aby rozpocząć czat.';

  @override
  String get iosStepOpenInfo => 'Kliknij na nazwisko osoby lub grupy u góry.';

  @override
  String get androidStepOpenMenu => 'Kliknij menu.';

  @override
  String get iosStepExportChat =>
      'Przewiń na dół i wybierz opcję Eksportuj czat.';

  @override
  String get androidStepMoreExport => 'Wybierz „Więcej”.';

  @override
  String get iosStepChooseMedia =>
      'Z menu wyboru aplikacji (arkusz udostępniania) wybierz WhatsBackUp (w starszych telefonach zapisz do plików).';

  @override
  String get androidStepChooseMedia => 'Wybierz opcję Eksportuj czat.';

  @override
  String get iosStepShareToApp => 'Czat zostanie zaimportowany do WhatsBackUp.';

  @override
  String get androidStepShareToApp =>
      'Z menu wyboru aplikacji (arkusz udostępniania) wybierz WhatsBackUp (w starszych telefonach zapisz do plików).';

  @override
  String get iosStepSaveToFiles =>
      'Czat zostanie zaimportowany do WhatsBackUp.';

  @override
  String get androidStepSaveToDevice =>
      'Czat zostanie zaimportowany do WhatsBackUp.';

  @override
  String get androidLargeImportNote =>
      'Należy pamiętać, że w przypadku starszych telefonów z systemem Android importowanie bardzo dużych czatów może potrwać do minuty.';

  @override
  String get importZipTitle => 'Importuj zapisany plik ZIP';

  @override
  String get iosStepImportZip =>
      'W WhatsBackUp dotknij „Importuj z ZIP” i wybierz plik z Plików.';

  @override
  String get androidStepImportZip =>
      'W aplikacji WhatsBackUp kliknij „Importuj z ZIP” i wybierz plik ze swojego urządzenia.';

  @override
  String get managingChatsTitle => 'Zarządzanie czatami';

  @override
  String get hideChatsWithCodeTitle => 'Ukryj czaty za pomocą kodu';

  @override
  String get stepTapGhostIcon => 'Kliknij ikonę ducha na górnym pasku.';

  @override
  String get stepEnterCodeUpTo8Digits => 'Wprowadź kod (do 8 cyfr).';

  @override
  String get stepSelectChatsSubmitHide =>
      'Wybierz czaty i kliknij Prześlij, aby je ukryć.';

  @override
  String get stepEnterSameCodeUnhide =>
      'Wprowadź ten sam kod ponownie, aby wyświetlić te czaty.';

  @override
  String get stepDifferentCodesHideSets =>
      'Różne kody mogą ukrywać różne zestawy czatów.';

  @override
  String get lockChatsWithCodeTitle => 'Blokowanie czatów za pomocą kodu';

  @override
  String get stepSwitchHideToLockMode =>
      'W Ustawieniach przełącz z trybu Ukryj na tryb Zablokuj.';

  @override
  String get stepTapGhostIconEnterCode => 'Kliknij ikonę ducha i wprowadź kod.';

  @override
  String get stepSelectChatsSubmitLock =>
      'Wybierz czaty i kliknij Prześlij, aby je zablokować.';

  @override
  String get stepLockedChatsRequireCode =>
      'Zablokowane czaty są oznaczone ikoną kłódki i do ich otwarcia wymagany jest kod.';

  @override
  String get archiveOrDeleteTitle => 'Archiwizuj lub usuń';

  @override
  String get stepSwipeRightArchive =>
      'Przesuń w prawo, aby zarchiwizować lub przywrócić z archiwum.';

  @override
  String get stepSwipeLeftDelete =>
      'Przesuń w lewo, aby usunąć (wymagane potwierdzenie).';

  @override
  String get bullet => '•';

  @override
  String get welcomeTitle => 'Powitanie';

  @override
  String get gotItAction => 'Zrozumiałem';

  @override
  String get settingsTitle => 'Ustawienia';

  @override
  String get sectionFont => 'Chrzcielnica';

  @override
  String get sectionColor => 'Kolor';

  @override
  String get sectionAccessibility => 'Dostępność';

  @override
  String get sectionPrivacy => 'Prywatność';

  @override
  String get sectionPro => 'BackupChat Pro';

  @override
  String get sectionStorage => 'Składowanie';

  @override
  String get storageTitle => 'Składowanie';

  @override
  String get storageSubtitle =>
      'Wyświetl przestrzeń na urządzeniu i pamięć czatu';

  @override
  String get storageAvailable => 'Dostępne miejsce do przechowywania';

  @override
  String get storageAppSize => 'Rozmiar WhatsBackUp (wliczając czaty)';

  @override
  String get storageLocation => 'Miejsce przechowywania';

  @override
  String get storageLocationUnknown => 'Nieznany';

  @override
  String get storageCalculate => 'Obliczać';

  @override
  String get storageCalculating => 'Obliczenie…';

  @override
  String get storageNotCalculated => 'Nie obliczono';

  @override
  String storageLastCalculated(Object date) {
    return 'Ostatnie obliczenia: $date';
  }

  @override
  String get storageLastCalculatedNone => 'Ostatnie obliczenia: —';

  @override
  String get storageChatSizesToggle => 'Pokaż rozmiary czatu na liście';

  @override
  String get storageChatSizesSubtitle =>
      'Pokazuje całkowity rozmiar każdego czatu na ekranie głównym';

  @override
  String get storageCleanupTitle => 'Wyczyść nieudane importy';

  @override
  String get storageCleanupSubtitle =>
      'Usuwa niekompletne lub nieudane importy do wolnej przestrzeni.';

  @override
  String get storageCleanupEstimate => 'Szacunkowa ilość miejsca do zwolnienia';

  @override
  String get storageCleanupAction => 'Wyczyść teraz';

  @override
  String get storageCleanupNone => 'Nie znaleziono nieudanych importów.';

  @override
  String storageCleanupDone(Object size) {
    return 'Wyczyszczono $size nieudanych importów.';
  }

  @override
  String storageCleanupLast(Object time) {
    return 'Ostatnie czyszczenie: $time';
  }

  @override
  String get proActiveTitle => 'Pro jest aktywny';

  @override
  String get proUpgradeTitle => 'Zaktualizuj do BackupChat Pro';

  @override
  String get proThankYouSubtitle => 'Dziękujemy za wsparcie aplikacji.';

  @override
  String get proUnlockSubtitle => 'Odblokuj nieograniczony import.';

  @override
  String get debugProOverrideTitle => 'Debugowanie: Force Pro';

  @override
  String get debugProOverrideSubtitle =>
      'Lokalne nadpisanie na potrzeby testowania (nie wymaga zakupu).';

  @override
  String paywallResult(Object result) {
    return 'Wynik płatności: $result.';
  }

  @override
  String get purchaseCancelled => 'Zakup anulowany.';

  @override
  String get restorePurchases => 'Przywróć zakupy';

  @override
  String get purchasesRestored => 'Zakupy przywrócone.';

  @override
  String get restoreFailedTryAgain =>
      'Przywracanie nie powiodło się. Spróbuj ponownie.';

  @override
  String get manageSubscription => 'Zarządzaj subskrypcją';

  @override
  String get openCustomerCenter => 'Otwórz Centrum Obsługi Klienta RevenueCat.';

  @override
  String get customerCenterUnavailable =>
      'Centrum obsługi klienta jest niedostępne.';

  @override
  String get sectionAbout => 'O';

  @override
  String get aboutDescription =>
      'WhatsBackUp to prywatna, offline przeglądarka eksportów czatów WhatsApp. Importuj pliki ZIP lub eksportuj je bezpośrednio z WhatsApp, aby zachować przejrzyste, przeszukiwalne archiwum z multimediami — bez konieczności korzystania z sieci.';

  @override
  String get sectionAboutDeveloper => 'O deweloperze';

  @override
  String get aboutDeveloperDescription =>
      'Stworzony przez niezależnego programistę, który kładzie nacisk na prywatność, szybkie wyszukiwanie i czyste archiwa czatów.';

  @override
  String get sectionHelp => 'Pomoc';

  @override
  String get showOnboardingAgain => 'Pokaż ponownie wprowadzenie';

  @override
  String get sdkConfigTitle => 'Konfiguracja SDK';

  @override
  String get publicKeyLabel => 'Klucz publiczny';

  @override
  String get offeringIdLabel => 'Identyfikator oferty';

  @override
  String get entitlementIdLabel => 'Identyfikator uprawnienia';

  @override
  String get lifetimeProductIdLabel => 'Identyfikator produktu na całe życie';

  @override
  String errorLabel(Object error) {
    return 'Błąd: $error';
  }

  @override
  String get offeringsTitle => 'Oferty';

  @override
  String get currentOfferingLabel => 'Aktualna oferta';

  @override
  String get allOfferingsLabel => 'Wszystkie oferty';

  @override
  String get customerInfoTitle => 'Informacje o kliencie';

  @override
  String get activeEntitlementsLabel => 'Aktywne uprawnienia';

  @override
  String get originalAppUserIdLabel =>
      'Oryginalny identyfikator użytkownika aplikacji';

  @override
  String get managementUrlLabel => 'Adres URL zarządzania';

  @override
  String get noneLabel => 'nic';

  @override
  String get refreshAction => 'Odświeżać';

  @override
  String get noPackagesAvailable => 'Brak dostępnych pakietów.';

  @override
  String get packagesTitle => 'Pakiety';

  @override
  String get fontSystem => 'System';

  @override
  String get fontSerif => 'Szeryfowy';

  @override
  String get fontMono => 'Mononukleoza';

  @override
  String get accessibilityFontSizeTitle => 'Rozmiar czcionki';

  @override
  String get accessibilityFontSizeSubtitle =>
      'Dostosuj rozmiar tekstu w całej aplikacji.';

  @override
  String get accessibilityFontPreview =>
      'To jest przykładowy dymek wiadomości.\nPokazuje, jak będzie wyglądał tekst czatu.\nDostosuj rozmiar suwakiem.';

  @override
  String get accessibilityHighContrastTitle => 'Tryb wysokiego kontrastu';

  @override
  String get accessibilityHighContrastSubtitle =>
      'Zwiększ kontrast dla lepszej czytelności.';

  @override
  String get colorWhatsAppGreen => 'WhatsApp Zielony';

  @override
  String get colorDeepTeal => 'Głęboki turkus';

  @override
  String get colorNavy => 'Marynarka wojenna';

  @override
  String get colorCharcoal => 'Węgiel drzewny';

  @override
  String get colorBlindPaletteTitle => 'Paleta dla daltonistów';

  @override
  String get colorBlindPaletteSubtitle =>
      'Użyj palety dostosowanej do osób z zaburzeniami widzenia kolorów.';

  @override
  String get hideChatsInsteadOfLocking => 'Ukryj czaty zamiast je blokować';

  @override
  String get hideChatsInsteadOfLockingSubtitle =>
      'Po wyłączeniu czaty są widoczne, ale chronione hasłem.';

  @override
  String get previousMatch => 'Poprzedni mecz';

  @override
  String get nextMatch => 'Następny mecz';

  @override
  String get selectSenderOnRight => 'Wybierz nadawcę po prawej stronie';

  @override
  String couldNotOpenArchive(Object error) {
    return 'Nie można otworzyć archiwum:\n$error';
  }

  @override
  String couldNotOpenFile(Object message) {
    return 'Nie można otworzyć pliku: $message';
  }

  @override
  String attachmentMissing(Object filename) {
    return 'Brak załącznika: $filename';
  }

  @override
  String get unknownError => 'Nieznany błąd';

  @override
  String get openPdf => 'Otwórz PDF';

  @override
  String get openFile => 'Otwórz plik';

  @override
  String get openAudio => 'Otwórz dźwięk';

  @override
  String senderMeLabel(Object sender) {
    return '$sender (Ja)';
  }

  @override
  String get chatFileNotFound => 'Plik czatu nie został znaleziony.';

  @override
  String get languageTitle => 'Język';

  @override
  String get languageTooltip => 'Język';

  @override
  String get moreOptionsTooltip => 'Więcej opcji';

  @override
  String get filterTitle => 'Filtr';

  @override
  String get filterDateRange => 'Zakres dat';

  @override
  String get filterAnyDate => 'Dowolna data';

  @override
  String get filterIncludeMedia => 'Uwzględnij media';

  @override
  String get filterMediaOnly => 'Tylko media';

  @override
  String get filterSenders => 'Nadawcy';

  @override
  String get applyFilters => 'Stosować';

  @override
  String get clearFilters => 'Wyczyść filtry';

  @override
  String get incrementalImportTitle => 'Czat już istnieje';

  @override
  String incrementalImportMessage(Object name) {
    return 'Dodać ten import do „$name”?';
  }

  @override
  String get incrementalAddAction => 'Dodać';

  @override
  String get incrementalChooseTitle => 'Wybierz czat, aby zaktualizować';

  @override
  String get incrementalUpdated => 'Czat zaktualizowany.';

  @override
  String get languageSystem => 'System';

  @override
  String get languageEnglish => 'angielski';

  @override
  String get languageSpanish => 'hiszpański';

  @override
  String get languageGerman => 'niemiecki';

  @override
  String get languageFrench => 'francuski';

  @override
  String get languagePortuguese => 'portugalski';

  @override
  String get languageRomanian => 'rumuński';

  @override
  String get languageAfrikaans => 'Afrykanerski';

  @override
  String get languageRussian => 'rosyjski';

  @override
  String get showImportButton => 'Pokaż przycisk Importuj';

  @override
  String get showImportButtonSubtitle =>
      'Kliknij przycisk Importuj ZIP na ekranie głównym.';

  @override
  String get importButtonHiddenMessage =>
      'Przycisk Importuj jest ukryty. Możesz go ponownie włączyć w Ustawieniach.';

  @override
  String get upgradeToAccessChat =>
      'Zaktualizuj, aby uzyskać dostęp do tego czatu.';

  @override
  String get aboutLegalTitle => 'O nas i informacje prawne';

  @override
  String get aboutLegalSummary =>
      'WhatsBackUp to przeglądarka offline eksportująca czaty WhatsApp. Twoje czaty pozostają na Twoim urządzeniu.';

  @override
  String get aboutLegalRefundPolicy =>
      'Zwroty: W przypadku zwrotu, dostępnych pozostaje tylko pierwszych 5 zaimportowanych czatów. Czaty powyżej limitu bezpłatnego są wyłączane do czasu ponownego zakupu.';

  @override
  String get aboutLegalDisclaimers =>
      'Zastrzeżenia: Nie ponosimy odpowiedzialności za utratę danych, treść czatu, dokładność tłumaczenia ani korzystanie z funkcji blokowania/ukrywania. Prosimy o zachowanie własnych kopii zapasowych.';

  @override
  String get aboutLegalAffiliation =>
      'Nie jest powiązane z WhatsApp ani Meta. WhatsApp jest znakiem towarowym Meta Platforms, Inc.';

  @override
  String get aboutLegalSupport => 'Wsparcie: vwdewaal@gmail.com';

  @override
  String get aboutLegalDeveloper => 'Deweloper: Van Wyk De Waal';

  @override
  String get aboutLegalJurisdiction => 'Jurysdykcja: UE/Wielka Brytania';

  @override
  String aboutLegalVersion(Object version) {
    return 'Wersja aplikacji: $version';
  }

  @override
  String get versionLoading => 'Wersja aplikacji: ładowanie...';

  @override
  String get languageScottishGaelic => 'szkocki gaelicki';

  @override
  String get languageScots => 'Szkoci';

  @override
  String get languageChinese => 'chiński (mandaryński)';

  @override
  String get languageHindi => 'hinduski';

  @override
  String get languageArabic => 'arabski';

  @override
  String get languageBengali => 'bengalski';

  @override
  String get languageJapanese => 'japoński';

  @override
  String get languagePunjabi => 'Pendżabski';

  @override
  String get languageKorean => 'koreański';

  @override
  String get languageTurkish => 'turecki';

  @override
  String get languageItalian => 'włoski';

  @override
  String get languageVietnamese => 'wietnamski';

  @override
  String get languageUrdu => 'Urdu';

  @override
  String get languageIndonesian => 'indonezyjski';

  @override
  String get languageThai => 'tajski';

  @override
  String get languagePolish => 'Polski';

  @override
  String get languageDutch => 'Holenderski';

  @override
  String get identifyMeTitle => 'Zidentyfikuj się';

  @override
  String get identifyMeSubtitle =>
      'Wybierz swoją nazwę, abyśmy mogli poprawnie oznaczyć Twoje wiadomości.';

  @override
  String get identifyMeNotNow => 'Nie teraz';
}
