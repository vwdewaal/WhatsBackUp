// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Qué es Backup';

  @override
  String get importZip => 'Importar ZIP';

  @override
  String get importAction => 'Importar';

  @override
  String get importingLabel => 'Importador';

  @override
  String get importDoneLabel => '¡HECHO!';

  @override
  String get importLargeStarted => 'Importación iniciada';

  @override
  String get importTriggeredMessage =>
      'La importación se activa en segundo plano. El chat se abrirá al finalizar. Mantén la aplicación abierta.';

  @override
  String get mediaImportingTitle => 'Importación de medios';

  @override
  String get mediaImportingSubtitle =>
      'Podrás leer el chat mientras finaliza el multimedia.';

  @override
  String get mediaImportPausedTitle => 'Importación de medios en pausa';

  @override
  String get mediaImportPausedSubtitle =>
      'Vuelva a seleccionar el ZIP original para continuar.';

  @override
  String get mediaImportFailedTitle => 'Error en la importación de medios';

  @override
  String get mediaImportFailedSubtitle => 'Pulse para volver a intentarlo.';

  @override
  String get mediaImportResumeAction => 'Reanudar';

  @override
  String get mediaImportingLabel => 'Importación de medios';

  @override
  String get contactLoadingLabel => 'Cargando contacto…';

  @override
  String get contactUnknownName => 'Contacto';

  @override
  String get contactPhoneLabel => 'Teléfono';

  @override
  String get contactEmailLabel => 'Correo electrónico';

  @override
  String get openContactAction => 'Contacto abierto';

  @override
  String contactOpenFailed(Object error) {
    return 'No se pudo abrir el contacto: $error';
  }

  @override
  String get howToImport => 'Cómo importar';

  @override
  String get settings => 'Ajustes';

  @override
  String get searchTitle => 'Buscar';

  @override
  String get textToInclude => 'Texto a incluir:';

  @override
  String get enterSearchText => 'Introduce texto de búsqueda...';

  @override
  String get dateRange => 'Rango de fechas:';

  @override
  String get fromLabel => 'Desde:';

  @override
  String get toLabel => 'Hasta:';

  @override
  String get selectLabel => 'Seleccionar';

  @override
  String get showOnlyMediaFiles => 'Mostrar solo archivos multimedia';

  @override
  String get clearAction => 'Limpiar';

  @override
  String get searchAction => 'Buscar';

  @override
  String get renameChatTitle => 'Renombrar chat';

  @override
  String get chatNameHint => 'Nombre del chat';

  @override
  String get cancelAction => 'Cancelar';

  @override
  String get saveAction => 'Guardar';

  @override
  String get hideChatsTooltip => 'Ocultar chats';

  @override
  String get hideAction => 'Ocultar';

  @override
  String get lockAction => 'Bloquear';

  @override
  String get noChatsYetHint =>
      'Aún no hay chats.\nUsa \"Importar ZIP\" para cargar una exportación de WhatsApp,\no exporta directamente desde WhatsApp usando la opción Exportar chat.';

  @override
  String get noArchivedChats => 'No hay chats archivados.';

  @override
  String get tabChats => 'Chats';

  @override
  String get tabArchived => 'Archivados';

  @override
  String get searchChatsHint => 'Buscar chats';

  @override
  String get enterCodeTitle => 'Introduce código';

  @override
  String get upTo8DigitsHint => 'Hasta 8 dígitos';

  @override
  String get continueAction => 'Continuar';

  @override
  String get updatingHiddenChats => 'Actualizando chats ocultos...';

  @override
  String get chatsUnhidden => 'Chats mostrados.';

  @override
  String get selectAtLeastOneChat => 'Selecciona al menos un chat.';

  @override
  String get hidingChats => 'Ocultando chats...';

  @override
  String get lockingChats => 'Bloqueando chats...';

  @override
  String get chatsHidden => 'Chats ocultos.';

  @override
  String get chatsUnlocked => 'Chats desbloqueados.';

  @override
  String get chatsLocked => 'Chats bloqueados.';

  @override
  String get unlockChatTitle => 'Desbloquear chat';

  @override
  String get enterPasscodeHint => 'Introduce el código';

  @override
  String get unlockAction => 'Desbloquear';

  @override
  String get incorrectCode => 'Código incorrecto.';

  @override
  String importedOn(Object date) {
    return 'Importado $date';
  }

  @override
  String get unarchiveAction => 'Desarchivar';

  @override
  String get archiveAction => 'Archivar';

  @override
  String get deleteAction => 'Eliminar';

  @override
  String get deleteChatTitle => '¿Eliminar chat?';

  @override
  String get deleteChatConfirm =>
      'Esto elimina permanentemente el archivo y los medios.';

  @override
  String get archiveFolderMissing => 'Falta la carpeta del archivo.';

  @override
  String updateFailedWithDetail(Object error) {
    return 'Actualización fallida: $error';
  }

  @override
  String get renameAction => 'Renombrar';

  @override
  String get working => 'Trabajando...';

  @override
  String get importPreparing => 'Preparando importación...';

  @override
  String get importAnalyzing => 'Analizando archivo...';

  @override
  String get bookmarksLabel => 'Marcadores';

  @override
  String get previousBookmark => 'Marcador anterior';

  @override
  String get nextBookmark => 'Siguiente marcador';

  @override
  String get importLargeFileNotice =>
      'Se detectó un archivo grande. Puede tardar unos minutos.';

  @override
  String get importExtracting => 'Extrayendo archivos...';

  @override
  String get importFinalizing => 'Finalizando...';

  @override
  String importFailedWithDetail(Object error) {
    return 'Error de importación: $error';
  }

  @override
  String get sharedFileNotZip => 'El archivo compartido no es un ZIP.';

  @override
  String get unlockProToImportMoreChats =>
      'Desbloquea BackupChat Pro para importar más chats.';

  @override
  String get purchaseFailedTryAgain => 'La compra falló. Inténtalo de nuevo.';

  @override
  String get importErrorOnlyZip => 'Solo se admiten archivos .zip.';

  @override
  String get importErrorNoChatText =>
      'No se encontró un archivo de texto de chat de WhatsApp en el ZIP.';

  @override
  String get importErrorAlreadyImported => 'Este chat ya está importado.';

  @override
  String get howToImportTitle => 'Cómo importar';

  @override
  String get chooseImportMethodTitle => 'Elige tu método de importación';

  @override
  String get iosExportTitle => 'Exportar desde WhatsApp (iOS)';

  @override
  String get androidExportTitle => 'Exportar desde WhatsApp (Android)';

  @override
  String get iosStepOpenChat =>
      'Dentro de la aplicación WhatsApp, haga clic en el chat.';

  @override
  String get androidStepOpenChat =>
      'Dentro de la aplicación WhatsApp, haga clic en un chat.';

  @override
  String get iosStepOpenInfo =>
      'Haga clic en el nombre de la persona o del grupo en la parte superior.';

  @override
  String get androidStepOpenMenu => 'Haga clic en el menú.';

  @override
  String get iosStepExportChat =>
      'Desplácese hasta el final y seleccione Exportar chat.';

  @override
  String get androidStepMoreExport => 'Seleccione “Más”.';

  @override
  String get iosStepChooseMedia =>
      'Desde el menú de selección de aplicaciones (hoja para compartir), seleccione WhatsBackUp (en teléfonos más antiguos, guardar en archivos).';

  @override
  String get androidStepChooseMedia => 'Seleccione Exportar chat.';

  @override
  String get iosStepShareToApp => 'El chat se importará a WhatsBackUp.';

  @override
  String get androidStepShareToApp =>
      'Desde el menú de selección de aplicaciones (hoja para compartir), seleccione WhatsBackUp (en teléfonos más antiguos, guardar en archivos).';

  @override
  String get iosStepSaveToFiles => 'El chat se importará a WhatsBackUp.';

  @override
  String get androidStepSaveToDevice => 'El chat se importará a WhatsBackUp.';

  @override
  String get androidLargeImportNote =>
      'Tenga en cuenta que en los teléfonos Android más antiguos la importación de chats muy grandes tardará hasta un minuto en comenzar.';

  @override
  String get importZipTitle => 'Importar un ZIP guardado';

  @override
  String get iosStepImportZip =>
      'En WhatsBackUp, toque “Importar desde ZIP” y elija el archivo de Archivos.';

  @override
  String get androidStepImportZip =>
      'En WhatsBackUp, toque “Importar desde ZIP” y elija el archivo de su dispositivo.';

  @override
  String get managingChatsTitle => 'Gestionar chats';

  @override
  String get hideChatsWithCodeTitle => 'Ocultar chats con un código';

  @override
  String get stepTapGhostIcon => 'Toca el icono fantasma en la barra superior.';

  @override
  String get stepEnterCodeUpTo8Digits =>
      'Introduce un código (hasta 8 dígitos).';

  @override
  String get stepSelectChatsSubmitHide =>
      'Selecciona chats y toca Enviar para ocultarlos.';

  @override
  String get stepEnterSameCodeUnhide =>
      'Introduce el mismo código para mostrar esos chats.';

  @override
  String get stepDifferentCodesHideSets =>
      'Diferentes códigos pueden ocultar distintos conjuntos de chats.';

  @override
  String get lockChatsWithCodeTitle => 'Bloquear chats con un código';

  @override
  String get stepSwitchHideToLockMode =>
      'En Ajustes, cambia de Ocultar a Bloquear.';

  @override
  String get stepTapGhostIconEnterCode =>
      'Toca el icono fantasma e introduce un código.';

  @override
  String get stepSelectChatsSubmitLock =>
      'Selecciona chats y toca Enviar para bloquearlos.';

  @override
  String get stepLockedChatsRequireCode =>
      'Los chats bloqueados muestran un candado y requieren el código para abrirse.';

  @override
  String get archiveOrDeleteTitle => 'Archivar o eliminar';

  @override
  String get stepSwipeRightArchive =>
      'Desliza a la derecha para archivar o desarchivar.';

  @override
  String get stepSwipeLeftDelete =>
      'Desliza a la izquierda para eliminar (se requiere confirmación).';

  @override
  String get bullet => '•';

  @override
  String get welcomeTitle => 'Bienvenido';

  @override
  String get gotItAction => 'Entendido';

  @override
  String get settingsTitle => 'Ajustes';

  @override
  String get sectionFont => 'Fuente';

  @override
  String get sectionColor => 'Color';

  @override
  String get sectionAccessibility => '';

  @override
  String get sectionPrivacy => 'Privacidad';

  @override
  String get sectionPro => 'BackupChat Pro';

  @override
  String get sectionStorage => 'Almacenamiento';

  @override
  String get storageTitle => 'Almacenamiento';

  @override
  String get storageSubtitle =>
      'Ver el espacio del dispositivo y el almacenamiento del chat';

  @override
  String get storageAvailable => 'Almacenamiento disponible';

  @override
  String get storageAppSize => 'Tamaño de WhatsBackUp (incluidos los chats)';

  @override
  String get storageLocation => 'Ubicación de almacenamiento';

  @override
  String get storageLocationUnknown => 'Desconocido';

  @override
  String get storageCalculate => 'Calcular';

  @override
  String get storageCalculating => 'Calculador…';

  @override
  String get storageNotCalculated => 'No calculado';

  @override
  String storageLastCalculated(Object date) {
    return 'Último cálculo: $date';
  }

  @override
  String get storageLastCalculatedNone => 'Último cálculo: —';

  @override
  String get storageChatSizesToggle => 'Mostrar tamaños de chat en la lista';

  @override
  String get storageChatSizesSubtitle =>
      'Muestra el tamaño total de cada chat en la pantalla principal';

  @override
  String get storageCleanupTitle => 'Limpiar importaciones fallidas';

  @override
  String get storageCleanupSubtitle =>
      'Elimina importaciones incompletas o fallidas para liberar espacio.';

  @override
  String get storageCleanupEstimate => 'Espacio estimado a liberar';

  @override
  String get storageCleanupAction => 'Limpiar ahora';

  @override
  String get storageCleanupNone => 'No se encontraron importaciones fallidas.';

  @override
  String storageCleanupDone(Object size) {
    return 'Se limpió $size de importaciones fallidas.';
  }

  @override
  String storageCleanupLast(Object time) {
    return 'Última limpieza: $time';
  }

  @override
  String get proActiveTitle => 'Pro está activo';

  @override
  String get proUpgradeTitle => 'Actualiza a BackupChat Pro';

  @override
  String get proThankYouSubtitle => 'Gracias por apoyar la app.';

  @override
  String get proUnlockSubtitle => 'Desbloquea importaciones ilimitadas.';

  @override
  String get debugProOverrideTitle => 'Depuración: Force Pro';

  @override
  String get debugProOverrideSubtitle =>
      'Anulación local para pruebas (no requiere compra).';

  @override
  String paywallResult(Object result) {
    return 'Resultado del paywall: $result.';
  }

  @override
  String get purchaseCancelled => 'Compra cancelada.';

  @override
  String get restorePurchases => 'Restaurar compras';

  @override
  String get purchasesRestored => 'Compras restauradas.';

  @override
  String get restoreFailedTryAgain =>
      'La restauración falló. Inténtalo de nuevo.';

  @override
  String get manageSubscription => 'Gestionar suscripción';

  @override
  String get openCustomerCenter => 'Abrir RevenueCat Customer Center.';

  @override
  String get customerCenterUnavailable => 'Customer Center no disponible.';

  @override
  String get sectionAbout => 'Acerca de';

  @override
  String get aboutDescription =>
      'WhatsBackUp es un visor privado y sin conexión para exportaciones de chats de WhatsApp. Importa archivos ZIP o exporta directamente desde WhatsApp para mantener un archivo limpio y buscable con medios — sin necesidad de red.';

  @override
  String get sectionAboutDeveloper => 'Sobre el desarrollador';

  @override
  String get aboutDeveloperDescription =>
      'Creado por un desarrollador independiente centrado en la privacidad, la búsqueda rápida y archivos de chat limpios.';

  @override
  String get sectionHelp => 'Ayuda';

  @override
  String get showOnboardingAgain => 'Mostrar tutorial de nuevo';

  @override
  String get sdkConfigTitle => 'Configuración del SDK';

  @override
  String get publicKeyLabel => 'Clave pública';

  @override
  String get offeringIdLabel => 'ID de oferta';

  @override
  String get entitlementIdLabel => 'ID de derecho';

  @override
  String get lifetimeProductIdLabel => 'ID de producto vitalicio';

  @override
  String errorLabel(Object error) {
    return 'Error: $error';
  }

  @override
  String get offeringsTitle => 'Ofertas';

  @override
  String get currentOfferingLabel => 'Oferta actual';

  @override
  String get allOfferingsLabel => 'Todas las ofertas';

  @override
  String get customerInfoTitle => 'Información del cliente';

  @override
  String get activeEntitlementsLabel => 'Derechos activos';

  @override
  String get originalAppUserIdLabel => 'ID de usuario original';

  @override
  String get managementUrlLabel => 'URL de gestión';

  @override
  String get noneLabel => 'ninguno';

  @override
  String get refreshAction => 'Actualizar';

  @override
  String get noPackagesAvailable => 'No hay paquetes disponibles.';

  @override
  String get packagesTitle => 'Paquetes';

  @override
  String get fontSystem => 'Sistema';

  @override
  String get fontSerif => 'Serif';

  @override
  String get fontMono => 'Mononucleosis infecciosa';

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
  String get colorDeepTeal => 'Verde azulado oscuro';

  @override
  String get colorNavy => 'Azul marino';

  @override
  String get colorCharcoal => 'Carbón';

  @override
  String get colorBlindPaletteTitle => '';

  @override
  String get colorBlindPaletteSubtitle => '';

  @override
  String get hideChatsInsteadOfLocking => 'Ocultar chats en lugar de bloquear';

  @override
  String get hideChatsInsteadOfLockingSubtitle =>
      'Cuando está desactivado, los chats son visibles pero están protegidos por código.';

  @override
  String get previousMatch => 'Coincidencia anterior';

  @override
  String get nextMatch => 'Siguiente coincidencia';

  @override
  String get selectSenderOnRight => 'Selecciona quién está a la derecha';

  @override
  String couldNotOpenArchive(Object error) {
    return 'No se pudo abrir el archivo:\n$error';
  }

  @override
  String couldNotOpenFile(Object message) {
    return 'No se pudo abrir el archivo: $message';
  }

  @override
  String attachmentMissing(Object filename) {
    return 'Adjunto faltante: $filename';
  }

  @override
  String get unknownError => 'Error desconocido';

  @override
  String get openPdf => 'Abrir PDF';

  @override
  String get openFile => 'Abrir archivo';

  @override
  String get openAudio => 'Abrir audio';

  @override
  String senderMeLabel(Object sender) {
    return '$sender (Yo)';
  }

  @override
  String get chatFileNotFound => 'Archivo de chat no encontrado.';

  @override
  String get languageTitle => 'Idioma';

  @override
  String get languageTooltip => 'Idioma';

  @override
  String get moreOptionsTooltip => 'Más opciones';

  @override
  String get filterTitle => 'Filtro';

  @override
  String get filterDateRange => 'Rango de fechas';

  @override
  String get filterAnyDate => 'Cualquier fecha';

  @override
  String get filterIncludeMedia => 'Incluir multimedia';

  @override
  String get filterMediaOnly => 'Solo multimedia';

  @override
  String get filterSenders => 'Remitentes';

  @override
  String get applyFilters => 'Aplicar';

  @override
  String get clearFilters => 'Borrar filtros';

  @override
  String get incrementalImportTitle => 'El chat ya existe';

  @override
  String incrementalImportMessage(Object name) {
    return '¿Agregar esta importación a \"$name\"?';
  }

  @override
  String get incrementalAddAction => 'Agregar';

  @override
  String get incrementalChooseTitle => 'Elegir chat para actualizar';

  @override
  String get incrementalUpdated => 'Chat actualizado.';

  @override
  String get languageSystem => 'Sistema';

  @override
  String get languageEnglish => 'Inglés';

  @override
  String get languageSpanish => 'Español';

  @override
  String get languageGerman => 'Alemán';

  @override
  String get languageFrench => 'Francés';

  @override
  String get languagePortuguese => 'Portugués';

  @override
  String get languageRomanian => 'Rumano';

  @override
  String get languageAfrikaans => 'Afrikáans';

  @override
  String get languageRussian => 'Ruso';

  @override
  String get showImportButton => 'Mostrar botón Importar';

  @override
  String get showImportButtonSubtitle =>
      'Alternar el botón Importar ZIP en la pantalla de inicio.';

  @override
  String get importButtonHiddenMessage =>
      'Botón de importación oculto. Puedes reactivarlo en Ajustes.';

  @override
  String get upgradeToAccessChat => 'Mejora para acceder a este chat.';

  @override
  String get aboutLegalTitle => 'Acerca de y legal';

  @override
  String get aboutLegalSummary =>
      'WhatsBackUp es un visor offline para exportaciones de chats de WhatsApp. Tus chats permanecen en tu dispositivo.';

  @override
  String get aboutLegalRefundPolicy =>
      'Reembolsos: Si se emite un reembolso, solo los primeros 5 chats importados permanecen accesibles. Los chats por encima del límite gratuito se desactivan hasta volver a comprar.';

  @override
  String get aboutLegalDisclaimers =>
      'Descargos: No somos responsables por pérdida de datos, contenido de chat, precisión de traducciones ni el uso de funciones de ocultar/bloquear. Mantén tus propios respaldos.';

  @override
  String get aboutLegalAffiliation =>
      'No afiliado con WhatsApp ni Meta. WhatsApp es una marca registrada de Meta Platforms, Inc.';

  @override
  String get aboutLegalSupport => 'Soporte: vwdewaal@gmail.com';

  @override
  String get aboutLegalDeveloper => 'Desarrollador: Van Wyk De Waal';

  @override
  String get aboutLegalJurisdiction => 'Jurisdicción: UE/Reino Unido';

  @override
  String aboutLegalVersion(Object version) {
    return 'Versión de la app: $version';
  }

  @override
  String get versionLoading => 'Versión de la app: cargando...';

  @override
  String get languageScottishGaelic => 'gaélico escocés';

  @override
  String get languageScots => 'escocés';

  @override
  String get languageChinese => 'Chino (mandarín)';

  @override
  String get languageHindi => 'No';

  @override
  String get languageArabic => 'árabe';

  @override
  String get languageBengali => 'bengalí';

  @override
  String get languageJapanese => 'japonés';

  @override
  String get languagePunjabi => 'punjabi';

  @override
  String get languageKorean => 'coreano';

  @override
  String get languageTurkish => 'turco';

  @override
  String get languageItalian => 'italiano';

  @override
  String get languageVietnamese => 'vietnamita';

  @override
  String get languageUrdu => 'Urdu';

  @override
  String get languageIndonesian => 'indonesio';

  @override
  String get languageThai => 'tailandés';

  @override
  String get languagePolish => 'Polaco';

  @override
  String get languageDutch => 'Holandés';

  @override
  String get identifyMeTitle => 'Identifícate';

  @override
  String get identifyMeSubtitle =>
      'Seleccione su nombre para que podamos etiquetar correctamente sus mensajes.';

  @override
  String get identifyMeNotNow => 'Ahora no';
}
