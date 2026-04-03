// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'WhatsBackUp';

  @override
  String get importZip => 'Importer ZIP';

  @override
  String get importAction => 'Importer';

  @override
  String get importingLabel => 'Importer';

  @override
  String get importDoneLabel => 'FAIT!';

  @override
  String get importLargeStarted => 'Importation commencée';

  @override
  String get importTriggeredMessage =>
      'L\'importation est en cours. La conversation s\'ouvrira une fois l\'opération terminée. Veuillez laisser l\'application ouverte.';

  @override
  String get mediaImportingTitle => 'Importation des médias';

  @override
  String get mediaImportingSubtitle =>
      'Vous pouvez lire la conversation pendant que le contenu multimédia se termine.';

  @override
  String get mediaImportPausedTitle => 'Importation multimédia suspendue';

  @override
  String get mediaImportPausedSubtitle =>
      'Veuillez resélectionner le fichier ZIP d\'origine pour reprendre.';

  @override
  String get mediaImportFailedTitle => 'L\'importation des médias a échoué';

  @override
  String get mediaImportFailedSubtitle => 'Appuyez pour réessayer.';

  @override
  String get mediaImportResumeAction => 'CV';

  @override
  String get mediaImportingLabel => 'Importation de médias';

  @override
  String get contactLoadingLabel => 'Chargement des contacts…';

  @override
  String get contactUnknownName => 'Contact';

  @override
  String get contactPhoneLabel => 'Téléphone';

  @override
  String get contactEmailLabel => 'E-mail';

  @override
  String get openContactAction => 'Contact ouvert';

  @override
  String contactOpenFailed(Object error) {
    return 'Impossible d\'ouvrir le contact : $error';
  }

  @override
  String get howToImport => 'Comment importer';

  @override
  String get settings => 'Paramètres';

  @override
  String get searchTitle => 'Rechercher';

  @override
  String get textToInclude => 'Texte à inclure :';

  @override
  String get enterSearchText => 'Saisissez le texte de recherche...';

  @override
  String get dateRange => 'Plage de dates :';

  @override
  String get fromLabel => 'Du :';

  @override
  String get toLabel => 'Au :';

  @override
  String get selectLabel => 'Sélectionner';

  @override
  String get showOnlyMediaFiles => 'Afficher uniquement les fichiers médias';

  @override
  String get clearAction => 'Effacer';

  @override
  String get searchAction => 'Rechercher';

  @override
  String get renameChatTitle => 'Renommer le chat';

  @override
  String get chatNameHint => 'Nom du chat';

  @override
  String get cancelAction => 'Annuler';

  @override
  String get saveAction => 'Enregistrer';

  @override
  String get hideChatsTooltip => 'Masquer les chats';

  @override
  String get hideAction => 'Masquer';

  @override
  String get lockAction => 'Verrouiller';

  @override
  String get noChatsYetHint =>
      'Aucun chat pour l’instant.\nUtilisez \"Importer ZIP\" pour charger un export WhatsApp,\nou exportez directement depuis WhatsApp via l’option Exporter la discussion.';

  @override
  String get noArchivedChats => 'Aucun chat archivé.';

  @override
  String get tabChats => 'Discussions';

  @override
  String get tabArchived => 'Archivés';

  @override
  String get searchChatsHint => 'Rechercher des chats';

  @override
  String get enterCodeTitle => 'Saisir le code';

  @override
  String get upTo8DigitsHint => 'Jusqu’à 8 chiffres';

  @override
  String get continueAction => 'Continuer';

  @override
  String get updatingHiddenChats => 'Mise à jour des chats masqués...';

  @override
  String get chatsUnhidden => 'Chats affichés.';

  @override
  String get selectAtLeastOneChat => 'Sélectionnez au moins un chat.';

  @override
  String get hidingChats => 'Masquage des chats...';

  @override
  String get lockingChats => 'Verrouillage des chats...';

  @override
  String get chatsHidden => 'Chats masqués.';

  @override
  String get chatsUnlocked => 'Chats déverrouillés.';

  @override
  String get chatsLocked => 'Chats verrouillés.';

  @override
  String get unlockChatTitle => 'Déverrouiller le chat';

  @override
  String get enterPasscodeHint => 'Saisir le code';

  @override
  String get unlockAction => 'Déverrouiller';

  @override
  String get incorrectCode => 'Code incorrect.';

  @override
  String importedOn(Object date) {
    return 'Importé $date';
  }

  @override
  String get unarchiveAction => 'Désarchiver';

  @override
  String get archiveAction => 'Archiver';

  @override
  String get deleteAction => 'Supprimer';

  @override
  String get deleteChatTitle => 'Supprimer le chat ?';

  @override
  String get deleteChatConfirm =>
      'Cela supprime définitivement l’archive et les médias.';

  @override
  String get archiveFolderMissing => 'Le dossier d’archive est manquant.';

  @override
  String updateFailedWithDetail(Object error) {
    return 'Échec de la mise à jour : $error';
  }

  @override
  String get renameAction => 'Renommer';

  @override
  String get working => 'En cours...';

  @override
  String get importPreparing => 'Préparation de l’import...';

  @override
  String get importAnalyzing => 'Analyse du fichier...';

  @override
  String get bookmarksLabel => 'Signets';

  @override
  String get previousBookmark => 'Favori précédent';

  @override
  String get nextBookmark => 'Signet suivant';

  @override
  String get importLargeFileNotice =>
      'Fichier volumineux détecté. Cela peut prendre quelques minutes.';

  @override
  String get importExtracting => 'Extraction des fichiers...';

  @override
  String get importFinalizing => 'Finalisation...';

  @override
  String importFailedWithDetail(Object error) {
    return 'Échec de l’import : $error';
  }

  @override
  String get sharedFileNotZip => 'Le fichier partagé n’est pas un ZIP.';

  @override
  String get unlockProToImportMoreChats =>
      'Déverrouillez BackupChat Pro pour importer plus de chats.';

  @override
  String get purchaseFailedTryAgain => 'L’achat a échoué. Veuillez réessayer.';

  @override
  String get importErrorOnlyZip =>
      'Seuls les fichiers .zip sont pris en charge.';

  @override
  String get importErrorNoChatText =>
      'Aucun fichier texte de chat WhatsApp n’a été trouvé dans le ZIP.';

  @override
  String get importErrorAlreadyImported => 'Ce chat est déjà importé.';

  @override
  String get howToImportTitle => 'Comment importer';

  @override
  String get chooseImportMethodTitle => 'Choisissez votre méthode d’import';

  @override
  String get iosExportTitle => 'Exporter depuis WhatsApp (iOS)';

  @override
  String get androidExportTitle => 'Exporter depuis WhatsApp (Android)';

  @override
  String get iosStepOpenChat =>
      'Dans l\'application WhatsApp, cliquez pour accéder à la conversation.';

  @override
  String get androidStepOpenChat =>
      'Dans l\'application WhatsApp, cliquez pour accéder à une conversation.';

  @override
  String get iosStepOpenInfo =>
      'Cliquez sur le nom de la personne ou du groupe en haut de la page.';

  @override
  String get androidStepOpenMenu => 'Cliquez sur le menu.';

  @override
  String get iosStepExportChat =>
      'Faites défiler vers le bas et sélectionnez Exporter la conversation.';

  @override
  String get androidStepMoreExport => 'Sélectionnez « Plus ».';

  @override
  String get iosStepChooseMedia =>
      'Dans le menu de sélection des applications (feuille de partage), sélectionnez WhatsBackUp (sur les téléphones plus anciens, enregistrez dans les fichiers).';

  @override
  String get androidStepChooseMedia => 'Sélectionnez Exporter la conversation.';

  @override
  String get iosStepShareToApp =>
      'La conversation sera importée dans WhatsBackUp.';

  @override
  String get androidStepShareToApp =>
      'Dans le menu de sélection des applications (feuille de partage), sélectionnez WhatsBackUp (sur les téléphones plus anciens, enregistrez dans les fichiers).';

  @override
  String get iosStepSaveToFiles =>
      'La conversation sera importée dans WhatsBackUp.';

  @override
  String get androidStepSaveToDevice =>
      'La conversation sera importée dans WhatsBackUp.';

  @override
  String get androidLargeImportNote =>
      'Veuillez noter que sur les anciens téléphones Android, l\'importation des conversations très volumineuses peut prendre jusqu\'à une minute avant de démarrer.';

  @override
  String get importZipTitle => 'Importer un fichier ZIP enregistré';

  @override
  String get iosStepImportZip =>
      'Dans WhatsBackUp, appuyez sur « Importer depuis un fichier ZIP » et choisissez le fichier dans Fichiers.';

  @override
  String get androidStepImportZip =>
      'Dans WhatsBackUp, appuyez sur « Importer depuis un fichier ZIP » et choisissez le fichier sur votre appareil.';

  @override
  String get managingChatsTitle => 'Gérer les chats';

  @override
  String get hideChatsWithCodeTitle => 'Masquer les chats avec un code';

  @override
  String get stepTapGhostIcon =>
      'Touchez l’icône fantôme dans la barre supérieure.';

  @override
  String get stepEnterCodeUpTo8Digits =>
      'Saisissez un code (jusqu’à 8 chiffres).';

  @override
  String get stepSelectChatsSubmitHide =>
      'Sélectionnez des chats puis touchez Envoyer pour les masquer.';

  @override
  String get stepEnterSameCodeUnhide =>
      'Saisissez à nouveau le même code pour réafficher ces chats.';

  @override
  String get stepDifferentCodesHideSets =>
      'Différents codes peuvent masquer différents ensembles de chats.';

  @override
  String get lockChatsWithCodeTitle => 'Verrouiller les chats avec un code';

  @override
  String get stepSwitchHideToLockMode =>
      'Dans Paramètres, passez de Masquer à Verrouiller.';

  @override
  String get stepTapGhostIconEnterCode =>
      'Touchez l’icône fantôme et saisissez un code.';

  @override
  String get stepSelectChatsSubmitLock =>
      'Sélectionnez des chats puis touchez Envoyer pour les verrouiller.';

  @override
  String get stepLockedChatsRequireCode =>
      'Les chats verrouillés affichent un cadenas et nécessitent le code pour s’ouvrir.';

  @override
  String get archiveOrDeleteTitle => 'Archiver ou supprimer';

  @override
  String get stepSwipeRightArchive =>
      'Balayez vers la droite pour archiver ou désarchiver.';

  @override
  String get stepSwipeLeftDelete =>
      'Balayez vers la gauche pour supprimer (confirmation requise).';

  @override
  String get bullet => '•';

  @override
  String get welcomeTitle => 'Bienvenue';

  @override
  String get gotItAction => 'Compris';

  @override
  String get settingsTitle => 'Paramètres';

  @override
  String get sectionFont => 'Police';

  @override
  String get sectionColor => 'Couleur';

  @override
  String get sectionAccessibility => '';

  @override
  String get sectionPrivacy => 'Confidentialité';

  @override
  String get sectionPro => 'BackupChat Pro';

  @override
  String get sectionStorage => 'Stockage';

  @override
  String get storageTitle => 'Stockage';

  @override
  String get storageSubtitle =>
      'Afficher l\'espace de stockage de l\'appareil et des conversations';

  @override
  String get storageAvailable => 'Espace de stockage disponible';

  @override
  String get storageAppSize => 'Taille de WhatsBackUp (conversations incluses)';

  @override
  String get storageLocation => 'Lieu de stockage';

  @override
  String get storageLocationUnknown => 'Inconnu';

  @override
  String get storageCalculate => 'Calculer';

  @override
  String get storageCalculating => 'Calculateur…';

  @override
  String get storageNotCalculated => 'Non calculé';

  @override
  String storageLastCalculated(Object date) {
    return 'Dernière valeur calculée : $date';
  }

  @override
  String get storageLastCalculatedNone => 'Dernières données calculées : —';

  @override
  String get storageChatSizesToggle =>
      'Afficher la taille des conversations dans la liste';

  @override
  String get storageChatSizesSubtitle =>
      'Affiche la taille totale de chaque conversation sur l\'écran principal';

  @override
  String get storageCleanupTitle => 'Nettoyer les importations ayant échoué';

  @override
  String get storageCleanupSubtitle =>
      'Supprime les importations incomplètes ou ayant échoué afin de libérer de l\'espace.';

  @override
  String get storageCleanupEstimate => 'Espace à libérer estimé';

  @override
  String get storageCleanupAction => 'Nettoyez maintenant';

  @override
  String get storageCleanupNone => 'Aucune importation ayant échoué.';

  @override
  String storageCleanupDone(Object size) {
    return 'Nettoyage des importations ayant échoué ($size).';
  }

  @override
  String storageCleanupLast(Object time) {
    return 'Dernier nettoyage : $time';
  }

  @override
  String get proActiveTitle => 'Pro est actif';

  @override
  String get proUpgradeTitle => 'Passer à BackupChat Pro';

  @override
  String get proThankYouSubtitle => 'Merci de soutenir l’application.';

  @override
  String get proUnlockSubtitle => 'Déverrouillez les imports illimités.';

  @override
  String get debugProOverrideTitle => 'Débogage : Force Pro';

  @override
  String get debugProOverrideSubtitle =>
      'Activation locale pour les tests (aucun achat requis).';

  @override
  String paywallResult(Object result) {
    return 'Résultat du paywall : $result.';
  }

  @override
  String get purchaseCancelled => 'Achat annulé.';

  @override
  String get restorePurchases => 'Restaurer les achats';

  @override
  String get purchasesRestored => 'Achats restaurés.';

  @override
  String get restoreFailedTryAgain => 'Échec de la restauration. Réessayez.';

  @override
  String get manageSubscription => 'Gérer l’abonnement';

  @override
  String get openCustomerCenter => 'Ouvrir le RevenueCat Customer Center.';

  @override
  String get customerCenterUnavailable => 'Customer Center indisponible.';

  @override
  String get sectionAbout => 'À propos';

  @override
  String get aboutDescription =>
      'WhatsBackUp est un visualiseur privé et hors ligne des exports de chats WhatsApp. Importez des fichiers ZIP ou exportez directement depuis WhatsApp pour conserver une archive propre et consultable avec médias — sans réseau.';

  @override
  String get sectionAboutDeveloper => 'À propos du développeur';

  @override
  String get aboutDeveloperDescription =>
      'Créé par un développeur indépendant axé sur la confidentialité, la recherche rapide et des archives de chats propres.';

  @override
  String get sectionHelp => 'Aide';

  @override
  String get showOnboardingAgain => 'Afficher l’onboarding à nouveau';

  @override
  String get sdkConfigTitle => 'Configuration du SDK';

  @override
  String get publicKeyLabel => 'Clé publique';

  @override
  String get offeringIdLabel => 'ID de l’offre';

  @override
  String get entitlementIdLabel => 'ID de droit';

  @override
  String get lifetimeProductIdLabel => 'ID produit à vie';

  @override
  String errorLabel(Object error) {
    return 'Erreur : $error';
  }

  @override
  String get offeringsTitle => 'Offres';

  @override
  String get currentOfferingLabel => 'Offre actuelle';

  @override
  String get allOfferingsLabel => 'Toutes les offres';

  @override
  String get customerInfoTitle => 'Infos client';

  @override
  String get activeEntitlementsLabel => 'Droits actifs';

  @override
  String get originalAppUserIdLabel => 'ID utilisateur original';

  @override
  String get managementUrlLabel => 'URL de gestion';

  @override
  String get noneLabel => 'aucun';

  @override
  String get refreshAction => 'Rafraîchir';

  @override
  String get noPackagesAvailable => 'Aucun forfait disponible.';

  @override
  String get packagesTitle => 'Forfaits';

  @override
  String get fontSystem => 'Système';

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
  String get colorWhatsAppGreen => 'Vert WhatsApp';

  @override
  String get colorDeepTeal => 'Sarcelle foncé';

  @override
  String get colorNavy => 'Bleu marine';

  @override
  String get colorCharcoal => 'Anthracite';

  @override
  String get colorBlindPaletteTitle => '';

  @override
  String get colorBlindPaletteSubtitle => '';

  @override
  String get hideChatsInsteadOfLocking =>
      'Masquer les chats au lieu de verrouiller';

  @override
  String get hideChatsInsteadOfLockingSubtitle =>
      'Quand désactivé, les chats sont visibles mais protégés par code.';

  @override
  String get previousMatch => 'Correspondance précédente';

  @override
  String get nextMatch => 'Correspondance suivante';

  @override
  String get selectSenderOnRight => 'Sélectionnez qui est à droite';

  @override
  String couldNotOpenArchive(Object error) {
    return 'Impossible d’ouvrir l’archive :\n$error';
  }

  @override
  String couldNotOpenFile(Object message) {
    return 'Impossible d’ouvrir le fichier : $message';
  }

  @override
  String attachmentMissing(Object filename) {
    return 'Pièce jointe manquante : $filename';
  }

  @override
  String get unknownError => 'Erreur inconnue';

  @override
  String get openPdf => 'Ouvrir le PDF';

  @override
  String get openFile => 'Ouvrir le fichier';

  @override
  String get openAudio => 'Ouvrir l’audio';

  @override
  String senderMeLabel(Object sender) {
    return '$sender (Moi)';
  }

  @override
  String get chatFileNotFound => 'Fichier de chat introuvable.';

  @override
  String get languageTitle => 'Langue';

  @override
  String get languageTooltip => 'Langue';

  @override
  String get moreOptionsTooltip => 'Plus d\'options';

  @override
  String get filterTitle => 'Filtrer';

  @override
  String get filterDateRange => 'Plage de dates';

  @override
  String get filterAnyDate => 'N\'importe quelle date';

  @override
  String get filterIncludeMedia => 'Inclure les médias';

  @override
  String get filterMediaOnly => 'Médias uniquement';

  @override
  String get filterSenders => 'Expéditeurs';

  @override
  String get applyFilters => 'Appliquer';

  @override
  String get clearFilters => 'Effacer les filtres';

  @override
  String get incrementalImportTitle => 'Le chat existe déjà';

  @override
  String incrementalImportMessage(Object name) {
    return 'Ajouter cet import à \"$name\" ?';
  }

  @override
  String get incrementalAddAction => 'Ajouter';

  @override
  String get incrementalChooseTitle => 'Choisir le chat à mettre à jour';

  @override
  String get incrementalUpdated => 'Chat mis à jour.';

  @override
  String get languageSystem => 'Système';

  @override
  String get languageEnglish => 'Anglais';

  @override
  String get languageSpanish => 'Espagnol';

  @override
  String get languageGerman => 'Allemand';

  @override
  String get languageFrench => 'Français';

  @override
  String get languagePortuguese => 'Portugais';

  @override
  String get languageRomanian => 'Roumain';

  @override
  String get languageAfrikaans => 'africain';

  @override
  String get languageRussian => 'Russe';

  @override
  String get showImportButton => 'Afficher le bouton Importer';

  @override
  String get showImportButtonSubtitle =>
      'Afficher/masquer le bouton Importer ZIP sur l’écran d’accueil.';

  @override
  String get importButtonHiddenMessage =>
      'Bouton d’importation masqué. Vous pouvez le réactiver dans Paramètres.';

  @override
  String get upgradeToAccessChat =>
      'Passez à la version Pro pour accéder à ce chat.';

  @override
  String get aboutLegalTitle => 'À propos & mentions légales';

  @override
  String get aboutLegalSummary =>
      'WhatsBackUp est un visualiseur hors ligne des exports de chats WhatsApp. Vos chats restent sur votre appareil.';

  @override
  String get aboutLegalRefundPolicy =>
      'Remboursements : si un remboursement est accordé, seuls les 5 premiers chats importés restent accessibles. Les chats au‑delà de la limite gratuite sont désactivés jusqu’à un nouvel achat.';

  @override
  String get aboutLegalDisclaimers =>
      'Avertissements : nous ne sommes pas responsables des pertes de données, du contenu des chats, de la précision des traductions ou de l’usage des fonctions masquer/verrouiller. Conservez vos propres sauvegardes.';

  @override
  String get aboutLegalAffiliation =>
      'Non affilié à WhatsApp ou Meta. WhatsApp est une marque de Meta Platforms, Inc.';

  @override
  String get aboutLegalSupport => 'Support : vwdewaal@gmail.com';

  @override
  String get aboutLegalDeveloper => 'Développeur : Van Wyk De Waal';

  @override
  String get aboutLegalJurisdiction => 'Juridiction : UE/Royaume‑Uni';

  @override
  String aboutLegalVersion(Object version) {
    return 'Version de l’app : $version';
  }

  @override
  String get versionLoading => 'Version de l’app : chargement...';

  @override
  String get languageScottishGaelic => 'gaélique écossais';

  @override
  String get languageScots => 'écossais';

  @override
  String get languageChinese => 'Chinois (mandarin)';

  @override
  String get languageHindi => 'Non';

  @override
  String get languageArabic => 'arabe';

  @override
  String get languageBengali => 'bengali';

  @override
  String get languageJapanese => 'japonais';

  @override
  String get languagePunjabi => 'Punjabi';

  @override
  String get languageKorean => 'coréen';

  @override
  String get languageTurkish => 'turc';

  @override
  String get languageItalian => 'italien';

  @override
  String get languageVietnamese => 'vietnamien';

  @override
  String get languageUrdu => 'ourdou';

  @override
  String get languageIndonesian => 'indonésien';

  @override
  String get languageThai => 'thaïlandais';

  @override
  String get languagePolish => 'polonais';

  @override
  String get languageDutch => 'Néerlandais';

  @override
  String get identifyMeTitle => 'Identifiez-vous';

  @override
  String get identifyMeSubtitle =>
      'Veuillez sélectionner votre nom afin que nous puissions étiqueter correctement vos messages.';

  @override
  String get identifyMeNotNow => 'Pas maintenant';
}
