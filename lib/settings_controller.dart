import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsController extends ChangeNotifier {
  SettingsController();

  String? _fontFamily;
  double _fontScale = 1.0;
  Color _primaryColor = const Color(0xFF075E54);
  String? _localeCode;
  bool _highContrast = false;
  bool _colorBlindPalette = false;
  bool _hideImportFab = false;
  bool _showChatSizes = false;
  String? _mySenderName;
  bool _mySenderPrompted = false;

  String? get fontFamily => _fontFamily;
  double get fontScale => _fontScale;
  Color get primaryColor => _primaryColor;
  String? get localeCode => _localeCode;
  bool get highContrast => _highContrast;
  bool get colorBlindPalette => _colorBlindPalette;
  bool get hideImportFab => _hideImportFab;
  bool get showChatSizes => _showChatSizes;
  String? get mySenderName => _mySenderName;
  bool get mySenderPrompted => _mySenderPrompted;
  Locale? get locale =>
      _localeCode == null ? null : Locale(_localeCode!);

  Future<void> loadLocale() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? override = prefs.getBool('locale_override');
    if (override == null) {
      if (prefs.containsKey('locale_code')) {
        await prefs.remove('locale_code');
        await prefs.setBool('locale_override', false);
        _localeCode = null;
        return;
      }
    }
    _localeCode =
        (override ?? false) ? prefs.getString('locale_code') : null;
  }

  Future<void> loadImportFabVisibility() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _hideImportFab = prefs.getBool('hide_import_fab') ?? false;
  }
  Future<void> loadAccessibility() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _fontScale = prefs.getDouble('font_scale') ?? 1.0;
    _highContrast = prefs.getBool('high_contrast') ?? false;
    _colorBlindPalette = prefs.getBool('color_blind_palette') ?? false;
  }
  Future<void> loadChatSizeVisibility() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _showChatSizes = prefs.getBool('show_chat_sizes') ?? false;
  }
  Future<void> loadIdentity() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _mySenderName = prefs.getString('my_sender_name');
    _mySenderPrompted = prefs.getBool('my_sender_prompted') ?? false;
  }


  void setFontFamily(String? family) {
    if (_fontFamily == family) {
      return;
    }
    _fontFamily = family;
    notifyListeners();
  }
  Future<void> setFontScale(double scale) async {
    final double clamped = scale.clamp(0.8, 1.7);
    if (_fontScale == clamped) {
      return;
    }
    _fontScale = clamped;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('font_scale', clamped);
    notifyListeners();
  }

  void setPrimaryColor(Color color) {
    if (_primaryColor == color) {
      return;
    }
    _primaryColor = color;
    notifyListeners();
  }
  Future<void> setHighContrast(bool value) async {
    if (_highContrast == value) {
      return;
    }
    _highContrast = value;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('high_contrast', value);
    notifyListeners();
  }
  Future<void> setColorBlindPalette(bool value) async {
    if (_colorBlindPalette == value) {
      return;
    }
    _colorBlindPalette = value;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('color_blind_palette', value);
    notifyListeners();
  }

  Future<void> setLocaleCode(String? code) async {
    if (_localeCode == code) {
      return;
    }
    _localeCode = code;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (code == null) {
      await prefs.remove('locale_code');
      await prefs.setBool('locale_override', false);
    } else {
      await prefs.setString('locale_code', code);
      await prefs.setBool('locale_override', true);
    }
    notifyListeners();
  }

  Future<void> setHideImportFab(bool value) async {
    if (_hideImportFab == value) {
      return;
    }
    _hideImportFab = value;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hide_import_fab', value);
    notifyListeners();
  }
  Future<void> setShowChatSizes(bool value) async {
    if (_showChatSizes == value) {
      return;
    }
    _showChatSizes = value;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('show_chat_sizes', value);
    notifyListeners();
  }
  Future<void> setMySenderName(String? value) async {
    if (_mySenderName == value) {
      return;
    }
    _mySenderName = value;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value == null || value.trim().isEmpty) {
      await prefs.remove('my_sender_name');
    } else {
      await prefs.setString('my_sender_name', value.trim());
      await prefs.setBool('my_sender_prompted', true);
      _mySenderPrompted = true;
    }
    notifyListeners();
  }
  Future<void> setMySenderPrompted(bool value) async {
    if (_mySenderPrompted == value) {
      return;
    }
    _mySenderPrompted = value;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('my_sender_prompted', value);
    notifyListeners();
  }


  static List<FontOption> fontOptions() {
    return const <FontOption>[
      FontOption(label: 'System', family: null),
      FontOption(label: 'Serif', family: 'Times New Roman'),
      FontOption(label: 'Mono', family: 'Courier New'),
    ];
  }

  static List<ColorOption> colorOptions() {
    return const <ColorOption>[
      ColorOption(label: 'WhatsApp Green', color: Color(0xFF075E54)),
      ColorOption(label: 'Deep Teal', color: Color(0xFF00695C)),
      ColorOption(label: 'Navy', color: Color(0xFF0D47A1)),
      ColorOption(label: 'Charcoal', color: Color(0xFF37474F)),
    ];
  }

  static List<ColorOption> colorBlindOptions() {
    return const <ColorOption>[
      ColorOption(label: 'Azure', color: Color(0xFF1B6EF3)),
      ColorOption(label: 'Orange', color: Color(0xFFF28E2B)),
      ColorOption(label: 'Teal', color: Color(0xFF17A398)),
      ColorOption(label: 'Indigo', color: Color(0xFF3C4EAA)),
    ];
  }
}

class FontOption {
  const FontOption({required this.label, required this.family});

  final String label;
  final String? family;
}

class ColorOption {
  const ColorOption({required this.label, required this.color});

  final String label;
  final Color color;
}

class SettingsScope extends InheritedNotifier<SettingsController> {
  const SettingsScope({
    super.key,
    required SettingsController controller,
    required Widget child,
  }) : super(notifier: controller, child: child);

  static SettingsController of(BuildContext context) {
    final SettingsScope? scope =
        context.dependOnInheritedWidgetOfExactType<SettingsScope>();
    if (scope == null || scope.notifier == null) {
      throw StateError('SettingsScope not found in widget tree.');
    }
    return scope.notifier!;
  }
}
