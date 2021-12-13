import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        // notification center (singleton)
        let center = UNUserNotificationCenter.current()

        // ------------------------------------
        // 前準備: ユーザに通知の許可を求める
        // ------------------------------------

        // request to notify for user
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                print("Allowed")
            } else {
                print("Didn't allowed")
            }
        }
        
        let choiceA = UNNotificationAction(identifier: "ross", title: "Ross", options: [.foreground])
        let choiceB = UNNotificationAction(identifier: "chandler", title: "Chandler", options: [.foreground])
        let choiceC = UNNotificationAction(identifier: "joey", title: "Joey", options: [.foreground])
        
        let friendsQuizCategory = UNNotificationCategory(identifier: "myNotificationCategory", actions: [choiceA, choiceB, choiceC], intentIdentifiers: [], options: [])
        
        UNUserNotificationCenter.current().setNotificationCategories([friendsQuizCategory])
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
}
