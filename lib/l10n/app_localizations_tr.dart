// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'WhatsBackUp';

  @override
  String get importZip => 'ZIP\'ı içe aktarın';

  @override
  String get importAction => 'İçe aktarmak';

  @override
  String get importingLabel => 'İthalat';

  @override
  String get importDoneLabel => 'TAMAMLAMAK!';

  @override
  String get importLargeStarted => 'İçe Aktarma Başladı';

  @override
  String get importTriggeredMessage =>
      'İçe aktarma işlemi arka planda tetikleniyor, tamamlandığında sohbet penceresi açılacaktır. Lütfen uygulamayı açık tutun.';

  @override
  String get mediaImportingTitle => 'Medya içe aktarma';

  @override
  String get mediaImportingSubtitle =>
      'Medya yayını biterken sohbeti okuyabilirsiniz.';

  @override
  String get mediaImportPausedTitle => 'Medya içe aktarma işlemi duraklatıldı.';

  @override
  String get mediaImportPausedSubtitle =>
      'Devam etmek için orijinal ZIP öğesini yeniden seçin.';

  @override
  String get mediaImportFailedTitle => 'Medya içe aktarma başarısız oldu';

  @override
  String get mediaImportFailedSubtitle => 'Tekrar denemek için dokunun.';

  @override
  String get mediaImportResumeAction => 'Sürdürmek';

  @override
  String get mediaImportingLabel => 'Medya içe aktarma';

  @override
  String get contactLoadingLabel => 'İletişim bilgileri yükleniyor…';

  @override
  String get contactUnknownName => 'Temas etmek';

  @override
  String get contactPhoneLabel => 'Telefon';

  @override
  String get contactEmailLabel => 'E-posta';

  @override
  String get openContactAction => 'Açık iletişim';

  @override
  String contactOpenFailed(Object error) {
    return 'İletişim kurulamadı: $error';
  }

  @override
  String get howToImport => 'Nasıl içe aktarılır?';

  @override
  String get settings => 'Ayarlar';

  @override
  String get searchTitle => 'Aramak';

  @override
  String get textToInclude => 'Eklenecek metin:';

  @override
  String get enterSearchText => 'Arama metni girin...';

  @override
  String get dateRange => 'Tarih aralığı:';

  @override
  String get fromLabel => 'İtibaren:';

  @override
  String get toLabel => 'İle:';

  @override
  String get selectLabel => 'Seçme';

  @override
  String get showOnlyMediaFiles => 'Yalnızca medya dosyalarını göster';

  @override
  String get clearAction => 'Temizlemek';

  @override
  String get searchAction => 'Aramak';

  @override
  String get renameChatTitle => 'Sohbeti yeniden adlandır';

  @override
  String get chatNameHint => 'Sohbet adı';

  @override
  String get cancelAction => 'İptal etmek';

  @override
  String get saveAction => 'Kaydetmek';

  @override
  String get hideChatsTooltip => 'Sohbetleri gizle';

  @override
  String get hideAction => 'Saklamak';

  @override
  String get lockAction => 'Kilit';

  @override
  String get noChatsYetHint =>
      'Henüz sohbet yok.\n\nWhatsApp dışa aktarımını yüklemek için \"ZIP İçe Aktar\" seçeneğini kullanın,\nya da sohbetin Sohbeti Dışa Aktar seçeneğini kullanarak doğrudan WhatsApp\'dan dışa aktarın.';

  @override
  String get noArchivedChats => 'Arşivlenmiş sohbet yok.';

  @override
  String get tabChats => 'Sohbetler';

  @override
  String get tabArchived => 'Arşivlendi';

  @override
  String get searchChatsHint => 'Arama sohbetleri';

  @override
  String get enterCodeTitle => 'Kodu girin';

  @override
  String get upTo8DigitsHint => 'En fazla 8 hane';

  @override
  String get continueAction => 'Devam etmek';

  @override
  String get updatingHiddenChats => 'Gizli sohbetler güncelleniyor...';

  @override
  String get chatsUnhidden => 'Sohbetler gizlilikten çıkarıldı.';

  @override
  String get selectAtLeastOneChat => 'En az bir sohbet seçin.';

  @override
  String get hidingChats => 'Sohbetleri gizleme...';

  @override
  String get lockingChats => 'Sohbetler kilitleniyor...';

  @override
  String get chatsHidden => 'Sohbetler gizlendi.';

  @override
  String get chatsUnlocked => 'Sohbetlerin kilidi açıldı.';

  @override
  String get chatsLocked => 'Sohbetler kilitlendi.';

  @override
  String get unlockChatTitle => 'Sohbetin kilidini aç';

  @override
  String get enterPasscodeHint => 'Parolayı girin';

  @override
  String get unlockAction => 'Kilidi aç';

  @override
  String get incorrectCode => 'Yanlış kod.';

  @override
  String importedOn(Object date) {
    return 'İçe aktarılan $date';
  }

  @override
  String get unarchiveAction => 'Arşivden Çıkar';

  @override
  String get archiveAction => 'Arşiv';

  @override
  String get deleteAction => 'Silmek';

  @override
  String get deleteChatTitle => 'Sohbeti sil?';

  @override
  String get deleteChatConfirm =>
      'Bu işlem arşiv ve medya dosyalarını kalıcı olarak siler.';

  @override
  String get archiveFolderMissing => 'Arşiv klasörü eksikti.';

  @override
  String updateFailedWithDetail(Object error) {
    return 'Güncelleme başarısız oldu: $error';
  }

  @override
  String get renameAction => 'Yeniden isimlendirmek';

  @override
  String get working => 'Çalışma...';

  @override
  String get importPreparing => 'İçe aktarma işlemleri hazırlanıyor...';

  @override
  String get importAnalyzing => 'Dosya analiz ediliyor...';

  @override
  String get bookmarksLabel => 'Yer işaretleri';

  @override
  String get previousBookmark => 'Önceki yer imi';

  @override
  String get nextBookmark => 'Sonraki yer imi';

  @override
  String get importLargeFileNotice =>
      'Büyük dosya tespit edildi. Bu işlem birkaç dakika sürebilir.';

  @override
  String get importExtracting => 'Dosyalar çıkarılıyor...';

  @override
  String get importFinalizing => 'Son aşamaya geliniyor...';

  @override
  String importFailedWithDetail(Object error) {
    return 'İçe aktarma başarısız oldu: $error';
  }

  @override
  String get sharedFileNotZip => 'Paylaşılan dosya bir ZIP değildir.';

  @override
  String get unlockProToImportMoreChats =>
      'Daha fazla sohbeti içe aktarmak için BackupChat Pro\'ın kilidini açın.';

  @override
  String get purchaseFailedTryAgain =>
      'Satın alma işlemi başarısız oldu. Lütfen tekrar deneyin.';

  @override
  String get importErrorOnlyZip => 'Yalnızca .zip dosyaları desteklenmektedir.';

  @override
  String get importErrorNoChatText =>
      'ZIP\'de WhatsApp sohbet metni dosyası bulunamadı.';

  @override
  String get importErrorAlreadyImported => 'Bu sohbet zaten içe aktarıldı.';

  @override
  String get howToImportTitle => 'İçe Aktarma Nasıl Yapılır';

  @override
  String get chooseImportMethodTitle => 'İçe aktarma yönteminizi seçin.';

  @override
  String get iosExportTitle => 'WhatsApp\'tan dışa aktar (iOS)';

  @override
  String get androidExportTitle => 'WhatsApp\'tan dışa aktar (Android)';

  @override
  String get iosStepOpenChat => 'WhatsApp uygulamasında, sohbete tıklayın.';

  @override
  String get androidStepOpenChat =>
      'WhatsApp uygulamasında, bir sohbete tıklayın.';

  @override
  String get iosStepOpenInfo =>
      'En üstte yer alan kişi veya grup adına tıklayın.';

  @override
  String get androidStepOpenMenu => 'Menüye tıklayın.';

  @override
  String get iosStepExportChat =>
      'Sayfanın en altına kaydırın ve \"Sohbeti Dışa Aktar\" seçeneğini seçin.';

  @override
  String get androidStepMoreExport => '“Daha Fazla”yı seçin.';

  @override
  String get iosStepChooseMedia =>
      'Uygulama seçim menüsünden (paylaşım sayfası) WhatsBackUp\'ı seçin (eski telefonlarda dosyalara kaydedin).';

  @override
  String get androidStepChooseMedia => 'Sohbeti Dışa Aktar\'ı seçin.';

  @override
  String get iosStepShareToApp => 'Sohbet, WhatsBackUp\'a aktarılacak.';

  @override
  String get androidStepShareToApp =>
      'Uygulama seçim menüsünden (paylaşım sayfası) WhatsBackUp\'ı seçin (eski telefonlarda dosyalara kaydedin).';

  @override
  String get iosStepSaveToFiles => 'Sohbet, WhatsBackUp\'a aktarılacak.';

  @override
  String get androidStepSaveToDevice => 'Sohbet, WhatsBackUp\'a aktarılacak.';

  @override
  String get androidLargeImportNote =>
      'Lütfen eski Android telefonlarda çok büyük sohbet dosyalarının içe aktarılmasının bir dakikaya kadar sürebileceğini unutmayın.';

  @override
  String get importZipTitle => 'Kaydedilmiş bir ZIP dosyasını içe aktarın.';

  @override
  String get iosStepImportZip =>
      'WhatsBackUp\'ta \"ZIP\'ten İçe Aktar\" seçeneğine dokunun ve Dosyalar\'dan dosyayı seçin.';

  @override
  String get androidStepImportZip =>
      'WhatsBackUp uygulamasında \"ZIP\'ten İçe Aktar\" seçeneğine dokunun ve cihazınızdaki dosyayı seçin.';

  @override
  String get managingChatsTitle => 'Sohbetleri yönetme';

  @override
  String get hideChatsWithCodeTitle => 'Sohbetleri bir kodla gizle';

  @override
  String get stepTapGhostIcon =>
      'Üst çubukta bulunan hayalet simgesine dokunun.';

  @override
  String get stepEnterCodeUpTo8Digits =>
      '(En fazla 8 karakterden oluşan) bir kod girin.';

  @override
  String get stepSelectChatsSubmitHide =>
      'Sohbetleri seçin, ardından gizlemek için Gönder\'e dokunun.';

  @override
  String get stepEnterSameCodeUnhide =>
      'Bu sohbetleri tekrar görünür hale getirmek için aynı kodu tekrar girin.';

  @override
  String get stepDifferentCodesHideSets =>
      'Farklı kodlar farklı sohbet gruplarını gizleyebilir.';

  @override
  String get lockChatsWithCodeTitle => 'Sohbetleri bir kodla kilitleyin.';

  @override
  String get stepSwitchHideToLockMode =>
      'Ayarlar bölümünde, Gizle modundan Kilitle moduna geçin.';

  @override
  String get stepTapGhostIconEnterCode =>
      'Hayalet simgesine dokunun ve bir kod girin.';

  @override
  String get stepSelectChatsSubmitLock =>
      'Sohbetleri seçin, ardından kilitlemek için Gönder\'e dokunun.';

  @override
  String get stepLockedChatsRequireCode =>
      'Kilitli sohbetler bir kilit simgesiyle gösterilir ve açmak için şifre gerektirir.';

  @override
  String get archiveOrDeleteTitle => 'Arşivle veya sil';

  @override
  String get stepSwipeRightArchive =>
      'Arşivlemek veya arşivden çıkarmak için sağa kaydırın.';

  @override
  String get stepSwipeLeftDelete =>
      'Silmek için sola kaydırın (onay gereklidir).';

  @override
  String get bullet => '•';

  @override
  String get welcomeTitle => 'Hoş geldin';

  @override
  String get gotItAction => 'Anladım';

  @override
  String get settingsTitle => 'Ayarlar';

  @override
  String get sectionFont => 'Yazı Tipi';

  @override
  String get sectionColor => 'Renk';

  @override
  String get sectionAccessibility => 'Erişilebilirlik';

  @override
  String get sectionPrivacy => 'Mahremiyet';

  @override
  String get sectionPro => 'BackupChat Pro';

  @override
  String get sectionStorage => 'Depolamak';

  @override
  String get storageTitle => 'Depolamak';

  @override
  String get storageSubtitle =>
      'Cihaz alanını ve sohbet depolama alanını görüntüle';

  @override
  String get storageAvailable => 'Mevcut depolama alanı';

  @override
  String get storageAppSize => 'WhatsBackUp boyutu (sohbetler dahil)';

  @override
  String get storageLocation => 'Depolama yeri';

  @override
  String get storageLocationUnknown => 'Bilinmiyor';

  @override
  String get storageCalculate => 'Hesaplamak';

  @override
  String get storageCalculating => 'Hesaplanıyor…';

  @override
  String get storageNotCalculated => 'Hesaplanmadı';

  @override
  String storageLastCalculated(Object date) {
    return 'Son hesaplama: $date';
  }

  @override
  String get storageLastCalculatedNone => 'Son hesaplama: —';

  @override
  String get storageChatSizesToggle => 'Sohbet boyutlarını listede göster';

  @override
  String get storageChatSizesSubtitle =>
      'Ana ekranda her sohbetin toplam boyutunu gösterir.';

  @override
  String get storageCleanupTitle => 'Başarısız içe aktarmaları temizle';

  @override
  String get storageCleanupSubtitle =>
      'Alan açmak için tamamlanmamış veya başarısız içe aktarma işlemlerini kaldırır.';

  @override
  String get storageCleanupEstimate => 'Tahmini boş alan';

  @override
  String get storageCleanupAction => 'Şimdi temizle';

  @override
  String get storageCleanupNone => 'Başarısız içe aktarma bulunamadı.';

  @override
  String storageCleanupDone(Object size) {
    return '$size başarısız içe aktarma işlemlerinden temizlendi.';
  }

  @override
  String storageCleanupLast(Object time) {
    return 'Son temizlik: $time';
  }

  @override
  String get proActiveTitle => 'Pro aktif durumda';

  @override
  String get proUpgradeTitle => 'BackupChat Pro sürümüne yükseltin';

  @override
  String get proThankYouSubtitle =>
      'Uygulamayı desteklediğiniz için teşekkür ederiz.';

  @override
  String get proUnlockSubtitle => 'Sınırsız ithalatın kilidini açın.';

  @override
  String get debugProOverrideTitle => 'Hata Ayıklama: Force Pro';

  @override
  String get debugProOverrideSubtitle =>
      'Test amaçlı yerel geçersiz kılma (satın alma gerekmez).';

  @override
  String paywallResult(Object result) {
    return 'Ödeme duvarı sonucu: $result.';
  }

  @override
  String get purchaseCancelled => 'Satın alma işlemi iptal edildi.';

  @override
  String get restorePurchases => 'Satın alımları geri yükle';

  @override
  String get purchasesRestored => 'Satın alımlar geri yüklendi.';

  @override
  String get restoreFailedTryAgain =>
      'Geri yükleme başarısız oldu. Tekrar deneyin.';

  @override
  String get manageSubscription => 'Aboneliği yönetin';

  @override
  String get openCustomerCenter => 'RevenueCat Müşteri Merkezi\'ni açın.';

  @override
  String get customerCenterUnavailable =>
      'Müşteri hizmetleri merkezi kullanılamıyor.';

  @override
  String get sectionAbout => 'Hakkında';

  @override
  String get aboutDescription =>
      'WhatsBackUp, WhatsApp sohbet dışa aktarımları için özel, çevrimdışı bir görüntüleyicidir. ZIP dosyalarını içe aktarın veya doğrudan WhatsApp\'den dışa aktararak medya dosyalarıyla birlikte temiz, aranabilir bir arşiv oluşturun; ağ bağlantısı gerekmez.';

  @override
  String get sectionAboutDeveloper => 'Geliştirici hakkında';

  @override
  String get aboutDeveloperDescription =>
      'Bağımsız bir geliştirici tarafından gizliliğe, hızlı aramaya ve temiz sohbet arşivlerine odaklanılarak oluşturulmuştur.';

  @override
  String get sectionHelp => 'Yardım';

  @override
  String get showOnboardingAgain =>
      'Yeni kullanıcıların işe alım sürecini tekrar göster';

  @override
  String get sdkConfigTitle => 'SDK yapılandırması';

  @override
  String get publicKeyLabel => 'Genel anahtar';

  @override
  String get offeringIdLabel => 'Teklif kimliği';

  @override
  String get entitlementIdLabel => 'Hak sahipliği kimliği';

  @override
  String get lifetimeProductIdLabel => 'Ömür boyu ürün kimliği';

  @override
  String errorLabel(Object error) {
    return 'Hata: $error';
  }

  @override
  String get offeringsTitle => 'Teklifler';

  @override
  String get currentOfferingLabel => 'Mevcut teklif';

  @override
  String get allOfferingsLabel => 'Tüm teklifler';

  @override
  String get customerInfoTitle => 'Müşteri bilgileri';

  @override
  String get activeEntitlementsLabel => 'Aktif haklar';

  @override
  String get originalAppUserIdLabel => 'Orijinal uygulama kullanıcı kimliği';

  @override
  String get managementUrlLabel => 'Yönetim URL\'si';

  @override
  String get noneLabel => 'hiçbiri';

  @override
  String get refreshAction => 'Yenile';

  @override
  String get noPackagesAvailable => 'Hiçbir paket mevcut değil.';

  @override
  String get packagesTitle => 'Paketler';

  @override
  String get fontSystem => 'Sistem';

  @override
  String get fontSerif => 'Serif';

  @override
  String get fontMono => 'Mono';

  @override
  String get accessibilityFontSizeTitle => 'Yazı tipi boyutu';

  @override
  String get accessibilityFontSizeSubtitle =>
      'Uygulama genelinde metin boyutunu ayarlayın.';

  @override
  String get accessibilityFontPreview =>
      'Bu bir örnek mesaj balonu.\nSohbet metninizin nasıl görüneceğini gösterir.\nBoyutunu değiştirmek için kaydırıcıyı ayarlayın.';

  @override
  String get accessibilityHighContrastTitle => 'Yüksek kontrast modu';

  @override
  String get accessibilityHighContrastSubtitle =>
      'Daha iyi okunabilirlik için kontrastı artırın.';

  @override
  String get colorWhatsAppGreen => 'WhatsApp Yeşil';

  @override
  String get colorDeepTeal => 'Koyu Turkuaz';

  @override
  String get colorNavy => 'Donanma';

  @override
  String get colorCharcoal => 'Kömür';

  @override
  String get colorBlindPaletteTitle => 'Renk körü paleti';

  @override
  String get colorBlindPaletteSubtitle =>
      'Renk görme bozuklukları için optimize edilmiş bir renk paleti kullanın.';

  @override
  String get hideChatsInsteadOfLocking =>
      'Sohbetleri kilitlemek yerine gizleyin.';

  @override
  String get hideChatsInsteadOfLockingSubtitle =>
      'Kapalıyken sohbetler görünür ancak parola ile korunur.';

  @override
  String get previousMatch => 'Önceki maç';

  @override
  String get nextMatch => 'Sonraki maç';

  @override
  String get selectSenderOnRight => 'Sağdaki göndericiyi seçin.';

  @override
  String couldNotOpenArchive(Object error) {
    return 'Arşiv açılamadı:\n$error';
  }

  @override
  String couldNotOpenFile(Object message) {
    return 'Dosya açılamadı: $message';
  }

  @override
  String attachmentMissing(Object filename) {
    return 'Ek dosya eksik: $filename';
  }

  @override
  String get unknownError => 'Bilinmeyen hata';

  @override
  String get openPdf => 'PDF dosyasını aç';

  @override
  String get openFile => 'Dosyayı aç';

  @override
  String get openAudio => 'Ses dosyasını açın';

  @override
  String senderMeLabel(Object sender) {
    return '$sender (Ben)';
  }

  @override
  String get chatFileNotFound => 'Sohbet dosyası bulunamadı.';

  @override
  String get languageTitle => 'Dil';

  @override
  String get languageTooltip => 'Dil';

  @override
  String get moreOptionsTooltip => 'Daha fazla seçenek';

  @override
  String get filterTitle => 'Filtrele';

  @override
  String get filterDateRange => 'Tarih aralığı';

  @override
  String get filterAnyDate => 'Herhangi bir tarih';

  @override
  String get filterIncludeMedia => 'Medyayı dahil et';

  @override
  String get filterMediaOnly => 'Sadece medya mensupları için';

  @override
  String get filterSenders => 'Gönderenler';

  @override
  String get applyFilters => 'Uygula';

  @override
  String get clearFilters => 'Filtreleri temizle';

  @override
  String get incrementalImportTitle => 'Sohbet zaten mevcut.';

  @override
  String incrementalImportMessage(Object name) {
    return 'Bu içe aktarma işlemini \"$name\" adresine ekleyelim mi?';
  }

  @override
  String get incrementalAddAction => 'Eklemek';

  @override
  String get incrementalChooseTitle => 'Güncellemek için sohbeti seçin.';

  @override
  String get incrementalUpdated => 'Sohbet güncellendi.';

  @override
  String get languageSystem => 'Sistem';

  @override
  String get languageEnglish => 'İngilizce';

  @override
  String get languageSpanish => 'İspanyol';

  @override
  String get languageGerman => 'Almanca';

  @override
  String get languageFrench => 'Fransızca';

  @override
  String get languagePortuguese => 'Portekizce';

  @override
  String get languageRomanian => 'Romence';

  @override
  String get languageAfrikaans => 'Afrika';

  @override
  String get languageRussian => 'Rusça';

  @override
  String get showImportButton => 'İçe Aktar düğmesini göster';

  @override
  String get showImportButtonSubtitle =>
      'Ana ekrandaki ZIP İçe Aktar düğmesini açıp kapatın.';

  @override
  String get importButtonHiddenMessage =>
      'İçe aktarma düğmesi gizlenmiştir. Ayarlar\'dan tekrar etkinleştirebilirsiniz.';

  @override
  String get upgradeToAccessChat => 'Bu sohbete erişmek için yükseltme yapın.';

  @override
  String get aboutLegalTitle => 'Hakkımızda ve Yasal Bilgiler';

  @override
  String get aboutLegalSummary =>
      'WhatsBackUp, WhatsApp sohbet dışa aktarımları için çevrimdışı bir görüntüleyicidir. Sohbetleriniz cihazınızda kalır.';

  @override
  String get aboutLegalRefundPolicy =>
      'Geri Ödemeler: Geri ödeme yapılması durumunda, yalnızca ilk 5 içe aktarılan sohbet erişilebilir durumda kalır. Ücretsiz sınırın üzerindeki sohbetler, yeniden satın alınana kadar devre dışı bırakılır.';

  @override
  String get aboutLegalDisclaimers =>
      'Yasal Uyarılar: Veri kaybı, sohbet içeriği, çeviri doğruluğu veya kilit/gizleme özelliklerinin kullanımından sorumlu değiliz. Lütfen kendi yedeklerinizi oluşturun.';

  @override
  String get aboutLegalAffiliation =>
      'WhatsApp veya Meta ile hiçbir bağlantımız yoktur. WhatsApp, Meta Platforms, Inc.\'in tescilli ticari markasıdır.';

  @override
  String get aboutLegalSupport => 'Destek: vwdewaal@gmail.com';

  @override
  String get aboutLegalDeveloper => 'Geliştirici: Van Wyk De Waal';

  @override
  String get aboutLegalJurisdiction => 'Yargı Yetkisi: AB/Birleşik Krallık';

  @override
  String aboutLegalVersion(Object version) {
    return 'Uygulama sürümü: $version';
  }

  @override
  String get versionLoading => 'Uygulama sürümü: yükleniyor...';

  @override
  String get languageScottishGaelic => 'İskoç Galcesi';

  @override
  String get languageScots => 'İskoçlar';

  @override
  String get languageChinese => 'Çince (Mandarin)';

  @override
  String get languageHindi => 'Hintçe';

  @override
  String get languageArabic => 'Arapça';

  @override
  String get languageBengali => 'Bengalce';

  @override
  String get languageJapanese => 'Japonca';

  @override
  String get languagePunjabi => 'Pencapça';

  @override
  String get languageKorean => 'Korece';

  @override
  String get languageTurkish => 'Türkçe';

  @override
  String get languageItalian => 'İtalyan';

  @override
  String get languageVietnamese => 'Vietnam';

  @override
  String get languageUrdu => 'Urdu';

  @override
  String get languageIndonesian => 'Endonezyalı';

  @override
  String get languageThai => 'Tayland';

  @override
  String get languagePolish => 'Lehçe';

  @override
  String get languageDutch => 'Flemenkçe';

  @override
  String get identifyMeTitle => 'Kendinizi tanıtın';

  @override
  String get identifyMeSubtitle =>
      'Mesajlarınızı doğru şekilde etiketleyebilmemiz için lütfen adınızı seçin.';

  @override
  String get identifyMeNotNow => 'Şimdi değil';
}
