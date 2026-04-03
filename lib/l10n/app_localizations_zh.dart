// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'WhatsBackUp';

  @override
  String get importZip => '导入 ZIP';

  @override
  String get importAction => '进口';

  @override
  String get importingLabel => '输入';

  @override
  String get importDoneLabel => '完毕！';

  @override
  String get importLargeStarted => '导入开始';

  @override
  String get importTriggeredMessage => '导入操作已在后台触发，完成后聊天窗口将自动打开。请保持应用开启状态。';

  @override
  String get mediaImportingTitle => '导入媒体';

  @override
  String get mediaImportingSubtitle => '媒体报道结束后，您可以阅读聊天记录。';

  @override
  String get mediaImportPausedTitle => '媒体导入已暂停';

  @override
  String get mediaImportPausedSubtitle => '重新选择原始的ZIP以继续。';

  @override
  String get mediaImportFailedTitle => '媒体导入失败';

  @override
  String get mediaImportFailedSubtitle => '点击重试。';

  @override
  String get mediaImportResumeAction => '恢复';

  @override
  String get mediaImportingLabel => '媒体导入';

  @override
  String get contactLoadingLabel => '正在加载联系人…';

  @override
  String get contactUnknownName => '接触';

  @override
  String get contactPhoneLabel => '电话';

  @override
  String get contactEmailLabel => '电子邮件';

  @override
  String get openContactAction => '开放联系';

  @override
  String contactOpenFailed(Object error) {
    return '无法打开联系人：$error';
  }

  @override
  String get howToImport => '如何导入';

  @override
  String get settings => '设置';

  @override
  String get searchTitle => '搜索';

  @override
  String get textToInclude => '需包含的文本：';

  @override
  String get enterSearchText => '请输入搜索文本...';

  @override
  String get dateRange => '日期范围：';

  @override
  String get fromLabel => '从：';

  @override
  String get toLabel => '到：';

  @override
  String get selectLabel => '选择';

  @override
  String get showOnlyMediaFiles => '仅显示媒体文件';

  @override
  String get clearAction => '清除';

  @override
  String get searchAction => '搜索';

  @override
  String get renameChatTitle => '重命名聊天';

  @override
  String get chatNameHint => '聊天名称';

  @override
  String get cancelAction => '取消';

  @override
  String get saveAction => '节省';

  @override
  String get hideChatsTooltip => '隐藏聊天记录';

  @override
  String get hideAction => '隐藏';

  @override
  String get lockAction => '锁';

  @override
  String get noChatsYetHint =>
      '暂无聊天记录。\n\n使用“导入 ZIP”加载 WhatsApp 导出文件，\n\n或使用聊天记录的“导出聊天记录”选项直接从 WhatsApp 导出。';

  @override
  String get noArchivedChats => '没有存档聊天记录。';

  @override
  String get tabChats => '聊天';

  @override
  String get tabArchived => '已存档';

  @override
  String get searchChatsHint => '搜索聊天记录';

  @override
  String get enterCodeTitle => '输入代码';

  @override
  String get upTo8DigitsHint => '最多 8 位数字';

  @override
  String get continueAction => '继续';

  @override
  String get updatingHiddenChats => '正在更新隐藏聊天记录……';

  @override
  String get chatsUnhidden => '聊天记录公开显示。';

  @override
  String get selectAtLeastOneChat => '至少选择一个聊天对象。';

  @override
  String get hidingChats => '隐藏聊天记录……';

  @override
  String get lockingChats => '正在锁定聊天记录……';

  @override
  String get chatsHidden => '聊天记录已隐藏。';

  @override
  String get chatsUnlocked => '聊天功能已解锁。';

  @override
  String get chatsLocked => '聊天已锁定。';

  @override
  String get unlockChatTitle => '解锁聊天';

  @override
  String get enterPasscodeHint => '输入密码';

  @override
  String get unlockAction => '开锁';

  @override
  String get incorrectCode => '代码错误。';

  @override
  String importedOn(Object date) {
    return '进口 $date';
  }

  @override
  String get unarchiveAction => '取消存档';

  @override
  String get archiveAction => '档案';

  @override
  String get deleteAction => '删除';

  @override
  String get deleteChatTitle => '删除聊天记录？';

  @override
  String get deleteChatConfirm => '这将永久删除存档和媒体文件。';

  @override
  String get archiveFolderMissing => '归档文件夹缺失。';

  @override
  String updateFailedWithDetail(Object error) {
    return '更新失败：$error';
  }

  @override
  String get renameAction => '重命名';

  @override
  String get working => '在职的...';

  @override
  String get importPreparing => '准备导入...';

  @override
  String get importAnalyzing => '正在分析文件……';

  @override
  String get bookmarksLabel => '书签';

  @override
  String get previousBookmark => '上一个书签';

  @override
  String get nextBookmark => '下一个书签';

  @override
  String get importLargeFileNotice => '检测到大文件。这可能需要几分钟时间。';

  @override
  String get importExtracting => '正在提取文件...';

  @override
  String get importFinalizing => '正在最后阶段……';

  @override
  String importFailedWithDetail(Object error) {
    return '导入失败：$error';
  }

  @override
  String get sharedFileNotZip => '共享文件不是 ZIP。';

  @override
  String get unlockProToImportMoreChats => '解锁 BackupChat Pro 以导入更多聊天记录。';

  @override
  String get purchaseFailedTryAgain => '购买失败，请重试。';

  @override
  String get importErrorOnlyZip => '仅支持.zip文件。';

  @override
  String get importErrorNoChatText => '在 ZIP 中未找到 WhatsApp 聊天文本文件。';

  @override
  String get importErrorAlreadyImported => '此聊天记录已导入。';

  @override
  String get howToImportTitle => '如何导入';

  @override
  String get chooseImportMethodTitle => '选择您的导入方式';

  @override
  String get iosExportTitle => '从 WhatsApp (iOS) 导出';

  @override
  String get androidExportTitle => '从 WhatsApp (Android) 导出';

  @override
  String get iosStepOpenChat => '在 WhatsApp 应用内，点击进入聊天窗口。';

  @override
  String get androidStepOpenChat => '在 WhatsApp 应用中，点击进入聊天。';

  @override
  String get iosStepOpenInfo => '点击顶部的人名或团体名。';

  @override
  String get androidStepOpenMenu => '点击菜单。';

  @override
  String get iosStepExportChat => '向下滚动到最底部，然后选择“导出聊天记录”。';

  @override
  String get androidStepMoreExport => '选择“更多”。';

  @override
  String get iosStepChooseMedia =>
      '从应用程序选择菜单（共享表）中选择 WhatsBackUp（在较旧的手机上，保存到文件）。';

  @override
  String get androidStepChooseMedia => '选择“导出聊天记录”。';

  @override
  String get iosStepShareToApp => '聊天记录将导入到 WhatsBackUp 中。';

  @override
  String get androidStepShareToApp =>
      '从应用程序选择菜单（共享表）中选择 WhatsBackUp（在较旧的手机上，保存到文件）。';

  @override
  String get iosStepSaveToFiles => '聊天记录将导入到 WhatsBackUp 中。';

  @override
  String get androidStepSaveToDevice => '聊天记录将导入到 WhatsBackUp 中。';

  @override
  String get androidLargeImportNote =>
      '请注意，在较旧的安卓手机上，导入非常大的聊天记录可能需要长达一分钟的时间才能开始。';

  @override
  String get importZipTitle => '导入已保存的 ZIP 文件';

  @override
  String get iosStepImportZip => '在 WhatsBackUp 中，点击“从 ZIP 导入”，然后从“文件”中选择文件。';

  @override
  String get androidStepImportZip =>
      '在 WhatsBackUp 中，点击“从 ZIP 导入”，然后从您的设备中选择文件。';

  @override
  String get managingChatsTitle => '管理聊天';

  @override
  String get hideChatsWithCodeTitle => '使用代码隐藏聊天记录';

  @override
  String get stepTapGhostIcon => '点击顶部栏中的幽灵图标。';

  @override
  String get stepEnterCodeUpTo8Digits => '请输入验证码（最多 8 位数字）。';

  @override
  String get stepSelectChatsSubmitHide => '选择聊天记录，然后点击“提交”将其隐藏。';

  @override
  String get stepEnterSameCodeUnhide => '再次输入相同的代码即可显示这些聊天记录。';

  @override
  String get stepDifferentCodesHideSets => '不同的代码可以隐藏不同的聊天记录。';

  @override
  String get lockChatsWithCodeTitle => '使用代码锁定聊天';

  @override
  String get stepSwitchHideToLockMode => '在设置中，将隐藏模式切换为锁定模式。';

  @override
  String get stepTapGhostIconEnterCode => '点击幽灵图标并输入代码。';

  @override
  String get stepSelectChatsSubmitLock => '选择聊天记录，然后点击“提交”将其锁定。';

  @override
  String get stepLockedChatsRequireCode => '已锁定的聊天会显示锁形图标，需要输入密码才能打开。';

  @override
  String get archiveOrDeleteTitle => '存档或删除';

  @override
  String get stepSwipeRightArchive => '向右滑动即可归档或取消归档。';

  @override
  String get stepSwipeLeftDelete => '向左滑动删除（需要确认）。';

  @override
  String get bullet => '•';

  @override
  String get welcomeTitle => '欢迎';

  @override
  String get gotItAction => '知道了';

  @override
  String get settingsTitle => '设置';

  @override
  String get sectionFont => '字体';

  @override
  String get sectionColor => '颜色';

  @override
  String get sectionAccessibility => '无障碍';

  @override
  String get sectionPrivacy => '隐私';

  @override
  String get sectionPro => 'BackupChat Pro';

  @override
  String get sectionStorage => '贮存';

  @override
  String get storageTitle => '贮存';

  @override
  String get storageSubtitle => '查看设备空间和聊天记录存储空间';

  @override
  String get storageAvailable => '可用存储空间';

  @override
  String get storageAppSize => 'WhatsBackUp 大小（包括聊天记录）';

  @override
  String get storageLocation => '存储位置';

  @override
  String get storageLocationUnknown => '未知';

  @override
  String get storageCalculate => '计算';

  @override
  String get storageCalculating => '正在计算……';

  @override
  String get storageNotCalculated => '未计算';

  @override
  String storageLastCalculated(Object date) {
    return '上次计算时间：$date';
  }

  @override
  String get storageLastCalculatedNone => '上次计算时间：—';

  @override
  String get storageChatSizesToggle => '在列表中显示聊天大小';

  @override
  String get storageChatSizesSubtitle => '在主屏幕上显示每个聊天的总人数';

  @override
  String get storageCleanupTitle => '清理失败的导入';

  @override
  String get storageCleanupSubtitle => '删除不完整或失败的导入以释放空间。';

  @override
  String get storageCleanupEstimate => '预计可腾出的空间';

  @override
  String get storageCleanupAction => '现在清洁';

  @override
  String get storageCleanupNone => '未发现导入失败的情况。';

  @override
  String storageCleanupDone(Object size) {
    return '已清理 $size 中失败的导入。';
  }

  @override
  String storageCleanupLast(Object time) {
    return '上次清理：$time';
  }

  @override
  String get proActiveTitle => '专业版已激活';

  @override
  String get proUpgradeTitle => '升级到BackupChat Pro';

  @override
  String get proThankYouSubtitle => '感谢您对本应用的支持。';

  @override
  String get proUnlockSubtitle => '解锁无限量导入功能。';

  @override
  String get debugProOverrideTitle => '调试：强制专业版';

  @override
  String get debugProOverrideSubtitle => '用于测试的本地覆盖（无需购买）。';

  @override
  String paywallResult(Object result) {
    return '付费墙结果：$result。';
  }

  @override
  String get purchaseCancelled => '购买已取消。';

  @override
  String get restorePurchases => '恢复购买记录';

  @override
  String get purchasesRestored => '购买记录已恢复。';

  @override
  String get restoreFailedTryAgain => '恢复失败，请重试。';

  @override
  String get manageSubscription => '管理订阅';

  @override
  String get openCustomerCenter => '打开 RevenueCat 客户中心。';

  @override
  String get customerCenterUnavailable => '客服中心无法访问。';

  @override
  String get sectionAbout => '关于';

  @override
  String get aboutDescription =>
      'WhatsBackUp 是一个私有的离线查看器，用于查看 WhatsApp 的聊天记录导出文件。您可以导入 ZIP 文件，也可以直接从 WhatsApp 导出，以保存包含媒体文件的干净、可搜索的存档——无需网络连接。';

  @override
  String get sectionAboutDeveloper => '关于开发者';

  @override
  String get aboutDeveloperDescription => '由专注于隐私保护、快速搜索和干净的聊天记录的独立开发者构建。';

  @override
  String get sectionHelp => '帮助';

  @override
  String get showOnboardingAgain => '再次显示入职流程';

  @override
  String get sdkConfigTitle => 'SDK 配置';

  @override
  String get publicKeyLabel => '公钥';

  @override
  String get offeringIdLabel => '提供 ID';

  @override
  String get entitlementIdLabel => '授权 ID';

  @override
  String get lifetimeProductIdLabel => '终身产品 ID';

  @override
  String errorLabel(Object error) {
    return '错误：$error';
  }

  @override
  String get offeringsTitle => '供品';

  @override
  String get currentOfferingLabel => '当前供应';

  @override
  String get allOfferingsLabel => '所有产品';

  @override
  String get customerInfoTitle => '客户信息';

  @override
  String get activeEntitlementsLabel => '有效权益';

  @override
  String get originalAppUserIdLabel => '原始应用用户 ID';

  @override
  String get managementUrlLabel => '管理网址';

  @override
  String get noneLabel => '没有任何';

  @override
  String get refreshAction => '刷新';

  @override
  String get noPackagesAvailable => '没有可用包裹。';

  @override
  String get packagesTitle => '包裹';

  @override
  String get fontSystem => '系统';

  @override
  String get fontSerif => '衬线字体';

  @override
  String get fontMono => '单核细胞增多症';

  @override
  String get accessibilityFontSizeTitle => '字体大小';

  @override
  String get accessibilityFontSizeSubtitle => '调整应用内所有文本大小。';

  @override
  String get accessibilityFontPreview =>
      '这是一个示例消息气泡。\n\n它展示了您的聊天文本的显示效果。\n\n调整滑块即可调整气泡大小。';

  @override
  String get accessibilityHighContrastTitle => '高对比度模式';

  @override
  String get accessibilityHighContrastSubtitle => '提高对比度，提高可读性。';

  @override
  String get colorWhatsAppGreen => 'WhatsApp 绿色';

  @override
  String get colorDeepTeal => '深青色';

  @override
  String get colorNavy => '海军';

  @override
  String get colorCharcoal => '木炭';

  @override
  String get colorBlindPaletteTitle => '色盲调色板';

  @override
  String get colorBlindPaletteSubtitle => '使用针对色觉障碍优化的调色板。';

  @override
  String get hideChatsInsteadOfLocking => '隐藏聊天记录而不是锁定聊天记录。';

  @override
  String get hideChatsInsteadOfLockingSubtitle => '关闭时，聊天记录可见，但受密码保护。';

  @override
  String get previousMatch => '上一场比赛';

  @override
  String get nextMatch => '下一场比赛';

  @override
  String get selectSenderOnRight => '请选择右侧的发件人。';

  @override
  String couldNotOpenArchive(Object error) {
    return '无法打开存档：\n\n$error';
  }

  @override
  String couldNotOpenFile(Object message) {
    return '无法打开文件：$message';
  }

  @override
  String attachmentMissing(Object filename) {
    return '附件缺失：$filename';
  }

  @override
  String get unknownError => '未知错误';

  @override
  String get openPdf => '打开PDF';

  @override
  String get openFile => '打开文件';

  @override
  String get openAudio => '打开音频';

  @override
  String senderMeLabel(Object sender) {
    return '$sender（我）';
  }

  @override
  String get chatFileNotFound => '未找到聊天记录文件。';

  @override
  String get languageTitle => '语言';

  @override
  String get languageTooltip => '语言';

  @override
  String get moreOptionsTooltip => '更多选项';

  @override
  String get filterTitle => '筛选';

  @override
  String get filterDateRange => '日期范围';

  @override
  String get filterAnyDate => '任何日期';

  @override
  String get filterIncludeMedia => '包含媒体';

  @override
  String get filterMediaOnly => '仅限媒体';

  @override
  String get filterSenders => '发件人';

  @override
  String get applyFilters => '申请';

  @override
  String get clearFilters => '清除过滤器';

  @override
  String get incrementalImportTitle => '聊天功能已存在';

  @override
  String incrementalImportMessage(Object name) {
    return '将此导入添加到“$name”？';
  }

  @override
  String get incrementalAddAction => '添加';

  @override
  String get incrementalChooseTitle => '选择聊天进行更新';

  @override
  String get incrementalUpdated => '聊天记录已更新。';

  @override
  String get languageSystem => '系统';

  @override
  String get languageEnglish => '英语';

  @override
  String get languageSpanish => '西班牙语';

  @override
  String get languageGerman => '德语';

  @override
  String get languageFrench => '法语';

  @override
  String get languagePortuguese => '葡萄牙语';

  @override
  String get languageRomanian => '罗马尼亚语';

  @override
  String get languageAfrikaans => '南非荷兰语';

  @override
  String get languageRussian => '俄语';

  @override
  String get showImportButton => '显示导入按钮';

  @override
  String get showImportButtonSubtitle => '在主屏幕上切换“导入ZIP”按钮。';

  @override
  String get importButtonHiddenMessage => '导入按钮已隐藏。您可以在设置中重新启用它。';

  @override
  String get upgradeToAccessChat => '升级即可访问此聊天室。';

  @override
  String get aboutLegalTitle => '关于我们及法律声明';

  @override
  String get aboutLegalSummary =>
      'WhatsBackUp 是 WhatsApp 聊天记录导出文件的离线查看器。您的聊天记录将保留在您的设备上。';

  @override
  String get aboutLegalRefundPolicy =>
      '退款：如果进行退款，则仅保留前 5 条导入的聊天记录。超出免费限额的聊天记录将被禁用，直至重新购买。';

  @override
  String get aboutLegalDisclaimers =>
      '免责声明：我们不对数据丢失、聊天内容、翻译准确性或锁定/隐藏功能的使用负责。请自行备份数据。';

  @override
  String get aboutLegalAffiliation =>
      '与WhatsApp或Meta无任何关联。WhatsApp是Meta Platforms, Inc.的商标。';

  @override
  String get aboutLegalSupport => '技术支持：vwdewaal@gmail.com';

  @override
  String get aboutLegalDeveloper => '开发者：范·维克·德·瓦尔';

  @override
  String get aboutLegalJurisdiction => '管辖范围：欧盟/英国';

  @override
  String aboutLegalVersion(Object version) {
    return '应用版本：$version';
  }

  @override
  String get versionLoading => '应用版本：正在加载...';

  @override
  String get languageScottishGaelic => '苏格兰盖尔语';

  @override
  String get languageScots => '苏格兰人';

  @override
  String get languageChinese => '中文（普通话）';

  @override
  String get languageHindi => '印地语';

  @override
  String get languageArabic => '阿拉伯';

  @override
  String get languageBengali => '孟加拉';

  @override
  String get languageJapanese => '日本人';

  @override
  String get languagePunjabi => '旁遮普语';

  @override
  String get languageKorean => '韩国人';

  @override
  String get languageTurkish => '土耳其';

  @override
  String get languageItalian => '意大利语';

  @override
  String get languageVietnamese => '越南语';

  @override
  String get languageUrdu => '乌尔都语';

  @override
  String get languageIndonesian => '印度尼西亚';

  @override
  String get languageThai => '泰国';

  @override
  String get languagePolish => '抛光';

  @override
  String get languageDutch => '荷兰语';

  @override
  String get identifyMeTitle => '表明你的身份';

  @override
  String get identifyMeSubtitle => '请选择您的姓名，以便我们正确标记您的消息。';

  @override
  String get identifyMeNotNow => '现在不要';
}
