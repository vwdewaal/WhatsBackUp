// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'ワッツバックアップ';

  @override
  String get importZip => 'ZIP をインポート';

  @override
  String get importAction => '輸入';

  @override
  String get importingLabel => 'インポート';

  @override
  String get importDoneLabel => '終わり！';

  @override
  String get importLargeStarted => 'インポートを開始しました';

  @override
  String get importTriggeredMessage =>
      'インポートはバックグラウンドで実行され、完了するとチャットが開きます。アプリを開いたままにしてください。';

  @override
  String get mediaImportingTitle => 'メディアのインポート';

  @override
  String get mediaImportingSubtitle => 'メディアが終了するまでチャットを読むことができます。';

  @override
  String get mediaImportPausedTitle => 'メディアのインポートが一時停止されました';

  @override
  String get mediaImportPausedSubtitle => '再開するには、元の ZIP を再度選択してください。';

  @override
  String get mediaImportFailedTitle => 'メディアのインポートに失敗しました';

  @override
  String get mediaImportFailedSubtitle => 'タップして再試行してください。';

  @override
  String get mediaImportResumeAction => '再開する';

  @override
  String get mediaImportingLabel => 'メディアのインポート';

  @override
  String get contactLoadingLabel => '連絡先を読み込んでいます…';

  @override
  String get contactUnknownName => '接触';

  @override
  String get contactPhoneLabel => '電話';

  @override
  String get contactEmailLabel => 'メール';

  @override
  String get openContactAction => '連絡先を開く';

  @override
  String contactOpenFailed(Object error) {
    return '連絡先を開けませんでした: $error';
  }

  @override
  String get howToImport => 'インポート方法';

  @override
  String get settings => '設定';

  @override
  String get searchTitle => '検索';

  @override
  String get textToInclude => '含めるテキスト:';

  @override
  String get enterSearchText => '検索テキストを入力してください...';

  @override
  String get dateRange => '日付範囲:';

  @override
  String get fromLabel => 'から：';

  @override
  String get toLabel => 'に：';

  @override
  String get selectLabel => '選択';

  @override
  String get showOnlyMediaFiles => 'メディアファイルのみを表示';

  @override
  String get clearAction => 'クリア';

  @override
  String get searchAction => '検索';

  @override
  String get renameChatTitle => 'チャットの名前を変更する';

  @override
  String get chatNameHint => 'チャット名';

  @override
  String get cancelAction => 'キャンセル';

  @override
  String get saveAction => '保存';

  @override
  String get hideChatsTooltip => 'チャットを非表示にする';

  @override
  String get hideAction => '隠れる';

  @override
  String get lockAction => 'ロック';

  @override
  String get noChatsYetHint =>
      'まだチャットはありません。\n「ZIP をインポート」を使用して WhatsApp エクスポートを読み込むか、\nチャットの「チャットをエクスポート」オプションを使用して WhatsApp から直接エクスポートしてください。';

  @override
  String get noArchivedChats => 'アーカイブされたチャットはありません。';

  @override
  String get tabChats => 'チャット';

  @override
  String get tabArchived => 'アーカイブ済み';

  @override
  String get searchChatsHint => 'チャットを検索';

  @override
  String get enterCodeTitle => 'コードを入力';

  @override
  String get upTo8DigitsHint => '最大8桁';

  @override
  String get continueAction => '続く';

  @override
  String get updatingHiddenChats => '非表示のチャットを更新しています...';

  @override
  String get chatsUnhidden => 'チャットが非表示になりました。';

  @override
  String get selectAtLeastOneChat => '少なくとも 1 つのチャットを選択してください。';

  @override
  String get hidingChats => 'チャットを非表示にしています...';

  @override
  String get lockingChats => 'チャットをロックしています...';

  @override
  String get chatsHidden => 'チャットは非表示になっています。';

  @override
  String get chatsUnlocked => 'チャットがロック解除されました。';

  @override
  String get chatsLocked => 'チャットはロックされています。';

  @override
  String get unlockChatTitle => 'チャットのロックを解除';

  @override
  String get enterPasscodeHint => 'パスコードを入力してください';

  @override
  String get unlockAction => 'ロック解除';

  @override
  String get incorrectCode => 'コードが正しくありません。';

  @override
  String importedOn(Object date) {
    return '$date をインポートしました';
  }

  @override
  String get unarchiveAction => 'アーカイブ解除';

  @override
  String get archiveAction => 'アーカイブ';

  @override
  String get deleteAction => '消去';

  @override
  String get deleteChatTitle => 'チャットを削除しますか?';

  @override
  String get deleteChatConfirm => 'これにより、アーカイブとメディア ファイルが完全に削除されます。';

  @override
  String get archiveFolderMissing => 'アーカイブフォルダが見つかりません。';

  @override
  String updateFailedWithDetail(Object error) {
    return '更新に失敗しました: $error';
  }

  @override
  String get renameAction => '名前を変更';

  @override
  String get working => '働く...';

  @override
  String get importPreparing => 'インポートを準備しています...';

  @override
  String get importAnalyzing => 'ファイルを分析しています...';

  @override
  String get bookmarksLabel => 'ブックマーク';

  @override
  String get previousBookmark => '前のブックマーク';

  @override
  String get nextBookmark => '次のブックマーク';

  @override
  String get importLargeFileNotice => '大きなファイルが検出されました。数分かかる場合があります。';

  @override
  String get importExtracting => 'ファイルを抽出しています...';

  @override
  String get importFinalizing => '終了しています...';

  @override
  String importFailedWithDetail(Object error) {
    return 'インポートに失敗しました: $error';
  }

  @override
  String get sharedFileNotZip => '共有ファイルは ZIP ではありません。';

  @override
  String get unlockProToImportMoreChats =>
      'より多くのチャットをインポートするには、BackupChat Pro のロックを解除してください。';

  @override
  String get purchaseFailedTryAgain => '購入に失敗しました。もう一度お試しください。';

  @override
  String get importErrorOnlyZip => '.zip ファイルのみがサポートされます。';

  @override
  String get importErrorNoChatText => 'ZIP に WhatsApp チャット テキスト ファイルが見つかりません。';

  @override
  String get importErrorAlreadyImported => 'このチャットはすでにインポートされています。';

  @override
  String get howToImportTitle => 'インポート方法';

  @override
  String get chooseImportMethodTitle => 'インポート方法を選択してください';

  @override
  String get iosExportTitle => 'WhatsApp (iOS) からのエクスポート';

  @override
  String get androidExportTitle => 'WhatsAppからのエクスポート（Android）';

  @override
  String get iosStepOpenChat => 'WhatsApp アプリ内で、チャットをクリックします。';

  @override
  String get androidStepOpenChat => 'WhatsApp アプリ内で、チャットをクリックします。';

  @override
  String get iosStepOpenInfo => '上部にある人物またはグループの名前をクリックします。';

  @override
  String get androidStepOpenMenu => 'メニューをクリックします。';

  @override
  String get iosStepExportChat => '一番下までスクロールして、「チャットのエクスポート」を選択します。';

  @override
  String get androidStepMoreExport => '「詳細」を選択します。';

  @override
  String get iosStepChooseMedia =>
      'アプリ選択メニュー (共有シート) から WhatsBackUp を選択します (古い携帯電話の場合はファイルに保存します)。';

  @override
  String get androidStepChooseMedia => 'チャットのエクスポートを選択します。';

  @override
  String get iosStepShareToApp => 'チャットは WhatsBackUp にインポートされます。';

  @override
  String get androidStepShareToApp =>
      'アプリ選択メニュー (共有シート) から WhatsBackUp を選択します (古い携帯電話の場合はファイルに保存します)。';

  @override
  String get iosStepSaveToFiles => 'チャットは WhatsBackUp にインポートされます。';

  @override
  String get androidStepSaveToDevice => 'チャットは WhatsBackUp にインポートされます。';

  @override
  String get androidLargeImportNote =>
      '古い Android スマートフォンでは、非常に大きなチャットのインポートが開始されるまでに最大 1 分かかることに注意してください。';

  @override
  String get importZipTitle => '保存したZIPファイルをインポートする';

  @override
  String get iosStepImportZip =>
      'WhatsBackUpで「ZIPからインポート」をタップし、ファイルからファイルを選択します。';

  @override
  String get androidStepImportZip =>
      'WhatsBackUpで「ZIPからインポート」をタップし、デバイスからファイルを選択します。';

  @override
  String get managingChatsTitle => 'チャットの管理';

  @override
  String get hideChatsWithCodeTitle => 'コードでチャットを非表示にする';

  @override
  String get stepTapGhostIcon => '上部のバーにあるゴーストアイコンをタップします。';

  @override
  String get stepEnterCodeUpTo8Digits => 'コード（最大8桁）を入力してください。';

  @override
  String get stepSelectChatsSubmitHide => 'チャットを選択し、「送信」をタップして非表示にします。';

  @override
  String get stepEnterSameCodeUnhide => '同じコードをもう一度入力すると、それらのチャットが非表示になります。';

  @override
  String get stepDifferentCodesHideSets =>
      '異なるコードを使用すると、異なるチャット セットを非表示にすることができます。';

  @override
  String get lockChatsWithCodeTitle => 'コードでチャットをロックする';

  @override
  String get stepSwitchHideToLockMode => '設定で、非表示モードからロックモードに切り替えます。';

  @override
  String get stepTapGhostIconEnterCode => 'ゴーストアイコンをタップしてコードを入力します。';

  @override
  String get stepSelectChatsSubmitLock => 'チャットを選択し、「送信」をタップしてロックします。';

  @override
  String get stepLockedChatsRequireCode =>
      'ロックされたチャットにはロックアイコンが表示され、開くにはコードが必要になります。';

  @override
  String get archiveOrDeleteTitle => 'アーカイブまたは削除';

  @override
  String get stepSwipeRightArchive => '右にスワイプしてアーカイブまたはアーカイブ解除します。';

  @override
  String get stepSwipeLeftDelete => '削除するには左にスワイプします（確認が必要です）。';

  @override
  String get bullet => '•';

  @override
  String get welcomeTitle => 'いらっしゃいませ';

  @override
  String get gotItAction => 'わかった';

  @override
  String get settingsTitle => '設定';

  @override
  String get sectionFont => 'フォント';

  @override
  String get sectionColor => '色';

  @override
  String get sectionAccessibility => 'アクセシビリティ';

  @override
  String get sectionPrivacy => 'プライバシー';

  @override
  String get sectionPro => 'バックアップチャットプロ';

  @override
  String get sectionStorage => 'ストレージ';

  @override
  String get storageTitle => 'ストレージ';

  @override
  String get storageSubtitle => 'デバイスの空き容量とチャットの保存容量を表示する';

  @override
  String get storageAvailable => '利用可能なストレージ';

  @override
  String get storageAppSize => 'WhatsBackUp サイズ（チャットを含む）';

  @override
  String get storageLocation => '保管場所';

  @override
  String get storageLocationUnknown => '未知';

  @override
  String get storageCalculate => '計算する';

  @override
  String get storageCalculating => '計算中…';

  @override
  String get storageNotCalculated => '計算されていません';

  @override
  String storageLastCalculated(Object date) {
    return '最終計算日: $date';
  }

  @override
  String get storageLastCalculatedNone => '最終計算日: —';

  @override
  String get storageChatSizesToggle => 'リストにチャットのサイズを表示';

  @override
  String get storageChatSizesSubtitle => 'メイン画面に各チャットの合計サイズを表示します';

  @override
  String get storageCleanupTitle => '失敗したインポートをクリーンアップする';

  @override
  String get storageCleanupSubtitle => '不完全なインポートや失敗したインポートを削除してスペースを解放します。';

  @override
  String get storageCleanupEstimate => '解放すべき推定容量';

  @override
  String get storageCleanupAction => '今すぐ掃除';

  @override
  String get storageCleanupNone => '失敗したインポートは見つかりませんでした。';

  @override
  String storageCleanupDone(Object size) {
    return '失敗したインポートの $size をクリーンアップしました。';
  }

  @override
  String storageCleanupLast(Object time) {
    return '最終クリーンアップ: $time';
  }

  @override
  String get proActiveTitle => 'プロはアクティブです';

  @override
  String get proUpgradeTitle => 'BackupChat Pro にアップグレード';

  @override
  String get proThankYouSubtitle => 'アプリをサポートしていただきありがとうございます。';

  @override
  String get proUnlockSubtitle => '無制限のインポートをロック解除します。';

  @override
  String get debugProOverrideTitle => 'デバッグ: Force Pro';

  @override
  String get debugProOverrideSubtitle => 'テスト用のローカル オーバーライド (購入は不要)。';

  @override
  String paywallResult(Object result) {
    return 'ペイウォールの結果: $result。';
  }

  @override
  String get purchaseCancelled => '購入はキャンセルされました。';

  @override
  String get restorePurchases => '購入を復元する';

  @override
  String get purchasesRestored => '購入が復元されました。';

  @override
  String get restoreFailedTryAgain => '復元に失敗しました。もう一度お試しください。';

  @override
  String get manageSubscription => 'サブスクリプションの管理';

  @override
  String get openCustomerCenter => 'RevenueCat カスタマー センターを開きます。';

  @override
  String get customerCenterUnavailable => 'カスタマーセンターは利用できません。';

  @override
  String get sectionAbout => 'について';

  @override
  String get aboutDescription =>
      'WhatsBackUp は、WhatsApp チャットエクスポート用のプライベートオフラインビューアです。ZIP ファイルをインポートするか、WhatsApp から直接エクスポートして、ネットワークを必要とせずに、メディアを含むクリーンで検索可能なアーカイブを保存できます。';

  @override
  String get sectionAboutDeveloper => '開発者について';

  @override
  String get aboutDeveloperDescription =>
      'プライバシー、高速検索、クリーンなチャット アーカイブに重点を置いた独立開発者によって構築されました。';

  @override
  String get sectionHelp => 'ヘルプ';

  @override
  String get showOnboardingAgain => 'オンボーディングを再度表示する';

  @override
  String get sdkConfigTitle => 'SDK設定';

  @override
  String get publicKeyLabel => '公開鍵';

  @override
  String get offeringIdLabel => 'オファリングID';

  @override
  String get entitlementIdLabel => '資格ID';

  @override
  String get lifetimeProductIdLabel => '生涯製品ID';

  @override
  String errorLabel(Object error) {
    return 'エラー: $error';
  }

  @override
  String get offeringsTitle => '提供品';

  @override
  String get currentOfferingLabel => '現在のオファー';

  @override
  String get allOfferingsLabel => 'すべてのオファー';

  @override
  String get customerInfoTitle => '顧客情報';

  @override
  String get activeEntitlementsLabel => '有効な権利';

  @override
  String get originalAppUserIdLabel => '元のアプリユーザーID';

  @override
  String get managementUrlLabel => '管理URL';

  @override
  String get noneLabel => 'なし';

  @override
  String get refreshAction => 'リフレッシュ';

  @override
  String get noPackagesAvailable => '利用可能なパッケージはありません。';

  @override
  String get packagesTitle => 'パッケージ';

  @override
  String get fontSystem => 'システム';

  @override
  String get fontSerif => 'セリフ';

  @override
  String get fontMono => '単核症';

  @override
  String get accessibilityFontSizeTitle => 'フォントサイズ';

  @override
  String get accessibilityFontSizeSubtitle => 'アプリ全体のテキスト サイズを調整します。';

  @override
  String get accessibilityFontPreview =>
      'これはメッセージバブルの例です。\nチャットテキストがどのように表示されるかを示しています。\nスライダーを調整してサイズを調整してください。';

  @override
  String get accessibilityHighContrastTitle => '高コントラストモード';

  @override
  String get accessibilityHighContrastSubtitle => '読みやすさを向上させるためにコントラストを高めます。';

  @override
  String get colorWhatsAppGreen => 'WhatsApp グリーン';

  @override
  String get colorDeepTeal => 'ディープティール';

  @override
  String get colorNavy => '海軍';

  @override
  String get colorCharcoal => '木炭';

  @override
  String get colorBlindPaletteTitle => '色覚異常用パレット';

  @override
  String get colorBlindPaletteSubtitle => '色覚異常者向けに最適化されたパレットを使用します。';

  @override
  String get hideChatsInsteadOfLocking => 'チャットをロックする代わりに非表示にする';

  @override
  String get hideChatsInsteadOfLockingSubtitle =>
      'オフの場合、チャットは表示されますが、パスコードで保護されます。';

  @override
  String get previousMatch => '前回の試合';

  @override
  String get nextMatch => '次の試合';

  @override
  String get selectSenderOnRight => '右側の送信者を選択してください';

  @override
  String couldNotOpenArchive(Object error) {
    return 'アーカイブを開けませんでした:\n$error';
  }

  @override
  String couldNotOpenFile(Object message) {
    return 'ファイルを開けませんでした: $message';
  }

  @override
  String attachmentMissing(Object filename) {
    return '添付ファイルがありません: $filename';
  }

  @override
  String get unknownError => '不明なエラー';

  @override
  String get openPdf => 'PDFを開く';

  @override
  String get openFile => 'ファイルを開く';

  @override
  String get openAudio => 'オーディオを開く';

  @override
  String senderMeLabel(Object sender) {
    return '$sender (私)';
  }

  @override
  String get chatFileNotFound => 'チャットファイルが見つかりません。';

  @override
  String get languageTitle => '言語';

  @override
  String get languageTooltip => '言語';

  @override
  String get moreOptionsTooltip => 'その他のオプション';

  @override
  String get filterTitle => 'フィルター';

  @override
  String get filterDateRange => '日付範囲';

  @override
  String get filterAnyDate => '任意の日付';

  @override
  String get filterIncludeMedia => 'メディアを含める';

  @override
  String get filterMediaOnly => 'メディアのみ';

  @override
  String get filterSenders => '送信者';

  @override
  String get applyFilters => '適用する';

  @override
  String get clearFilters => 'フィルターをクリア';

  @override
  String get incrementalImportTitle => 'チャットはすでに存在します';

  @override
  String incrementalImportMessage(Object name) {
    return 'このインポートを「$name」に追加しますか?';
  }

  @override
  String get incrementalAddAction => '追加';

  @override
  String get incrementalChooseTitle => '更新するチャットを選択';

  @override
  String get incrementalUpdated => 'チャットが更新されました。';

  @override
  String get languageSystem => 'システム';

  @override
  String get languageEnglish => '英語';

  @override
  String get languageSpanish => 'スペイン語';

  @override
  String get languageGerman => 'ドイツ語';

  @override
  String get languageFrench => 'フランス語';

  @override
  String get languagePortuguese => 'ポルトガル語';

  @override
  String get languageRomanian => 'ルーマニア語';

  @override
  String get languageAfrikaans => 'アフリカーンス語';

  @override
  String get languageRussian => 'ロシア';

  @override
  String get showImportButton => 'インポートボタンを表示';

  @override
  String get showImportButtonSubtitle => 'ホーム画面で [ZIP のインポート] ボタンを切り替えます。';

  @override
  String get importButtonHiddenMessage =>
      'インポートボタンが非表示になっています。設定で再度有効にすることができます。';

  @override
  String get upgradeToAccessChat => 'このチャットにアクセスするにはアップグレードしてください。';

  @override
  String get aboutLegalTitle => '会社概要と法的事項';

  @override
  String get aboutLegalSummary =>
      'WhatsBackUp は、WhatsApp チャットエクスポートのオフラインビューアです。チャットはデバイス上に残ります。';

  @override
  String get aboutLegalRefundPolicy =>
      '払い戻し：払い戻しが行われた場合、インポートした最初の5件のチャットのみが引き続きアクセス可能となります。無料上限を超えたチャットは、再購入されるまで利用できなくなります。';

  @override
  String get aboutLegalDisclaimers =>
      '免責事項：データの損失、チャット内容、翻訳の正確性、ロック/非表示機能の使用については責任を負いません。ご自身でバックアップを保管してください。';

  @override
  String get aboutLegalAffiliation =>
      'WhatsApp または Meta と提携関係はありません。WhatsApp は Meta Platforms, Inc. の商標です。';

  @override
  String get aboutLegalSupport => 'サポート: vwdewaal@gmail.com';

  @override
  String get aboutLegalDeveloper => '開発者: Van Wyk De Waal';

  @override
  String get aboutLegalJurisdiction => '管轄：EU/英国';

  @override
  String aboutLegalVersion(Object version) {
    return 'アプリバージョン: $version';
  }

  @override
  String get versionLoading => 'アプリのバージョン: 読み込み中...';

  @override
  String get languageScottishGaelic => 'スコットランド・ゲール語';

  @override
  String get languageScots => 'スコットランド人';

  @override
  String get languageChinese => '中国語（北京語）';

  @override
  String get languageHindi => 'ヒンディー語';

  @override
  String get languageArabic => 'アラビア語';

  @override
  String get languageBengali => 'ベンガル語';

  @override
  String get languageJapanese => '日本語';

  @override
  String get languagePunjabi => 'パンジャブ語';

  @override
  String get languageKorean => '韓国語';

  @override
  String get languageTurkish => 'トルコ語';

  @override
  String get languageItalian => 'イタリア語';

  @override
  String get languageVietnamese => 'ベトナム語';

  @override
  String get languageUrdu => 'ウルドゥー語';

  @override
  String get languageIndonesian => 'インドネシア語';

  @override
  String get languageThai => 'タイ語';

  @override
  String get languagePolish => '研磨';

  @override
  String get languageDutch => 'オランダ語';

  @override
  String get identifyMeTitle => '身元を明らかにする';

  @override
  String get identifyMeSubtitle => 'メッセージに適切なラベルを付けられるように、名前を選択してください。';

  @override
  String get identifyMeNotNow => '今じゃない';
}
