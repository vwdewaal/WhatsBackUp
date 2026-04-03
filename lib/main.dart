import 'dart:async';
import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'l10n/app_localizations.dart';

import 'screens/home_screen.dart';
import 'screens/splash_screen.dart';
import 'settings_controller.dart';
import 'firebase_options.dart';
import 'services/revenuecat_service.dart';

Future<void> main() async {
  bool firebaseReady = false;
  final bool shouldEnableFirebase = !kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.android ||
          defaultTargetPlatform == TargetPlatform.iOS);

  Future<void> recordError(
    Object error,
    StackTrace stack, {
    required bool fatal,
  }) async {
    if (!firebaseReady) {
      debugPrint('Skipping Crashlytics report because Firebase is unavailable: '
          '$error');
      return;
    }
    await FirebaseCrashlytics.instance.recordError(error, stack, fatal: fatal);
  }

  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      if (shouldEnableFirebase) {
        await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );
        firebaseReady = true;
      } else {
        debugPrint(
          'Firebase telemetry is disabled on this platform.',
        );
      }

      if (firebaseReady) {
        await FirebaseCrashlytics.instance
            .setCrashlyticsCollectionEnabled(!kDebugMode);
        await FirebaseAnalytics.instance
            .setAnalyticsCollectionEnabled(!kDebugMode);
      }

      await RevenueCatService.configure();

      FlutterError.onError = (FlutterErrorDetails details) {
        FlutterError.presentError(details);
        unawaited(
          recordError(
            details.exception,
            details.stack ?? StackTrace.current,
            fatal: true,
          ),
        );
      };
      PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
        unawaited(recordError(error, stack, fatal: true));
        return true;
      };

      final SettingsController settings = SettingsController();
      await settings.loadLocale();
      await settings.loadImportFabVisibility();
      await settings.loadChatSizeVisibility();
      await settings.loadAccessibility();
      await settings.loadIdentity();
      runApp(ArchiveViewerApp(settings: settings));
    },
    (Object error, StackTrace stack) {
      unawaited(recordError(error, stack, fatal: true));
    },
  );
}

class ArchiveViewerApp extends StatefulWidget {
  const ArchiveViewerApp({super.key, required this.settings});

  final SettingsController settings;

  @override
  State<ArchiveViewerApp> createState() => _ArchiveViewerAppState();
}

class _ArchiveViewerAppState extends State<ArchiveViewerApp> {
  late final SettingsController _settings = widget.settings;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return SettingsScope(
      controller: _settings,
      child: AnimatedBuilder(
        animation: _settings,
        builder: (BuildContext context, _) {
          final ThemeData baseTheme = _settings.highContrast
              ? ThemeData.from(colorScheme: const ColorScheme.highContrastLight())
              : ThemeData.light();
          final TextTheme textTheme = _settings.fontFamily == null
              ? baseTheme.textTheme
              : baseTheme.textTheme.apply(fontFamily: _settings.fontFamily);
          final TextTheme primaryTextTheme = _settings.fontFamily == null
              ? baseTheme.primaryTextTheme
              : baseTheme.primaryTextTheme
                  .apply(fontFamily: _settings.fontFamily);
          return MaterialApp(
            navigatorKey: _navigatorKey,
            title: 'WhatsBackUp',
            onGenerateTitle: (BuildContext context) =>
                AppLocalizations.of(context)!.appTitle,
            debugShowCheckedModeBanner: false,
            theme: baseTheme.copyWith(
              colorScheme: ColorScheme.fromSeed(
                seedColor: _settings.primaryColor,
                brightness: baseTheme.brightness,
              ),
              scaffoldBackgroundColor: Colors.white,
              useMaterial3: true,
              textTheme: textTheme,
              primaryTextTheme: primaryTextTheme,
            ),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: const <Locale>[Locale('en')],
            locale: const Locale('en'),
            localeResolutionCallback:
                (Locale? locale, Iterable<Locale> supported) =>
                    const Locale('en'),
            builder: (BuildContext context, Widget? child) {
              final MediaQueryData media = MediaQuery.of(context);
              return MediaQuery(
                data: media.copyWith(
                  textScaler: TextScaler.linear(_settings.fontScale),
                ),
                child: child ?? const SizedBox.shrink(),
              );
            },
            home: SplashScreen(
              onFinished: () {
                final NavigatorState? nav = _navigatorKey.currentState;
                if (nav == null) {
                  return;
                }
                nav.pushReplacement(
                  MaterialPageRoute<void>(
                    builder: (_) => const HomeScreen(),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
