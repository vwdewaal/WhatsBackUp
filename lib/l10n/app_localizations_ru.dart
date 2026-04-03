// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'WhatsBackUp';

  @override
  String get importZip => 'Импорт ZIP';

  @override
  String get importAction => 'Импорт';

  @override
  String get importingLabel => 'Импорт';

  @override
  String get importDoneLabel => 'СДЕЛАННЫЙ!';

  @override
  String get importLargeStarted => 'Импорт начался';

  @override
  String get importTriggeredMessage =>
      'Импорт запускается в фоновом режиме, чат откроется после завершения. Пожалуйста, оставьте приложение открытым.';

  @override
  String get mediaImportingTitle => 'Импорт медиафайлов';

  @override
  String get mediaImportingSubtitle =>
      'Вы можете почитать чат, пока заканчивается воспроизведение медиаконтента.';

  @override
  String get mediaImportPausedTitle => 'Импорт медиафайлов приостановлен.';

  @override
  String get mediaImportPausedSubtitle =>
      'Для продолжения выберите исходный ZIP-адрес.';

  @override
  String get mediaImportFailedTitle => 'Импорт медиафайлов не удался.';

  @override
  String get mediaImportFailedSubtitle => 'Нажмите, чтобы повторить попытку.';

  @override
  String get mediaImportResumeAction => 'Резюме';

  @override
  String get mediaImportingLabel => 'Импорт медиафайлов';

  @override
  String get contactLoadingLabel => 'Загрузка контактов…';

  @override
  String get contactUnknownName => 'Контакт';

  @override
  String get contactPhoneLabel => 'Телефон';

  @override
  String get contactEmailLabel => 'Электронная почта';

  @override
  String get openContactAction => 'Открыть контакт';

  @override
  String contactOpenFailed(Object error) {
    return 'Не удалось открыть контакт: $error';
  }

  @override
  String get howToImport => 'Как импортировать';

  @override
  String get settings => 'Настройки';

  @override
  String get searchTitle => 'Поиск';

  @override
  String get textToInclude => 'Текст для поиска:';

  @override
  String get enterSearchText => 'Введите текст поиска...';

  @override
  String get dateRange => 'Диапазон дат:';

  @override
  String get fromLabel => 'С:';

  @override
  String get toLabel => 'По:';

  @override
  String get selectLabel => 'Выбрать';

  @override
  String get showOnlyMediaFiles => 'Показывать только медиафайлы';

  @override
  String get clearAction => 'Сбросить';

  @override
  String get searchAction => 'Искать';

  @override
  String get renameChatTitle => 'Переименовать чат';

  @override
  String get chatNameHint => 'Название чата';

  @override
  String get cancelAction => 'Отмена';

  @override
  String get saveAction => 'Сохранить';

  @override
  String get hideChatsTooltip => 'Скрыть чаты';

  @override
  String get hideAction => 'Скрыть';

  @override
  String get lockAction => 'Заблокировать';

  @override
  String get noChatsYetHint =>
      'Пока нет чатов.\nИспользуйте \"Импорт ZIP\" для загрузки экспорта WhatsApp\nили экспортируйте напрямую из WhatsApp через опцию Экспорт чата.';

  @override
  String get noArchivedChats => 'Нет архивированных чатов.';

  @override
  String get tabChats => 'Чаты';

  @override
  String get tabArchived => 'Архив';

  @override
  String get searchChatsHint => 'Поиск чатов';

  @override
  String get enterCodeTitle => 'Введите код';

  @override
  String get upTo8DigitsHint => 'До 8 цифр';

  @override
  String get continueAction => 'Продолжить';

  @override
  String get updatingHiddenChats => 'Обновление скрытых чатов...';

  @override
  String get chatsUnhidden => 'Чаты показаны.';

  @override
  String get selectAtLeastOneChat => 'Выберите хотя бы один чат.';

  @override
  String get hidingChats => 'Скрытие чатов...';

  @override
  String get lockingChats => 'Блокировка чатов...';

  @override
  String get chatsHidden => 'Чаты скрыты.';

  @override
  String get chatsUnlocked => 'Чаты разблокированы.';

  @override
  String get chatsLocked => 'Чаты заблокированы.';

  @override
  String get unlockChatTitle => 'Разблокировать чат';

  @override
  String get enterPasscodeHint => 'Введите код';

  @override
  String get unlockAction => 'Разблокировать';

  @override
  String get incorrectCode => 'Неверный код.';

  @override
  String importedOn(Object date) {
    return 'Импортировано $date';
  }

  @override
  String get unarchiveAction => 'Разархивировать';

  @override
  String get archiveAction => 'Архивировать';

  @override
  String get deleteAction => 'Удалить';

  @override
  String get deleteChatTitle => 'Удалить чат?';

  @override
  String get deleteChatConfirm => 'Это навсегда удалит архив и медиафайлы.';

  @override
  String get archiveFolderMissing => 'Папка архива отсутствует.';

  @override
  String updateFailedWithDetail(Object error) {
    return 'Не удалось обновить: $error';
  }

  @override
  String get renameAction => 'Переименовать';

  @override
  String get working => 'Выполняется...';

  @override
  String get importPreparing => 'Подготовка импорта...';

  @override
  String get importAnalyzing => 'Анализ файла...';

  @override
  String get bookmarksLabel => 'Закладки';

  @override
  String get previousBookmark => 'Предыдущая закладка';

  @override
  String get nextBookmark => 'Следующая закладка';

  @override
  String get importLargeFileNotice =>
      'Обнаружен большой файл. Это может занять несколько минут.';

  @override
  String get importExtracting => 'Извлечение файлов...';

  @override
  String get importFinalizing => 'Завершение...';

  @override
  String importFailedWithDetail(Object error) {
    return 'Ошибка импорта: $error';
  }

  @override
  String get sharedFileNotZip => 'Отправленный файл не ZIP.';

  @override
  String get unlockProToImportMoreChats =>
      'Разблокируйте BackupChat Pro, чтобы импортировать больше чатов.';

  @override
  String get purchaseFailedTryAgain => 'Покупка не удалась. Попробуйте снова.';

  @override
  String get importErrorOnlyZip => 'Поддерживаются только файлы .zip.';

  @override
  String get importErrorNoChatText =>
      'В ZIP не найден текстовый файл чата WhatsApp.';

  @override
  String get importErrorAlreadyImported => 'Этот чат уже импортирован.';

  @override
  String get howToImportTitle => 'Как импортировать';

  @override
  String get chooseImportMethodTitle => 'Выберите способ импорта';

  @override
  String get iosExportTitle => 'Экспорт из WhatsApp (iOS)';

  @override
  String get androidExportTitle => 'Экспорт из WhatsApp (Android)';

  @override
  String get iosStepOpenChat => 'Внутри приложения WhatsApp перейдите в чат.';

  @override
  String get androidStepOpenChat =>
      'Внутри приложения WhatsApp перейдите в чат.';

  @override
  String get iosStepOpenInfo =>
      'Нажмите на имя человека или группы вверху страницы.';

  @override
  String get androidStepOpenMenu => 'Нажмите на меню.';

  @override
  String get iosStepExportChat =>
      'Прокрутите страницу вниз и выберите «Экспорт чата».';

  @override
  String get androidStepMoreExport => 'Выберите «Подробнее».';

  @override
  String get iosStepChooseMedia =>
      'В меню выбора приложений (вкладка «Поделиться») выберите WhatsBackUp (на старых телефонах — сохранить в файлы).';

  @override
  String get androidStepChooseMedia => 'Выберите «Экспорт чата».';

  @override
  String get iosStepShareToApp => 'Чат будет импортирован в WhatsBackUp.';

  @override
  String get androidStepShareToApp =>
      'В меню выбора приложений (вкладка «Поделиться») выберите WhatsBackUp (на старых телефонах — сохранить в файлы).';

  @override
  String get iosStepSaveToFiles => 'Чат будет импортирован в WhatsBackUp.';

  @override
  String get androidStepSaveToDevice => 'Чат будет импортирован в WhatsBackUp.';

  @override
  String get androidLargeImportNote =>
      'Обратите внимание, что на старых моделях телефонов Android импорт очень больших чатов может занять до минуты.';

  @override
  String get importZipTitle => 'Импортируйте сохраненный ZIP-архив';

  @override
  String get iosStepImportZip =>
      'В WhatsBackUp нажмите «Импорт из ZIP-архива» и выберите файл в меню «Файлы».';

  @override
  String get androidStepImportZip =>
      'В WhatsBackUp нажмите «Импорт из ZIP-архива» и выберите файл со своего устройства.';

  @override
  String get managingChatsTitle => 'Управление чатами';

  @override
  String get hideChatsWithCodeTitle => 'Скрыть чаты с кодом';

  @override
  String get stepTapGhostIcon => 'Нажмите на значок призрака в верхней панели.';

  @override
  String get stepEnterCodeUpTo8Digits => 'Введите код (до 8 цифр).';

  @override
  String get stepSelectChatsSubmitHide =>
      'Выберите чаты и нажмите Отправить, чтобы скрыть их.';

  @override
  String get stepEnterSameCodeUnhide =>
      'Введите тот же код ещё раз, чтобы показать чаты.';

  @override
  String get stepDifferentCodesHideSets =>
      'Разные коды могут скрывать разные наборы чатов.';

  @override
  String get lockChatsWithCodeTitle => 'Заблокировать чаты с кодом';

  @override
  String get stepSwitchHideToLockMode =>
      'В настройках переключитесь с Скрыть на Заблокировать.';

  @override
  String get stepTapGhostIconEnterCode =>
      'Нажмите значок призрака и введите код.';

  @override
  String get stepSelectChatsSubmitLock =>
      'Выберите чаты и нажмите Отправить, чтобы заблокировать их.';

  @override
  String get stepLockedChatsRequireCode =>
      'Заблокированные чаты показывают замок и требуют код для открытия.';

  @override
  String get archiveOrDeleteTitle => 'Архивировать или удалить';

  @override
  String get stepSwipeRightArchive =>
      'Проведите вправо, чтобы архивировать или разархивировать.';

  @override
  String get stepSwipeLeftDelete =>
      'Проведите влево, чтобы удалить (нужно подтверждение).';

  @override
  String get bullet => '•';

  @override
  String get welcomeTitle => 'Добро пожаловать';

  @override
  String get gotItAction => 'Понятно';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get sectionFont => 'Шрифт';

  @override
  String get sectionColor => 'Цвет';

  @override
  String get sectionAccessibility => '';

  @override
  String get sectionPrivacy => 'Конфиденциальность';

  @override
  String get sectionPro => 'BackupChat Pro';

  @override
  String get sectionStorage => 'Хранилище';

  @override
  String get storageTitle => 'Хранилище';

  @override
  String get storageSubtitle =>
      'Просмотр свободного места на устройстве и хранилища чатов';

  @override
  String get storageAvailable => 'Доступное хранилище';

  @override
  String get storageAppSize =>
      'Размер резервной копии WhatsBackUp (включая чаты)';

  @override
  String get storageLocation => 'Место хранения';

  @override
  String get storageLocationUnknown => 'Неизвестный';

  @override
  String get storageCalculate => 'Рассчитайте';

  @override
  String get storageCalculating => 'Вычисления…';

  @override
  String get storageNotCalculated => 'Не рассчитано';

  @override
  String storageLastCalculated(Object date) {
    return 'Последний расчет: $date';
  }

  @override
  String get storageLastCalculatedNone => 'Последний подсчёт: —';

  @override
  String get storageChatSizesToggle => 'Показать размеры чата в списке';

  @override
  String get storageChatSizesSubtitle =>
      'На главном экране отображается общий размер каждого чата.';

  @override
  String get storageCleanupTitle => 'Чистка несостоявшихся импортных грузов';

  @override
  String get storageCleanupSubtitle =>
      'Удаляет незавершенные или неудачные импорты, чтобы освободить место.';

  @override
  String get storageCleanupEstimate =>
      'Примерное пространство для освобождения';

  @override
  String get storageCleanupAction => 'Уберитесь сейчас';

  @override
  String get storageCleanupNone => 'Неудачных импортов не обнаружено.';

  @override
  String storageCleanupDone(Object size) {
    return 'Удалены все неудачные импорты из $size.';
  }

  @override
  String storageCleanupLast(Object time) {
    return 'Последняя уборка: $time';
  }

  @override
  String get proActiveTitle => 'Pro активен';

  @override
  String get proUpgradeTitle => 'Обновить до BackupChat Pro';

  @override
  String get proThankYouSubtitle => 'Спасибо за поддержку приложения.';

  @override
  String get proUnlockSubtitle => 'Разблокируйте неограниченные импорты.';

  @override
  String get debugProOverrideTitle => 'Отладка: Force Pro';

  @override
  String get debugProOverrideSubtitle =>
      'Локальное переопределение для тестирования (покупка не требуется).';

  @override
  String paywallResult(Object result) {
    return 'Результат paywall: $result.';
  }

  @override
  String get purchaseCancelled => 'Покупка отменена.';

  @override
  String get restorePurchases => 'Восстановить покупки';

  @override
  String get purchasesRestored => 'Покупки восстановлены.';

  @override
  String get restoreFailedTryAgain =>
      'Не удалось восстановить. Попробуйте снова.';

  @override
  String get manageSubscription => 'Управление подпиской';

  @override
  String get openCustomerCenter => 'Открыть RevenueCat Customer Center.';

  @override
  String get customerCenterUnavailable => 'Customer Center недоступен.';

  @override
  String get sectionAbout => 'О приложении';

  @override
  String get aboutDescription =>
      'WhatsBackUp — приватный офлайн‑просмотрщик экспортов чатов WhatsApp. Импортируйте ZIP или экспортируйте напрямую из WhatsApp, чтобы хранить чистый и удобный для поиска архив с медиа — без сети.';

  @override
  String get sectionAboutDeveloper => 'О разработчике';

  @override
  String get aboutDeveloperDescription =>
      'Создано независимым разработчиком с фокусом на приватность, быстрый поиск и чистые архивы чатов.';

  @override
  String get sectionHelp => 'Помощь';

  @override
  String get showOnboardingAgain => 'Показать вводный экран снова';

  @override
  String get sdkConfigTitle => 'Конфигурация SDK';

  @override
  String get publicKeyLabel => 'Публичный ключ';

  @override
  String get offeringIdLabel => 'ID оффера';

  @override
  String get entitlementIdLabel => 'ID права';

  @override
  String get lifetimeProductIdLabel => 'ID пожизненного продукта';

  @override
  String errorLabel(Object error) {
    return 'Ошибка: $error';
  }

  @override
  String get offeringsTitle => 'Офферы';

  @override
  String get currentOfferingLabel => 'Текущий оффер';

  @override
  String get allOfferingsLabel => 'Все офферы';

  @override
  String get customerInfoTitle => 'Информация о клиенте';

  @override
  String get activeEntitlementsLabel => 'Активные права';

  @override
  String get originalAppUserIdLabel => 'Оригинальный ID пользователя';

  @override
  String get managementUrlLabel => 'URL управления';

  @override
  String get noneLabel => 'нет';

  @override
  String get refreshAction => 'Обновить';

  @override
  String get noPackagesAvailable => 'Пакеты недоступны.';

  @override
  String get packagesTitle => 'Пакеты';

  @override
  String get fontSystem => 'Система';

  @override
  String get fontSerif => 'Засечка';

  @override
  String get fontMono => 'Мононуклеоз';

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
  String get colorWhatsAppGreen => 'WhatsApp зелёный';

  @override
  String get colorDeepTeal => 'Глубокий бирюзовый';

  @override
  String get colorNavy => 'Темно‑синий';

  @override
  String get colorCharcoal => 'Угольный';

  @override
  String get colorBlindPaletteTitle => '';

  @override
  String get colorBlindPaletteSubtitle => '';

  @override
  String get hideChatsInsteadOfLocking => 'Скрывать чаты вместо блокировки';

  @override
  String get hideChatsInsteadOfLockingSubtitle =>
      'Когда выключено, чаты видны, но защищены кодом.';

  @override
  String get previousMatch => 'Предыдущее совпадение';

  @override
  String get nextMatch => 'Следующее совпадение';

  @override
  String get selectSenderOnRight => 'Выберите, кто справа';

  @override
  String couldNotOpenArchive(Object error) {
    return 'Не удалось открыть архив:\n$error';
  }

  @override
  String couldNotOpenFile(Object message) {
    return 'Не удалось открыть файл: $message';
  }

  @override
  String attachmentMissing(Object filename) {
    return 'Вложение не найдено: $filename';
  }

  @override
  String get unknownError => 'Неизвестная ошибка';

  @override
  String get openPdf => 'Открыть PDF';

  @override
  String get openFile => 'Открыть файл';

  @override
  String get openAudio => 'Открыть аудио';

  @override
  String senderMeLabel(Object sender) {
    return '$sender (Я)';
  }

  @override
  String get chatFileNotFound => 'Файл чата не найден.';

  @override
  String get languageTitle => 'Язык';

  @override
  String get languageTooltip => 'Язык';

  @override
  String get moreOptionsTooltip => 'Другие параметры';

  @override
  String get filterTitle => 'Фильтр';

  @override
  String get filterDateRange => 'Диапазон дат';

  @override
  String get filterAnyDate => 'Любая дата';

  @override
  String get filterIncludeMedia => 'Включать медиа';

  @override
  String get filterMediaOnly => 'Только медиа';

  @override
  String get filterSenders => 'Отправители';

  @override
  String get applyFilters => 'Применить';

  @override
  String get clearFilters => 'Очистить фильтры';

  @override
  String get incrementalImportTitle => 'Чат уже существует';

  @override
  String incrementalImportMessage(Object name) {
    return 'Добавить этот импорт в \"$name\"?';
  }

  @override
  String get incrementalAddAction => 'Добавить';

  @override
  String get incrementalChooseTitle => 'Выберите чат для обновления';

  @override
  String get incrementalUpdated => 'Чат обновлен.';

  @override
  String get languageSystem => 'Система';

  @override
  String get languageEnglish => 'Английский';

  @override
  String get languageSpanish => 'Испанский';

  @override
  String get languageGerman => 'Немецкий';

  @override
  String get languageFrench => 'Французский';

  @override
  String get languagePortuguese => 'Португальский';

  @override
  String get languageRomanian => 'Румынский';

  @override
  String get languageAfrikaans => 'Африкаанс';

  @override
  String get languageRussian => 'Русский';

  @override
  String get showImportButton => 'Показывать кнопку Импорт';

  @override
  String get showImportButtonSubtitle =>
      'Включить или скрыть кнопку «Импорт ZIP» на главном экране.';

  @override
  String get importButtonHiddenMessage =>
      'Кнопка импорта скрыта. Вы можете включить её в настройках.';

  @override
  String get upgradeToAccessChat =>
      'Обновитесь, чтобы получить доступ к этому чату.';

  @override
  String get aboutLegalTitle => 'О приложении и правовые сведения';

  @override
  String get aboutLegalSummary =>
      'WhatsBackUp — офлайн‑просмотрщик экспортов чатов WhatsApp. Ваши чаты остаются на устройстве.';

  @override
  String get aboutLegalRefundPolicy =>
      'Возвраты: если возврат одобрен, доступны только первые 5 импортированных чатов. Чаты сверх бесплатного лимита отключаются до повторной покупки.';

  @override
  String get aboutLegalDisclaimers =>
      'Отказ от ответственности: мы не отвечаем за потерю данных, содержание чатов, точность переводов или использование функций скрытия/блокировки. Делайте свои резервные копии.';

  @override
  String get aboutLegalAffiliation =>
      'Мы не связаны с WhatsApp или Meta. WhatsApp — торговая марка Meta Platforms, Inc.';

  @override
  String get aboutLegalSupport => 'Поддержка: vwdewaal@gmail.com';

  @override
  String get aboutLegalDeveloper => 'Разработчик: Van Wyk De Waal';

  @override
  String get aboutLegalJurisdiction => 'Юрисдикция: ЕС/Великобритания';

  @override
  String aboutLegalVersion(Object version) {
    return 'Версия приложения: $version';
  }

  @override
  String get versionLoading => 'Версия приложения: загрузка...';

  @override
  String get languageScottishGaelic => 'шотландский гэльский';

  @override
  String get languageScots => 'шотландцы';

  @override
  String get languageChinese => 'Китайский (мандаринский)';

  @override
  String get languageHindi => 'Нет';

  @override
  String get languageArabic => 'арабский';

  @override
  String get languageBengali => 'бенгальский';

  @override
  String get languageJapanese => 'японский';

  @override
  String get languagePunjabi => 'Пенджаби';

  @override
  String get languageKorean => 'корейский';

  @override
  String get languageTurkish => 'турецкий';

  @override
  String get languageItalian => 'итальянского';

  @override
  String get languageVietnamese => 'вьетнамский';

  @override
  String get languageUrdu => 'урду';

  @override
  String get languageIndonesian => 'индонезийский';

  @override
  String get languageThai => 'Тайский';

  @override
  String get languagePolish => 'польский';

  @override
  String get languageDutch => 'Голландский';

  @override
  String get identifyMeTitle => 'Представьтесь';

  @override
  String get identifyMeSubtitle =>
      'Выберите своё имя, чтобы мы могли правильно пометить ваши сообщения.';

  @override
  String get identifyMeNotNow => 'Не сейчас';
}
