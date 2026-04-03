// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'WhatsBackUp';

  @override
  String get importZip => 'Importar ZIP';

  @override
  String get importAction => 'Importar';

  @override
  String get importingLabel => 'Importação';

  @override
  String get importDoneLabel => 'FEITO!';

  @override
  String get importLargeStarted => 'Importação iniciada';

  @override
  String get importTriggeredMessage =>
      'A importação foi iniciada em segundo plano e o chat será aberto quando estiver concluída. Mantenha o aplicativo aberto.';

  @override
  String get mediaImportingTitle => 'Importação de mídia';

  @override
  String get mediaImportingSubtitle =>
      'Você pode ler o chat enquanto a mídia termina de ser exibida.';

  @override
  String get mediaImportPausedTitle => 'Importação de mídia pausada';

  @override
  String get mediaImportPausedSubtitle =>
      'Selecione novamente o arquivo ZIP original para continuar.';

  @override
  String get mediaImportFailedTitle => 'A importação de mídia falhou';

  @override
  String get mediaImportFailedSubtitle => 'Toque para tentar novamente.';

  @override
  String get mediaImportResumeAction => 'Retomar';

  @override
  String get mediaImportingLabel => 'Importação de mídia';

  @override
  String get contactLoadingLabel => 'Carregando contato…';

  @override
  String get contactUnknownName => 'Contato';

  @override
  String get contactPhoneLabel => 'Telefone';

  @override
  String get contactEmailLabel => 'E-mail';

  @override
  String get openContactAction => 'Contato aberto';

  @override
  String contactOpenFailed(Object error) {
    return 'Não foi possível abrir o contato: $error';
  }

  @override
  String get howToImport => 'Como importar';

  @override
  String get settings => 'Definições';

  @override
  String get searchTitle => 'Pesquisar';

  @override
  String get textToInclude => 'Texto a incluir:';

  @override
  String get enterSearchText => 'Introduza o texto de pesquisa...';

  @override
  String get dateRange => 'Intervalo de datas:';

  @override
  String get fromLabel => 'De:';

  @override
  String get toLabel => 'Até:';

  @override
  String get selectLabel => 'Selecionar';

  @override
  String get showOnlyMediaFiles => 'Mostrar apenas ficheiros multimédia';

  @override
  String get clearAction => 'Limpar';

  @override
  String get searchAction => 'Pesquisar';

  @override
  String get renameChatTitle => 'Renomear chat';

  @override
  String get chatNameHint => 'Nome do chat';

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
      'Ainda não há chats.\nUse \"Importar ZIP\" para carregar uma exportação do WhatsApp,\nou exporte diretamente do WhatsApp usando a opção Exportar chat.';

  @override
  String get noArchivedChats => 'Sem chats arquivados.';

  @override
  String get tabChats => 'Bate-papos';

  @override
  String get tabArchived => 'Arquivados';

  @override
  String get searchChatsHint => 'Pesquisar chats';

  @override
  String get enterCodeTitle => 'Introduzir código';

  @override
  String get upTo8DigitsHint => 'Até 8 dígitos';

  @override
  String get continueAction => 'Continuar';

  @override
  String get updatingHiddenChats => 'A atualizar chats ocultos...';

  @override
  String get chatsUnhidden => 'Chats mostrados.';

  @override
  String get selectAtLeastOneChat => 'Selecione pelo menos um chat.';

  @override
  String get hidingChats => 'A ocultar chats...';

  @override
  String get lockingChats => 'A bloquear chats...';

  @override
  String get chatsHidden => 'Chats ocultos.';

  @override
  String get chatsUnlocked => 'Chats desbloqueados.';

  @override
  String get chatsLocked => 'Chats bloqueados.';

  @override
  String get unlockChatTitle => 'Desbloquear chat';

  @override
  String get enterPasscodeHint => 'Introduzir código';

  @override
  String get unlockAction => 'Desbloquear';

  @override
  String get incorrectCode => 'Código incorreto.';

  @override
  String importedOn(Object date) {
    return 'Importado $date';
  }

  @override
  String get unarchiveAction => 'Desarquivar';

  @override
  String get archiveAction => 'Arquivar';

  @override
  String get deleteAction => 'Eliminar';

  @override
  String get deleteChatTitle => 'Eliminar chat?';

  @override
  String get deleteChatConfirm =>
      'Isto elimina permanentemente o arquivo e os ficheiros multimédia.';

  @override
  String get archiveFolderMissing => 'A pasta de arquivo estava em falta.';

  @override
  String updateFailedWithDetail(Object error) {
    return 'Falha na atualização: $error';
  }

  @override
  String get renameAction => 'Renomear';

  @override
  String get working => 'A trabalhar...';

  @override
  String get importPreparing => 'A preparar importação...';

  @override
  String get importAnalyzing => 'Analisando o arquivo...';

  @override
  String get bookmarksLabel => 'Favoritos';

  @override
  String get previousBookmark => 'Favorito anterior';

  @override
  String get nextBookmark => 'Próximo marcador';

  @override
  String get importLargeFileNotice =>
      'Arquivo grande detectado. Isso pode levar alguns minutos.';

  @override
  String get importExtracting => 'A extrair ficheiros...';

  @override
  String get importFinalizing => 'A finalizar...';

  @override
  String importFailedWithDetail(Object error) {
    return 'Falha ao importar: $error';
  }

  @override
  String get sharedFileNotZip => 'O ficheiro partilhado não é um ZIP.';

  @override
  String get unlockProToImportMoreChats =>
      'Desbloqueie o BackupChat Pro para importar mais chats.';

  @override
  String get purchaseFailedTryAgain => 'A compra falhou. Tente novamente.';

  @override
  String get importErrorOnlyZip => 'Apenas ficheiros .zip são suportados.';

  @override
  String get importErrorNoChatText =>
      'Não foi encontrado um ficheiro de texto de chat do WhatsApp no ZIP.';

  @override
  String get importErrorAlreadyImported => 'Este chat já foi importado.';

  @override
  String get howToImportTitle => 'Como importar';

  @override
  String get chooseImportMethodTitle => 'Escolha o método de importação';

  @override
  String get iosExportTitle => 'Exportar do WhatsApp (iOS)';

  @override
  String get androidExportTitle => 'Exportar do WhatsApp (Android)';

  @override
  String get iosStepOpenChat =>
      'Dentro do aplicativo WhatsApp, clique na conversa.';

  @override
  String get androidStepOpenChat =>
      'Dentro do aplicativo WhatsApp, clique em uma conversa.';

  @override
  String get iosStepOpenInfo =>
      'Clique no nome da pessoa ou do grupo na parte superior.';

  @override
  String get androidStepOpenMenu => 'Clique no menu.';

  @override
  String get iosStepExportChat =>
      'Role a página até o final e selecione Exportar chat.';

  @override
  String get androidStepMoreExport => 'Selecione “Mais”.';

  @override
  String get iosStepChooseMedia =>
      'No menu de seleção de aplicativos (folha de compartilhamento), selecione WhatsBackUp (em telefones mais antigos, salve em arquivos).';

  @override
  String get androidStepChooseMedia => 'Selecione Exportar chat.';

  @override
  String get iosStepShareToApp => 'O chat será importado para o WhatsBackUp.';

  @override
  String get androidStepShareToApp =>
      'No menu de seleção de aplicativos (folha de compartilhamento), selecione WhatsBackUp (em telefones mais antigos, salve em arquivos).';

  @override
  String get iosStepSaveToFiles => 'O chat será importado para o WhatsBackUp.';

  @override
  String get androidStepSaveToDevice =>
      'O chat será importado para o WhatsBackUp.';

  @override
  String get androidLargeImportNote =>
      'Observe que em telefones Android mais antigos, a importação de conversas muito grandes pode levar até um minuto para iniciar.';

  @override
  String get importZipTitle => 'Importar um arquivo ZIP salvo';

  @override
  String get iosStepImportZip =>
      'No WhatsBackUp, toque em “Importar de ZIP” e escolha o arquivo em Arquivos.';

  @override
  String get androidStepImportZip =>
      'No WhatsBackUp, toque em “Importar de ZIP” e escolha o arquivo no seu dispositivo.';

  @override
  String get managingChatsTitle => 'Gerir chats';

  @override
  String get hideChatsWithCodeTitle => 'Ocultar chats com um código';

  @override
  String get stepTapGhostIcon => 'Toque no ícone fantasma na barra superior.';

  @override
  String get stepEnterCodeUpTo8Digits => 'Introduza um código (até 8 dígitos).';

  @override
  String get stepSelectChatsSubmitHide =>
      'Selecione chats e toque em Enviar para os ocultar.';

  @override
  String get stepEnterSameCodeUnhide =>
      'Introduza o mesmo código novamente para mostrar esses chats.';

  @override
  String get stepDifferentCodesHideSets =>
      'Códigos diferentes podem ocultar conjuntos diferentes de chats.';

  @override
  String get lockChatsWithCodeTitle => 'Bloquear chats com um código';

  @override
  String get stepSwitchHideToLockMode =>
      'Em Definições, mude de Ocultar para Bloquear.';

  @override
  String get stepTapGhostIconEnterCode =>
      'Toque no ícone fantasma e introduza um código.';

  @override
  String get stepSelectChatsSubmitLock =>
      'Selecione chats e toque em Enviar para os bloquear.';

  @override
  String get stepLockedChatsRequireCode =>
      'Os chats bloqueados mostram um cadeado e exigem o código para abrir.';

  @override
  String get archiveOrDeleteTitle => 'Arquivar ou eliminar';

  @override
  String get stepSwipeRightArchive =>
      'Deslize para a direita para arquivar ou desarquivar.';

  @override
  String get stepSwipeLeftDelete =>
      'Deslize para a esquerda para eliminar (confirmação necessária).';

  @override
  String get bullet => '•';

  @override
  String get welcomeTitle => 'Bem-vindo';

  @override
  String get gotItAction => 'Percebi';

  @override
  String get settingsTitle => 'Definições';

  @override
  String get sectionFont => 'Tipo de letra';

  @override
  String get sectionColor => 'Cor';

  @override
  String get sectionAccessibility => '';

  @override
  String get sectionPrivacy => 'Privacidade';

  @override
  String get sectionPro => 'BackupChat Pro';

  @override
  String get sectionStorage => 'Armazenar';

  @override
  String get storageTitle => 'Armazenar';

  @override
  String get storageSubtitle =>
      'Veja o espaço disponível no dispositivo e o armazenamento de conversas.';

  @override
  String get storageAvailable => 'Espaço de armazenamento disponível';

  @override
  String get storageAppSize =>
      'Tamanho do backup do WhatsBackUp (incluindo conversas)';

  @override
  String get storageLocation => 'Local de armazenamento';

  @override
  String get storageLocationUnknown => 'Desconhecido';

  @override
  String get storageCalculate => 'Calcular';

  @override
  String get storageCalculating => 'Calculando…';

  @override
  String get storageNotCalculated => 'Não calculado';

  @override
  String storageLastCalculated(Object date) {
    return 'Último cálculo: $date';
  }

  @override
  String get storageLastCalculatedNone => 'Último cálculo: —';

  @override
  String get storageChatSizesToggle => 'Exibir tamanhos de bate-papo em lista';

  @override
  String get storageChatSizesSubtitle =>
      'Exibe o tamanho total de cada chat na tela principal.';

  @override
  String get storageCleanupTitle => 'Limpar importações com falha';

  @override
  String get storageCleanupSubtitle =>
      'Remove importações incompletas ou com falha para liberar espaço.';

  @override
  String get storageCleanupEstimate => 'Espaço estimado para liberar';

  @override
  String get storageCleanupAction => 'Limpe agora';

  @override
  String get storageCleanupNone =>
      'Nenhuma importação com falha foi encontrada.';

  @override
  String storageCleanupDone(Object size) {
    return '$size limpo de importações com falha.';
  }

  @override
  String storageCleanupLast(Object time) {
    return 'Última limpeza: $time';
  }

  @override
  String get proActiveTitle => 'Pro está ativo';

  @override
  String get proUpgradeTitle => 'Atualizar para BackupChat Pro';

  @override
  String get proThankYouSubtitle => 'Obrigado por apoiar a aplicação.';

  @override
  String get proUnlockSubtitle => 'Desbloqueie importações ilimitadas.';

  @override
  String get debugProOverrideTitle => 'Depuração: Forçar Pro';

  @override
  String get debugProOverrideSubtitle =>
      'Substituição local para testes (não requer compra).';

  @override
  String paywallResult(Object result) {
    return 'Resultado do paywall: $result.';
  }

  @override
  String get purchaseCancelled => 'Compra cancelada.';

  @override
  String get restorePurchases => 'Restaurar compras';

  @override
  String get purchasesRestored => 'Compras restauradas.';

  @override
  String get restoreFailedTryAgain => 'Falha ao restaurar. Tente novamente.';

  @override
  String get manageSubscription => 'Gerir subscrição';

  @override
  String get openCustomerCenter => 'Abrir RevenueCat Customer Center.';

  @override
  String get customerCenterUnavailable => 'Customer Center indisponível.';

  @override
  String get sectionAbout => 'Sobre';

  @override
  String get aboutDescription =>
      'O WhatsBackUp é um visualizador privado e offline de exportações de chats do WhatsApp. Importe ficheiros ZIP ou exporte diretamente do WhatsApp para manter um arquivo limpo e pesquisável com multimédia — sem rede necessária.';

  @override
  String get sectionAboutDeveloper => 'Sobre o developer';

  @override
  String get aboutDeveloperDescription =>
      'Criado por um developer independente focado na privacidade, pesquisa rápida e arquivos de chat limpos.';

  @override
  String get sectionHelp => 'Ajuda';

  @override
  String get showOnboardingAgain => 'Mostrar introdução novamente';

  @override
  String get sdkConfigTitle => 'Configuração do SDK';

  @override
  String get publicKeyLabel => 'Chave pública';

  @override
  String get offeringIdLabel => 'ID da oferta';

  @override
  String get entitlementIdLabel => 'ID do entitlement';

  @override
  String get lifetimeProductIdLabel => 'ID do produto vitalício';

  @override
  String errorLabel(Object error) {
    return 'Erro: $error';
  }

  @override
  String get offeringsTitle => 'Ofertas';

  @override
  String get currentOfferingLabel => 'Oferta atual';

  @override
  String get allOfferingsLabel => 'Todas as ofertas';

  @override
  String get customerInfoTitle => 'Informação do cliente';

  @override
  String get activeEntitlementsLabel => 'Entitlements ativos';

  @override
  String get originalAppUserIdLabel => 'ID de utilizador original';

  @override
  String get managementUrlLabel => 'URL de gestão';

  @override
  String get noneLabel => 'nenhum';

  @override
  String get refreshAction => 'Atualizar';

  @override
  String get noPackagesAvailable => 'Sem pacotes disponíveis.';

  @override
  String get packagesTitle => 'Pacotes';

  @override
  String get fontSystem => 'Sistema';

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
  String get colorDeepTeal => 'Azul-petróleo escuro';

  @override
  String get colorNavy => 'Azul-marinho';

  @override
  String get colorCharcoal => 'Carvão';

  @override
  String get colorBlindPaletteTitle => '';

  @override
  String get colorBlindPaletteSubtitle => '';

  @override
  String get hideChatsInsteadOfLocking => 'Ocultar chats em vez de bloquear';

  @override
  String get hideChatsInsteadOfLockingSubtitle =>
      'Quando desligado, os chats ficam visíveis mas protegidos por código.';

  @override
  String get previousMatch => 'Correspondência anterior';

  @override
  String get nextMatch => 'Próxima correspondência';

  @override
  String get selectSenderOnRight => 'Selecione quem está à direita';

  @override
  String couldNotOpenArchive(Object error) {
    return 'Não foi possível abrir o arquivo:\n$error';
  }

  @override
  String couldNotOpenFile(Object message) {
    return 'Não foi possível abrir o ficheiro: $message';
  }

  @override
  String attachmentMissing(Object filename) {
    return 'Anexo em falta: $filename';
  }

  @override
  String get unknownError => 'Erro desconhecido';

  @override
  String get openPdf => 'Abrir PDF';

  @override
  String get openFile => 'Abrir ficheiro';

  @override
  String get openAudio => 'Abrir áudio';

  @override
  String senderMeLabel(Object sender) {
    return '$sender (Eu)';
  }

  @override
  String get chatFileNotFound => 'Ficheiro de chat não encontrado.';

  @override
  String get languageTitle => 'Idioma';

  @override
  String get languageTooltip => 'Idioma';

  @override
  String get moreOptionsTooltip => 'Mais opções';

  @override
  String get filterTitle => 'Filtro';

  @override
  String get filterDateRange => 'Intervalo de datas';

  @override
  String get filterAnyDate => 'Qualquer data';

  @override
  String get filterIncludeMedia => 'Incluir mídia';

  @override
  String get filterMediaOnly => 'Somente mídia';

  @override
  String get filterSenders => 'Remetentes';

  @override
  String get applyFilters => 'Aplicar';

  @override
  String get clearFilters => 'Limpar filtros';

  @override
  String get incrementalImportTitle => 'O chat já existe';

  @override
  String incrementalImportMessage(Object name) {
    return 'Adicionar esta importação a \"$name\"?';
  }

  @override
  String get incrementalAddAction => 'Adicionar';

  @override
  String get incrementalChooseTitle => 'Escolha o chat para atualizar';

  @override
  String get incrementalUpdated => 'Chat atualizado.';

  @override
  String get languageSystem => 'Sistema';

  @override
  String get languageEnglish => 'Inglês';

  @override
  String get languageSpanish => 'Espanhol';

  @override
  String get languageGerman => 'Alemão';

  @override
  String get languageFrench => 'Francês';

  @override
  String get languagePortuguese => 'Português';

  @override
  String get languageRomanian => 'Romeno';

  @override
  String get languageAfrikaans => 'africano';

  @override
  String get languageRussian => 'Russo';

  @override
  String get showImportButton => 'Mostrar botão Importar';

  @override
  String get showImportButtonSubtitle =>
      'Ativar ou desativar o botão Importar ZIP no ecrã inicial.';

  @override
  String get importButtonHiddenMessage =>
      'Botão de importação oculto. Pode reativá-lo nas Definições.';

  @override
  String get upgradeToAccessChat => 'Faça upgrade para aceder a este chat.';

  @override
  String get aboutLegalTitle => 'Sobre & Legal';

  @override
  String get aboutLegalSummary =>
      'WhatsBackUp é um visualizador offline de exportações de chats do WhatsApp. Os seus chats ficam no seu dispositivo.';

  @override
  String get aboutLegalRefundPolicy =>
      'Reembolsos: se for emitido um reembolso, apenas os primeiros 5 chats importados ficam acessíveis. Chats acima do limite gratuito ficam desativados até nova compra.';

  @override
  String get aboutLegalDisclaimers =>
      'Isenções: não somos responsáveis por perda de dados, conteúdo de chats, precisão de traduções ou uso das funções de bloquear/ocultar. Guarde as suas próprias cópias.';

  @override
  String get aboutLegalAffiliation =>
      'Não somos afiliados ao WhatsApp ou à Meta. WhatsApp é uma marca da Meta Platforms, Inc.';

  @override
  String get aboutLegalSupport => 'Suporte: vwdewaal@gmail.com';

  @override
  String get aboutLegalDeveloper => 'Desenvolvedor: Van Wyk De Waal';

  @override
  String get aboutLegalJurisdiction => 'Jurisdição: UE/Reino Unido';

  @override
  String aboutLegalVersion(Object version) {
    return 'Versão da app: $version';
  }

  @override
  String get versionLoading => 'Versão da app: a carregar...';

  @override
  String get languageScottishGaelic => 'gaélico escocês';

  @override
  String get languageScots => 'escocês';

  @override
  String get languageChinese => 'Chinês (Mandarim)';

  @override
  String get languageHindi => 'Não';

  @override
  String get languageArabic => 'árabe';

  @override
  String get languageBengali => 'bengali';

  @override
  String get languageJapanese => 'japonês';

  @override
  String get languagePunjabi => 'Punjabi';

  @override
  String get languageKorean => 'coreano';

  @override
  String get languageTurkish => 'turco';

  @override
  String get languageItalian => 'italiano';

  @override
  String get languageVietnamese => 'vietnamita';

  @override
  String get languageUrdu => 'urdu';

  @override
  String get languageIndonesian => 'indonésio';

  @override
  String get languageThai => 'Tailandês';

  @override
  String get languagePolish => 'polonês';

  @override
  String get languageDutch => 'Holandês';

  @override
  String get identifyMeTitle => 'Identifique-se';

  @override
  String get identifyMeSubtitle =>
      'Selecione seu nome para que possamos identificar suas mensagens corretamente.';

  @override
  String get identifyMeNotNow => 'Agora não';
}
