import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var lastState = AppState.notRunning

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        log(newState: AppState.inactive, #function)
        return true
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        log(newState: AppState.active, #function)
    }

    func applicationWillResignActive(_ application: UIApplication) {
        log(newState: AppState.inactive, #function)
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        log(newState: AppState.background, #function)
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        log(state: AppState.suspended, #function)
    }

    func applicationWillTerminate(_ application: UIApplication) {
        log(newState: AppState.notRunning, #function)
    }

    func log(newState: AppState, _ function: String) {
        print("Application moved from '\(lastState.rawValue)' to '\(newState.rawValue)': \(function)")
        lastState = newState
    }

    func log(state: AppState, _ function: String) {
        print("Application moved from '\(state.rawValue)': \(function)")
        lastState = state
    }
}

enum AppState: String {
    case notRunning = "Not running"
    case active = "Active"
    case inactive = "Inactive"
    case background = "Background"
    case suspended = "Suspended"
}
