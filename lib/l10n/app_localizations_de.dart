// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'WhatsBackUp';

  @override
  String get importZip => 'ZIP importieren';

  @override
  String get importAction => 'Import';

  @override
  String get importingLabel => 'Importieren';

  @override
  String get importDoneLabel => 'ERLEDIGT!';

  @override
  String get importLargeStarted => 'Import gestartet';

  @override
  String get importTriggeredMessage =>
      'Der Importvorgang läuft im Hintergrund. Der Chat öffnet sich, sobald er abgeschlossen ist. Bitte lassen Sie die App geöffnet.';

  @override
  String get mediaImportingTitle => 'Medien importieren';

  @override
  String get mediaImportingSubtitle =>
      'Sie können den Chat lesen, während die Medienübertragung endet.';

  @override
  String get mediaImportPausedTitle => 'Medienimport pausiert';

  @override
  String get mediaImportPausedSubtitle =>
      'Wählen Sie die ursprüngliche ZIP-Datei erneut aus, um fortzufahren.';

  @override
  String get mediaImportFailedTitle => 'Medienimport fehlgeschlagen';

  @override
  String get mediaImportFailedSubtitle => 'Zum erneuten Versuch tippen.';

  @override
  String get mediaImportResumeAction => 'Wieder aufnehmen';

  @override
  String get mediaImportingLabel => 'Medienimport';

  @override
  String get contactLoadingLabel => 'Kontakt wird geladen…';

  @override
  String get contactUnknownName => 'Kontakt';

  @override
  String get contactPhoneLabel => 'Telefon';

  @override
  String get contactEmailLabel => 'E-Mail';

  @override
  String get openContactAction => 'Offener Kontakt';

  @override
  String contactOpenFailed(Object error) {
    return 'Kontakt konnte nicht geöffnet werden: $error';
  }

  @override
  String get howToImport => 'So importierst du';

  @override
  String get settings => 'Einstellungen';

  @override
  String get searchTitle => 'Suchen';

  @override
  String get textToInclude => 'Text enthalten:';

  @override
  String get enterSearchText => 'Suchtext eingeben...';

  @override
  String get dateRange => 'Datumsbereich:';

  @override
  String get fromLabel => 'Von:';

  @override
  String get toLabel => 'Bis:';

  @override
  String get selectLabel => 'Auswählen';

  @override
  String get showOnlyMediaFiles => 'Nur Mediendateien anzeigen';

  @override
  String get clearAction => 'Zurücksetzen';

  @override
  String get searchAction => 'Suchen';

  @override
  String get renameChatTitle => 'Chat umbenennen';

  @override
  String get chatNameHint => 'Chatname';

  @override
  String get cancelAction => 'Abbrechen';

  @override
  String get saveAction => 'Speichern';

  @override
  String get hideChatsTooltip => 'Chats ausblenden';

  @override
  String get hideAction => 'Ausblenden';

  @override
  String get lockAction => 'Sperren';

  @override
  String get noChatsYetHint =>
      'Noch keine Chats.\nVerwende \"ZIP importieren\", um einen WhatsApp-Export zu laden,\noder exportiere direkt aus WhatsApp über die Option Chat exportieren.';

  @override
  String get noArchivedChats => 'Keine archivierten Chats.';

  @override
  String get tabChats => 'Chats';

  @override
  String get tabArchived => 'Archiviert';

  @override
  String get searchChatsHint => 'Chats suchen';

  @override
  String get enterCodeTitle => 'Code eingeben';

  @override
  String get upTo8DigitsHint => 'Bis zu 8 Ziffern';

  @override
  String get continueAction => 'Weiter';

  @override
  String get updatingHiddenChats =>
      'Ausgeblendete Chats werden aktualisiert...';

  @override
  String get chatsUnhidden => 'Chats eingeblendet.';

  @override
  String get selectAtLeastOneChat => 'Wähle mindestens einen Chat aus.';

  @override
  String get hidingChats => 'Chats werden ausgeblendet...';

  @override
  String get lockingChats => 'Chats werden gesperrt...';

  @override
  String get chatsHidden => 'Chats ausgeblendet.';

  @override
  String get chatsUnlocked => 'Chats entsperrt.';

  @override
  String get chatsLocked => 'Chats gesperrt.';

  @override
  String get unlockChatTitle => 'Chat entsperren';

  @override
  String get enterPasscodeHint => 'Code eingeben';

  @override
  String get unlockAction => 'Entsperren';

  @override
  String get incorrectCode => 'Falscher Code.';

  @override
  String importedOn(Object date) {
    return 'Importiert $date';
  }

  @override
  String get unarchiveAction => 'Aus Archiv entfernen';

  @override
  String get archiveAction => 'Archivieren';

  @override
  String get deleteAction => 'Löschen';

  @override
  String get deleteChatTitle => 'Chat löschen?';

  @override
  String get deleteChatConfirm =>
      'Dadurch werden Archiv und Medien dauerhaft gelöscht.';

  @override
  String get archiveFolderMissing => 'Archivordner fehlte.';

  @override
  String updateFailedWithDetail(Object error) {
    return 'Aktualisierung fehlgeschlagen: $error';
  }

  @override
  String get renameAction => 'Umbenennen';

  @override
  String get working => 'Wird ausgeführt...';

  @override
  String get importPreparing => 'Import wird vorbereitet...';

  @override
  String get importAnalyzing => 'Datei wird analysiert...';

  @override
  String get bookmarksLabel => 'Lesezeichen';

  @override
  String get previousBookmark => 'Vorheriges Lesezeichen';

  @override
  String get nextBookmark => 'Nächstes Lesezeichen';

  @override
  String get importLargeFileNotice =>
      'Große Datei erkannt. Dies kann einige Minuten dauern.';

  @override
  String get importExtracting => 'Dateien werden entpackt...';

  @override
  String get importFinalizing => 'Wird abgeschlossen...';

  @override
  String importFailedWithDetail(Object error) {
    return 'Import fehlgeschlagen: $error';
  }

  @override
  String get sharedFileNotZip => 'Geteilte Datei ist kein ZIP.';

  @override
  String get unlockProToImportMoreChats =>
      'BackupChat Pro freischalten, um mehr Chats zu importieren.';

  @override
  String get purchaseFailedTryAgain =>
      'Kauf fehlgeschlagen. Bitte erneut versuchen.';

  @override
  String get importErrorOnlyZip => 'Nur .zip-Dateien werden unterstützt.';

  @override
  String get importErrorNoChatText =>
      'Keine WhatsApp-Chat-Textdatei im ZIP gefunden.';

  @override
  String get importErrorAlreadyImported =>
      'Dieser Chat wurde bereits importiert.';

  @override
  String get howToImportTitle => 'So importierst du';

  @override
  String get chooseImportMethodTitle => 'Wähle deine Importmethode';

  @override
  String get iosExportTitle => 'Export aus WhatsApp (iOS)';

  @override
  String get androidExportTitle => 'Export aus WhatsApp (Android)';

  @override
  String get iosStepOpenChat =>
      'Öffne die WhatsApp-App und klicke auf den Chat.';

  @override
  String get androidStepOpenChat =>
      'Öffne die WhatsApp-App und klicke auf einen Chat.';

  @override
  String get iosStepOpenInfo =>
      'Klicken Sie oben auf den Namen der Person oder Gruppe.';

  @override
  String get androidStepOpenMenu => 'Klicken Sie auf das Menü.';

  @override
  String get iosStepExportChat =>
      'Scrollen Sie ganz nach unten und wählen Sie „Chat exportieren“.';

  @override
  String get androidStepMoreExport => 'Wählen Sie „Mehr“.';

  @override
  String get iosStepChooseMedia =>
      'Im App-Auswahlmenü (Teilen-Menü) wählen Sie WhatsBackUp (bei älteren Telefonen: Unter Dateien speichern).';

  @override
  String get androidStepChooseMedia => 'Chat exportieren auswählen.';

  @override
  String get iosStepShareToApp => 'Der Chat wird in WhatsBackUp importiert.';

  @override
  String get androidStepShareToApp =>
      'Im App-Auswahlmenü (Teilen-Menü) wählen Sie WhatsBackUp (bei älteren Telefonen: Unter Dateien speichern).';

  @override
  String get iosStepSaveToFiles => 'Der Chat wird in WhatsBackUp importiert.';

  @override
  String get androidStepSaveToDevice =>
      'Der Chat wird in WhatsBackUp importiert.';

  @override
  String get androidLargeImportNote =>
      'Bitte beachten Sie, dass bei älteren Android-Telefonen der Import sehr großer Chats bis zu einer Minute dauern kann.';

  @override
  String get importZipTitle => 'Eine gespeicherte ZIP-Datei importieren';

  @override
  String get iosStepImportZip =>
      'Tippen Sie in WhatsBackUp auf „Aus ZIP importieren“ und wählen Sie die Datei aus dem Ordner „Dateien“ aus.';

  @override
  String get androidStepImportZip =>
      'Tippen Sie in WhatsBackUp auf „Aus ZIP importieren“ und wählen Sie die Datei von Ihrem Gerät aus.';

  @override
  String get managingChatsTitle => 'Chats verwalten';

  @override
  String get hideChatsWithCodeTitle => 'Chats mit einem Code ausblenden';

  @override
  String get stepTapGhostIcon =>
      'Tippe auf das Geister-Icon in der oberen Leiste.';

  @override
  String get stepEnterCodeUpTo8Digits =>
      'Gib einen Code ein (bis zu 8 Ziffern).';

  @override
  String get stepSelectChatsSubmitHide =>
      'Chats auswählen und auf Senden tippen, um sie auszublenden.';

  @override
  String get stepEnterSameCodeUnhide =>
      'Gib denselben Code erneut ein, um die Chats einzublenden.';

  @override
  String get stepDifferentCodesHideSets =>
      'Verschiedene Codes können unterschiedliche Chat-Gruppen ausblenden.';

  @override
  String get lockChatsWithCodeTitle => 'Chats mit einem Code sperren';

  @override
  String get stepSwitchHideToLockMode =>
      'In den Einstellungen von Ausblenden zu Sperren wechseln.';

  @override
  String get stepTapGhostIconEnterCode =>
      'Tippe auf das Geister-Icon und gib einen Code ein.';

  @override
  String get stepSelectChatsSubmitLock =>
      'Chats auswählen und auf Senden tippen, um sie zu sperren.';

  @override
  String get stepLockedChatsRequireCode =>
      'Gesperrte Chats zeigen ein Schloss und benötigen den Code zum Öffnen.';

  @override
  String get archiveOrDeleteTitle => 'Archivieren oder löschen';

  @override
  String get stepSwipeRightArchive =>
      'Nach rechts wischen, um zu archivieren oder zu entarchivieren.';

  @override
  String get stepSwipeLeftDelete =>
      'Nach links wischen, um zu löschen (Bestätigung erforderlich).';

  @override
  String get bullet => '•';

  @override
  String get welcomeTitle => 'Willkommen';

  @override
  String get gotItAction => 'Alles klar';

  @override
  String get settingsTitle => 'Einstellungen';

  @override
  String get sectionFont => 'Schriftart';

  @override
  String get sectionColor => 'Farbe';

  @override
  String get sectionAccessibility => '';

  @override
  String get sectionPrivacy => 'Datenschutz';

  @override
  String get sectionPro => 'BackupChat Pro';

  @override
  String get sectionStorage => 'Lagerung';

  @override
  String get storageTitle => 'Lagerung';

  @override
  String get storageSubtitle =>
      'Gerätespeicherplatz und Chat-Speicher anzeigen';

  @override
  String get storageAvailable => 'Verfügbarer Speicherplatz';

  @override
  String get storageAppSize => 'WhatsBackUp-Größe (einschließlich Chats)';

  @override
  String get storageLocation => 'Lagerort';

  @override
  String get storageLocationUnknown => 'Unbekannt';

  @override
  String get storageCalculate => 'Berechnen';

  @override
  String get storageCalculating => 'Berechnung läuft…';

  @override
  String get storageNotCalculated => 'Nicht berechnet';

  @override
  String storageLastCalculated(Object date) {
    return 'Zuletzt berechnet: $date';
  }

  @override
  String get storageLastCalculatedNone => 'Zuletzt berechnet: —';

  @override
  String get storageChatSizesToggle => 'Chatgrößen in der Liste anzeigen';

  @override
  String get storageChatSizesSubtitle =>
      'Zeigt die Gesamtgröße jedes Chats auf dem Hauptbildschirm an.';

  @override
  String get storageCleanupTitle => 'Bereinigen fehlgeschlagener Importe';

  @override
  String get storageCleanupSubtitle =>
      'Entfernt unvollständige oder fehlgeschlagene Importe, um Speicherplatz freizugeben.';

  @override
  String get storageCleanupEstimate =>
      'Geschätzter freizugebender Speicherplatz';

  @override
  String get storageCleanupAction => 'Jetzt reinigen';

  @override
  String get storageCleanupNone =>
      'Es wurden keine fehlgeschlagenen Importe gefunden.';

  @override
  String storageCleanupDone(Object size) {
    return 'Bereinigt $size von fehlgeschlagenen Importen.';
  }

  @override
  String storageCleanupLast(Object time) {
    return 'Letzte Bereinigung: $time';
  }

  @override
  String get proActiveTitle => 'Pro ist aktiv';

  @override
  String get proUpgradeTitle => 'Upgrade auf BackupChat Pro';

  @override
  String get proThankYouSubtitle => 'Danke für die Unterstützung der App.';

  @override
  String get proUnlockSubtitle => 'Unbegrenzte Importe freischalten.';

  @override
  String get debugProOverrideTitle => 'Debug: Force Pro';

  @override
  String get debugProOverrideSubtitle =>
      'Lokale Überschreibung zu Testzwecken (kein Kauf erforderlich).';

  @override
  String paywallResult(Object result) {
    return 'Paywall-Ergebnis: $result.';
  }

  @override
  String get purchaseCancelled => 'Kauf abgebrochen.';

  @override
  String get restorePurchases => 'Käufe wiederherstellen';

  @override
  String get purchasesRestored => 'Käufe wiederhergestellt.';

  @override
  String get restoreFailedTryAgain =>
      'Wiederherstellung fehlgeschlagen. Bitte erneut versuchen.';

  @override
  String get manageSubscription => 'Abonnement verwalten';

  @override
  String get openCustomerCenter => 'RevenueCat Customer Center öffnen.';

  @override
  String get customerCenterUnavailable => 'Customer Center nicht verfügbar.';

  @override
  String get sectionAbout => 'Über';

  @override
  String get aboutDescription =>
      'WhatsBackUp ist ein privater Offline-Viewer für WhatsApp-Chat-Exporte. Importiere ZIP-Dateien oder exportiere direkt aus WhatsApp, um ein sauberes, durchsuchbares Archiv mit Medien zu behalten — ohne Netzwerk.';

  @override
  String get sectionAboutDeveloper => 'Über den Entwickler';

  @override
  String get aboutDeveloperDescription =>
      'Erstellt von einem unabhängigen Entwickler mit Fokus auf Datenschutz, schnelle Suche und saubere Chat-Archive.';

  @override
  String get sectionHelp => 'Hilfe';

  @override
  String get showOnboardingAgain => 'Einführung erneut anzeigen';

  @override
  String get sdkConfigTitle => 'SDK-Konfiguration';

  @override
  String get publicKeyLabel => 'Öffentlicher Schlüssel';

  @override
  String get offeringIdLabel => 'Angebots-ID';

  @override
  String get entitlementIdLabel => 'Berechtigungs-ID';

  @override
  String get lifetimeProductIdLabel => 'Lebenslange Produkt-ID';

  @override
  String errorLabel(Object error) {
    return 'Fehler: $error';
  }

  @override
  String get offeringsTitle => 'Angebote';

  @override
  String get currentOfferingLabel => 'Aktuelles Angebot';

  @override
  String get allOfferingsLabel => 'Alle Angebote';

  @override
  String get customerInfoTitle => 'Kundeninfo';

  @override
  String get activeEntitlementsLabel => 'Aktive Berechtigungen';

  @override
  String get originalAppUserIdLabel => 'Originale App-User-ID';

  @override
  String get managementUrlLabel => 'Verwaltungs-URL';

  @override
  String get noneLabel => 'keine';

  @override
  String get refreshAction => 'Aktualisieren';

  @override
  String get noPackagesAvailable => 'Keine Pakete verfügbar.';

  @override
  String get packagesTitle => 'Pakete';

  @override
  String get fontSystem => 'System';

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
  String get colorWhatsAppGreen => 'WhatsApp-Grün';

  @override
  String get colorDeepTeal => 'Dunkles Türkis';

  @override
  String get colorNavy => 'Marineblau';

  @override
  String get colorCharcoal => 'Anthrazit';

  @override
  String get colorBlindPaletteTitle => '';

  @override
  String get colorBlindPaletteSubtitle => '';

  @override
  String get hideChatsInsteadOfLocking => 'Chats ausblenden statt sperren';

  @override
  String get hideChatsInsteadOfLockingSubtitle =>
      'Wenn aus, sind Chats sichtbar, aber durch Code geschützt.';

  @override
  String get previousMatch => 'Vorheriger Treffer';

  @override
  String get nextMatch => 'Nächster Treffer';

  @override
  String get selectSenderOnRight => 'Wähle, wer rechts ist';

  @override
  String couldNotOpenArchive(Object error) {
    return 'Archiv konnte nicht geöffnet werden:\n$error';
  }

  @override
  String couldNotOpenFile(Object message) {
    return 'Datei konnte nicht geöffnet werden: $message';
  }

  @override
  String attachmentMissing(Object filename) {
    return 'Anhang fehlt: $filename';
  }

  @override
  String get unknownError => 'Unbekannter Fehler';

  @override
  String get openPdf => 'PDF öffnen';

  @override
  String get openFile => 'Datei öffnen';

  @override
  String get openAudio => 'Audio öffnen';

  @override
  String senderMeLabel(Object sender) {
    return '$sender (Ich)';
  }

  @override
  String get chatFileNotFound => 'Chat-Datei nicht gefunden.';

  @override
  String get languageTitle => 'Sprache';

  @override
  String get languageTooltip => 'Sprache';

  @override
  String get moreOptionsTooltip => 'Weitere Optionen';

  @override
  String get filterTitle => 'Filter';

  @override
  String get filterDateRange => 'Datumsbereich';

  @override
  String get filterAnyDate => 'Beliebiges Datum';

  @override
  String get filterIncludeMedia => 'Medien einschließen';

  @override
  String get filterMediaOnly => 'Nur Medien';

  @override
  String get filterSenders => 'Absender';

  @override
  String get applyFilters => 'Anwenden';

  @override
  String get clearFilters => 'Filter löschen';

  @override
  String get incrementalImportTitle => 'Chat existiert bereits';

  @override
  String incrementalImportMessage(Object name) {
    return 'Diesen Import zu \"$name\" hinzufügen?';
  }

  @override
  String get incrementalAddAction => 'Hinzufügen';

  @override
  String get incrementalChooseTitle => 'Chat zum Aktualisieren auswählen';

  @override
  String get incrementalUpdated => 'Chat aktualisiert.';

  @override
  String get languageSystem => 'System';

  @override
  String get languageEnglish => 'Englisch';

  @override
  String get languageSpanish => 'Spanisch';

  @override
  String get languageGerman => 'Deutsch';

  @override
  String get languageFrench => 'Französisch';

  @override
  String get languagePortuguese => 'Portugiesisch';

  @override
  String get languageRomanian => 'Rumänisch';

  @override
  String get languageAfrikaans => 'afrikanisch';

  @override
  String get languageRussian => 'Russisch';

  @override
  String get showImportButton => 'Import-Schaltfläche anzeigen';

  @override
  String get showImportButtonSubtitle =>
      'Schaltet die Schaltfläche „ZIP importieren“ auf dem Startbildschirm ein oder aus.';

  @override
  String get importButtonHiddenMessage =>
      'Import-Schaltfläche ausgeblendet. Du kannst sie in den Einstellungen wieder aktivieren.';

  @override
  String get upgradeToAccessChat => 'Upgrade, um auf diesen Chat zuzugreifen.';

  @override
  String get aboutLegalTitle => 'Über & Rechtliches';

  @override
  String get aboutLegalSummary =>
      'WhatsBackUp ist ein Offline-Viewer für WhatsApp-Chat-Exporte. Deine Chats bleiben auf deinem Gerät.';

  @override
  String get aboutLegalRefundPolicy =>
      'Rückerstattungen: Wenn eine Rückerstattung erfolgt, bleiben nur die ersten 5 importierten Chats zugänglich. Chats über dem kostenlosen Limit werden bis zur erneuten Zahlung deaktiviert.';

  @override
  String get aboutLegalDisclaimers =>
      'Hinweise: Wir übernehmen keine Verantwortung für Datenverlust, Chat-Inhalte, Übersetzungsgenauigkeit oder die Nutzung von Sperr-/Ausblendfunktionen. Bitte sichere deine Daten selbst.';

  @override
  String get aboutLegalAffiliation =>
      'Keine Verbindung zu WhatsApp oder Meta. WhatsApp ist eine Marke von Meta Platforms, Inc.';

  @override
  String get aboutLegalSupport => 'Support: vwdewaal@gmail.com';

  @override
  String get aboutLegalDeveloper => 'Entwickler: Van Wyk De Waal';

  @override
  String get aboutLegalJurisdiction => 'Gerichtsstand: EU/UK';

  @override
  String aboutLegalVersion(Object version) {
    return 'App-Version: $version';
  }

  @override
  String get versionLoading => 'App-Version: wird geladen...';

  @override
  String get languageScottishGaelic => 'Schottisch-Gälisch';

  @override
  String get languageScots => 'schottisch';

  @override
  String get languageChinese => 'Chinesisch (Mandarin)';

  @override
  String get languageHindi => 'NEIN';

  @override
  String get languageArabic => 'Arabisch';

  @override
  String get languageBengali => 'Bengali';

  @override
  String get languageJapanese => 'japanisch';

  @override
  String get languagePunjabi => 'Punjabi';

  @override
  String get languageKorean => 'Koreanisch';

  @override
  String get languageTurkish => 'Türkisch';

  @override
  String get languageItalian => 'Italienisch';

  @override
  String get languageVietnamese => 'Vietnamesisch';

  @override
  String get languageUrdu => 'Urdu';

  @override
  String get languageIndonesian => 'Indonesisch';

  @override
  String get languageThai => 'Thai';

  @override
  String get languagePolish => 'Polieren';

  @override
  String get languageDutch => 'Niederländisch';

  @override
  String get identifyMeTitle => 'Identifizieren Sie sich';

  @override
  String get identifyMeSubtitle =>
      'Wählen Sie Ihren Namen, damit wir Ihre Nachrichten richtig kennzeichnen können.';

  @override
  String get identifyMeNotNow => 'Nicht jetzt.';
}
