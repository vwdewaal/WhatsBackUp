// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'WhatsBackUp';

  @override
  String get importZip => 'Importa ZIP';

  @override
  String get importAction => 'Importare';

  @override
  String get importingLabel => 'Importazione';

  @override
  String get importDoneLabel => 'FATTO!';

  @override
  String get importLargeStarted => 'Importazione avviata';

  @override
  String get importTriggeredMessage =>
      'L\'importazione viene avviata in background. La chat si aprirà al termine. Tieni l\'app aperta.';

  @override
  String get mediaImportingTitle => 'Importazione di contenuti multimediali';

  @override
  String get mediaImportingSubtitle =>
      'Puoi leggere la chat mentre la riproduzione dei contenuti multimediali termina.';

  @override
  String get mediaImportPausedTitle => 'Importazione multimediale in pausa';

  @override
  String get mediaImportPausedSubtitle =>
      'Riselezionare il ZIP originale per riprendere.';

  @override
  String get mediaImportFailedTitle => 'Importazione del supporto non riuscita';

  @override
  String get mediaImportFailedSubtitle => 'Tocca per riprovare.';

  @override
  String get mediaImportResumeAction => 'Riprendere';

  @override
  String get mediaImportingLabel => 'Importazione di media';

  @override
  String get contactLoadingLabel => 'Caricamento contatto in corso…';

  @override
  String get contactUnknownName => 'Contatto';

  @override
  String get contactPhoneLabel => 'Telefono';

  @override
  String get contactEmailLabel => 'E-mail';

  @override
  String get openContactAction => 'Contatto aperto';

  @override
  String contactOpenFailed(Object error) {
    return 'Impossibile aprire il contatto: $error';
  }

  @override
  String get howToImport => 'Come importare';

  @override
  String get settings => 'Impostazioni';

  @override
  String get searchTitle => 'Ricerca';

  @override
  String get textToInclude => 'Testo da includere:';

  @override
  String get enterSearchText => 'Inserisci il testo da cercare...';

  @override
  String get dateRange => 'Intervallo di date:';

  @override
  String get fromLabel => 'Da:';

  @override
  String get toLabel => 'A:';

  @override
  String get selectLabel => 'Selezionare';

  @override
  String get showOnlyMediaFiles => 'Mostra solo i file multimediali';

  @override
  String get clearAction => 'Chiaro';

  @override
  String get searchAction => 'Ricerca';

  @override
  String get renameChatTitle => 'Rinomina chat';

  @override
  String get chatNameHint => 'Nome della chat';

  @override
  String get cancelAction => 'Cancellare';

  @override
  String get saveAction => 'Salva';

  @override
  String get hideChatsTooltip => 'Nascondi le chat';

  @override
  String get hideAction => 'Nascondere';

  @override
  String get lockAction => 'Serratura';

  @override
  String get noChatsYetHint =>
      'Nessuna chat ancora.\nUtilizza \"Importa ZIP\" per caricare un\'esportazione WhatsApp,\noppure esporta direttamente da WhatsApp utilizzando l\'opzione \"Esporta chat\" della chat.';

  @override
  String get noArchivedChats => 'Nessuna chat archiviata.';

  @override
  String get tabChats => 'Chat';

  @override
  String get tabArchived => 'Archiviato';

  @override
  String get searchChatsHint => 'Cerca chat';

  @override
  String get enterCodeTitle => 'Inserisci il codice';

  @override
  String get upTo8DigitsHint => 'Fino a 8 cifre';

  @override
  String get continueAction => 'Continuare';

  @override
  String get updatingHiddenChats => 'Aggiornamento delle chat nascoste...';

  @override
  String get chatsUnhidden => 'Chat non nascoste.';

  @override
  String get selectAtLeastOneChat => 'Seleziona almeno una chat.';

  @override
  String get hidingChats => 'Nascondere le chat...';

  @override
  String get lockingChats => 'Blocco delle chat...';

  @override
  String get chatsHidden => 'Chat nascoste.';

  @override
  String get chatsUnlocked => 'Chat sbloccate.';

  @override
  String get chatsLocked => 'Chat bloccate.';

  @override
  String get unlockChatTitle => 'Sblocca la chat';

  @override
  String get enterPasscodeHint => 'Inserisci il codice di accesso';

  @override
  String get unlockAction => 'Sbloccare';

  @override
  String get incorrectCode => 'Codice errato.';

  @override
  String importedOn(Object date) {
    return 'Importato $date';
  }

  @override
  String get unarchiveAction => 'Disarchiviare';

  @override
  String get archiveAction => 'Archivio';

  @override
  String get deleteAction => 'Eliminare';

  @override
  String get deleteChatTitle => 'Eliminare la chat?';

  @override
  String get deleteChatConfirm =>
      'Questa operazione elimina definitivamente l\'archivio e i file multimediali.';

  @override
  String get archiveFolderMissing => 'La cartella di archivio era mancante.';

  @override
  String updateFailedWithDetail(Object error) {
    return 'Aggiornamento non riuscito: $error';
  }

  @override
  String get renameAction => 'Rinominare';

  @override
  String get working => 'Lavorando...';

  @override
  String get importPreparing => 'Preparazione dell\'importazione...';

  @override
  String get importAnalyzing => 'Analisi del file in corso...';

  @override
  String get bookmarksLabel => 'Segnalibri';

  @override
  String get previousBookmark => 'Segnalibro precedente';

  @override
  String get nextBookmark => 'Segnalibro successivo';

  @override
  String get importLargeFileNotice =>
      'Rilevato file di grandi dimensioni. L\'operazione potrebbe richiedere alcuni minuti.';

  @override
  String get importExtracting => 'Estrazione dei file...';

  @override
  String get importFinalizing => 'Finalizzazione in corso...';

  @override
  String importFailedWithDetail(Object error) {
    return 'Importazione non riuscita: $error';
  }

  @override
  String get sharedFileNotZip => 'Il file condiviso non è un ZIP.';

  @override
  String get unlockProToImportMoreChats =>
      'Sblocca BackupChat Pro per importare più chat.';

  @override
  String get purchaseFailedTryAgain => 'Acquisto non riuscito. Riprova.';

  @override
  String get importErrorOnlyZip => 'Sono supportati solo i file .zip.';

  @override
  String get importErrorNoChatText =>
      'Non è stato trovato alcun file di testo della chat WhatsApp in ZIP.';

  @override
  String get importErrorAlreadyImported => 'Questa chat è già stata importata.';

  @override
  String get howToImportTitle => 'Come importare';

  @override
  String get chooseImportMethodTitle => 'Scegli il tuo metodo di importazione';

  @override
  String get iosExportTitle => 'Esporta da WhatsApp (iOS)';

  @override
  String get androidExportTitle => 'Esporta da WhatsApp (Android)';

  @override
  String get iosStepOpenChat =>
      'All\'interno dell\'app WhatsApp, clicca sulla chat.';

  @override
  String get androidStepOpenChat =>
      'All\'interno dell\'app WhatsApp, clicca su una chat.';

  @override
  String get iosStepOpenInfo =>
      'Fare clic sul nome della persona o del gruppo in alto.';

  @override
  String get androidStepOpenMenu => 'Fare clic sul menu.';

  @override
  String get iosStepExportChat =>
      'Scorri fino in fondo e seleziona Esporta chat.';

  @override
  String get androidStepMoreExport => 'Seleziona “Altro”.';

  @override
  String get iosStepChooseMedia =>
      'Dal menu di selezione delle app (foglio di condivisione) seleziona WhatsBackUp (sui telefoni più vecchi, salva nei file).';

  @override
  String get androidStepChooseMedia => 'Seleziona Esporta chat.';

  @override
  String get iosStepShareToApp => 'La chat verrà importata in WhatsBackUp.';

  @override
  String get androidStepShareToApp =>
      'Dal menu di selezione delle app (foglio di condivisione) seleziona WhatsBackUp (sui telefoni più vecchi, salva nei file).';

  @override
  String get iosStepSaveToFiles => 'La chat verrà importata in WhatsBackUp.';

  @override
  String get androidStepSaveToDevice =>
      'La chat verrà importata in WhatsBackUp.';

  @override
  String get androidLargeImportNote =>
      'Si prega di notare che sui vecchi telefoni Android l\'importazione di chat molto grandi potrebbe richiedere fino a un minuto.';

  @override
  String get importZipTitle => 'Importa un file ZIP salvato';

  @override
  String get iosStepImportZip =>
      'In WhatsBackUp, tocca \"Importa da ZIP\" e scegli il file da File.';

  @override
  String get androidStepImportZip =>
      'In WhatsBackUp, tocca \"Importa da ZIP\" e scegli il file dal tuo dispositivo.';

  @override
  String get managingChatsTitle => 'Gestione delle chat';

  @override
  String get hideChatsWithCodeTitle => 'Nascondi le chat con un codice';

  @override
  String get stepTapGhostIcon =>
      'Tocca l\'icona del fantasma nella barra in alto.';

  @override
  String get stepEnterCodeUpTo8Digits =>
      'Inserisci un codice (fino a 8 cifre).';

  @override
  String get stepSelectChatsSubmitHide =>
      'Seleziona le chat, quindi tocca Invia per nasconderle.';

  @override
  String get stepEnterSameCodeUnhide =>
      'Inserisci nuovamente lo stesso codice per visualizzare nuovamente le chat.';

  @override
  String get stepDifferentCodesHideSets =>
      'Codici diversi possono nascondere diversi set di chat.';

  @override
  String get lockChatsWithCodeTitle => 'Blocca le chat con un codice';

  @override
  String get stepSwitchHideToLockMode =>
      'Nelle Impostazioni, passa dalla modalità Nascondi a quella Blocca.';

  @override
  String get stepTapGhostIconEnterCode =>
      'Tocca l\'icona del fantasma e inserisci un codice.';

  @override
  String get stepSelectChatsSubmitLock =>
      'Seleziona le chat, quindi tocca Invia per bloccarle.';

  @override
  String get stepLockedChatsRequireCode =>
      'Le chat bloccate mostrano un\'icona a forma di lucchetto e richiedono un codice per essere aperte.';

  @override
  String get archiveOrDeleteTitle => 'Archivia o elimina';

  @override
  String get stepSwipeRightArchive =>
      'Scorri verso destra per archiviare o decomprimere.';

  @override
  String get stepSwipeLeftDelete =>
      'Scorri verso sinistra per eliminare (è richiesta la conferma).';

  @override
  String get bullet => '•';

  @override
  String get welcomeTitle => 'Benvenuto';

  @override
  String get gotItAction => 'Fatto';

  @override
  String get settingsTitle => 'Impostazioni';

  @override
  String get sectionFont => 'Font';

  @override
  String get sectionColor => 'Colore';

  @override
  String get sectionAccessibility => 'Accessibilità';

  @override
  String get sectionPrivacy => 'Riservatezza';

  @override
  String get sectionPro => 'BackupChat Pro';

  @override
  String get sectionStorage => 'Magazzinaggio';

  @override
  String get storageTitle => 'Magazzinaggio';

  @override
  String get storageSubtitle =>
      'Visualizza lo spazio del dispositivo e l\'archiviazione delle chat';

  @override
  String get storageAvailable => 'Spazio di archiviazione disponibile';

  @override
  String get storageAppSize => 'WhatsBackUp dimensioni (incluse le chat)';

  @override
  String get storageLocation => 'Luogo di archiviazione';

  @override
  String get storageLocationUnknown => 'Sconosciuto';

  @override
  String get storageCalculate => 'Calcolare';

  @override
  String get storageCalculating => 'Calcolo in corso…';

  @override
  String get storageNotCalculated => 'Non calcolato';

  @override
  String storageLastCalculated(Object date) {
    return 'Ultimo calcolo: $date';
  }

  @override
  String get storageLastCalculatedNone => 'Ultimo calcolo: —';

  @override
  String get storageChatSizesToggle =>
      'Mostra le dimensioni della chat nell\'elenco';

  @override
  String get storageChatSizesSubtitle =>
      'Mostra la dimensione totale di ogni chat nella schermata principale';

  @override
  String get storageCleanupTitle => 'Pulisci le importazioni non riuscite';

  @override
  String get storageCleanupSubtitle =>
      'Rimuove le importazioni incomplete o non riuscite nello spazio libero.';

  @override
  String get storageCleanupEstimate => 'Spazio stimato da liberare';

  @override
  String get storageCleanupAction => 'Pulisci ora';

  @override
  String get storageCleanupNone => 'Nessuna importazione non riuscita trovata.';

  @override
  String storageCleanupDone(Object size) {
    return 'Ripulito $size dalle importazioni non riuscite.';
  }

  @override
  String storageCleanupLast(Object time) {
    return 'Ultima pulizia: $time';
  }

  @override
  String get proActiveTitle => 'Pro è attivo';

  @override
  String get proUpgradeTitle => 'Aggiorna a BackupChat Pro';

  @override
  String get proThankYouSubtitle => 'Grazie per aver supportato l\'app.';

  @override
  String get proUnlockSubtitle => 'Sblocca importazioni illimitate.';

  @override
  String get debugProOverrideTitle => 'Debug: Force Pro';

  @override
  String get debugProOverrideSubtitle =>
      'Override locale per i test (nessun acquisto richiesto).';

  @override
  String paywallResult(Object result) {
    return 'Risultato del paywall: $result.';
  }

  @override
  String get purchaseCancelled => 'Acquisto annullato.';

  @override
  String get restorePurchases => 'Ripristina gli acquisti';

  @override
  String get purchasesRestored => 'Acquisti ripristinati.';

  @override
  String get restoreFailedTryAgain => 'Ripristino non riuscito. Riprova.';

  @override
  String get manageSubscription => 'Gestisci l\'abbonamento';

  @override
  String get openCustomerCenter => 'Apri il Centro clienti RevenueCat.';

  @override
  String get customerCenterUnavailable => 'Centro clienti non disponibile.';

  @override
  String get sectionAbout => 'Di';

  @override
  String get aboutDescription =>
      'WhatsBackUp è un visualizzatore privato e offline per le esportazioni di chat WhatsApp. Importa file ZIP o esportali direttamente da WhatsApp per mantenere un archivio pulito e ricercabile con contenuti multimediali, senza bisogno di una rete.';

  @override
  String get sectionAboutDeveloper => 'Informazioni sullo sviluppatore';

  @override
  String get aboutDeveloperDescription =>
      'Realizzato da uno sviluppatore indipendente, focalizzato sulla privacy, sulla ricerca veloce e sulla pulizia degli archivi delle chat.';

  @override
  String get sectionHelp => 'Aiuto';

  @override
  String get showOnboardingAgain => 'Mostra di nuovo l\'onboarding';

  @override
  String get sdkConfigTitle => 'Configurazione SDK';

  @override
  String get publicKeyLabel => 'Chiave pubblica';

  @override
  String get offeringIdLabel => 'ID offerta';

  @override
  String get entitlementIdLabel => 'ID di autorizzazione';

  @override
  String get lifetimeProductIdLabel => 'ID prodotto a vita';

  @override
  String errorLabel(Object error) {
    return 'Errore: $error';
  }

  @override
  String get offeringsTitle => 'Offerte';

  @override
  String get currentOfferingLabel => 'Offerta attuale';

  @override
  String get allOfferingsLabel => 'Tutte le offerte';

  @override
  String get customerInfoTitle => 'Informazioni sul cliente';

  @override
  String get activeEntitlementsLabel => 'Diritti attivi';

  @override
  String get originalAppUserIdLabel => 'ID utente dell\'app originale';

  @override
  String get managementUrlLabel => 'URL di gestione';

  @override
  String get noneLabel => 'nessuno';

  @override
  String get refreshAction => 'Aggiorna';

  @override
  String get noPackagesAvailable => 'Nessun pacchetto disponibile.';

  @override
  String get packagesTitle => 'Pacchetti';

  @override
  String get fontSystem => 'Sistema';

  @override
  String get fontSerif => 'Serif';

  @override
  String get fontMono => 'Mono';

  @override
  String get accessibilityFontSizeTitle => 'Dimensione del carattere';

  @override
  String get accessibilityFontSizeSubtitle =>
      'Regola la dimensione del testo in tutta l\'app.';

  @override
  String get accessibilityFontPreview =>
      'Questo è un esempio di messaggio a fumetto.\nMostra come apparirà il testo della tua chat.\nRegola il cursore per ridimensionarlo.';

  @override
  String get accessibilityHighContrastTitle => 'Modalità ad alto contrasto';

  @override
  String get accessibilityHighContrastSubtitle =>
      'Aumentare il contrasto per una migliore leggibilità.';

  @override
  String get colorWhatsAppGreen => 'WhatsApp Verde';

  @override
  String get colorDeepTeal => 'Verde acqua intenso';

  @override
  String get colorNavy => 'Marina';

  @override
  String get colorCharcoal => 'Carbone';

  @override
  String get colorBlindPaletteTitle => 'Palette per daltonici';

  @override
  String get colorBlindPaletteSubtitle =>
      'Utilizzare una tavolozza ottimizzata per i deficit della visione dei colori.';

  @override
  String get hideChatsInsteadOfLocking =>
      'Nascondi le chat invece di bloccarle';

  @override
  String get hideChatsInsteadOfLockingSubtitle =>
      'Se disattivata, le chat sono visibili ma protette da codice di accesso.';

  @override
  String get previousMatch => 'Partita precedente';

  @override
  String get nextMatch => 'Prossima partita';

  @override
  String get selectSenderOnRight => 'Seleziona il mittente sulla destra';

  @override
  String couldNotOpenArchive(Object error) {
    return 'Impossibile aprire l\'archivio:\n$error';
  }

  @override
  String couldNotOpenFile(Object message) {
    return 'Impossibile aprire il file: $message';
  }

  @override
  String attachmentMissing(Object filename) {
    return 'Allegato mancante: $filename';
  }

  @override
  String get unknownError => 'Errore sconosciuto';

  @override
  String get openPdf => 'Apri PDF';

  @override
  String get openFile => 'Apri file';

  @override
  String get openAudio => 'Apri audio';

  @override
  String senderMeLabel(Object sender) {
    return '$sender (Io)';
  }

  @override
  String get chatFileNotFound => 'File di chat non trovato.';

  @override
  String get languageTitle => 'Lingua';

  @override
  String get languageTooltip => 'Lingua';

  @override
  String get moreOptionsTooltip => 'Altre opzioni';

  @override
  String get filterTitle => 'Filtro';

  @override
  String get filterDateRange => 'Intervallo di date';

  @override
  String get filterAnyDate => 'Qualsiasi data';

  @override
  String get filterIncludeMedia => 'Includi media';

  @override
  String get filterMediaOnly => 'Solo media';

  @override
  String get filterSenders => 'Mittenti';

  @override
  String get applyFilters => 'Fare domanda a';

  @override
  String get clearFilters => 'Cancella filtri';

  @override
  String get incrementalImportTitle => 'La chat esiste già';

  @override
  String incrementalImportMessage(Object name) {
    return 'Aggiungere questa importazione a \"$name\"?';
  }

  @override
  String get incrementalAddAction => 'Aggiungere';

  @override
  String get incrementalChooseTitle => 'Scegli la chat da aggiornare';

  @override
  String get incrementalUpdated => 'Chat aggiornata.';

  @override
  String get languageSystem => 'Sistema';

  @override
  String get languageEnglish => 'Inglese';

  @override
  String get languageSpanish => 'spagnolo';

  @override
  String get languageGerman => 'tedesco';

  @override
  String get languageFrench => 'francese';

  @override
  String get languagePortuguese => 'portoghese';

  @override
  String get languageRomanian => 'rumeno';

  @override
  String get languageAfrikaans => 'afrikaans';

  @override
  String get languageRussian => 'russo';

  @override
  String get showImportButton => 'Mostra pulsante Importa';

  @override
  String get showImportButtonSubtitle =>
      'Attiva il pulsante Importa ZIP nella schermata iniziale.';

  @override
  String get importButtonHiddenMessage =>
      'Pulsante Importa nascosto. Puoi riattivarlo nelle Impostazioni.';

  @override
  String get upgradeToAccessChat =>
      'Effettua l\'upgrade per accedere a questa chat.';

  @override
  String get aboutLegalTitle => 'Informazioni e informazioni legali';

  @override
  String get aboutLegalSummary =>
      'WhatsBackUp è un visualizzatore offline per le chat esportate da WhatsApp. Le tue chat rimangono sul tuo dispositivo.';

  @override
  String get aboutLegalRefundPolicy =>
      'Rimborsi: se viene emesso un rimborso, solo le prime 5 chat importate rimarranno accessibili. Le chat che superano il limite gratuito saranno disabilitate fino al nuovo acquisto.';

  @override
  String get aboutLegalDisclaimers =>
      'Avvertenze: non siamo responsabili per la perdita di dati, il contenuto della chat, l\'accuratezza delle traduzioni o l\'uso delle funzioni di blocco/nascondimento. Si prega di conservare i propri backup.';

  @override
  String get aboutLegalAffiliation =>
      'Non affiliato con WhatsApp o Meta. WhatsApp è un marchio commerciale di Meta Platforms, Inc.';

  @override
  String get aboutLegalSupport => 'Supporto: vwdewaal@gmail.com';

  @override
  String get aboutLegalDeveloper => 'Sviluppatore: Van Wyk De Waal';

  @override
  String get aboutLegalJurisdiction => 'Giurisdizione: UE/Regno Unito';

  @override
  String aboutLegalVersion(Object version) {
    return 'Versione dell\'app: $version';
  }

  @override
  String get versionLoading => 'Versione dell\'app: caricamento in corso...';

  @override
  String get languageScottishGaelic => 'gaelico scozzese';

  @override
  String get languageScots => 'Scozzesi';

  @override
  String get languageChinese => 'Cinese (mandarino)';

  @override
  String get languageHindi => 'hindi';

  @override
  String get languageArabic => 'arabo';

  @override
  String get languageBengali => 'bengalese';

  @override
  String get languageJapanese => 'giapponese';

  @override
  String get languagePunjabi => 'Punjabi';

  @override
  String get languageKorean => 'coreano';

  @override
  String get languageTurkish => 'turco';

  @override
  String get languageItalian => 'Italiano';

  @override
  String get languageVietnamese => 'vietnamita';

  @override
  String get languageUrdu => 'Urdu';

  @override
  String get languageIndonesian => 'indonesiano';

  @override
  String get languageThai => 'tailandese';

  @override
  String get languagePolish => 'Polacco';

  @override
  String get languageDutch => 'Olandese';

  @override
  String get identifyMeTitle => 'Identificati';

  @override
  String get identifyMeSubtitle =>
      'Seleziona il tuo nome in modo che possiamo etichettare correttamente i tuoi messaggi.';

  @override
  String get identifyMeNotNow => 'Non adesso';
}
