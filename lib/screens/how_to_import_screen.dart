import 'dart:io';

import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class HowToImportScreen extends StatelessWidget {
  const HowToImportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.howToImportTitle),
      ),
      body: const HowToImportContent(),
    );
  }
}

class HowToImportContent extends StatelessWidget {
  const HowToImportContent({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    final bool isIos = Platform.isIOS;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: <Widget>[
        Text(
          l10n.chooseImportMethodTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 12),
        _Section(
          title: isIos ? l10n.iosExportTitle : l10n.androidExportTitle,
          children: <Widget>[
            if (isIos) ...<Widget>[
              _StepText(l10n.iosStepOpenChat),
              _StepText(l10n.iosStepOpenInfo),
              _StepText(l10n.iosStepExportChat),
              _StepText(l10n.iosStepChooseMedia),
              _StepText(l10n.iosStepShareToApp),
            ] else ...<Widget>[
              _StepText(l10n.androidStepOpenChat),
              _StepTextWithIcon(
                text: l10n.androidStepOpenMenu,
                icon: Icons.more_vert,
              ),
              _StepText(l10n.androidStepMoreExport),
              _StepText(l10n.androidStepChooseMedia),
              _StepText(l10n.androidStepShareToApp),
              _StepText(l10n.androidStepSaveToDevice),
              _StepText(l10n.androidLargeImportNote),
            ],
          ],
        ),
        const SizedBox(height: 16),
        _Section(
          title: l10n.importZipTitle,
          children: <Widget>[
            _StepText(
              isIos ? l10n.iosStepImportZip : l10n.androidStepImportZip,
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          l10n.managingChatsTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 12),
        _Section(
          title: l10n.hideChatsWithCodeTitle,
          children: <Widget>[
            _StepText(l10n.stepTapGhostIcon),
            _StepText(l10n.stepEnterCodeUpTo8Digits),
            _StepText(l10n.stepSelectChatsSubmitHide),
            _StepText(l10n.stepEnterSameCodeUnhide),
            _StepText(l10n.stepDifferentCodesHideSets),
          ],
        ),
        const SizedBox(height: 16),
        _Section(
          title: l10n.lockChatsWithCodeTitle,
          children: <Widget>[
            _StepText(l10n.stepSwitchHideToLockMode),
            _StepText(l10n.stepTapGhostIconEnterCode),
            _StepText(l10n.stepSelectChatsSubmitLock),
            _StepText(l10n.stepLockedChatsRequireCode),
          ],
        ),
        const SizedBox(height: 16),
        _Section(
          title: l10n.archiveOrDeleteTitle,
          children: <Widget>[
            _StepText(l10n.stepSwipeRightArchive),
            _StepText(l10n.stepSwipeLeftDelete),
          ],
        ),
      ],
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        ...children,
      ],
    );
  }
}

class _StepText extends StatelessWidget {
  const _StepText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(AppLocalizations.of(context)!.bullet),
          Expanded(
            child: Text(text),
          ),
        ],
      ),
    );
  }
}

class _StepTextWithIcon extends StatelessWidget {
  const _StepTextWithIcon({
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(AppLocalizations.of(context)!.bullet),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(child: Text(text)),
                const SizedBox(width: 6),
                Icon(icon, size: 18),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
