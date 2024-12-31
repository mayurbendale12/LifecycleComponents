import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    // Called when a new scene session is being created. It provides you with the scene and the options used to open it.
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // It allows you to save state or perform cleanup when a scene is no longer active.
    func sceneDidDisconnect(_ scene: UIScene) {

    }

    // Called when the scene becomes active, meaning it is now onscreen and the user can interact with it.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    func sceneDidBecomeActive(_ scene: UIScene) {

    }

    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
    func sceneWillResignActive(_ scene: UIScene) {

    }

    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
    func sceneWillEnterForeground(_ scene: UIScene) {

    }

    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
    func sceneDidEnterBackground(_ scene: UIScene) {

    }
}
