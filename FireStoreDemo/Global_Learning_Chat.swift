//
//  FireStoreDemoApp.swift
//  FireStoreDemo
//
//  Created by JAESOON on 2021/02/04.
//

import SwiftUI
import Firebase
@main
struct Global_Learning_Chat: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate : NSObject, UIApplicationDelegate {
    
    func application(_ application:UIApplication,
                     didFinishLaunchingWithOptions launchOptions:
                        [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        
        FirebaseApp.configure()
        return true
    }
}
