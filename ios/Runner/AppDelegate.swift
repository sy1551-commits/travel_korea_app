import UIKit
import Flutter
import GoogleMaps   // ✅ 추가

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
    // ✅ Google Maps API Key 등록
    GMSServices.provideAPIKey("AIzaSyC0xlSkwnTGJNqrjN8SM9PlYP-1RxyK-_g")

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
