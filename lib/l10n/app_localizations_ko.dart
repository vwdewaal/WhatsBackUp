// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => '왓츠백업';

  @override
  String get importZip => 'ZIP 가져오기';

  @override
  String get importAction => '수입';

  @override
  String get importingLabel => '수입';

  @override
  String get importDoneLabel => '완료!';

  @override
  String get importLargeStarted => '가져오기 시작됨';

  @override
  String get importTriggeredMessage =>
      '백그라운드에서 가져오기 작업이 진행 중이며, 완료되면 채팅창이 열립니다. 앱을 계속 켜두시기 바랍니다.';

  @override
  String get mediaImportingTitle => '미디어 가져오기';

  @override
  String get mediaImportingSubtitle => '미디어 방송이 끝나는 동안 채팅 내용을 읽어보실 수 있습니다.';

  @override
  String get mediaImportPausedTitle => '미디어 가져오기가 일시 중지되었습니다';

  @override
  String get mediaImportPausedSubtitle => '원래의 ZIP을 다시 선택하여 재개하십시오.';

  @override
  String get mediaImportFailedTitle => '미디어 가져오기 실패';

  @override
  String get mediaImportFailedSubtitle => '다시 시도하려면 탭하세요.';

  @override
  String get mediaImportResumeAction => '재개하다';

  @override
  String get mediaImportingLabel => '미디어 가져오기';

  @override
  String get contactLoadingLabel => '연락처 불러오는 중…';

  @override
  String get contactUnknownName => '연락하다';

  @override
  String get contactPhoneLabel => '핸드폰';

  @override
  String get contactEmailLabel => '이메일';

  @override
  String get openContactAction => '연락처를 열어두세요';

  @override
  String contactOpenFailed(Object error) {
    return '연락처를 열 수 없습니다: $error';
  }

  @override
  String get howToImport => '가져오는 방법';

  @override
  String get settings => '설정';

  @override
  String get searchTitle => '찾다';

  @override
  String get textToInclude => '포함할 텍스트:';

  @override
  String get enterSearchText => '검색어를 입력하세요...';

  @override
  String get dateRange => '기간:';

  @override
  String get fromLabel => '에서:';

  @override
  String get toLabel => '에게:';

  @override
  String get selectLabel => '선택하다';

  @override
  String get showOnlyMediaFiles => '미디어 파일만 표시';

  @override
  String get clearAction => '분명한';

  @override
  String get searchAction => '찾다';

  @override
  String get renameChatTitle => '채팅 이름 변경';

  @override
  String get chatNameHint => '채팅 이름';

  @override
  String get cancelAction => '취소';

  @override
  String get saveAction => '구하다';

  @override
  String get hideChatsTooltip => '채팅 숨기기';

  @override
  String get hideAction => '숨다';

  @override
  String get lockAction => '잠그다';

  @override
  String get noChatsYetHint =>
      '아직 채팅이 없습니다.\n\"ZIP 가져오기\"를 사용하여 WhatsApp 내보내기 파일을 불러오거나,\n채팅의 \"채팅 내보내기\" 옵션을 사용하여 WhatsApp에서 직접 내보낼 수 있습니다.';

  @override
  String get noArchivedChats => '채팅 기록이 보관되지 않습니다.';

  @override
  String get tabChats => '채팅';

  @override
  String get tabArchived => '보관됨';

  @override
  String get searchChatsHint => '채팅 검색';

  @override
  String get enterCodeTitle => '코드를 입력하세요';

  @override
  String get upTo8DigitsHint => '최대 8자리 숫자';

  @override
  String get continueAction => '계속하다';

  @override
  String get updatingHiddenChats => '숨겨진 채팅을 업데이트하는 중...';

  @override
  String get chatsUnhidden => '채팅 내용이 숨겨지지 않았습니다.';

  @override
  String get selectAtLeastOneChat => '채팅을 하나 이상 선택하세요.';

  @override
  String get hidingChats => '채팅 숨기기...';

  @override
  String get lockingChats => '채팅 잠금 중...';

  @override
  String get chatsHidden => '채팅이 숨겨져 있습니다.';

  @override
  String get chatsUnlocked => '채팅 기능이 잠금 해제되었습니다.';

  @override
  String get chatsLocked => '채팅이 잠겼습니다.';

  @override
  String get unlockChatTitle => '채팅 잠금 해제';

  @override
  String get enterPasscodeHint => '암호를 입력하세요';

  @override
  String get unlockAction => '터놓다';

  @override
  String get incorrectCode => '잘못된 코드입니다.';

  @override
  String importedOn(Object date) {
    return '수입됨 $date';
  }

  @override
  String get unarchiveAction => '아카이브 해제';

  @override
  String get archiveAction => '보관소';

  @override
  String get deleteAction => '삭제';

  @override
  String get deleteChatTitle => '채팅을 삭제하시겠습니까?';

  @override
  String get deleteChatConfirm => '이렇게 하면 아카이브 및 미디어 파일이 영구적으로 삭제됩니다.';

  @override
  String get archiveFolderMissing => '아카이브 폴더가 없습니다.';

  @override
  String updateFailedWithDetail(Object error) {
    return '업데이트 실패: $error';
  }

  @override
  String get renameAction => '이름 변경';

  @override
  String get working => '일하고 있는...';

  @override
  String get importPreparing => '가져오기 준비 중...';

  @override
  String get importAnalyzing => '파일을 분석하는 중...';

  @override
  String get bookmarksLabel => '책갈피';

  @override
  String get previousBookmark => '이전 북마크';

  @override
  String get nextBookmark => '다음 북마크';

  @override
  String get importLargeFileNotice =>
      '대용량 파일이 감지되었습니다. 처리하는 데 몇 분 정도 소요될 수 있습니다.';

  @override
  String get importExtracting => '파일 압축 해제 중...';

  @override
  String get importFinalizing => '마무리 중...';

  @override
  String importFailedWithDetail(Object error) {
    return '가져오기 실패: $error';
  }

  @override
  String get sharedFileNotZip => '공유된 파일은 ZIP이 아닙니다.';

  @override
  String get unlockProToImportMoreChats =>
      'BackupChat Pro을 잠금 해제하여 더 많은 채팅을 가져오세요.';

  @override
  String get purchaseFailedTryAgain => '구매에 실패했습니다. 다시 시도해 주세요.';

  @override
  String get importErrorOnlyZip => '.zip 파일만 지원됩니다.';

  @override
  String get importErrorNoChatText => 'ZIP에서 WhatsApp 채팅 텍스트 파일을 찾을 수 없습니다.';

  @override
  String get importErrorAlreadyImported => '이 채팅은 이미 가져왔습니다.';

  @override
  String get howToImportTitle => '가져오는 방법';

  @override
  String get chooseImportMethodTitle => '가져오기 방법을 선택하세요';

  @override
  String get iosExportTitle => 'WhatsApp에서 내보내기(iOS)';

  @override
  String get androidExportTitle => 'WhatsApp에서 내보내기(안드로이드)';

  @override
  String get iosStepOpenChat => 'WhatsApp 앱 내에서 채팅을 클릭하세요.';

  @override
  String get androidStepOpenChat => 'WhatsApp 앱 내에서 채팅을 클릭하세요.';

  @override
  String get iosStepOpenInfo => '상단에 있는 개인 또는 그룹 이름을 클릭하세요.';

  @override
  String get androidStepOpenMenu => '메뉴를 클릭하세요.';

  @override
  String get iosStepExportChat => '아래로 스크롤하여 맨 아래에서 \'채팅 내보내기\'를 선택하세요.';

  @override
  String get androidStepMoreExport => '“더보기”를 선택하세요.';

  @override
  String get iosStepChooseMedia =>
      '앱 선택 메뉴(공유 시트)에서 WhatsBackUp을 선택하세요(구형 휴대폰의 경우 파일에 저장).';

  @override
  String get androidStepChooseMedia => '내보내기 채팅을 선택하세요.';

  @override
  String get iosStepShareToApp => '채팅 내용이 WhatsBackUp으로 가져와집니다.';

  @override
  String get androidStepShareToApp =>
      '앱 선택 메뉴(공유 시트)에서 WhatsBackUp을 선택하세요(구형 휴대폰의 경우 파일에 저장).';

  @override
  String get iosStepSaveToFiles => '채팅 내용이 WhatsBackUp으로 가져와집니다.';

  @override
  String get androidStepSaveToDevice => '채팅 내용이 WhatsBackUp으로 가져와집니다.';

  @override
  String get androidLargeImportNote =>
      '구형 안드로이드 휴대폰의 경우 용량이 매우 큰 채팅 파일을 불러오는 데 최대 1분이 소요될 수 있습니다.';

  @override
  String get importZipTitle => '저장된 ZIP 파일을 불러오기';

  @override
  String get iosStepImportZip =>
      'WhatsBackUp에서 \"ZIP에서 가져오기\"를 탭하고 파일 목록에서 파일을 선택하세요.';

  @override
  String get androidStepImportZip =>
      'WhatsBackUp에서 \"ZIP에서 가져오기\"를 탭하고 기기에서 파일을 선택하세요.';

  @override
  String get managingChatsTitle => '채팅 관리';

  @override
  String get hideChatsWithCodeTitle => '코드를 사용하여 채팅을 숨기세요';

  @override
  String get stepTapGhostIcon => '상단 바에 있는 유령 아이콘을 탭하세요.';

  @override
  String get stepEnterCodeUpTo8Digits => '코드를 입력하세요 (최대 8자리).';

  @override
  String get stepSelectChatsSubmitHide => '채팅을 선택한 다음 제출을 탭하여 숨기세요.';

  @override
  String get stepEnterSameCodeUnhide => '해당 채팅을 표시하려면 동일한 코드를 다시 입력하세요.';

  @override
  String get stepDifferentCodesHideSets =>
      '서로 다른 코드를 사용하면 서로 다른 채팅 목록을 숨길 수 있습니다.';

  @override
  String get lockChatsWithCodeTitle => '채팅을 비밀번호로 잠그세요';

  @override
  String get stepSwitchHideToLockMode => '설정에서 숨기기 모드를 잠금 모드로 전환하세요.';

  @override
  String get stepTapGhostIconEnterCode => '유령 아이콘을 탭하고 코드를 입력하세요.';

  @override
  String get stepSelectChatsSubmitLock => '채팅을 선택한 다음 제출을 탭하여 잠급니다.';

  @override
  String get stepLockedChatsRequireCode =>
      '잠긴 채팅방에는 자물쇠 아이콘이 표시되며, 열려면 암호를 입력해야 합니다.';

  @override
  String get archiveOrDeleteTitle => '보관 또는 삭제';

  @override
  String get stepSwipeRightArchive => '오른쪽으로 스와이프하여 보관하거나 보관 해제하세요.';

  @override
  String get stepSwipeLeftDelete => '왼쪽으로 스와이프하여 삭제하세요(확인 필요).';

  @override
  String get bullet => '•';

  @override
  String get welcomeTitle => '환영';

  @override
  String get gotItAction => '알았어요';

  @override
  String get settingsTitle => '설정';

  @override
  String get sectionFont => '세례반';

  @override
  String get sectionColor => '색상';

  @override
  String get sectionAccessibility => '접근성';

  @override
  String get sectionPrivacy => '은둔';

  @override
  String get sectionPro => 'BackupChat Pro';

  @override
  String get sectionStorage => '저장';

  @override
  String get storageTitle => '저장';

  @override
  String get storageSubtitle => '기기 저장 공간 및 채팅 저장 공간 보기';

  @override
  String get storageAvailable => '사용 가능한 저장 공간';

  @override
  String get storageAppSize => 'WhatsBackUp 크기 (채팅 포함)';

  @override
  String get storageLocation => '저장 위치';

  @override
  String get storageLocationUnknown => '알려지지 않은';

  @override
  String get storageCalculate => '믿다';

  @override
  String get storageCalculating => '계산 중…';

  @override
  String get storageNotCalculated => '계산되지 않음';

  @override
  String storageLastCalculated(Object date) {
    return '최종 계산: $date';
  }

  @override
  String get storageLastCalculatedNone => '최종 계산 시간: —';

  @override
  String get storageChatSizesToggle => '채팅 크기를 목록에 표시합니다.';

  @override
  String get storageChatSizesSubtitle => '메인 화면에 각 채팅방의 전체 크기를 표시합니다.';

  @override
  String get storageCleanupTitle => '실패한 가져오기 정리';

  @override
  String get storageCleanupSubtitle =>
      '가져오기가 완료되지 않았거나 실패한 항목을 삭제하여 공간을 확보합니다.';

  @override
  String get storageCleanupEstimate => '확보해야 할 예상 공간';

  @override
  String get storageCleanupAction => '지금 청소하세요';

  @override
  String get storageCleanupNone => '가져오기 실패 항목이 없습니다.';

  @override
  String storageCleanupDone(Object size) {
    return '실패한 가져오기 항목의 $size을 정리했습니다.';
  }

  @override
  String storageCleanupLast(Object time) {
    return '마지막 청소: $time';
  }

  @override
  String get proActiveTitle => 'Pro가 활성화되었습니다.';

  @override
  String get proUpgradeTitle => 'BackupChat Pro으로 업그레이드하세요';

  @override
  String get proThankYouSubtitle => '앱을 지원해 주셔서 감사합니다.';

  @override
  String get proUnlockSubtitle => '무제한 가져오기 기능을 이용하세요.';

  @override
  String get debugProOverrideTitle => '디버그: 포스 프로';

  @override
  String get debugProOverrideSubtitle => '테스트용 로컬 오버라이드(구매 불필요).';

  @override
  String paywallResult(Object result) {
    return '유료 구독 검색 결과: $result.';
  }

  @override
  String get purchaseCancelled => '구매가 취소되었습니다.';

  @override
  String get restorePurchases => '구매 내역 복원';

  @override
  String get purchasesRestored => '구매 내역이 복원되었습니다.';

  @override
  String get restoreFailedTryAgain => '복원에 실패했습니다. 다시 시도하세요.';

  @override
  String get manageSubscription => '구독 관리';

  @override
  String get openCustomerCenter => 'RevenueCat 고객센터를 여세요.';

  @override
  String get customerCenterUnavailable => '고객센터를 이용하실 수 없습니다.';

  @override
  String get sectionAbout => '에 대한';

  @override
  String get aboutDescription =>
      'WhatsBackUp은 WhatsApp 채팅 내보내기 파일을 위한 비공개 오프라인 뷰어입니다. ZIP 파일을 가져오거나 WhatsApp에서 직접 내보내어 네트워크 연결 없이도 미디어가 포함된 깔끔하고 검색 가능한 아카이브를 유지할 수 있습니다.';

  @override
  String get sectionAboutDeveloper => '개발자 소개';

  @override
  String get aboutDeveloperDescription =>
      '개인 정보 보호, 빠른 검색 및 깔끔한 채팅 기록 보관에 중점을 둔 독립 개발자가 제작했습니다.';

  @override
  String get sectionHelp => '돕다';

  @override
  String get showOnboardingAgain => '온보딩 화면을 다시 표시';

  @override
  String get sdkConfigTitle => 'SDK 구성';

  @override
  String get publicKeyLabel => '공개 키';

  @override
  String get offeringIdLabel => '신분증 제공';

  @override
  String get entitlementIdLabel => '권한 ID';

  @override
  String get lifetimeProductIdLabel => '평생 제품 ID';

  @override
  String errorLabel(Object error) {
    return '오류: $error';
  }

  @override
  String get offeringsTitle => '제공 상품';

  @override
  String get currentOfferingLabel => '현재 제공 상품';

  @override
  String get allOfferingsLabel => '모든 상품';

  @override
  String get customerInfoTitle => '고객 정보';

  @override
  String get activeEntitlementsLabel => '활성 권한';

  @override
  String get originalAppUserIdLabel => '원래 앱 사용자 ID';

  @override
  String get managementUrlLabel => '관리 URL';

  @override
  String get noneLabel => '없음';

  @override
  String get refreshAction => '새로 고치다';

  @override
  String get noPackagesAvailable => '이용 가능한 패키지가 없습니다.';

  @override
  String get packagesTitle => '패키지';

  @override
  String get fontSystem => '체계';

  @override
  String get fontSerif => '가는 장식 선';

  @override
  String get fontMono => '단핵증';

  @override
  String get accessibilityFontSizeTitle => '글꼴 크기';

  @override
  String get accessibilityFontSizeSubtitle => '앱 전체의 텍스트 크기를 조정하세요.';

  @override
  String get accessibilityFontPreview =>
      '이것은 메시지 말풍선의 예시입니다.\n채팅 텍스트가 어떻게 표시되는지 보여줍니다.\n슬라이더를 조정하여 크기를 조절할 수 있습니다.';

  @override
  String get accessibilityHighContrastTitle => '고대비 모드';

  @override
  String get accessibilityHighContrastSubtitle => '가독성을 높이려면 대비를 높이세요.';

  @override
  String get colorWhatsAppGreen => 'WhatsApp 녹색';

  @override
  String get colorDeepTeal => '짙은 청록색';

  @override
  String get colorNavy => '해군';

  @override
  String get colorCharcoal => '숯';

  @override
  String get colorBlindPaletteTitle => '색맹용 팔레트';

  @override
  String get colorBlindPaletteSubtitle => '색맹에 최적화된 색상 팔레트를 사용하십시오.';

  @override
  String get hideChatsInsteadOfLocking => '채팅을 잠그는 대신 숨기세요';

  @override
  String get hideChatsInsteadOfLockingSubtitle =>
      '꺼져 있을 때는 채팅 내용이 보이지만 비밀번호로 보호됩니다.';

  @override
  String get previousMatch => '이전 경기';

  @override
  String get nextMatch => '다음 경기';

  @override
  String get selectSenderOnRight => '오른쪽에 있는 발신자를 선택하세요';

  @override
  String couldNotOpenArchive(Object error) {
    return '아카이브를 열 수 없습니다:\n$error';
  }

  @override
  String couldNotOpenFile(Object message) {
    return '파일을 열 수 없습니다: $message';
  }

  @override
  String attachmentMissing(Object filename) {
    return '첨부파일이 누락되었습니다: $filename';
  }

  @override
  String get unknownError => '알 수 없는 오류';

  @override
  String get openPdf => 'PDF 열기';

  @override
  String get openFile => '파일 열기';

  @override
  String get openAudio => '오디오 열기';

  @override
  String senderMeLabel(Object sender) {
    return '$sender (나)';
  }

  @override
  String get chatFileNotFound => '채팅 파일을 찾을 수 없습니다.';

  @override
  String get languageTitle => '언어';

  @override
  String get languageTooltip => '언어';

  @override
  String get moreOptionsTooltip => '더 많은 옵션';

  @override
  String get filterTitle => '필터';

  @override
  String get filterDateRange => '날짜 범위';

  @override
  String get filterAnyDate => '아무 날짜나';

  @override
  String get filterIncludeMedia => '미디어 포함';

  @override
  String get filterMediaOnly => '미디어 전용';

  @override
  String get filterSenders => '발신자';

  @override
  String get applyFilters => '적용하다';

  @override
  String get clearFilters => '필터 지우기';

  @override
  String get incrementalImportTitle => '채팅 기능이 이미 존재합니다.';

  @override
  String incrementalImportMessage(Object name) {
    return '이 가져오기를 \"$name\"에 추가하시겠습니까?';
  }

  @override
  String get incrementalAddAction => '추가하다';

  @override
  String get incrementalChooseTitle => '업데이트하려면 채팅을 선택하세요.';

  @override
  String get incrementalUpdated => '채팅이 업데이트되었습니다.';

  @override
  String get languageSystem => '체계';

  @override
  String get languageEnglish => '영어';

  @override
  String get languageSpanish => '스페인 사람';

  @override
  String get languageGerman => '독일 사람';

  @override
  String get languageFrench => '프랑스 국민';

  @override
  String get languagePortuguese => '포르투갈 인';

  @override
  String get languageRomanian => '루마니아 사람';

  @override
  String get languageAfrikaans => '아프리카 어';

  @override
  String get languageRussian => '러시아인';

  @override
  String get showImportButton => '가져오기 버튼 표시';

  @override
  String get showImportButtonSubtitle => '홈 화면에서 ZIP 가져오기 버튼을 토글합니다.';

  @override
  String get importButtonHiddenMessage =>
      '가져오기 버튼이 숨겨져 있습니다. 설정에서 다시 활성화할 수 있습니다.';

  @override
  String get upgradeToAccessChat => '이 채팅에 접속하려면 업그레이드하세요.';

  @override
  String get aboutLegalTitle => '회사 소개 및 법적 고지';

  @override
  String get aboutLegalSummary =>
      'WhatsBackUp은 WhatsApp 채팅 내보내기 파일을 오프라인에서 볼 수 있는 뷰어입니다. 채팅 내용은 기기에 저장됩니다.';

  @override
  String get aboutLegalRefundPolicy =>
      '환불: 환불이 진행될 경우, 가져온 채팅 기록 중 처음 5개만 이용 가능합니다. 무료 채팅 횟수를 초과하는 채팅은 재구매 전까지 비활성화됩니다.';

  @override
  String get aboutLegalDisclaimers =>
      '면책 조항: 데이터 손실, 채팅 내용, 번역 정확도 또는 잠금/숨기기 기능 사용에 대해서는 당사가 책임지지 않습니다. 백업은 직접 진행하시기 바랍니다.';

  @override
  String get aboutLegalAffiliation =>
      '본 회사는 WhatsApp 또는 Meta와 제휴 관계가 없습니다. WhatsApp은 Meta Platforms, Inc.의 상표입니다.';

  @override
  String get aboutLegalSupport => '문의: vwdewaal@gmail.com';

  @override
  String get aboutLegalDeveloper => '개발자: 반 와이크 드 와알';

  @override
  String get aboutLegalJurisdiction => '관할권: EU/영국';

  @override
  String aboutLegalVersion(Object version) {
    return '앱 버전: $version';
  }

  @override
  String get versionLoading => '앱 버전: 로딩 중...';

  @override
  String get languageScottishGaelic => '스코틀랜드 게일어';

  @override
  String get languageScots => '스코틀랜드 사람';

  @override
  String get languageChinese => '중국어(만다린어)';

  @override
  String get languageHindi => '힌디 어';

  @override
  String get languageArabic => '아라비아 말';

  @override
  String get languageBengali => '벵골 사람';

  @override
  String get languageJapanese => '일본어';

  @override
  String get languagePunjabi => '펀자브어';

  @override
  String get languageKorean => '한국인';

  @override
  String get languageTurkish => '터키어';

  @override
  String get languageItalian => '이탈리아 사람';

  @override
  String get languageVietnamese => '베트남 사람';

  @override
  String get languageUrdu => '우르두어';

  @override
  String get languageIndonesian => '인도네시아 인';

  @override
  String get languageThai => '태국';

  @override
  String get languagePolish => '광택';

  @override
  String get languageDutch => '네덜란드 사람';

  @override
  String get identifyMeTitle => '본인임을 밝히십시오.';

  @override
  String get identifyMeSubtitle => '메시지에 정확한 라벨을 붙이기 위해 이름을 선택해 주세요.';

  @override
  String get identifyMeNotNow => '지금은 안 돼';
}
