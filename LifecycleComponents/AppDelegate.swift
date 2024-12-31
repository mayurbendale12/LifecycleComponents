import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    // Called when the app is launched. It's an opportunity to perform initial setup, such as configuring the user interface, setting up data structures, or initializing services. The method receives a dictionary (launchOptions) containing information about the launch.
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Perform initial setup here
        return true
    }

    // Similar to didFinishLaunchingWithOptions, but called slightly earlier in the launch process.
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Perform setup before the app finishes launching
        return true
    }

    // Called when the app becomes active and moves to the foreground.
    // This is a good place to restart tasks that were paused (or not started) when the app entered the background.
    // Restart tasks or refresh UI when the app becomes active
    func applicationDidBecomeActive(_ application: UIApplication) {

    }

    // Called when the app is about to become inactive.
    // This happens when, for example, the user receives a phone call or switches to another app.
    // Pause ongoing tasks or save state when the app is about to become inactive
    func applicationWillResignActive(_ application: UIApplication) {

    }

    // Called when the app is about to move from the background to the foreground.
    // Perform tasks before the app enters the foreground
    func applicationWillEnterForeground(_ application: UIApplication) {

    }

    // Called when the app enters the background.
    // It's an opportunity to save critical data or perform tasks that should continue running in the background.
    // Save data or perform background tasks when the app enters the background
    func applicationDidEnterBackground(_ application: UIApplication) {

    }

    // Called when the app is about to terminate.
    // This method is not always called; iOS might terminate the app without warning.
    // Perform cleanup tasks before the app terminates
    func applicationWillTerminate(_ application: UIApplication) {

    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}
