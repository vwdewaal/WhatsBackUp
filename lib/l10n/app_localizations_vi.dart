// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appTitle => 'WhatsBackUp';

  @override
  String get importZip => 'Nhập ZIP';

  @override
  String get importAction => 'Nhập khẩu';

  @override
  String get importingLabel => 'Nhập khẩu';

  @override
  String get importDoneLabel => 'XONG!';

  @override
  String get importLargeStarted => 'Quá trình nhập khẩu đã bắt đầu';

  @override
  String get importTriggeredMessage =>
      'Quá trình nhập dữ liệu được kích hoạt trong nền, cửa sổ trò chuyện sẽ mở khi hoàn tất. Vui lòng giữ ứng dụng luôn mở.';

  @override
  String get mediaImportingTitle => 'Nhập khẩu phương tiện truyền thông';

  @override
  String get mediaImportingSubtitle =>
      'Bạn có thể đọc tin nhắn trong khi chờ quá trình phát video hoàn tất.';

  @override
  String get mediaImportPausedTitle => 'Quá trình nhập phương tiện đã tạm dừng';

  @override
  String get mediaImportPausedSubtitle => 'Chọn lại ZIP ban đầu để tiếp tục.';

  @override
  String get mediaImportFailedTitle => 'Nhập phương tiện thất bại';

  @override
  String get mediaImportFailedSubtitle => 'Nhấn để thử lại.';

  @override
  String get mediaImportResumeAction => 'Bản tóm tắt';

  @override
  String get mediaImportingLabel => 'Nhập phương tiện';

  @override
  String get contactLoadingLabel => 'Đang tải thông tin liên hệ…';

  @override
  String get contactUnknownName => 'Liên hệ';

  @override
  String get contactPhoneLabel => 'Điện thoại';

  @override
  String get contactEmailLabel => 'E-mail';

  @override
  String get openContactAction => 'Liên hệ mở';

  @override
  String contactOpenFailed(Object error) {
    return 'Không thể mở liên hệ: $error';
  }

  @override
  String get howToImport => 'Cách nhập khẩu';

  @override
  String get settings => 'Cài đặt';

  @override
  String get searchTitle => 'Tìm kiếm';

  @override
  String get textToInclude => 'Nội dung cần bao gồm:';

  @override
  String get enterSearchText => 'Nhập văn bản tìm kiếm...';

  @override
  String get dateRange => 'Khoảng thời gian:';

  @override
  String get fromLabel => 'Từ:';

  @override
  String get toLabel => 'ĐẾN:';

  @override
  String get selectLabel => 'Lựa chọn';

  @override
  String get showOnlyMediaFiles => 'Chỉ hiển thị các tệp phương tiện';

  @override
  String get clearAction => 'Thông thoáng';

  @override
  String get searchAction => 'Tìm kiếm';

  @override
  String get renameChatTitle => 'Đổi tên cuộc trò chuyện';

  @override
  String get chatNameHint => 'Tên cuộc trò chuyện';

  @override
  String get cancelAction => 'Hủy bỏ';

  @override
  String get saveAction => 'Cứu';

  @override
  String get hideChatsTooltip => 'Ẩn các cuộc trò chuyện';

  @override
  String get hideAction => 'Trốn';

  @override
  String get lockAction => 'Khóa';

  @override
  String get noChatsYetHint =>
      'Chưa có cuộc trò chuyện nào.\n\nSử dụng \"Nhập ZIP\" để tải dữ liệu xuất từ WhatsApp,\nhoặc xuất trực tiếp từ WhatsApp bằng tùy chọn Xuất cuộc trò chuyện của cuộc trò chuyện đó.';

  @override
  String get noArchivedChats => 'Không có cuộc trò chuyện nào được lưu trữ.';

  @override
  String get tabChats => 'Trò chuyện';

  @override
  String get tabArchived => 'Đã lưu trữ';

  @override
  String get searchChatsHint => 'Tìm kiếm cuộc trò chuyện';

  @override
  String get enterCodeTitle => 'Nhập mã';

  @override
  String get upTo8DigitsHint => 'Tối đa 8 chữ số';

  @override
  String get continueAction => 'Tiếp tục';

  @override
  String get updatingHiddenChats => 'Đang cập nhật các cuộc trò chuyện ẩn...';

  @override
  String get chatsUnhidden => 'Các cuộc trò chuyện đã được hiển thị.';

  @override
  String get selectAtLeastOneChat => 'Chọn ít nhất một cuộc trò chuyện.';

  @override
  String get hidingChats => 'Ẩn tin nhắn...';

  @override
  String get lockingChats => 'Khóa cuộc trò chuyện...';

  @override
  String get chatsHidden => 'Các cuộc trò chuyện đã được ẩn.';

  @override
  String get chatsUnlocked => 'Đã mở khóa các cuộc trò chuyện.';

  @override
  String get chatsLocked => 'Các cuộc trò chuyện đã bị khóa.';

  @override
  String get unlockChatTitle => 'Mở khóa trò chuyện';

  @override
  String get enterPasscodeHint => 'Nhập mật mã';

  @override
  String get unlockAction => 'Mở khóa';

  @override
  String get incorrectCode => 'Mã không chính xác.';

  @override
  String importedOn(Object date) {
    return 'Đã nhập $date';
  }

  @override
  String get unarchiveAction => 'Giải nén';

  @override
  String get archiveAction => 'Lưu trữ';

  @override
  String get deleteAction => 'Xóa bỏ';

  @override
  String get deleteChatTitle => 'Xóa tin nhắn?';

  @override
  String get deleteChatConfirm =>
      'Thao tác này sẽ xóa vĩnh viễn các tệp lưu trữ và tệp phương tiện.';

  @override
  String get archiveFolderMissing => 'Thư mục lưu trữ bị thiếu.';

  @override
  String updateFailedWithDetail(Object error) {
    return 'Cập nhật thất bại: $error';
  }

  @override
  String get renameAction => 'Đổi tên';

  @override
  String get working => 'Đang làm việc...';

  @override
  String get importPreparing => 'Đang chuẩn bị nhập khẩu...';

  @override
  String get importAnalyzing => 'Đang phân tích tập tin...';

  @override
  String get bookmarksLabel => 'Dấu trang';

  @override
  String get previousBookmark => 'Dấu trang trước đó';

  @override
  String get nextBookmark => 'Đánh dấu trang tiếp theo';

  @override
  String get importLargeFileNotice =>
      'Đã phát hiện tệp tin dung lượng lớn. Quá trình này có thể mất vài phút.';

  @override
  String get importExtracting => 'Đang giải nén tập tin...';

  @override
  String get importFinalizing => 'Đang hoàn tất...';

  @override
  String importFailedWithDetail(Object error) {
    return 'Nhập khẩu thất bại: $error';
  }

  @override
  String get sharedFileNotZip => 'Tệp được chia sẻ không phải là ZIP.';

  @override
  String get unlockProToImportMoreChats =>
      'Mở khóa BackupChat Pro để nhập thêm cuộc trò chuyện.';

  @override
  String get purchaseFailedTryAgain =>
      'Giao dịch mua hàng không thành công. Vui lòng thử lại.';

  @override
  String get importErrorOnlyZip => 'Chỉ hỗ trợ các tệp .zip.';

  @override
  String get importErrorNoChatText =>
      'Không tìm thấy tệp văn bản trò chuyện WhatsApp trong ZIP.';

  @override
  String get importErrorAlreadyImported => 'Cuộc trò chuyện này đã được nhập.';

  @override
  String get howToImportTitle => 'Cách nhập khẩu';

  @override
  String get chooseImportMethodTitle => 'Chọn phương thức nhập khẩu của bạn';

  @override
  String get iosExportTitle => 'Xuất dữ liệu từ WhatsApp (iOS)';

  @override
  String get androidExportTitle => 'Xuất dữ liệu từ WhatsApp (Android)';

  @override
  String get iosStepOpenChat =>
      'Trong ứng dụng WhatsApp, hãy nhấp vào cuộc trò chuyện.';

  @override
  String get androidStepOpenChat =>
      'Trong ứng dụng WhatsApp, hãy nhấp vào một cuộc trò chuyện.';

  @override
  String get iosStepOpenInfo =>
      'Nhấp chuột vào tên người hoặc nhóm ở phía trên.';

  @override
  String get androidStepOpenMenu => 'Nhấp vào menu.';

  @override
  String get iosStepExportChat =>
      'Cuộn xuống cuối trang và chọn Xuất cuộc trò chuyện.';

  @override
  String get androidStepMoreExport => 'Chọn “Thêm”.';

  @override
  String get iosStepChooseMedia =>
      'Từ menu chọn ứng dụng (trang chia sẻ), chọn WhatsBackUp (trên các điện thoại đời cũ hơn, hãy lưu vào tập tin).';

  @override
  String get androidStepChooseMedia => 'Chọn Xuất đoạn hội thoại.';

  @override
  String get iosStepShareToApp => 'Tin nhắn sẽ được chuyển vào WhatsBackUp.';

  @override
  String get androidStepShareToApp =>
      'Từ menu chọn ứng dụng (trang chia sẻ), chọn WhatsBackUp (trên các điện thoại đời cũ hơn, hãy lưu vào tập tin).';

  @override
  String get iosStepSaveToFiles => 'Tin nhắn sẽ được chuyển vào WhatsBackUp.';

  @override
  String get androidStepSaveToDevice =>
      'Tin nhắn sẽ được chuyển vào WhatsBackUp.';

  @override
  String get androidLargeImportNote =>
      'Xin lưu ý rằng trên các điện thoại Android đời cũ, việc nhập các cuộc trò chuyện có dung lượng rất lớn có thể mất đến một phút để bắt đầu.';

  @override
  String get importZipTitle => 'Nhập tệp ZIP đã lưu';

  @override
  String get iosStepImportZip =>
      'Trong WhatsBackUp, nhấn vào “Nhập từ ZIP” và chọn tệp từ mục Tệp.';

  @override
  String get androidStepImportZip =>
      'Trong WhatsBackUp, hãy nhấn vào “Nhập từ ZIP” và chọn tệp từ thiết bị của bạn.';

  @override
  String get managingChatsTitle => 'Quản lý cuộc trò chuyện';

  @override
  String get hideChatsWithCodeTitle => 'Ẩn các cuộc trò chuyện bằng mã';

  @override
  String get stepTapGhostIcon =>
      'Nhấn vào biểu tượng hình con ma ở thanh trên cùng.';

  @override
  String get stepEnterCodeUpTo8Digits => 'Nhập mã (tối đa 8 chữ số).';

  @override
  String get stepSelectChatsSubmitHide =>
      'Chọn các cuộc trò chuyện, sau đó nhấn Gửi để ẩn chúng.';

  @override
  String get stepEnterSameCodeUnhide =>
      'Nhập lại mã đó để hiển thị lại các cuộc trò chuyện.';

  @override
  String get stepDifferentCodesHideSets =>
      'Các mã khác nhau có thể ẩn các nhóm cuộc trò chuyện khác nhau.';

  @override
  String get lockChatsWithCodeTitle => 'Khóa cuộc trò chuyện bằng mã.';

  @override
  String get stepSwitchHideToLockMode =>
      'Trong phần Cài đặt, chuyển từ chế độ Ẩn sang chế độ Khóa.';

  @override
  String get stepTapGhostIconEnterCode =>
      'Chạm vào biểu tượng con ma và nhập mã.';

  @override
  String get stepSelectChatsSubmitLock =>
      'Chọn các cuộc trò chuyện, sau đó nhấn Gửi để khóa chúng.';

  @override
  String get stepLockedChatsRequireCode =>
      'Các cuộc trò chuyện bị khóa sẽ hiển thị biểu tượng khóa và yêu cầu mã để mở.';

  @override
  String get archiveOrDeleteTitle => 'Lưu trữ hoặc xóa';

  @override
  String get stepSwipeRightArchive =>
      'Vuốt sang phải để lưu trữ hoặc bỏ lưu trữ.';

  @override
  String get stepSwipeLeftDelete => 'Vuốt sang trái để xóa (cần xác nhận).';

  @override
  String get bullet => '•';

  @override
  String get welcomeTitle => 'Chào mừng';

  @override
  String get gotItAction => 'Hiểu rồi';

  @override
  String get settingsTitle => 'Cài đặt';

  @override
  String get sectionFont => 'Phông chữ';

  @override
  String get sectionColor => 'Màu sắc';

  @override
  String get sectionAccessibility => 'Khả năng tiếp cận';

  @override
  String get sectionPrivacy => 'Sự riêng tư';

  @override
  String get sectionPro => 'BackupChat Pro';

  @override
  String get sectionStorage => 'Kho';

  @override
  String get storageTitle => 'Kho';

  @override
  String get storageSubtitle => 'Xem dung lượng thiết bị và bộ nhớ trò chuyện';

  @override
  String get storageAvailable => 'Dung lượng lưu trữ khả dụng';

  @override
  String get storageAppSize =>
      'Kích thước WhatsBackUp (bao gồm cả các cuộc trò chuyện)';

  @override
  String get storageLocation => 'Vị trí lưu trữ';

  @override
  String get storageLocationUnknown => 'Không rõ';

  @override
  String get storageCalculate => 'Tính toán';

  @override
  String get storageCalculating => 'Đang tính toán…';

  @override
  String get storageNotCalculated => 'Không được tính toán';

  @override
  String storageLastCalculated(Object date) {
    return 'Lần tính toán cuối cùng: $date';
  }

  @override
  String get storageLastCalculatedNone => 'Lần tính toán cuối cùng: —';

  @override
  String get storageChatSizesToggle =>
      'Hiển thị kích thước trò chuyện trong danh sách';

  @override
  String get storageChatSizesSubtitle =>
      'Hiển thị tổng dung lượng của mỗi cuộc trò chuyện trên màn hình chính.';

  @override
  String get storageCleanupTitle => 'Xóa các lần nhập khẩu thất bại';

  @override
  String get storageCleanupSubtitle =>
      'Xóa các tệp nhập chưa hoàn tất hoặc bị lỗi để giải phóng dung lượng.';

  @override
  String get storageCleanupEstimate => 'Dung lượng trống ước tính';

  @override
  String get storageCleanupAction => 'Dọn dẹp ngay';

  @override
  String get storageCleanupNone => 'Không tìm thấy lỗi nhập khẩu nào.';

  @override
  String storageCleanupDone(Object size) {
    return 'Đã dọn sạch $size các mục nhập không thành công.';
  }

  @override
  String storageCleanupLast(Object time) {
    return 'Lần dọn dẹp cuối cùng: __PH__';
  }

  @override
  String get proActiveTitle => 'Chế độ Pro đang hoạt động';

  @override
  String get proUpgradeTitle => 'Nâng cấp lên BackupChat Pro';

  @override
  String get proThankYouSubtitle => 'Cảm ơn bạn đã ủng hộ ứng dụng.';

  @override
  String get proUnlockSubtitle => 'Mở khóa tính năng nhập khẩu không giới hạn.';

  @override
  String get debugProOverrideTitle => 'Gỡ lỗi: Buộc Pro';

  @override
  String get debugProOverrideSubtitle =>
      'Chế độ ghi đè cục bộ để thử nghiệm (không cần mua).';

  @override
  String paywallResult(Object result) {
    return 'Kết quả truy cập tường phí: $result.';
  }

  @override
  String get purchaseCancelled => 'Giao dịch mua hàng đã bị hủy.';

  @override
  String get restorePurchases => 'Khôi phục các giao dịch mua';

  @override
  String get purchasesRestored => 'Các giao dịch mua hàng đã được khôi phục.';

  @override
  String get restoreFailedTryAgain => 'Khôi phục thất bại. Vui lòng thử lại.';

  @override
  String get manageSubscription => 'Quản lý đăng ký';

  @override
  String get openCustomerCenter =>
      'Mở Trung tâm Chăm sóc Khách hàng RevenueCat.';

  @override
  String get customerCenterUnavailable =>
      'Trung tâm chăm sóc khách hàng hiện không hoạt động.';

  @override
  String get sectionAbout => 'Về';

  @override
  String get aboutDescription =>
      'WhatsBackUp là trình xem ngoại tuyến riêng tư dành cho các tệp xuất chat từ WhatsApp. Nhập các tệp từ ZIP hoặc xuất trực tiếp từ WhatsApp để lưu trữ một kho lưu trữ sạch sẽ, có thể tìm kiếm được với các phương tiện truyền thông — không cần kết nối mạng.';

  @override
  String get sectionAboutDeveloper => 'Giới thiệu về nhà phát triển';

  @override
  String get aboutDeveloperDescription =>
      'Được xây dựng bởi một nhà phát triển độc lập tập trung vào quyền riêng tư, tìm kiếm nhanh và lưu trữ tin nhắn sạch sẽ.';

  @override
  String get sectionHelp => 'Giúp đỡ';

  @override
  String get showOnboardingAgain =>
      'Hiển thị lại quy trình giới thiệu nhân viên mới';

  @override
  String get sdkConfigTitle => 'Cấu hình SDK';

  @override
  String get publicKeyLabel => 'Khóa công khai';

  @override
  String get offeringIdLabel => 'Đề xuất ID';

  @override
  String get entitlementIdLabel => 'Mã định danh quyền';

  @override
  String get lifetimeProductIdLabel => 'Mã sản phẩm trọn đời';

  @override
  String errorLabel(Object error) {
    return 'Lỗi: $error';
  }

  @override
  String get offeringsTitle => 'Các sản phẩm cung cấp';

  @override
  String get currentOfferingLabel => 'Ưu đãi hiện tại';

  @override
  String get allOfferingsLabel => 'Tất cả các sản phẩm được cung cấp';

  @override
  String get customerInfoTitle => 'Thông tin khách hàng';

  @override
  String get activeEntitlementsLabel => 'Quyền lợi đang hoạt động';

  @override
  String get originalAppUserIdLabel => 'ID người dùng ứng dụng gốc';

  @override
  String get managementUrlLabel => 'URL quản lý';

  @override
  String get noneLabel => 'không có';

  @override
  String get refreshAction => 'Làm cho khỏe lại';

  @override
  String get noPackagesAvailable => 'Hiện không có gói dịch vụ nào.';

  @override
  String get packagesTitle => 'Gói hàng';

  @override
  String get fontSystem => 'Hệ thống';

  @override
  String get fontSerif => 'Serif';

  @override
  String get fontMono => 'Bệnh tăng bạch cầu đơn nhân';

  @override
  String get accessibilityFontSizeTitle => 'Kích thước phông chữ';

  @override
  String get accessibilityFontSizeSubtitle =>
      'Điều chỉnh kích thước văn bản trong toàn bộ ứng dụng.';

  @override
  String get accessibilityFontPreview =>
      'Đây là một ví dụ về bong bóng tin nhắn.\n\nNó cho thấy văn bản trò chuyện của bạn sẽ trông như thế nào.\n\nĐiều chỉnh thanh trượt để thay đổi kích thước.';

  @override
  String get accessibilityHighContrastTitle => 'Chế độ tương phản cao';

  @override
  String get accessibilityHighContrastSubtitle =>
      'Tăng độ tương phản để dễ đọc hơn.';

  @override
  String get colorWhatsAppGreen => '__TERM__ 0__ Xanh lá';

  @override
  String get colorDeepTeal => 'Xanh ngọc đậm';

  @override
  String get colorNavy => 'Hải quân';

  @override
  String get colorCharcoal => 'Than';

  @override
  String get colorBlindPaletteTitle => 'Bảng màu dành cho người mù màu';

  @override
  String get colorBlindPaletteSubtitle =>
      'Hãy sử dụng bảng màu được tối ưu hóa cho người có khiếm khuyết về thị giác màu.';

  @override
  String get hideChatsInsteadOfLocking =>
      'Ẩn các cuộc trò chuyện thay vì khóa chúng.';

  @override
  String get hideChatsInsteadOfLockingSubtitle =>
      'Khi tắt, tin nhắn vẫn hiển thị nhưng được bảo vệ bằng mật mã.';

  @override
  String get previousMatch => 'Trận đấu trước đó';

  @override
  String get nextMatch => 'Trận đấu tiếp theo';

  @override
  String get selectSenderOnRight => 'Chọn người gửi ở bên phải';

  @override
  String couldNotOpenArchive(Object error) {
    return 'Không thể mở tệp lưu trữ:\n$error';
  }

  @override
  String couldNotOpenFile(Object message) {
    return 'Không thể mở tệp: $message';
  }

  @override
  String attachmentMissing(Object filename) {
    return 'Tệp đính kèm bị thiếu: $filename';
  }

  @override
  String get unknownError => 'Lỗi không xác định';

  @override
  String get openPdf => 'Mở tệp PDF';

  @override
  String get openFile => 'Mở tệp';

  @override
  String get openAudio => 'Mở âm thanh';

  @override
  String senderMeLabel(Object sender) {
    return '__PH__ (Tôi)';
  }

  @override
  String get chatFileNotFound => 'Không tìm thấy tệp tin trò chuyện.';

  @override
  String get languageTitle => 'Ngôn ngữ';

  @override
  String get languageTooltip => 'Ngôn ngữ';

  @override
  String get moreOptionsTooltip => 'Nhiều tùy chọn hơn';

  @override
  String get filterTitle => 'Lọc';

  @override
  String get filterDateRange => 'Khoảng thời gian';

  @override
  String get filterAnyDate => 'Bất kỳ ngày nào';

  @override
  String get filterIncludeMedia => 'Bao gồm phương tiện truyền thông';

  @override
  String get filterMediaOnly => 'Chỉ dành cho giới truyền thông';

  @override
  String get filterSenders => 'Người gửi';

  @override
  String get applyFilters => 'Áp dụng';

  @override
  String get clearFilters => 'Xóa bộ lọc';

  @override
  String get incrementalImportTitle => 'Tính năng trò chuyện đã có sẵn.';

  @override
  String incrementalImportMessage(Object name) {
    return 'Thêm lệnh nhập này vào \"$name\"?';
  }

  @override
  String get incrementalAddAction => 'Thêm vào';

  @override
  String get incrementalChooseTitle => 'Chọn trò chuyện để cập nhật';

  @override
  String get incrementalUpdated => 'Đã cập nhật tin nhắn.';

  @override
  String get languageSystem => 'Hệ thống';

  @override
  String get languageEnglish => 'Tiếng Anh';

  @override
  String get languageSpanish => 'tiếng Tây Ban Nha';

  @override
  String get languageGerman => 'tiếng Đức';

  @override
  String get languageFrench => 'tiếng Pháp';

  @override
  String get languagePortuguese => 'tiếng Bồ Đào Nha';

  @override
  String get languageRomanian => 'tiếng Romania';

  @override
  String get languageAfrikaans => 'Tiếng Afrikaans';

  @override
  String get languageRussian => 'Tiếng Nga';

  @override
  String get showImportButton => 'Hiển thị nút Nhập';

  @override
  String get showImportButtonSubtitle =>
      'Bật/tắt nút Nhập ZIP trên màn hình chính.';

  @override
  String get importButtonHiddenMessage =>
      'Nút nhập dữ liệu bị ẩn. Bạn có thể kích hoạt lại nút này trong Cài đặt.';

  @override
  String get upgradeToAccessChat =>
      'Nâng cấp để truy cập vào cuộc trò chuyện này.';

  @override
  String get aboutLegalTitle => 'Về chúng tôi & Pháp lý';

  @override
  String get aboutLegalSummary =>
      'WhatsBackUp là trình xem ngoại tuyến cho các tệp xuất trò chuyện của WhatsApp. Các cuộc trò chuyện của bạn vẫn được lưu trên thiết bị của bạn.';

  @override
  String get aboutLegalRefundPolicy =>
      'Hoàn tiền: Nếu được hoàn tiền, chỉ 5 cuộc trò chuyện được nhập đầu tiên mới có thể truy cập được. Các cuộc trò chuyện vượt quá giới hạn miễn phí sẽ bị vô hiệu hóa cho đến khi mua lại.';

  @override
  String get aboutLegalDisclaimers =>
      'Lưu ý: Chúng tôi không chịu trách nhiệm về việc mất dữ liệu, nội dung trò chuyện, độ chính xác của bản dịch hoặc việc sử dụng các tính năng khóa/ẩn. Vui lòng tự sao lưu dữ liệu của mình.';

  @override
  String get aboutLegalAffiliation =>
      'Không liên kết với WhatsApp hoặc Meta. WhatsApp là thương hiệu của Meta Platforms, Inc.';

  @override
  String get aboutLegalSupport => 'Hỗ trợ: vwdewaal@gmail.com';

  @override
  String get aboutLegalDeveloper => 'Nhà phát triển: Van Wyk De Waal';

  @override
  String get aboutLegalJurisdiction => 'Phạm vi thẩm quyền: EU/Vương quốc Anh';

  @override
  String aboutLegalVersion(Object version) {
    return 'Phiên bản ứng dụng: $version';
  }

  @override
  String get versionLoading => 'Phiên bản ứng dụng: đang tải...';

  @override
  String get languageScottishGaelic => 'Tiếng Gaelic Scotland';

  @override
  String get languageScots => 'người Scotland';

  @override
  String get languageChinese => 'Tiếng Trung (tiếng Quan Thoại)';

  @override
  String get languageHindi => 'Tiếng Hindi';

  @override
  String get languageArabic => 'tiếng Ả Rập';

  @override
  String get languageBengali => 'tiếng Bengali';

  @override
  String get languageJapanese => 'Tiếng Nhật';

  @override
  String get languagePunjabi => 'tiếng Punjabi';

  @override
  String get languageKorean => 'tiếng Hàn';

  @override
  String get languageTurkish => 'Thổ Nhĩ Kỳ';

  @override
  String get languageItalian => 'Ý';

  @override
  String get languageVietnamese => 'Tiếng Việt';

  @override
  String get languageUrdu => 'tiếng Urdu';

  @override
  String get languageIndonesian => 'Tiếng Indonesia';

  @override
  String get languageThai => 'Thái Lan';

  @override
  String get languagePolish => 'Đánh bóng';

  @override
  String get languageDutch => 'Tiếng Hà Lan';

  @override
  String get identifyMeTitle => 'Hãy tự giới thiệu bản thân.';

  @override
  String get identifyMeSubtitle =>
      'Vui lòng chọn tên của bạn để chúng tôi có thể gắn nhãn tin nhắn của bạn một cách chính xác.';

  @override
  String get identifyMeNotNow => 'Không phải bây giờ';
}
