import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../settings_controller.dart';
import '../services/revenuecat_service.dart';
import 'onboarding_screen.dart';
import 'send_to_phone_screen.dart';
import 'storage_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsController settings = SettingsScope.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settingsTitle),
        backgroundColor: settings.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          _SectionHeader(
            title: l10n.sectionFont,
            color: settings.primaryColor,
          ),
          const SizedBox(height: 12),
          _FontPicker(settings: settings),
          const SizedBox(height: 24),
          const Divider(height: 32),
          _SectionHeader(
            title: l10n.sectionColor,
            color: settings.primaryColor,
          ),
          const SizedBox(height: 12),
          SwitchListTile(
            title: Text(l10n.colorBlindPaletteTitle),
            subtitle: Text(l10n.colorBlindPaletteSubtitle),
            value: settings.colorBlindPalette,
            onChanged: (bool value) async {
              await settings.setColorBlindPalette(value);
            },
          ),
          const SizedBox(height: 8),
          _ColorPicker(settings: settings),
          const SizedBox(height: 24),
          const Divider(height: 32),
          _SectionHeader(
            title: l10n.sectionAccessibility,
            color: settings.primaryColor,
          ),
          const SizedBox(height: 12),
          ListTile(
            leading: const Icon(Icons.text_fields),
            title: Text(l10n.accessibilityFontSizeTitle),
            subtitle: Text(l10n.accessibilityFontSizeSubtitle),
            onTap: () {
              showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  double tempScale = settings.fontScale;
                  return StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      return AlertDialog(
                        title: Text(l10n.accessibilityFontSizeTitle),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            MediaQuery(
                              data: MediaQuery.of(context).copyWith(
                                textScaler: TextScaler.linear(tempScale),
                              ),
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Color.alphaBlend(
                                    settings.primaryColor.withValues(
                                      alpha: settings.highContrast ? 0.34 : 0.22,
                                    ),
                                    Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const <BoxShadow>[
                                    BoxShadow(
                                      color: Color(0x22000000),
                                      blurRadius: 4,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Text(
                                  l10n.accessibilityFontPreview,
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Slider(
                              value: tempScale,
                              min: 0.8,
                              max: 1.7,
                              divisions: 9,
                              label: tempScale.toStringAsFixed(1),
                              onChanged: (double value) async {
                                setState(() {
                                  tempScale = value;
                                });
                                await settings.setFontScale(value);
                              },
                            ),
                          ],
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text(l10n.gotItAction),
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            },
          ),
          SwitchListTile(
            secondary: const Icon(Icons.contrast),
            title: Text(l10n.accessibilityHighContrastTitle),
            subtitle: Text(l10n.accessibilityHighContrastSubtitle),
            value: settings.highContrast,
            onChanged: (bool value) async {
              await settings.setHighContrast(value);
            },
          ),
          const SizedBox(height: 24),
          const Divider(height: 32),
          _SectionHeader(
            title: l10n.sectionPrivacy,
            color: settings.primaryColor,
          ),
          const SizedBox(height: 12),
          const _HideModeToggle(),
          const SizedBox(height: 24),
          const Divider(height: 32),
          _SectionHeader(
            title: l10n.sectionStorage,
            color: settings.primaryColor,
          ),
          const SizedBox(height: 12),
          ListTile(
            leading: const Icon(Icons.storage),
            title: Text(l10n.storageTitle),
            subtitle: Text(l10n.storageSubtitle),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => StorageScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.phone_android),
            title: const Text('Send to phone'),
            subtitle: const Text(
              'Transfer WhatsApp export ZIPs to your phone over your local network.',
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => const SendToPhoneScreen(),
                ),
              );
            },
          ),
          const Divider(height: 32),
          _SectionHeader(
            title: l10n.sectionPro,
            color: settings.primaryColor,
          ),
          const SizedBox(height: 12),
          if (RevenueCatService.isAvailable) ...<Widget>[
            ValueListenableBuilder<bool>(
              valueListenable: RevenueCatService.isPro,
              builder: (BuildContext context, bool isPro, _) {
                return ListTile(
                  leading: Icon(isPro ? Icons.verified : Icons.lock_outline),
                  title: Text(
                    isPro ? l10n.proActiveTitle : l10n.proUpgradeTitle,
                  ),
                  subtitle: Text(
                    isPro ? l10n.proThankYouSubtitle : l10n.proUnlockSubtitle,
                  ),
                  onTap: () async {
                    try {
                      final PaywallResult result =
                          await RevenueCatService.presentPaywall();
                      if (!context.mounted) {
                        return;
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(l10n.paywallResult(result.name)),
                        ),
                      );
                    } catch (error) {
                      if (!context.mounted) {
                        return;
                      }
                      final code = RevenueCatService.parseErrorCode(error);
                      final message =
                          code == PurchasesErrorCode.purchaseCancelledError
                              ? l10n.purchaseCancelled
                              : l10n.purchaseFailedTryAgain;
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(message)));
                    }
                  },
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.restore),
              title: Text(l10n.restorePurchases),
              onTap: () async {
                try {
                  await RevenueCatService.restorePurchases();
                  if (!context.mounted) {
                    return;
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(l10n.purchasesRestored)),
                  );
                } catch (_) {
                  if (!context.mounted) {
                    return;
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(l10n.restoreFailedTryAgain)),
                  );
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.manage_accounts_outlined),
              title: Text(l10n.manageSubscription),
              subtitle: Text(l10n.openCustomerCenter),
              onTap: () async {
                try {
                  await RevenueCatService.presentCustomerCenter();
                } catch (_) {
                  if (!context.mounted) {
                    return;
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(l10n.customerCenterUnavailable)),
                  );
                }
              },
            ),
          ],
          const SizedBox(height: 24),
          const Divider(height: 32),
          _SectionHeader(
            title: l10n.sectionAbout,
            color: settings.primaryColor,
          ),
          const SizedBox(height: 12),
          Text(l10n.aboutDescription),
          const SizedBox(height: 12),
          const Divider(height: 24),
          _SectionHeader(
            title: l10n.sectionAboutDeveloper,
            color: settings.primaryColor,
          ),
          const SizedBox(height: 12),
          Text(l10n.aboutDeveloperDescription),
          const SizedBox(height: 24),
          const Divider(height: 32),
          _SectionHeader(
            title: l10n.sectionHelp,
            color: settings.primaryColor,
          ),
          const SizedBox(height: 12),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: Text(l10n.showOnboardingAgain),
            onTap: () async {
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              await prefs.setBool('has_seen_onboarding', false);
              if (!context.mounted) {
                return;
              }
              await Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => OnboardingScreen(
                    onDone: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  fullscreenDialog: true,
                ),
              );
              await prefs.setBool('has_seen_onboarding', true);
            },
          ),
          const SizedBox(height: 24),
          const _ImportButtonToggle(),
          const SizedBox(height: 24),
          const _AboutLegalSection(),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, required this.color});

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: color,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}

class _ImportButtonToggle extends StatefulWidget {
  const _ImportButtonToggle();

  @override
  State<_ImportButtonToggle> createState() => _ImportButtonToggleState();
}

class _ImportButtonToggleState extends State<_ImportButtonToggle> {
  static const String _prefsHideImportFabKey = 'hide_import_fab';
  bool _hidden = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    if (!mounted) {
      return;
    }
    final SettingsController settings = SettingsScope.of(context);
    setState(() {
      _hidden = settings.hideImportFab;
    });
  }

  Future<void> _toggle(bool value) async {
    final SettingsController settings = SettingsScope.of(context);
    await settings.setHideImportFab(value);
    if (!mounted) {
      return;
    }
    setState(() {
      _hidden = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    return SwitchListTile(
      title: Text(l10n.showImportButton),
      subtitle: Text(l10n.showImportButtonSubtitle),
      value: !_hidden,
      onChanged: (bool value) => _toggle(!value),
    );
  }
}

class _FontPicker extends StatelessWidget {
  const _FontPicker({required this.settings});

  final SettingsController settings;

  @override
  Widget build(BuildContext context) {
    final List<FontOption> options = SettingsController.fontOptions();
    final AppLocalizations l10n = AppLocalizations.of(context)!;

    return RadioGroup<String?>(
      groupValue: settings.fontFamily,
      onChanged: (String? value) {
        settings.setFontFamily(value);
      },
      child: Column(
        children: options.map((FontOption option) {
          return RadioListTile<String?>(
            value: option.family,
            title: Text(_fontLabel(l10n, option)),
          );
        }).toList(),
      ),
    );
  }

  String _fontLabel(AppLocalizations l10n, FontOption option) {
    if (option.family == null) {
      return l10n.fontSystem;
    }
    if (option.family == 'Times New Roman') {
      return l10n.fontSerif;
    }
    if (option.family == 'Courier New') {
      return l10n.fontMono;
    }
    return option.label;
  }
}

class _ColorPicker extends StatelessWidget {
  const _ColorPicker({required this.settings});

  final SettingsController settings;

  @override
  Widget build(BuildContext context) {
    final List<ColorOption> options = settings.colorBlindPalette
        ? SettingsController.colorBlindOptions()
        : SettingsController.colorOptions();
    final AppLocalizations l10n = AppLocalizations.of(context)!;

    return Column(
      children: options.map((ColorOption option) {
        return ListTile(
          leading: CircleAvatar(backgroundColor: option.color),
          title: Text(_colorLabel(l10n, option)),
          trailing: settings.primaryColor == option.color
              ? const Icon(Icons.check)
              : null,
          onTap: () {
            settings.setPrimaryColor(option.color);
          },
        );
      }).toList(),
    );
  }

  String _colorLabel(AppLocalizations l10n, ColorOption option) {
    switch (option.color.toARGB32()) {
      case 0xFF075E54:
        return l10n.colorWhatsAppGreen;
      case 0xFF00695C:
        return l10n.colorDeepTeal;
      case 0xFF0D47A1:
        return l10n.colorNavy;
      case 0xFF37474F:
        return l10n.colorCharcoal;
      default:
        return option.label;
    }
  }
}

class _HideModeToggle extends StatefulWidget {
  const _HideModeToggle();

  @override
  State<_HideModeToggle> createState() => _HideModeToggleState();
}

class _HideModeToggleState extends State<_HideModeToggle> {
  bool _hideMode = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!mounted) {
      return;
    }
    setState(() {
      _hideMode = prefs.getBool('hide_mode') ?? false;
    });
  }

  Future<void> _toggle(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hide_mode', value);
    if (!mounted) {
      return;
    }
    setState(() {
      _hideMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    return SwitchListTile(
      title: Text(l10n.hideChatsInsteadOfLocking),
      subtitle: Text(l10n.hideChatsInsteadOfLockingSubtitle),
      value: _hideMode,
      onChanged: _toggle,
    );
  }
}

class _AboutLegalSection extends StatefulWidget {
  const _AboutLegalSection();

  @override
  State<_AboutLegalSection> createState() => _AboutLegalSectionState();
}

class _AboutLegalSectionState extends State<_AboutLegalSection> {
  String? _versionLabel;

  @override
  void initState() {
    super.initState();
    _loadVersion();
  }

  Future<void> _loadVersion() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    if (!mounted) {
      return;
    }
    setState(() {
      _versionLabel = '${info.version} (${info.buildNumber})';
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    final String version = _versionLabel ?? l10n.versionLoading;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          l10n.aboutLegalTitle,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(l10n.aboutLegalSummary),
        const SizedBox(height: 8),
        Text(l10n.aboutLegalRefundPolicy),
        const SizedBox(height: 8),
        Text(l10n.aboutLegalDisclaimers),
        const SizedBox(height: 8),
        Text(l10n.aboutLegalAffiliation),
        const SizedBox(height: 8),
        Text(l10n.aboutLegalSupport),
        const SizedBox(height: 4),
        Text(l10n.aboutLegalDeveloper),
        const SizedBox(height: 4),
        Text(l10n.aboutLegalJurisdiction),
        const SizedBox(height: 8),
        Text(l10n.aboutLegalVersion(version)),
      ],
    );
  }
}
