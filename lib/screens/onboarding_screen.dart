import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

import 'how_to_import_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key, required this.onDone});

  final VoidCallback onDone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.welcomeTitle),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: <Widget>[
          const Expanded(child: HowToImportContent()),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onDone,
                  child: Text(AppLocalizations.of(context)!.gotItAction),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
