import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';

import '../revenuecat_config.dart';

class RevenueCatService {
  static bool _configured = false;
  static final ValueNotifier<bool> isPro = ValueNotifier<bool>(false);
  static final ValueNotifier<CustomerInfo?> customerInfo =
      ValueNotifier<CustomerInfo?>(null);

  static bool get isAvailable {
    if (kIsWeb) {
      return false;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
      case TargetPlatform.iOS:
        return true;
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
      case TargetPlatform.linux:
        return false;
      default:
        return false;
    }
  }

  static Future<void> configure() async {
    if (_configured) {
      return;
    }
    if (!isAvailable) {
      _configured = true;
      isPro.value = true;
      customerInfo.value = null;
      return;
    }
    if (kDebugMode) {
      await Purchases.setLogLevel(LogLevel.debug);
    }
    final PurchasesConfiguration configuration =
        PurchasesConfiguration(revenueCatPublicApiKey);
    await Purchases.configure(configuration);
    Purchases.addCustomerInfoUpdateListener(_handleCustomerInfo);
    final CustomerInfo info = await Purchases.getCustomerInfo();
    _handleCustomerInfo(info);
    _configured = true;
  }

  static Future<bool> hasEntitlement() async {
    if (!isAvailable) {
      return true;
    }
    final CustomerInfo info = await Purchases.getCustomerInfo();
    return info.entitlements.active.containsKey(revenueCatEntitlementId);
  }

  static Future<CustomerInfo> refreshCustomerInfo() async {
    if (!isAvailable) {
      throw UnsupportedError('RevenueCat is unavailable on this platform.');
    }
    final CustomerInfo info = await Purchases.getCustomerInfo();
    _handleCustomerInfo(info);
    return info;
  }

  static Future<CustomerInfo> restorePurchases() async {
    if (!isAvailable) {
      throw UnsupportedError('RevenueCat is unavailable on this platform.');
    }
    final CustomerInfo info = await Purchases.restorePurchases();
    _handleCustomerInfo(info);
    return info;
  }

  static Future<Offering?> getOffering() async {
    if (!isAvailable) {
      return null;
    }
    final Offerings offerings = await Purchases.getOfferings();
    return offerings.getOffering(revenueCatOfferingId) ?? offerings.current;
  }

  static Future<PaywallResult> presentPaywall() async {
    if (!isAvailable) {
      throw UnsupportedError('RevenueCat is unavailable on this platform.');
    }
    final Offering? offering = await getOffering();
    if (offering == null) {
      return RevenueCatUI.presentPaywall();
    }
    return RevenueCatUI.presentPaywall(offering: offering);
  }

  static Future<PaywallResult> presentPaywallIfNeeded() async {
    if (!isAvailable) {
      throw UnsupportedError('RevenueCat is unavailable on this platform.');
    }
    final Offering? offering = await getOffering();
    if (offering == null) {
      return RevenueCatUI.presentPaywallIfNeeded(revenueCatEntitlementId);
    }
    return RevenueCatUI.presentPaywallIfNeeded(
      revenueCatEntitlementId,
      offering: offering,
    );
  }

  static Future<void> presentCustomerCenter() async {
    if (!isAvailable) {
      throw UnsupportedError('RevenueCat is unavailable on this platform.');
    }
    await RevenueCatUI.presentCustomerCenter();
  }

  static Future<CustomerInfo?> purchaseLifetimePackage() async {
    if (!isAvailable) {
      throw UnsupportedError('RevenueCat is unavailable on this platform.');
    }
    final Offering? offering = await getOffering();
    if (offering == null) {
      return null;
    }
    final Package package = offering.availablePackages.firstWhere(
      (Package item) =>
          item.storeProduct.identifier == revenueCatLifetimeProductId ||
          item.packageType == PackageType.lifetime ||
          item.identifier == 'lifetime',
      orElse: () => offering.availablePackages.first,
    );
    final PurchaseResult result = await Purchases.purchasePackage(package);
    final CustomerInfo info = result.customerInfo;
    _handleCustomerInfo(info);
    return info;
  }

  static PurchasesErrorCode? parseErrorCode(Object error) {
    if (error is PlatformException) {
      try {
        return PurchasesErrorHelper.getErrorCode(error);
      } on FormatException {
        return null;
      } catch (_) {
        return null;
      }
    }
    return null;
  }

  static void _handleCustomerInfo(CustomerInfo info) {
    customerInfo.value = info;
    isPro.value = info.entitlements.active.containsKey(revenueCatEntitlementId);
  }
}
