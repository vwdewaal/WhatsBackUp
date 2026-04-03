// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get appTitle => 'การสำรองข้อมูล';

  @override
  String get importZip => 'นำเข้า ZIP';

  @override
  String get importAction => 'นำเข้า';

  @override
  String get importingLabel => 'การนำเข้า';

  @override
  String get importDoneLabel => 'เสร็จแล้ว!';

  @override
  String get importLargeStarted => 'เริ่มการนำเข้าแล้ว';

  @override
  String get importTriggeredMessage =>
      'การนำเข้าข้อมูลจะเริ่มทำงานเบื้องหลัง และแชทจะเปิดขึ้นเมื่อการนำเข้าเสร็จสมบูรณ์ โปรดเปิดแอปพลิเคชันไว้ตลอดเวลา';

  @override
  String get mediaImportingTitle => 'การนำเข้าสื่อ';

  @override
  String get mediaImportingSubtitle =>
      'คุณสามารถอ่านแชทได้ในขณะที่สื่อกำลังเล่นอยู่';

  @override
  String get mediaImportPausedTitle => 'การนำเข้าสื่อหยุดชั่วคราว';

  @override
  String get mediaImportPausedSubtitle =>
      'เลือก ZIP เดิมอีกครั้งเพื่อดำเนินการต่อ';

  @override
  String get mediaImportFailedTitle => 'การนำเข้าสื่อล้มเหลว';

  @override
  String get mediaImportFailedSubtitle => 'แตะเพื่อลองใหม่อีกครั้ง';

  @override
  String get mediaImportResumeAction => 'ประวัติย่อ';

  @override
  String get mediaImportingLabel => 'การนำเข้าสื่อ';

  @override
  String get contactLoadingLabel => 'กำลังโหลดข้อมูลติดต่อ…';

  @override
  String get contactUnknownName => 'ติดต่อ';

  @override
  String get contactPhoneLabel => 'โทรศัพท์';

  @override
  String get contactEmailLabel => 'อีเมล';

  @override
  String get openContactAction => 'เปิดการติดต่อ';

  @override
  String contactOpenFailed(Object error) {
    return 'ไม่สามารถเปิดหน้าสัมผัสได้: $error';
  }

  @override
  String get howToImport => 'วิธีการนำเข้า';

  @override
  String get settings => 'การตั้งค่า';

  @override
  String get searchTitle => 'ค้นหา';

  @override
  String get textToInclude => 'ข้อความที่จะใส่:';

  @override
  String get enterSearchText => 'ป้อนข้อความค้นหา...';

  @override
  String get dateRange => 'ช่วงวันที่:';

  @override
  String get fromLabel => 'จาก:';

  @override
  String get toLabel => 'ถึง:';

  @override
  String get selectLabel => 'เลือก';

  @override
  String get showOnlyMediaFiles => 'แสดงเฉพาะไฟล์มีเดีย';

  @override
  String get clearAction => 'ชัดเจน';

  @override
  String get searchAction => 'ค้นหา';

  @override
  String get renameChatTitle => 'เปลี่ยนชื่อแชท';

  @override
  String get chatNameHint => 'ชื่อแชท';

  @override
  String get cancelAction => 'ยกเลิก';

  @override
  String get saveAction => 'บันทึก';

  @override
  String get hideChatsTooltip => 'ซ่อนแชท';

  @override
  String get hideAction => 'ซ่อน';

  @override
  String get lockAction => 'ล็อค';

  @override
  String get noChatsYetHint =>
      'ยังไม่มีการสนทนาใดๆ\nใช้ \"นำเข้า ZIP\" เพื่อโหลดไฟล์ส่งออก WhatsApp\nหรือส่งออกโดยตรงจาก WhatsApp โดยใช้ตัวเลือก \"ส่งออกการสนทนา\" ของแชท';

  @override
  String get noArchivedChats => 'ไม่มีการเก็บถาวรแชท';

  @override
  String get tabChats => 'แชท';

  @override
  String get tabArchived => 'เก็บถาวร';

  @override
  String get searchChatsHint => 'ค้นหาแชท';

  @override
  String get enterCodeTitle => 'ป้อนรหัส';

  @override
  String get upTo8DigitsHint => 'สูงสุด 8 หลัก';

  @override
  String get continueAction => 'ดำเนินการต่อ';

  @override
  String get updatingHiddenChats => 'กำลังอัปเดตแชทที่ซ่อนไว้...';

  @override
  String get chatsUnhidden => 'แชทถูกเปิดเผยแล้ว';

  @override
  String get selectAtLeastOneChat => 'เลือกแชทอย่างน้อยหนึ่งรายการ';

  @override
  String get hidingChats => 'ซ่อนแชท...';

  @override
  String get lockingChats => 'กำลังล็อกแชท...';

  @override
  String get chatsHidden => 'แชทถูกซ่อนไว้';

  @override
  String get chatsUnlocked => 'ปลดล็อกแชทแล้ว';

  @override
  String get chatsLocked => 'ปิดแชทแล้ว';

  @override
  String get unlockChatTitle => 'ปลดล็อกแชท';

  @override
  String get enterPasscodeHint => 'ป้อนรหัสผ่าน';

  @override
  String get unlockAction => 'ปลดล็อก';

  @override
  String get incorrectCode => 'รหัสไม่ถูกต้อง';

  @override
  String importedOn(Object date) {
    return 'นำเข้า $date';
  }

  @override
  String get unarchiveAction => 'ยกเลิกการเก็บถาวร';

  @override
  String get archiveAction => 'คลังเก็บเอกสารสำคัญ';

  @override
  String get deleteAction => 'ลบ';

  @override
  String get deleteChatTitle => 'ลบแชท?';

  @override
  String get deleteChatConfirm =>
      'การดำเนินการนี้จะลบไฟล์เก็บถาวรและไฟล์มีเดียอย่างถาวร';

  @override
  String get archiveFolderMissing => 'โฟลเดอร์เก็บถาวรหายไป';

  @override
  String updateFailedWithDetail(Object error) {
    return 'การอัปเดตล้มเหลว: $error';
  }

  @override
  String get renameAction => 'เปลี่ยนชื่อ';

  @override
  String get working => 'การทำงาน...';

  @override
  String get importPreparing => 'กำลังเตรียมการนำเข้า...';

  @override
  String get importAnalyzing => 'กำลังวิเคราะห์ไฟล์...';

  @override
  String get bookmarksLabel => 'ที่คั่นหนังสือ';

  @override
  String get previousBookmark => 'คั่นหน้าก่อนหน้า';

  @override
  String get nextBookmark => 'ถัดไป คั่นหน้า';

  @override
  String get importLargeFileNotice =>
      'ตรวจพบไฟล์ขนาดใหญ่ กระบวนการนี้อาจใช้เวลาสักครู่';

  @override
  String get importExtracting => 'กำลังแตกไฟล์...';

  @override
  String get importFinalizing => 'กำลังดำเนินการขั้นสุดท้าย...';

  @override
  String importFailedWithDetail(Object error) {
    return 'การนำเข้าล้มเหลว: $error';
  }

  @override
  String get sharedFileNotZip => 'ไฟล์ที่แชร์ไม่ใช่ ZIP';

  @override
  String get unlockProToImportMoreChats =>
      'ปลดล็อก BackupChat Pro เพื่อนำเข้าแชทเพิ่มเติม';

  @override
  String get purchaseFailedTryAgain => 'การซื้อล้มเหลว โปรดลองอีกครั้ง';

  @override
  String get importErrorOnlyZip => 'รองรับเฉพาะไฟล์ .zip เท่านั้น';

  @override
  String get importErrorNoChatText => 'ไม่พบไฟล์ข้อความแชท WhatsApp ใน ZIP';

  @override
  String get importErrorAlreadyImported => 'แชทนี้ถูกนำเข้าเรียบร้อยแล้ว';

  @override
  String get howToImportTitle => 'วิธีการนำเข้า';

  @override
  String get chooseImportMethodTitle => 'เลือกวิธีการนำเข้าของคุณ';

  @override
  String get iosExportTitle => 'ส่งออกข้อมูลจาก WhatsApp (iOS)';

  @override
  String get androidExportTitle => 'ส่งออกข้อมูลจาก WhatsApp (Android)';

  @override
  String get iosStepOpenChat => 'ภายในแอป WhatsApp ให้คลิกเข้าไปที่แชท';

  @override
  String get androidStepOpenChat =>
      'ภายในแอป WhatsApp ให้คลิกเข้าไปในแชทใดแชทหนึ่ง';

  @override
  String get iosStepOpenInfo => 'คลิกที่ชื่อบุคคลหรือกลุ่มด้านบน';

  @override
  String get androidStepOpenMenu => 'คลิกที่เมนู';

  @override
  String get iosStepExportChat =>
      'เลื่อนลงไปด้านล่างสุด แล้วเลือก \"ส่งออกแชท\"';

  @override
  String get androidStepMoreExport => 'เลือก “เพิ่มเติม”';

  @override
  String get iosStepChooseMedia =>
      'จากเมนูเลือกแอป (หน้าต่างแชร์) เลือก WhatsBackUp (ในโทรศัพท์รุ่นเก่า ให้บันทึกเป็นไฟล์)';

  @override
  String get androidStepChooseMedia => 'เลือก \"ส่งออกแชท\"';

  @override
  String get iosStepShareToApp => 'ข้อความแชทจะถูกนำเข้าสู่ WhatsBackUp';

  @override
  String get androidStepShareToApp =>
      'จากเมนูเลือกแอป (หน้าต่างแชร์) เลือก WhatsBackUp (ในโทรศัพท์รุ่นเก่า ให้บันทึกเป็นไฟล์)';

  @override
  String get iosStepSaveToFiles => 'ข้อความแชทจะถูกนำเข้าสู่ WhatsBackUp';

  @override
  String get androidStepSaveToDevice => 'ข้อความแชทจะถูกนำเข้าสู่ WhatsBackUp';

  @override
  String get androidLargeImportNote =>
      'โปรดทราบว่าในโทรศัพท์ Android รุ่นเก่า การนำเข้าแชทขนาดใหญ่มากอาจใช้เวลานานถึงหนึ่งนาทีในการเริ่มต้น';

  @override
  String get importZipTitle => 'นำเข้าไฟล์ ZIP ที่บันทึกไว้';

  @override
  String get iosStepImportZip =>
      'ในแอป WhatsBackUp ให้แตะ “นำเข้าจากไฟล์ ZIP” แล้วเลือกไฟล์จากโฟลเดอร์ Files';

  @override
  String get androidStepImportZip =>
      'ในแอป WhatsBackUp ให้แตะ “นำเข้าจากไฟล์ ZIP” แล้วเลือกไฟล์จากอุปกรณ์ของคุณ';

  @override
  String get managingChatsTitle => 'การจัดการแชท';

  @override
  String get hideChatsWithCodeTitle => 'ซ่อนแชทด้วยรหัส';

  @override
  String get stepTapGhostIcon => 'แตะที่ไอคอนรูปผีในแถบด้านบน';

  @override
  String get stepEnterCodeUpTo8Digits => 'ป้อนรหัส (ไม่เกิน 8 หลัก)';

  @override
  String get stepSelectChatsSubmitHide =>
      'เลือกแชท จากนั้นแตะ ส่ง เพื่อซ่อนแชทเหล่านั้น';

  @override
  String get stepEnterSameCodeUnhide =>
      'ป้อนรหัสเดิมอีกครั้งเพื่อแสดงแชทเหล่านั้นอีกครั้ง';

  @override
  String get stepDifferentCodesHideSets =>
      'รหัสที่แตกต่างกันสามารถซ่อนชุดแชทที่แตกต่างกันได้';

  @override
  String get lockChatsWithCodeTitle => 'ล็อกแชทด้วยรหัส';

  @override
  String get stepSwitchHideToLockMode =>
      'ในเมนูการตั้งค่า ให้เปลี่ยนจากโหมดซ่อนเป็นโหมดล็อก';

  @override
  String get stepTapGhostIconEnterCode => 'แตะที่ไอคอนรูปผีแล้วป้อนรหัส';

  @override
  String get stepSelectChatsSubmitLock =>
      'เลือกแชท จากนั้นแตะ ส่ง เพื่อล็อกแชท';

  @override
  String get stepLockedChatsRequireCode =>
      'แชทที่ล็อกไว้จะแสดงไอคอนรูปกุญแจและต้องใช้รหัสเพื่อเปิด';

  @override
  String get archiveOrDeleteTitle => 'เก็บถาวรหรือลบ';

  @override
  String get stepSwipeRightArchive =>
      'ปัดไปทางขวาเพื่อเก็บถาวรหรือยกเลิกการเก็บถาวร';

  @override
  String get stepSwipeLeftDelete => 'ปัดไปทางซ้ายเพื่อลบ (ต้องยืนยันอีกครั้ง)';

  @override
  String get bullet => '•';

  @override
  String get welcomeTitle => 'ยินดีต้อนรับ';

  @override
  String get gotItAction => 'เข้าใจแล้ว';

  @override
  String get settingsTitle => 'การตั้งค่า';

  @override
  String get sectionFont => 'ฟอนต์';

  @override
  String get sectionColor => 'สี';

  @override
  String get sectionAccessibility => 'การเข้าถึง';

  @override
  String get sectionPrivacy => 'ความเป็นส่วนตัว';

  @override
  String get sectionPro => 'แบ็คอัพแชท โปร';

  @override
  String get sectionStorage => 'พื้นที่จัดเก็บ';

  @override
  String get storageTitle => 'พื้นที่จัดเก็บ';

  @override
  String get storageSubtitle => 'ดูพื้นที่ว่างในอุปกรณ์และพื้นที่จัดเก็บแชท';

  @override
  String get storageAvailable => 'พื้นที่ว่าง';

  @override
  String get storageAppSize => 'ขนาดของ WhatsBackUp (รวมถึงแชท)';

  @override
  String get storageLocation => 'สถานที่จัดเก็บ';

  @override
  String get storageLocationUnknown => 'ไม่ทราบ';

  @override
  String get storageCalculate => 'คำนวณ';

  @override
  String get storageCalculating => 'กำลังคำนวณ…';

  @override
  String get storageNotCalculated => 'ไม่ได้คำนวณ';

  @override
  String storageLastCalculated(Object date) {
    return 'คำนวณครั้งล่าสุด: $date';
  }

  @override
  String get storageLastCalculatedNone => 'คำนวณครั้งล่าสุด: —';

  @override
  String get storageChatSizesToggle => 'แสดงขนาดแชทในรายการ';

  @override
  String get storageChatSizesSubtitle => 'แสดงขนาดรวมของแต่ละแชทบนหน้าจอหลัก';

  @override
  String get storageCleanupTitle => 'ล้างข้อมูลนำเข้าที่ล้มเหลว';

  @override
  String get storageCleanupSubtitle =>
      'ลบการนำเข้าที่ไม่สมบูรณ์หรือล้มเหลวเพื่อเพิ่มพื้นที่ว่าง';

  @override
  String get storageCleanupEstimate => 'พื้นที่ว่างโดยประมาณ';

  @override
  String get storageCleanupAction => 'ทำความสะอาดเลยตอนนี้';

  @override
  String get storageCleanupNone => 'ไม่พบการนำเข้าที่ล้มเหลว';

  @override
  String storageCleanupDone(Object size) {
    return 'ล้างข้อมูลการนำเข้าที่ล้มเหลวใน $size แล้ว';
  }

  @override
  String storageCleanupLast(Object time) {
    return 'การทำความสะอาดครั้งล่าสุด: $time';
  }

  @override
  String get proActiveTitle => 'โปรเปิดใช้งานแล้ว';

  @override
  String get proUpgradeTitle => 'อัปเกรดเป็น BackupChat Pro';

  @override
  String get proThankYouSubtitle => 'ขอบคุณที่ให้การสนับสนุนแอปพลิเคชันนี้';

  @override
  String get proUnlockSubtitle => 'ปลดล็อกการนำเข้าแบบไม่จำกัด';

  @override
  String get debugProOverrideTitle => 'ดีบัก: บังคับโปร';

  @override
  String get debugProOverrideSubtitle =>
      'การตั้งค่าเฉพาะที่สำหรับการทดสอบ (ไม่ต้องซื้อ)';

  @override
  String paywallResult(Object result) {
    return 'ผลการค้นหาที่ต้องชำระเงิน: $result';
  }

  @override
  String get purchaseCancelled => 'ยกเลิกคำสั่งซื้อแล้ว';

  @override
  String get restorePurchases => 'กู้คืนการซื้อ';

  @override
  String get purchasesRestored => 'การซื้อกลับมาใช้งานได้แล้ว';

  @override
  String get restoreFailedTryAgain => 'การกู้คืนล้มเหลว โปรดลองอีกครั้ง';

  @override
  String get manageSubscription => 'จัดการการสมัครสมาชิก';

  @override
  String get openCustomerCenter => 'เปิดศูนย์บริการลูกค้า RevenueCat';

  @override
  String get customerCenterUnavailable => 'ศูนย์บริการลูกค้าไม่พร้อมให้บริการ';

  @override
  String get sectionAbout => 'เกี่ยวกับ';

  @override
  String get aboutDescription =>
      'WhatsBackUp เป็นโปรแกรมดูไฟล์แชทที่ส่งออกจาก WhatsApp แบบส่วนตัวและออฟไลน์ สามารถนำเข้าไฟล์จาก ZIP หรือส่งออกโดยตรงจาก WhatsApp เพื่อเก็บรักษาไฟล์มีเดียในรูปแบบไฟล์เก็บถาวรที่ค้นหาได้ง่าย โดยไม่จำเป็นต้องเชื่อมต่อเครือข่าย';

  @override
  String get sectionAboutDeveloper => 'เกี่ยวกับผู้พัฒนา';

  @override
  String get aboutDeveloperDescription =>
      'พัฒนาโดยนักพัฒนาอิสระที่เน้นความเป็นส่วนตัว การค้นหาที่รวดเร็ว และการจัดเก็บประวัติการสนทนาที่สะอาดตา';

  @override
  String get sectionHelp => 'ช่วย';

  @override
  String get showOnboardingAgain => 'แสดงขั้นตอนการเริ่มต้นใช้งานอีกครั้ง';

  @override
  String get sdkConfigTitle => 'การกำหนดค่า SDK';

  @override
  String get publicKeyLabel => 'กุญแจสาธารณะ';

  @override
  String get offeringIdLabel => 'รหัสข้อเสนอ';

  @override
  String get entitlementIdLabel => 'รหัสสิทธิ์';

  @override
  String get lifetimeProductIdLabel => 'รหัสผลิตภัณฑ์ตลอดอายุการใช้งาน';

  @override
  String errorLabel(Object error) {
    return 'ข้อผิดพลาด: $error';
  }

  @override
  String get offeringsTitle => 'ข้อเสนอ';

  @override
  String get currentOfferingLabel => 'ข้อเสนอปัจจุบัน';

  @override
  String get allOfferingsLabel => 'ข้อเสนอทั้งหมด';

  @override
  String get customerInfoTitle => 'ข้อมูลลูกค้า';

  @override
  String get activeEntitlementsLabel => 'สิทธิ์การใช้งานที่ใช้งานอยู่';

  @override
  String get originalAppUserIdLabel => 'รหัสผู้ใช้แอปดั้งเดิม';

  @override
  String get managementUrlLabel => 'URL สำหรับการจัดการ';

  @override
  String get noneLabel => 'ไม่มี';

  @override
  String get refreshAction => 'รีเฟรช';

  @override
  String get noPackagesAvailable => 'ไม่มีแพ็คเกจให้บริการ';

  @override
  String get packagesTitle => 'แพ็คเกจ';

  @override
  String get fontSystem => 'ระบบ';

  @override
  String get fontSerif => 'เซริฟ';

  @override
  String get fontMono => 'โมโน';

  @override
  String get accessibilityFontSizeTitle => 'ขนาดตัวอักษร';

  @override
  String get accessibilityFontSizeSubtitle => 'ปรับขนาดตัวอักษรได้ทั่วทั้งแอป';

  @override
  String get accessibilityFontPreview =>
      'นี่คือตัวอย่างข้อความแชท\nแสดงให้เห็นว่าข้อความแชทของคุณจะมีลักษณะอย่างไร\nปรับแถบเลื่อนเพื่อปรับขนาด';

  @override
  String get accessibilityHighContrastTitle => 'โหมดความคมชัดสูง';

  @override
  String get accessibilityHighContrastSubtitle =>
      'เพิ่มความคมชัดเพื่อให้อ่านง่ายขึ้น';

  @override
  String get colorWhatsAppGreen => 'WhatsApp สีเขียว';

  @override
  String get colorDeepTeal => 'สีเขียวอมฟ้าเข้ม';

  @override
  String get colorNavy => 'กองทัพเรือ';

  @override
  String get colorCharcoal => 'ถ่าน';

  @override
  String get colorBlindPaletteTitle => 'จานสีสำหรับผู้ที่มีปัญหาตาบอดสี';

  @override
  String get colorBlindPaletteSubtitle =>
      'ใช้ชุดสีที่ปรับให้เหมาะสมสำหรับผู้ที่มีความบกพร่องทางการมองเห็นสี';

  @override
  String get hideChatsInsteadOfLocking => 'ซ่อนแชทแทนการล็อก';

  @override
  String get hideChatsInsteadOfLockingSubtitle =>
      'เมื่อปิดใช้งานอยู่ แชทจะยังคงมองเห็นได้ แต่จะมีรหัสผ่านป้องกัน';

  @override
  String get previousMatch => 'การแข่งขันครั้งก่อน';

  @override
  String get nextMatch => 'การแข่งขันนัดต่อไป';

  @override
  String get selectSenderOnRight => 'เลือกผู้ส่งที่อยู่ทางด้านขวา';

  @override
  String couldNotOpenArchive(Object error) {
    return 'ไม่สามารถเปิดไฟล์เก็บถาวรได้:\n$error';
  }

  @override
  String couldNotOpenFile(Object message) {
    return 'ไม่สามารถเปิดไฟล์ได้: $message';
  }

  @override
  String attachmentMissing(Object filename) {
    return 'ไฟล์แนบหายไป: $filename';
  }

  @override
  String get unknownError => 'ข้อผิดพลาดที่ไม่ทราบสาเหตุ';

  @override
  String get openPdf => 'เปิดไฟล์ PDF';

  @override
  String get openFile => 'เปิดไฟล์';

  @override
  String get openAudio => 'เปิดเสียง';

  @override
  String senderMeLabel(Object sender) {
    return '$sender (ฉัน)';
  }

  @override
  String get chatFileNotFound => 'ไม่พบไฟล์แชท';

  @override
  String get languageTitle => 'ภาษา';

  @override
  String get languageTooltip => 'ภาษา';

  @override
  String get moreOptionsTooltip => 'ตัวเลือกเพิ่มเติม';

  @override
  String get filterTitle => 'กรอง';

  @override
  String get filterDateRange => 'ช่วงวันที่';

  @override
  String get filterAnyDate => 'วันใดก็ได้';

  @override
  String get filterIncludeMedia => 'รวมสื่อต่างๆ';

  @override
  String get filterMediaOnly => 'เฉพาะสื่อเท่านั้น';

  @override
  String get filterSenders => 'ผู้ส่ง';

  @override
  String get applyFilters => 'นำมาใช้';

  @override
  String get clearFilters => 'ล้างตัวกรอง';

  @override
  String get incrementalImportTitle => 'แชทมีอยู่แล้ว';

  @override
  String incrementalImportMessage(Object name) {
    return 'เพิ่มการนำเข้านี้ลงใน \"$name\" หรือไม่?';
  }

  @override
  String get incrementalAddAction => 'เพิ่ม';

  @override
  String get incrementalChooseTitle => 'เลือกแชทเพื่ออัปเดต';

  @override
  String get incrementalUpdated => 'แชทได้รับการอัปเดตแล้ว';

  @override
  String get languageSystem => 'ระบบ';

  @override
  String get languageEnglish => 'ภาษาอังกฤษ';

  @override
  String get languageSpanish => 'ภาษาสเปน';

  @override
  String get languageGerman => 'ภาษาเยอรมัน';

  @override
  String get languageFrench => 'ภาษาฝรั่งเศส';

  @override
  String get languagePortuguese => 'ภาษาโปรตุเกส';

  @override
  String get languageRomanian => 'โรมาเนีย';

  @override
  String get languageAfrikaans => 'ภาษาแอฟริกาans';

  @override
  String get languageRussian => 'รัสเซีย';

  @override
  String get showImportButton => 'แสดงปุ่มนำเข้า';

  @override
  String get showImportButtonSubtitle =>
      'เปิดใช้งานหรือปิดใช้งานปุ่ม Import ZIP บนหน้าจอหลัก';

  @override
  String get importButtonHiddenMessage =>
      'ปุ่มนำเข้าถูกซ่อนอยู่ คุณสามารถเปิดใช้งานอีกครั้งได้ในการตั้งค่า';

  @override
  String get upgradeToAccessChat => 'อัปเกรดเพื่อเข้าใช้งานแชทนี้';

  @override
  String get aboutLegalTitle => 'เกี่ยวกับเราและข้อกำหนดทางกฎหมาย';

  @override
  String get aboutLegalSummary =>
      'WhatsBackUp เป็นโปรแกรมดูไฟล์แชทที่ส่งออกโดย WhatsApp แบบออฟไลน์ ไฟล์แชทของคุณจะยังคงอยู่ในอุปกรณ์ของคุณ';

  @override
  String get aboutLegalRefundPolicy =>
      'การคืนเงิน: หากมีการคืนเงิน คุณจะสามารถใช้งานแชทที่นำเข้า 5 รายการแรกได้เท่านั้น แชทที่เกินจำนวนที่กำหนดจะถูกปิดใช้งานจนกว่าจะซื้อใหม่';

  @override
  String get aboutLegalDisclaimers =>
      'ข้อสงวนสิทธิ์: เราไม่รับผิดชอบต่อการสูญหายของข้อมูล เนื้อหาการสนทนา ความถูกต้องของการแปล หรือการใช้คุณสมบัติการล็อก/ซ่อน โปรดสำรองข้อมูลของคุณเอง';

  @override
  String get aboutLegalAffiliation =>
      'ไม่เกี่ยวข้องกับ WhatsApp หรือ Meta WhatsApp เป็นเครื่องหมายการค้าของ Meta Platforms, Inc.';

  @override
  String get aboutLegalSupport => 'ติดต่อสอบถาม: vwdewaal@gmail.com';

  @override
  String get aboutLegalDeveloper => 'ผู้พัฒนา: Van Wyk De Waal';

  @override
  String get aboutLegalJurisdiction => 'เขตอำนาจศาล: สหภาพยุโรป/สหราชอาณาจักร';

  @override
  String aboutLegalVersion(Object version) {
    return 'เวอร์ชันแอป: $version';
  }

  @override
  String get versionLoading => 'กำลังโหลดเวอร์ชันแอป...';

  @override
  String get languageScottishGaelic => 'ภาษาเกลิกสกอตแลนด์';

  @override
  String get languageScots => 'ชาวสกอต';

  @override
  String get languageChinese => 'ภาษาจีน (แมนดาริน)';

  @override
  String get languageHindi => 'ภาษาฮินดี';

  @override
  String get languageArabic => 'ภาษาอาหรับ';

  @override
  String get languageBengali => 'เบงกาลี';

  @override
  String get languageJapanese => 'ญี่ปุ่น';

  @override
  String get languagePunjabi => 'ปัญจาบ';

  @override
  String get languageKorean => 'เกาหลี';

  @override
  String get languageTurkish => 'ตุรกี';

  @override
  String get languageItalian => 'อิตาลี';

  @override
  String get languageVietnamese => 'เวียดนาม';

  @override
  String get languageUrdu => 'ภาษาอูร์ดู';

  @override
  String get languageIndonesian => 'ชาวอินโดนีเซีย';

  @override
  String get languageThai => 'แบบไทย';

  @override
  String get languagePolish => 'ขัด';

  @override
  String get languageDutch => 'ดัตช์';

  @override
  String get identifyMeTitle => 'โปรดระบุตัวตนของคุณ';

  @override
  String get identifyMeSubtitle =>
      'โปรดเลือกชื่อของคุณเพื่อให้เราติดป้ายกำกับข้อความของคุณได้อย่างถูกต้อง';

  @override
  String get identifyMeNotNow => 'ไม่ใช่ตอนนี้';
}
