import 'package:flutter/foundation.dart';

String get revenueCatPublicApiKey {
  switch (defaultTargetPlatform) {
    case TargetPlatform.android:
      return 'goog_oOrXoqICwNGBpqJxcseTakkRYmt';
    case TargetPlatform.iOS:
    case TargetPlatform.macOS:
      return 'appl_MGqtXXPmhmDFmlLSLfumkSWpFPn';
    default:
      return 'appl_MGqtXXPmhmDFmlLSLfumkSWpFPn';
  }
}

const String revenueCatEntitlementId = 'BackupChat Pro';
const String revenueCatOfferingId = 'iOS_default';
const String revenueCatLifetimeProductId = 'co.dewaal.backupchat.lifetime';
