//
//  Quote_AppApp.swift
//  Quote App
//
//  Created by Bilal Ahmed on 24/03/2023.
//

import SwiftUI
import FirebaseCore
import Firebase
import UserNotifications

@available(iOS 16.0, *)
@main
struct Quote_AppApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            
                ContentView()
          
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
    let quoteMessageIdKey = "com.codecue.bestquotes"
    
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
      Messaging.messaging().delegate = self
      
    
      
      if #available(iOS 10.0, *){
          UNUserNotificationCenter.current().delegate = self
          
          let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
          UNUserNotificationCenter.current().requestAuthorization(options: authOptions, completionHandler: {_, _ in })
      }
      else{
          let settings : UIUserNotificationSettings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
          application.registerUserNotificationSettings(settings)
      }

      application.registerForRemoteNotifications()
    return true
  }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler : @escaping  (UIBackgroundFetchResult) -> Void) {
        if let messageID = userInfo[quoteMessageIdKey]{
            print("Message ID : \(messageID)")
        }
        print(userInfo)
        
        completionHandler(UIBackgroundFetchResult.newData)
    }
}

extension AppDelegate: MessagingDelegate{
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        let deviceToken:[String: String] = ["token": fcmToken ?? ""]
        print("Device token : ", deviceToken) // this token can be used fot testing notifications on FCM
    }
}

@available(iOS 10, *)
extension AppDelegate : UNUserNotificationCenterDelegate {
    // Receive displayed notifications for iOS 10 devices
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler : @escaping (UNNotificationPresentationOptions) -> Void) {
        let userInfo = notification.request.content.userInfo
        
        if let window = UIApplication.shared.windows.first {
            if #available(iOS 16.0, *) {
                window.rootViewController?.present(UIHostingController(rootView: QuoteOfTheDayScreen(notificationInfo: userInfo)), animated: true, completion: nil)
            } else {
                // Fallback on earlier versions
            }
                      }
        
        
        if let messageID = userInfo[quoteMessageIdKey]{
            print("Message ID: \(messageID)")
        }
        
        print(userInfo)
        
        // change this to your preferred presentation option
        completionHandler([[.banner, .badge, .sound]])
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print("Registered for Apple Remote Notifications")
        Messaging.messaging().setAPNSToken(deviceToken, type: .unknown)
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        
    }
}
 
