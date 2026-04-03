// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => '__TERM__0__';

  @override
  String get importZip => 'Impor __TERM__0__';

  @override
  String get importAction => 'Impor';

  @override
  String get importingLabel => 'Pengimporan';

  @override
  String get importDoneLabel => 'SELESAI!';

  @override
  String get importLargeStarted => 'Impor Dimulai';

  @override
  String get importTriggeredMessage =>
      'Proses impor sedang berjalan di latar belakang, obrolan akan terbuka setelah selesai. Harap tetap membuka aplikasi.';

  @override
  String get mediaImportingTitle => 'Mengimpor media';

  @override
  String get mediaImportingSubtitle =>
      'Anda dapat membaca obrolan sambil menunggu media selesai diputar.';

  @override
  String get mediaImportPausedTitle => 'Impor media dihentikan sementara';

  @override
  String get mediaImportPausedSubtitle =>
      'Pilih kembali ZIP asli untuk melanjutkan.';

  @override
  String get mediaImportFailedTitle => 'Impor media gagal';

  @override
  String get mediaImportFailedSubtitle => 'Ketuk untuk mencoba lagi.';

  @override
  String get mediaImportResumeAction => 'Melanjutkan';

  @override
  String get mediaImportingLabel => 'Impor media';

  @override
  String get contactLoadingLabel => 'Sedang memuat kontak…';

  @override
  String get contactUnknownName => 'Kontak';

  @override
  String get contactPhoneLabel => 'Telepon';

  @override
  String get contactEmailLabel => 'E-mail';

  @override
  String get openContactAction => 'Buka kontak';

  @override
  String contactOpenFailed(Object error) {
    return 'Kontak tidak dapat dibuka: __PH__';
  }

  @override
  String get howToImport => 'Cara mengimpor';

  @override
  String get settings => 'Pengaturan';

  @override
  String get searchTitle => 'Mencari';

  @override
  String get textToInclude => 'Teks yang perlu disertakan:';

  @override
  String get enterSearchText => 'Masukkan teks pencarian...';

  @override
  String get dateRange => 'Rentang tanggal:';

  @override
  String get fromLabel => 'Dari:';

  @override
  String get toLabel => 'Ke:';

  @override
  String get selectLabel => 'Memilih';

  @override
  String get showOnlyMediaFiles => 'Tampilkan hanya file media';

  @override
  String get clearAction => 'Jernih';

  @override
  String get searchAction => 'Mencari';

  @override
  String get renameChatTitle => 'Ganti nama obrolan';

  @override
  String get chatNameHint => 'Nama obrolan';

  @override
  String get cancelAction => 'Membatalkan';

  @override
  String get saveAction => 'Menyimpan';

  @override
  String get hideChatsTooltip => 'Sembunyikan obrolan';

  @override
  String get hideAction => 'Bersembunyi';

  @override
  String get lockAction => 'Kunci';

  @override
  String get noChatsYetHint =>
      'Belum ada obrolan.\n\nGunakan \"Impor ZIP\" untuk memuat ekspor WhatsApp,\natau ekspor langsung dari WhatsApp menggunakan opsi Ekspor Obrolan.';

  @override
  String get noArchivedChats => 'Tidak ada obrolan yang diarsipkan.';

  @override
  String get tabChats => 'Obrolan';

  @override
  String get tabArchived => 'Diarsipkan';

  @override
  String get searchChatsHint => 'Cari obrolan';

  @override
  String get enterCodeTitle => 'Masukkan kode';

  @override
  String get upTo8DigitsHint => 'Hingga 8 digit';

  @override
  String get continueAction => 'Melanjutkan';

  @override
  String get updatingHiddenChats => 'Memperbarui obrolan tersembunyi...';

  @override
  String get chatsUnhidden => 'Obrolan ditampilkan.';

  @override
  String get selectAtLeastOneChat => 'Pilih setidaknya satu obrolan.';

  @override
  String get hidingChats => 'Menyembunyikan obrolan...';

  @override
  String get lockingChats => 'Mengunci obrolan...';

  @override
  String get chatsHidden => 'Obrolan disembunyikan.';

  @override
  String get chatsUnlocked => 'Obrolan terbuka.';

  @override
  String get chatsLocked => 'Obrolan terkunci.';

  @override
  String get unlockChatTitle => 'Buka obrolan';

  @override
  String get enterPasscodeHint => 'Masukkan kode sandi';

  @override
  String get unlockAction => 'Membuka kunci';

  @override
  String get incorrectCode => 'Kode salah.';

  @override
  String importedOn(Object date) {
    return 'Diimpor __PH__';
  }

  @override
  String get unarchiveAction => 'Buka arsip';

  @override
  String get archiveAction => 'Arsip';

  @override
  String get deleteAction => 'Menghapus';

  @override
  String get deleteChatTitle => 'Hapus obrolan?';

  @override
  String get deleteChatConfirm =>
      'Ini akan menghapus arsip dan file media secara permanen.';

  @override
  String get archiveFolderMissing => 'Folder arsip hilang.';

  @override
  String updateFailedWithDetail(Object error) {
    return 'Pembaruan gagal: $error';
  }

  @override
  String get renameAction => 'Ganti nama';

  @override
  String get working => 'Bekerja...';

  @override
  String get importPreparing => 'Mempersiapkan impor...';

  @override
  String get importAnalyzing => 'Menganalisis berkas...';

  @override
  String get bookmarksLabel => 'Penanda buku';

  @override
  String get previousBookmark => 'Bookmark sebelumnya';

  @override
  String get nextBookmark => 'Bookmark berikutnya';

  @override
  String get importLargeFileNotice =>
      'Berkas berukuran besar terdeteksi. Proses ini dapat memakan waktu beberapa menit.';

  @override
  String get importExtracting => 'Mengekstrak file...';

  @override
  String get importFinalizing => 'Menyelesaikan...';

  @override
  String importFailedWithDetail(Object error) {
    return 'Impor gagal: $error';
  }

  @override
  String get sharedFileNotZip => 'Berkas yang dibagikan bukanlah ZIP.';

  @override
  String get unlockProToImportMoreChats =>
      'Buka kunci BackupChat Pro untuk mengimpor lebih banyak obrolan.';

  @override
  String get purchaseFailedTryAgain => 'Pembelian gagal. Silakan coba lagi.';

  @override
  String get importErrorOnlyZip => 'Hanya file .zip yang didukung.';

  @override
  String get importErrorNoChatText =>
      'Tidak ditemukan berkas teks obrolan WhatsApp di ZIP.';

  @override
  String get importErrorAlreadyImported => 'Obrolan ini sudah diimpor.';

  @override
  String get howToImportTitle => 'Cara Mengimpor';

  @override
  String get chooseImportMethodTitle => 'Pilih metode impor Anda';

  @override
  String get iosExportTitle => 'Ekspor dari WhatsApp (iOS)';

  @override
  String get androidExportTitle => 'Ekspor dari WhatsApp (Android)';

  @override
  String get iosStepOpenChat =>
      'Di dalam aplikasi WhatsApp, klik obrolan tersebut.';

  @override
  String get androidStepOpenChat => 'Di dalam aplikasi WhatsApp, klik obrolan.';

  @override
  String get iosStepOpenInfo =>
      'Klik pada nama orang atau kelompok di bagian atas.';

  @override
  String get androidStepOpenMenu => 'Klik menu.';

  @override
  String get iosStepExportChat =>
      'Gulir ke bawah hingga bagian bawah dan pilih Ekspor obrolan.';

  @override
  String get androidStepMoreExport => 'Pilih “Selengkapnya”.';

  @override
  String get iosStepChooseMedia =>
      'Dari menu pemilihan aplikasi (lembar berbagi), pilih WhatsBackUp (pada ponsel lama, simpan ke file).';

  @override
  String get androidStepChooseMedia => 'Pilih Ekspor obrolan.';

  @override
  String get iosStepShareToApp => 'Obrolan akan diimpor ke WhatsBackUp.';

  @override
  String get androidStepShareToApp =>
      'Dari menu pemilihan aplikasi (lembar berbagi), pilih WhatsBackUp (pada ponsel lama, simpan ke file).';

  @override
  String get iosStepSaveToFiles => 'Obrolan akan diimpor ke WhatsBackUp.';

  @override
  String get androidStepSaveToDevice => 'Obrolan akan diimpor ke WhatsBackUp.';

  @override
  String get androidLargeImportNote =>
      'Harap dicatat bahwa pada ponsel Android lama, impor obrolan yang sangat besar akan membutuhkan waktu hingga satu menit untuk dimulai.';

  @override
  String get importZipTitle => 'Impor file ZIP yang tersimpan.';

  @override
  String get iosStepImportZip =>
      'Di WhatsBackUp, ketuk “Impor dari ZIP” dan pilih file dari menu File.';

  @override
  String get androidStepImportZip =>
      'Di WhatsBackUp, ketuk “Impor dari ZIP” dan pilih file dari perangkat Anda.';

  @override
  String get managingChatsTitle => 'Mengelola obrolan';

  @override
  String get hideChatsWithCodeTitle => 'Sembunyikan obrolan dengan kode';

  @override
  String get stepTapGhostIcon => 'Ketuk ikon hantu di bilah atas.';

  @override
  String get stepEnterCodeUpTo8Digits => 'Masukkan kode (maksimal 8 digit).';

  @override
  String get stepSelectChatsSubmitHide =>
      'Pilih obrolan, lalu ketuk Kirim untuk menyembunyikannya.';

  @override
  String get stepEnterSameCodeUnhide =>
      'Masukkan kode yang sama lagi untuk menampilkan kembali obrolan tersebut.';

  @override
  String get stepDifferentCodesHideSets =>
      'Kode yang berbeda dapat menyembunyikan kumpulan obrolan yang berbeda.';

  @override
  String get lockChatsWithCodeTitle => 'Kunci obrolan dengan kode';

  @override
  String get stepSwitchHideToLockMode =>
      'Di Pengaturan, ubah dari mode Sembunyikan ke mode Kunci.';

  @override
  String get stepTapGhostIconEnterCode => 'Ketuk ikon hantu dan masukkan kode.';

  @override
  String get stepSelectChatsSubmitLock =>
      'Pilih obrolan, lalu ketuk Kirim untuk menguncinya.';

  @override
  String get stepLockedChatsRequireCode =>
      'Obrolan yang terkunci akan menampilkan ikon gembok dan memerlukan kode untuk membukanya.';

  @override
  String get archiveOrDeleteTitle => 'Arsipkan atau hapus';

  @override
  String get stepSwipeRightArchive =>
      'Geser ke kanan untuk mengarsipkan atau membatalkan pengarsipan.';

  @override
  String get stepSwipeLeftDelete =>
      'Geser ke kiri untuk menghapus (konfirmasi diperlukan).';

  @override
  String get bullet => '•';

  @override
  String get welcomeTitle => 'Selamat datang';

  @override
  String get gotItAction => 'Mengerti';

  @override
  String get settingsTitle => 'Pengaturan';

  @override
  String get sectionFont => 'Font';

  @override
  String get sectionColor => 'Warna';

  @override
  String get sectionAccessibility => 'Aksesibilitas';

  @override
  String get sectionPrivacy => 'Pribadi';

  @override
  String get sectionPro => '__TERM__0__';

  @override
  String get sectionStorage => 'Penyimpanan';

  @override
  String get storageTitle => 'Penyimpanan';

  @override
  String get storageSubtitle =>
      'Lihat ruang penyimpanan perangkat dan penyimpanan obrolan.';

  @override
  String get storageAvailable => 'Penyimpanan yang tersedia';

  @override
  String get storageAppSize => 'Ukuran WhatsBackUp (termasuk obrolan)';

  @override
  String get storageLocation => 'Lokasi penyimpanan';

  @override
  String get storageLocationUnknown => 'Tidak dikenal';

  @override
  String get storageCalculate => 'Menghitung';

  @override
  String get storageCalculating => 'Menghitung…';

  @override
  String get storageNotCalculated => 'Tidak dihitung';

  @override
  String storageLastCalculated(Object date) {
    return 'Terakhir dihitung: __PH__';
  }

  @override
  String get storageLastCalculatedNone => 'Perhitungan terakhir: —';

  @override
  String get storageChatSizesToggle => 'Tampilkan ukuran obrolan dalam daftar';

  @override
  String get storageChatSizesSubtitle =>
      'Menampilkan total ukuran setiap obrolan di layar utama.';

  @override
  String get storageCleanupTitle => 'Bersihkan impor yang gagal';

  @override
  String get storageCleanupSubtitle =>
      'Menghapus impor yang tidak lengkap atau gagal untuk membebaskan ruang.';

  @override
  String get storageCleanupEstimate => 'Perkiraan ruang yang perlu dikosongkan';

  @override
  String get storageCleanupAction => 'Bersihkan sekarang';

  @override
  String get storageCleanupNone => 'Tidak ditemukan impor yang gagal.';

  @override
  String storageCleanupDone(Object size) {
    return 'Membersihkan $size dari impor yang gagal.';
  }

  @override
  String storageCleanupLast(Object time) {
    return 'Pembersihan terakhir: __PH__';
  }

  @override
  String get proActiveTitle => 'Pro aktif';

  @override
  String get proUpgradeTitle => 'Tingkatkan ke __TERM__0__';

  @override
  String get proThankYouSubtitle =>
      'Terima kasih atas dukungan Anda terhadap aplikasi ini.';

  @override
  String get proUnlockSubtitle => 'Aktifkan impor tanpa batas.';

  @override
  String get debugProOverrideTitle => 'Debug: Paksa Pro';

  @override
  String get debugProOverrideSubtitle =>
      'Penggunaan lokal untuk pengujian (tidak perlu pembelian).';

  @override
  String paywallResult(Object result) {
    return 'Hasil akses berbayar: $result.';
  }

  @override
  String get purchaseCancelled => 'Pembelian dibatalkan.';

  @override
  String get restorePurchases => 'Pulihkan pembelian';

  @override
  String get purchasesRestored => 'Pembelian dipulihkan.';

  @override
  String get restoreFailedTryAgain => 'Pemulihan gagal. Coba lagi.';

  @override
  String get manageSubscription => 'Kelola langganan';

  @override
  String get openCustomerCenter => 'Buka Pusat Layanan Pelanggan RevenueCat.';

  @override
  String get customerCenterUnavailable =>
      'Pusat Layanan Pelanggan tidak tersedia.';

  @override
  String get sectionAbout => 'Tentang';

  @override
  String get aboutDescription =>
      'WhatsBackUp adalah penampil pribadi dan offline untuk ekspor obrolan WhatsApp. Impor file ZIP atau ekspor langsung dari WhatsApp untuk menyimpan arsip yang bersih dan mudah dicari beserta medianya — tanpa memerlukan jaringan.';

  @override
  String get sectionAboutDeveloper => 'Tentang pengembang';

  @override
  String get aboutDeveloperDescription =>
      'Dibuat oleh pengembang independen yang berfokus pada privasi, pencarian cepat, dan arsip obrolan yang rapi.';

  @override
  String get sectionHelp => 'Membantu';

  @override
  String get showOnboardingAgain =>
      'Tampilkan kembali proses orientasi pengguna.';

  @override
  String get sdkConfigTitle => 'Konfigurasi SDK';

  @override
  String get publicKeyLabel => 'Kunci publik';

  @override
  String get offeringIdLabel => 'ID penawaran';

  @override
  String get entitlementIdLabel => 'ID hak akses';

  @override
  String get lifetimeProductIdLabel => 'ID produk seumur hidup';

  @override
  String errorLabel(Object error) {
    return 'Kesalahan: __PH__';
  }

  @override
  String get offeringsTitle => 'Penawaran';

  @override
  String get currentOfferingLabel => 'Penawaran saat ini';

  @override
  String get allOfferingsLabel => 'Semua penawaran';

  @override
  String get customerInfoTitle => 'Informasi pelanggan';

  @override
  String get activeEntitlementsLabel => 'Hak aktif';

  @override
  String get originalAppUserIdLabel => 'ID pengguna aplikasi asli';

  @override
  String get managementUrlLabel => 'URL Manajemen';

  @override
  String get noneLabel => 'tidak ada';

  @override
  String get refreshAction => 'Menyegarkan';

  @override
  String get noPackagesAvailable => 'Tidak ada paket yang tersedia.';

  @override
  String get packagesTitle => 'Paket';

  @override
  String get fontSystem => 'Sistem';

  @override
  String get fontSerif => 'Serif';

  @override
  String get fontMono => 'Mono';

  @override
  String get accessibilityFontSizeTitle => 'Ukuran font';

  @override
  String get accessibilityFontSizeSubtitle =>
      'Sesuaikan ukuran teks di seluruh aplikasi.';

  @override
  String get accessibilityFontPreview =>
      'Ini adalah contoh gelembung pesan.\n\nIni menunjukkan bagaimana tampilan teks obrolan Anda.\nSesuaikan penggeser untuk mengubah ukurannya.';

  @override
  String get accessibilityHighContrastTitle => 'Mode kontras tinggi';

  @override
  String get accessibilityHighContrastSubtitle =>
      'Tingkatkan kontras untuk keterbacaan yang lebih baik.';

  @override
  String get colorWhatsAppGreen => 'WhatsApp Hijau';

  @override
  String get colorDeepTeal => 'Biru kehijauan tua';

  @override
  String get colorNavy => 'Angkatan laut';

  @override
  String get colorCharcoal => 'Arang';

  @override
  String get colorBlindPaletteTitle => 'Palet warna untuk buta warna';

  @override
  String get colorBlindPaletteSubtitle =>
      'Gunakan palet warna yang dioptimalkan untuk penderita gangguan penglihatan warna.';

  @override
  String get hideChatsInsteadOfLocking =>
      'Sembunyikan obrolan alih-alih menguncinya';

  @override
  String get hideChatsInsteadOfLockingSubtitle =>
      'Saat dimatikan, obrolan tetap terlihat tetapi dilindungi dengan kata sandi.';

  @override
  String get previousMatch => 'Pertandingan sebelumnya';

  @override
  String get nextMatch => 'Pertandingan selanjutnya';

  @override
  String get selectSenderOnRight =>
      'Pilih pengirim yang berada di sebelah kanan.';

  @override
  String couldNotOpenArchive(Object error) {
    return 'Tidak dapat membuka arsip:\n$error';
  }

  @override
  String couldNotOpenFile(Object message) {
    return 'Tidak dapat membuka file: $message';
  }

  @override
  String attachmentMissing(Object filename) {
    return 'Lampiran hilang: __PH__';
  }

  @override
  String get unknownError => 'Kesalahan tidak dikenal';

  @override
  String get openPdf => 'Buka PDF';

  @override
  String get openFile => 'Buka berkas';

  @override
  String get openAudio => 'Buka audio';

  @override
  String senderMeLabel(Object sender) {
    return '__PH__ (Saya)';
  }

  @override
  String get chatFileNotFound => 'Berkas obrolan tidak ditemukan.';

  @override
  String get languageTitle => 'Bahasa';

  @override
  String get languageTooltip => 'Bahasa';

  @override
  String get moreOptionsTooltip => 'Opsi lainnya';

  @override
  String get filterTitle => 'Menyaring';

  @override
  String get filterDateRange => 'Rentang tanggal';

  @override
  String get filterAnyDate => 'Tanggal berapa pun';

  @override
  String get filterIncludeMedia => 'Sertakan media';

  @override
  String get filterMediaOnly => 'Khusus media';

  @override
  String get filterSenders => 'Pengirim';

  @override
  String get applyFilters => 'Menerapkan';

  @override
  String get clearFilters => 'Hapus filter';

  @override
  String get incrementalImportTitle => 'Obrolan sudah ada.';

  @override
  String incrementalImportMessage(Object name) {
    return 'Tambahkan impor ini ke \"$name\"?';
  }

  @override
  String get incrementalAddAction => 'Menambahkan';

  @override
  String get incrementalChooseTitle => 'Pilih obrolan untuk memperbarui';

  @override
  String get incrementalUpdated => 'Obrolan telah diperbarui.';

  @override
  String get languageSystem => 'Sistem';

  @override
  String get languageEnglish => 'Bahasa inggris';

  @override
  String get languageSpanish => 'Spanyol';

  @override
  String get languageGerman => 'Jerman';

  @override
  String get languageFrench => 'Perancis';

  @override
  String get languagePortuguese => 'Portugis';

  @override
  String get languageRomanian => 'Rumania';

  @override
  String get languageAfrikaans => 'Afrikanas';

  @override
  String get languageRussian => 'Rusia';

  @override
  String get showImportButton => 'Tampilkan tombol Impor';

  @override
  String get showImportButtonSubtitle =>
      'Aktifkan atau nonaktifkan tombol Impor ZIP di layar utama.';

  @override
  String get importButtonHiddenMessage =>
      'Tombol impor disembunyikan. Anda dapat mengaktifkannya kembali di Pengaturan.';

  @override
  String get upgradeToAccessChat =>
      'Tingkatkan akun Anda untuk mengakses obrolan ini.';

  @override
  String get aboutLegalTitle => 'Tentang Kami & Hukum';

  @override
  String get aboutLegalSummary =>
      'WhatsBackUp adalah penampil offline untuk ekspor obrolan WhatsApp. Obrolan Anda tetap tersimpan di perangkat Anda.';

  @override
  String get aboutLegalRefundPolicy =>
      'Pengembalian Dana: Jika pengembalian dana diberikan, hanya 5 obrolan yang diimpor pertama yang tetap dapat diakses. Obrolan di atas batas gratis akan dinonaktifkan hingga pembelian ulang.';

  @override
  String get aboutLegalDisclaimers =>
      'Penafian: Kami tidak bertanggung jawab atas kehilangan data, isi obrolan, keakuratan terjemahan, atau penggunaan fitur kunci/sembunyikan. Harap simpan cadangan Anda sendiri.';

  @override
  String get aboutLegalAffiliation =>
      'Tidak berafiliasi dengan WhatsApp atau Meta. WhatsApp adalah merek dagang dari Meta Platforms, Inc.';

  @override
  String get aboutLegalSupport => 'Dukungan: vwdewaal@gmail.com';

  @override
  String get aboutLegalDeveloper => 'Pengembang: Van Wyk De Waal';

  @override
  String get aboutLegalJurisdiction => 'Yurisdiksi: Uni Eropa/Inggris Raya';

  @override
  String aboutLegalVersion(Object version) {
    return 'Versi aplikasi: __PH__';
  }

  @override
  String get versionLoading => 'Versi aplikasi: sedang dimuat...';

  @override
  String get languageScottishGaelic => 'Bahasa Gaelik Skotlandia';

  @override
  String get languageScots => 'orang Skotlandia';

  @override
  String get languageChinese => 'Bahasa Mandarin (Tionghoa)';

  @override
  String get languageHindi => 'TIDAK';

  @override
  String get languageArabic => 'Arab';

  @override
  String get languageBengali => 'Benggala';

  @override
  String get languageJapanese => 'Jepang';

  @override
  String get languagePunjabi => 'Bahasa Punjabi';

  @override
  String get languageKorean => 'Korea';

  @override
  String get languageTurkish => 'Turki';

  @override
  String get languageItalian => 'Italia';

  @override
  String get languageVietnamese => 'Vietnam';

  @override
  String get languageUrdu => 'Bahasa Urdu';

  @override
  String get languageIndonesian => 'Indonesia';

  @override
  String get languageThai => 'Thai';

  @override
  String get languagePolish => 'Polandia';

  @override
  String get languageDutch => 'Belanda';

  @override
  String get identifyMeTitle => 'Perkenalkan diri Anda';

  @override
  String get identifyMeSubtitle =>
      'Pilih nama Anda agar kami dapat memberi label pada pesan Anda dengan benar.';

  @override
  String get identifyMeNotNow => 'Tidak sekarang';
}
