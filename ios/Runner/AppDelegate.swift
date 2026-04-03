import Flutter
import UIKit
import ObjectiveC.runtime

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    disableTouchRateCorrection()
    GeneratedPluginRegistrant.register(with: self)

    if let controller = window?.rootViewController as? FlutterViewController {
      let channel = FlutterMethodChannel(
        name: "whatsbackup/share",
        binaryMessenger: controller.binaryMessenger
      )

      channel.setMethodCallHandler { call, result in
        guard call.method == "consumeSharedFiles" else {
          result(FlutterMethodNotImplemented)
          return
        }

        let defaults = UserDefaults(suiteName: "group.co.dewaal.whatsappArchiveViewer")
        let paths = Self.readSharedPaths(from: defaults)
        if !paths.isEmpty {
          defaults?.removeObject(forKey: "ShareKey")
          defaults?.removeObject(forKey: "ShareMessageKey")
          defaults?.synchronize()
        }
        result(paths)
      }

      let storageChannel = FlutterMethodChannel(
        name: "whatsbackup/storage",
        binaryMessenger: controller.binaryMessenger
      )

      storageChannel.setMethodCallHandler { call, result in
        guard call.method == "getStorageInfo" else {
          result(FlutterMethodNotImplemented)
          return
        }
        guard
          let args = call.arguments as? [String: Any],
          let path = args["path"] as? String
        else {
          result(FlutterError(code: "invalid_args", message: "Missing path", details: nil))
          return
        }

        let info = Self.storageInfo(for: path)
        result(info)
      }
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

private extension AppDelegate {
  static func storageInfo(for path: String) -> [String: Any] {
    let url = URL(fileURLWithPath: path)
    let values = try? url.resourceValues(forKeys: [
      .volumeAvailableCapacityForImportantUsageKey,
      .volumeAvailableCapacityKey,
      .volumeNameKey
    ])
    let available = values?.volumeAvailableCapacityForImportantUsage
      ?? values?.volumeAvailableCapacity
      ?? 0
    let volumeName = values?.volumeName
    return [
      "availableBytes": available,
      "volumeName": volumeName as Any
    ]
  }


  func disableTouchRateCorrection() {
    guard let cls = NSClassFromString("FlutterViewController") else {
      return
    }
    let originalSelector = NSSelectorFromString("createTouchRateCorrectionVSyncClientIfNeeded")
    let swizzledSelector = #selector(FlutterViewController.wb_noopTouchRateCorrection)
    guard
      let originalMethod = class_getInstanceMethod(cls, originalSelector),
      let swizzledMethod = class_getInstanceMethod(cls, swizzledSelector)
    else {
      return
    }
    method_exchangeImplementations(originalMethod, swizzledMethod)
  }

  struct SharedMediaFile: Decodable {
    let path: String
  }

  static func readSharedPaths(from defaults: UserDefaults?) -> [String] {
    guard let defaults else {
      return []
    }
    if let data = defaults.data(forKey: "ShareKey") {
      if let items = try? JSONDecoder().decode([SharedMediaFile].self, from: data) {
        return items.map { $0.path }
      }
      if let single = try? JSONDecoder().decode(SharedMediaFile.self, from: data) {
        return [single.path]
      }
    }
    return defaults.array(forKey: "ShareKey") as? [String] ?? []
  }
}

private extension FlutterViewController {
  @objc func wb_noopTouchRateCorrection() {
    // No-op: prevents VSyncClient crash on iOS 26.x.
  }
}
